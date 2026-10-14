# marola-research

[![marola-bench: DOI 10.5281/zenodo.23352633](https://img.shields.io/badge/marola--bench-10.5281%2Fzenodo.23352633-1682D4?style=flat-square)](https://doi.org/10.5281/zenodo.23352633)
[![pdf](https://img.shields.io/github/actions/workflow/status/marola-dev/marola-research/pdf.yml?branch=main&label=pdf&style=flat-square)](https://github.com/marola-dev/marola-research/actions/workflows/pdf.yml)
[![.md](https://img.shields.io/github/actions/workflow/status/marola-dev/marola-research/md.yml?branch=main&label=.md&style=flat-square)](https://github.com/marola-dev/marola-research/actions/workflows/md.yml)
[![live links](https://img.shields.io/github/actions/workflow/status/marola-dev/marola-research/links.yml?branch=main&label=live%20links&style=flat-square)](https://github.com/marola-dev/marola-research/actions/workflows/links.yml)
[![site](https://img.shields.io/github/actions/workflow/status/marola-dev/marola-research/site.yml?branch=main&label=site&style=flat-square)](https://github.com/marola-dev/marola-research/actions/workflows/site.yml)

The science of [marola](https://github.com/marola-dev/marola). One directory is one research:
its paper, its sources, the log of how each source was checked, and later its code.

## Researches

| Research | What it is | Site | Paper | Status |
|---|---|---|---|---|
| [`marola-bench`](marola-bench/README.md) | a WeatherBench for Brazil: Brazilian regions, wave variables, instruments as the truth | [marola-dev.github.io/marola-research/marola-bench](https://marola-dev.github.io/marola-research/marola-bench/) | [PDF](marola-bench/marola-bench.pdf), [source](marola-bench/paper/paper.md) | a proposal, v0.1.0, DOI [10.5281/zenodo.23352633](https://doi.org/10.5281/zenodo.23352633). No score has been computed |

Not a research: [`chamada/`](chamada/README.md), *Marola: Chamada para CONTRIBUIÇÃO e
PUBLICAÇÃO* ([PDF](chamada/chamada.pdf), at most 5 pages). It is a call in easy Brazilian
Portuguese to undergraduates, master's and doctoral students. It says what marola is, and what
it takes to publish on marola.dev and to collaborate with it.

Every research has the same four parts: a **paper** (with its references and the log of how each
was checked), **notes** (a slip box, one idea in one note), a **journal** (one entry for each
challenge met) and a **site** that tells it, built from those files. [`NOTES.md`](NOTES.md) has
the rules of the notes and the journal.

## How to read a paper here

Every claim carries a mark: `(v)` was checked, and the paper's `REFERENCES.md` says how; `⚠`
was not. Every paper ends with what is not known.

## Make a paper and a site

```sh
just paper marola-bench    # marola-bench/paper/*.md -> marola-bench/marola-bench.pdf
just site marola-bench     # the research's files -> marola-bench/site/dist/
just pages                 # every research's site, as one tree for GitHub Pages
```

It needs Nix and `just`. The tools come from [picasso](https://github.com/h0ffmann/picasso)'s
labs, pinned in `flake.lock`: `paper` (pandoc, XeLaTeX) and `gleam-website` (Gleam, Node,
esbuild). A site is Gleam and Lustre; its facts come from the research's files through
`tools/content`, so a page never repeats a fact by hand.

## For agents

[`AGENTS.md`](AGENTS.md) has the map and the rules;
[`ouro-paper`](.claude/skills/ouro-paper/SKILL.md) is how a text is written and checked. The
skill has no evals yet.

## Cite

Each research that was released has its own DOI, and its page says how to cite it.

| Research | Cite the work | This version |
|---|---|---|
| marola-bench | [10.5281/zenodo.23352633](https://doi.org/10.5281/zenodo.23352633) | v0.1.0: [10.5281/zenodo.23352634](https://doi.org/10.5281/zenodo.23352634) |

> Hoffmann, M. (2026). *marola-bench: a proposal for a WeatherBench for Brazil*. Zenodo.
> <https://doi.org/10.5281/zenodo.23352633>

GitHub's "Cite this repository" gives the same, from [`CITATION.cff`](CITATION.cff).

## Checks

`just check <research>`, `just md-quality` and `just pages` are what CI runs, on each pull
request and on `main`: [`pdf`](.github/workflows/pdf.yml) (one job for each research),
[`.md`](.github/workflows/md.yml), [`live links`](.github/workflows/links.yml) and
[`site`](.github/workflows/site.yml), which also publishes the sites from `main`.
[`AGENTS.md`](AGENTS.md) says what each one checks.

## Skills by other people

This repository's own skill, [`ouro-paper`](.claude/skills/ouro-paper/SKILL.md), learned from
other people's skills for paper quality; [`REA.md`](.claude/skills/ouro-paper/REA.md) credits
each one at a commit, with its licence. The largest source is K-Dense's library:

> Kassis, T., Agarwal, V., He, Y., Patel, D., & Brueckner, A. M. (2026). *Scientific Agent
> Skills: A Library of Procedural Knowledge for Research Agents*. arXiv:2609.00065.
> <https://arxiv.org/abs/2609.00065>

Six of its skills are used here **by link**: pinned in
[`skills.lock`](.claude/skills/skills.lock) to a commit, never copied into this repository.
`just skills fetch` brings them to one machine; [`.claude/skills/README.md`](.claude/skills/README.md)
has the links and the rules.

## Ouroboric

This repository is made in the Ouroboric way: the work documents itself as it documents its
subject, a human steers and agents build, and every borrowed idea is cited. The Ouroboric ideas
are Bruno Valério's. These are the public repositories of
[ouroboric-dev](https://github.com/ouroboric-dev), each with the description its owner gave it,
read from GitHub on 13 October 2026.

| Repository | In its owner's words |
|---|---|
| [ouroboric](https://github.com/ouroboric-dev/ouroboric) | Ouroboric: open factories that improve themselves. Charter, standards, journal and brand. |
| [yggdrasil](https://github.com/ouroboric-dev/yggdrasil) | Yggdrasil: an open software factory. Agents build, humans steer. (Design phase.) |
| [asgard](https://github.com/ouroboric-dev/asgard) | Asgard: the company factory, running on Yggdrasil. (Design phase.) |
| [odin](https://github.com/ouroboric-dev/odin) | The orchestrator: the graph engine and the ygg CLI, with routing and the ledger as packages. |
| [gleipnir](https://github.com/ouroboric-dev/gleipnir) | The harness: agent adapters, the devcontainer sandbox driver, policies and the check runner. |
| [jormungandr](https://github.com/ouroboric-dev/jormungandr) | The loop: build, check and fix with attempts, backoff, budgets, feedback and escalation. |
| [gungnir](https://github.com/ouroboric-dev/gungnir) | The contract: Go interface types and JSON schemas for ledger events, graph.yaml, pack.yaml and factory.yaml. |
| [havamal](https://github.com/ouroboric-dev/havamal) | The skill library: vendored skills with skills.lock and licences, our own skills with their evals, and the tooling. |
| [realm-web](https://github.com/ouroboric-dev/realm-web) | The web realm: graph, prompts, devcontainer stack layer, templates and checks. |
| [ouroboric-packages](https://github.com/ouroboric-dev/ouroboric-packages) | The official ouroboric packages on PyPI and crates.io: they identify the project and hold its name |
| [.github](https://github.com/ouroboric-dev/.github) | Organisation profile and defaults for Ouroboric. |

What this repository takes from them, and where: the working rules in
[`ouro-paper`](.claude/skills/ouro-paper/SKILL.md) (its "Sources"), the journal's six headings
([`NOTES.md`](NOTES.md)) and the licence file's pattern ([`REUSE.toml`](REUSE.toml)). The name
and the logo of Ouroboric are trademarks of that project and are not licensed here.

## Not here yet

Any code of a research.

## Licence

**A research is not open because this repository is public.** marola-bench is **all rights
reserved**: read it and cite it; do not copy it or share it without the author's
acknowledgement. [`REUSE.md`](REUSE.md) says who may work on it and what an agent must do, and
[`TRADEMARKS.md`](TRADEMARKS.md) has the names and logos.

At the root, the code that builds and checks a research is MIT ([`LICENSE`](LICENSE)) and the
texts that explain the repository are CC BY 4.0. One file says it for every file, with no header
in any file: [`REUSE.toml`](REUSE.toml), in the pattern of the ouroboric-dev repositories. The
licence texts are in [`LICENSES/`](LICENSES/). `just reuse` checks it.
