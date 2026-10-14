#!/usr/bin/env python3
"""override-check: a research overrides the root's discipline only as far as the root allows.

    python3 scripts/override-check.py              # check every research
    python3 scripts/override-check.py --self-test

OVERRIDE_CONFIG.toml at the root names each policy and its level: free, stricter-only or never.
A research declares what it changes in <research>/OVERRIDE_CONFIG.toml. This refuses:
  - a policy the root does not name, or one whose level is `never`;
  - a declaration without a value, a date (`since`) or the files where a reader finds it, or one
    whose files do not exist;
  - a licence that is not the one REUSE.toml gives the research's directory, and a licence in
    REUSE.toml for a research's directory that its OVERRIDE_CONFIG.toml does not declare.
A research is a directory at the root with paper/paper.md, as the justfile says.
"""
import sys
import tempfile
import tomllib
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
LEVELS = ("free", "stricter-only", "never")


def load(path):
    with open(path, "rb") as f:
        return tomllib.load(f)


def reuse_licences(reuse):
    """{research: SPDX} for each REUSE.toml block whose path is exactly '<research>/**'."""
    out = {}
    for block in reuse.get("annotations", []):
        paths = block.get("path", [])
        paths = [paths] if isinstance(paths, str) else paths
        for p in paths:
            if p.endswith("/**") and "/" not in p[:-3] and "*" not in p[:-3]:
                out[p[:-3]] = block.get("SPDX-License-Identifier")
    return out


def check(root):
    errors = []
    policy = load(root / "OVERRIDE_CONFIG.toml").get("policy", {})
    if not policy:
        return ["OVERRIDE_CONFIG.toml: no [policy.*] table"]
    for name, p in policy.items():
        if p.get("override") not in LEVELS:
            errors.append(f"OVERRIDE_CONFIG.toml: policy.{name}: override must be one of {', '.join(LEVELS)}")
        if not p.get("rule"):
            errors.append(f"OVERRIDE_CONFIG.toml: policy.{name}: no rule")
    licences = reuse_licences(load(root / "REUSE.toml")) if (root / "REUSE.toml").exists() else {}
    researches = sorted(p.parent.parent.name for p in root.glob("*/paper/paper.md"))
    for r in researches:
        f = root / r / "OVERRIDE_CONFIG.toml"
        decl = load(f) if f.exists() else {}
        where = f"{r}/OVERRIDE_CONFIG.toml"
        if decl:
            if decl.get("research") != r:
                errors.append(f"{where}: research must be \"{r}\"")
            if not decl.get("owner"):
                errors.append(f"{where}: no owner: an override is its owner's")
        overrides = decl.get("override", {})
        for name, o in overrides.items():
            level = policy.get(name, {}).get("override")
            if level is None:
                errors.append(f"{where}: override.{name}: the root has no such policy")
                continue
            if level == "never":
                errors.append(f"{where}: override.{name}: the root says it is never overridden")
                continue
            for key in ("value", "since", "where"):
                if not o.get(key):
                    errors.append(f"{where}: override.{name}: no {key}")
            for path in o.get("where", []):
                if not (root / path).exists():
                    errors.append(f"{where}: override.{name}: {path} does not exist")
        declared = overrides.get("licence", {}).get("value")
        given = licences.get(r)
        if given and declared != given:
            if declared:
                errors.append(f"{where}: override.licence is {declared}, REUSE.toml gives {r}/** {given}")
            else:
                errors.append(f"REUSE.toml gives {r}/** {given}; declare it as override.licence in {where}")
        if declared and not given:
            errors.append(f"{where}: override.licence is {declared}, REUSE.toml has no block for {r}/**")
    return errors


def self_test():
    fails = 0

    def case(label, files, expect):
        nonlocal fails
        with tempfile.TemporaryDirectory() as tmp:
            t = Path(tmp)
            for name, text in files.items():
                (t / name).parent.mkdir(parents=True, exist_ok=True)
                (t / name).write_text(text, encoding="utf-8")
            errs = check(t)
        ok = any(expect in e for e in errs) if expect else not errs
        print(f"  {'ok  ' if ok else 'FAIL'} {label}" + ("" if ok else f": {errs}"))
        fails += 0 if ok else 1

    root = ('[policy.licence]\noverride = "free"\nrule = "x"\n'
            '[policy.citation]\noverride = "never"\nrule = "y"\n')
    reuse = ('version = 1\n[[annotations]]\npath = ["a/**"]\nSPDX-License-Identifier = "LicenseRef-ARR"\n')
    good = ('research = "a"\nowner = "o"\n[override.licence]\nvalue = "LicenseRef-ARR"\n'
            'since = 2026-10-14\nwhere = ["a/README.md"]\n')
    base = {"OVERRIDE_CONFIG.toml": root, "REUSE.toml": reuse, "a/paper/paper.md": "", "a/README.md": ""}
    case("a declared licence that REUSE.toml gives passes", {**base, "a/OVERRIDE_CONFIG.toml": good}, None)
    case("a licence in REUSE.toml with no declaration fails", base, "declare it as override.licence")
    case("a declared licence REUSE.toml does not give fails",
         {**base, "a/OVERRIDE_CONFIG.toml": good.replace("LicenseRef-ARR", "MIT")}, "REUSE.toml gives")
    case("a `never` policy cannot be overridden",
         {**base, "a/OVERRIDE_CONFIG.toml": good + '[override.citation]\nvalue = "none"\nsince = 2026-10-14\nwhere = ["a/README.md"]\n'},
         "never overridden")
    case("a policy the root does not name fails",
         {**base, "a/OVERRIDE_CONFIG.toml": good + '[override.colour]\nvalue = "red"\n'}, "no such policy")
    case("a file in `where` must exist",
         {**base, "a/OVERRIDE_CONFIG.toml": good.replace("a/README.md", "a/NOPE.md")}, "does not exist")
    case("an override has an owner", {**base, "a/OVERRIDE_CONFIG.toml": good.replace('owner = "o"\n', "")}, "no owner")
    case("a level outside the three fails",
         {**base, "OVERRIDE_CONFIG.toml": root.replace('"free"', '"maybe"'), "a/OVERRIDE_CONFIG.toml": good}, "must be one of")
    print("override-check self-test: " + ("ok" if not fails else f"{fails} failure(s)"))
    return 1 if fails else 0


def main():
    if sys.argv[1:] == ["--self-test"]:
        return self_test()
    errors = check(ROOT)
    for e in errors:
        print(f"override-check: {e}", file=sys.stderr)
    if errors:
        return 1
    n = len(list(ROOT.glob("*/paper/paper.md")))
    print(f"override-check: {n} research(es), every override within OVERRIDE_CONFIG.toml")
    return 0


if __name__ == "__main__":
    sys.exit(main())
