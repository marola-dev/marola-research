#!/usr/bin/env python3
"""citation: the metadata of a research's record, and the citation file made from it.

    python3 scripts/citation.py <research>            # validate, write CITATION.cff
    python3 scripts/citation.py <research> --check    # validate; exit 1 if anything is stale
    python3 scripts/citation.py --check               # validate every research; check the root
                                                      # files against the one they copy
    python3 scripts/citation.py --self-test

`<research>/zenodo.json` is the one citation file edited by hand. Two files are copies of it and
must never differ from what it makes:
  - `.zenodo.json` at the root: Zenodo reads only that one, and a repository has one. It is a
    byte-for-byte copy.
  - `CITATION.cff` at the root: GitHub's "Cite this repository" reads only that one. It is
    generated here, with the DOI of `<research>/doi.tsv`.
The root files belong to one research at a time: the one released next. CI runs the form with
no research, so a second research's `zenodo.json` is validated without failing the check.

Three rules come from a release that went wrong (marola-bench/journal/, "the first record came
out open"):
  - `license` must be there. With none, Zenodo takes the licence that GitHub shows for the
    default branch.
  - `version`, `publication_date` and `doi` must not be there: Zenodo sets them.
  - an ORCID must pass its checksum.

Written for this repository, at the owner's request to bring the DOI discipline of
h0ffmann/h0ffmann here. The idea is the citation tool of marola-dev/marola, h0ffmann/picasso and
h0ffmann/closed-source.
"""
import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
FORBIDDEN = ("version", "publication_date", "doi", "prereserve_doi")
REQUIRED = ("title", "upload_type", "description", "creators", "license", "access_right", "keywords")


def orcid_ok(orcid: str) -> bool:
    if not re.fullmatch(r"\d{4}-\d{4}-\d{4}-\d{3}[\dX]", orcid):
        return False
    digits = orcid.replace("-", "")
    total = 0
    for c in digits[:-1]:
        total = (total + int(c)) * 2
    check = (12 - total % 11) % 11
    return digits[-1] == ("X" if check == 10 else str(check))


def errors(meta: dict) -> list:
    out = [f"missing {k}" for k in REQUIRED if not meta.get(k)]
    out += [f"{k} is set by Zenodo; remove it" for k in FORBIDDEN if k in meta]
    for i, c in enumerate(meta.get("creators", [])):
        if not re.fullmatch(r"[^,]+, [^,]+", c.get("name", "")):
            out.append(f"creators[{i}]: name is not 'Family, Given'")
        if "orcid" in c and not orcid_ok(c["orcid"]):
            out.append(f"creators[{i}]: the ORCID does not pass its checksum")
    for i, r in enumerate(meta.get("related_identifiers", [])):
        if not r.get("identifier") or not r.get("relation"):
            out.append(f"related_identifiers[{i}]: needs an identifier and a relation")
    return out


def dois(research: str) -> dict:
    """The rows of <research>/doi.tsv; empty before the first release."""
    path = ROOT / research / "doi.tsv"
    if not path.exists():
        return {}
    rows = (line.split("\t") for line in path.read_text().splitlines() if line and not line.startswith("#"))
    return {r[0]: r[1] for r in rows if len(r) == 2}


def message(meta: dict) -> str:
    if meta["license"] == "other-closed":
        return "All rights reserved. Read it and cite it; do not copy or share it. See REUSE.md."
    return f"Cite it by its DOI. Licence: {meta['license']}."


def quote(s: str) -> str:
    return '"' + s.replace("\\", "\\\\").replace('"', '\\"') + '"'


def cff(meta: dict, research: str, ids: dict) -> str:
    lines = [
        f"# Generated from {research}/zenodo.json and {research}/doi.tsv by scripts/citation.py; do not edit.",
        "cff-version: 1.2.0",
        "message: " + quote(message(meta)),
        "type: generic",
        "title: " + quote(meta["title"]),
        "authors:",
    ]
    for c in meta["creators"]:
        family, given = [p.strip() for p in c["name"].split(",", 1)]
        lines += ["  - family-names: " + quote(family), "    given-names: " + quote(given)]
        if "orcid" in c:
            lines.append('    orcid: "https://orcid.org/' + c["orcid"] + '"')
        if c.get("affiliation"):
            lines.append("    affiliation: " + quote(c["affiliation"]))
    lines.append('repository-code: "https://github.com/marola-dev/marola-research"')
    lines.append(f'url: "https://marola-dev.github.io/marola-research/{research}/"')
    if ids.get("doi"):
        lines.append("doi: " + ids["doi"])
    if ids.get("version"):
        lines.append("version: " + quote(ids["version"]))
    if ids.get("released"):
        lines.append("date-released: " + ids["released"])
    lines.append("keywords:")
    lines += ["  - " + quote(k) for k in meta["keywords"]]
    return "\n".join(lines) + "\n"


def self_test() -> int:
    good = {
        "title": "t", "upload_type": "publication", "description": "d", "license": "other-closed",
        "access_right": "closed", "keywords": ["k"],
        "creators": [{"name": "Hoffmann, Matheus", "orcid": "0009-0009-1056-7661"}],
    }
    assert errors(good) == [], errors(good)
    bad = dict(good, doi="10.1/x", creators=[{"name": "Matheus Hoffmann", "orcid": "0000-0000-0000-0000"}])
    del bad["license"]
    got = errors(bad)
    assert "missing license" in got and "doi is set by Zenodo; remove it" in got, got
    assert any("Family, Given" in e for e in got) and any("checksum" in e for e in got), got
    text = cff(good, "r", {"doi": "10.5281/zenodo.1", "version": "v0.1.0", "released": "2026-10-13"})
    assert "doi: 10.5281/zenodo.1" in text and 'version: "v0.1.0"' in text and "date-released: 2026-10-13" in text, text
    assert "doi:" not in cff(good, "r", {})
    assert "All rights reserved" in text
    assert "Licence: cc-by-4.0" in cff(dict(good, license="cc-by-4.0"), "r", {})
    assert orcid_ok("0000-0002-1825-0097") and not orcid_ok("0000-0002-1825-0098")
    print("citation: self-test ok", file=sys.stderr)
    return 0


def check_root() -> int:
    sources = sorted(ROOT.glob("*/zenodo.json"))
    bad = 0
    for s in sources:
        for e in errors(json.loads(s.read_text())):
            print(f"citation: {s.parent.name}/zenodo.json: {e}", file=sys.stderr)
            bad = 1
    root = ROOT / ".zenodo.json"
    owner = [s.parent.name for s in sources if root.exists() and root.read_bytes() == s.read_bytes()]
    if not owner:
        print("citation: .zenodo.json is no research's zenodo.json; run `just citation <research>`", file=sys.stderr)
        return 1
    return main([owner[0], "--check"]) or bad


def main(argv: list) -> int:
    if "--self-test" in argv:
        return self_test()
    names = [a for a in argv if not a.startswith("--")]
    if not names and "--check" in argv:
        return check_root()
    if len(names) != 1:
        print("citation: usage: scripts/citation.py <research> [--check]", file=sys.stderr)
        return 1
    research = names[0]
    source = ROOT / research / "zenodo.json"
    if not source.exists():
        print(f"citation: no {research}/zenodo.json", file=sys.stderr)
        return 1
    meta = json.loads(source.read_text())
    found = errors(meta)
    if found:
        for e in found:
            print(f"citation: {research}/zenodo.json: {e}", file=sys.stderr)
        return 1
    text = cff(meta, research, dois(research))
    root, target = ROOT / ".zenodo.json", ROOT / "CITATION.cff"
    if "--check" in argv:
        stale = []
        if not root.exists() or root.read_bytes() != source.read_bytes():
            stale.append(f".zenodo.json is not {research}/zenodo.json")
        if not target.exists() or target.read_text() != text:
            stale.append("CITATION.cff is stale")
        for s in stale:
            print(f"citation: {s}; run `just citation {research}`", file=sys.stderr)
        if not stale:
            print(f"citation: {research}/zenodo.json valid; .zenodo.json and CITATION.cff current", file=sys.stderr)
        return 1 if stale else 0
    root.write_bytes(source.read_bytes())
    target.write_text(text)
    print("citation: wrote .zenodo.json and CITATION.cff", file=sys.stderr)
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
