# marola-bench

A WeatherBench for Brazil: the method of the public weather benchmarks, applied to the Brazilian
coast and to ocean waves, with instruments as the truth.

- **The site:** <https://marola-dev.github.io/marola-research/marola-bench/>, built from the
  files of this directory ([`site/`](site/)).
- **The paper:** [`marola-bench.pdf`](marola-bench.pdf), rendered from
  [`paper/paper.md`](paper/paper.md). A proposal, v0, draft. It reports no result.
- **The preprint:** [`design-prop.preprint.pdf`](design-prop.preprint.pdf), the design proposal
  in six figures, rendered from [`paper/design-prop.preprint.md`](paper/design-prop.preprint.md).
  It draws the paper's section 4 and its hard rules, and designs nothing.
- **The notes:** [`notes/index.md`](notes/index.md), a slip box: one idea in one note.
- **The journal:** [`journal/README.md`](journal/README.md), one entry for each challenge met.
- **The design:** marola's
  [MIP-0091](https://github.com/marola-dev/marola/blob/cf7bd4f/docs/MIPs/MIP-0091-marola-forecaster-architecture.md),
  accepted on 13 October 2026. If the paper and the MIP disagree, the MIP is right.
- **The code:** none yet.

## Hard rules

The owner's rules (Hoffmann, 13 October 2026; rule 7, 14 October 2026). They are not open to an agent's choice.

1. marola-bench is implemented in **Apache Pekko**, in **Scala 3**.
2. marola-bench is implemented on **GCP**, and developed with **Claude Code**, with an **SDD**
   (spec-driven development) framework.
3. Its infrastructure as code is defined with **Besom**.
4. marola-bench lives **here**, in `marola-research/marola-bench`. The first rendered paper is
   here.
5. The deployment of the Pekko cluster is **cheap** and **reliable**. Both are hard
   requirements, and so is its infrastructure on GCP.
6. marola-bench is **all rights reserved**, and the credit belongs to Matheus Hoffmann. No
   sharing outside marola-dev and ouroboric-dev without his acknowledgement. Whoever uses it
   cites it.
7. **Ponytail 5** is adopted as the coding assistant, a Claude Code plugin (the owner,
   14 October 2026).

## The bench, in the owner's words

"The bench are the score series performed by any Forecaster, Registered by an Actor." The bench
is the final goal.

- Observation points are added by hand, through a CRUD API specified in Apache Pekko and Scala.
- An actor for each point monitors it, asks the providers, and in the future asks marola's
  forecaster.
- The design principles for a cheap and reliable cluster are in section 4.4 of the paper.

Rules 1, 2, 4, 5 and 6 change the accepted design, which has Kyo, zero cloud spend, modules in
marola-app, a cycle on GitHub Actions and a public chain under CC BY 4.0. The paper's section "Hard rules" says what each rule meets. A MIP must settle the
rest before code is written: which parts of Pekko, what runs on GCP and its budget, which SDD
framework, and whether the code moves here. Rule 7 agrees with the design, which names no
plugin, and does not name the SDD framework: Ponytail is about the size of a change, not about a
specification.

## Terms

All rights reserved, © 2026 Matheus Hoffmann. You may read marola-bench and cite it. You may not
copy it, share it, adapt it or use it as source material without his written acknowledgement.
The members of marola-dev and ouroboric-dev may work on it, inside those organisations.
[`REUSE.md`](../REUSE.md) has the terms and the hard rule for agents;
[`TRADEMARKS.md`](../TRADEMARKS.md) has the names and logos.

## Cite

> Hoffmann, M. (2026). *marola-bench: a proposal for a WeatherBench for Brazil*. Zenodo.
> <https://doi.org/10.5281/zenodo.23352633>

| | DOI |
|---|---|
| the work, always its latest version | [10.5281/zenodo.23352633](https://doi.org/10.5281/zenodo.23352633) |
| v0.1.0, 13 October 2026 | [10.5281/zenodo.23352634](https://doi.org/10.5281/zenodo.23352634) |

Cite the first one, unless you mean the exact text of one version.

The release was cut from the author's fork, `h0ffmann/marola-research`, at the commit of this
repository's pull request 4: Zenodo's switch is on for his account, not for the organisation.
The next version is released from that fork too, or it starts a second record.

## Files

| File | What it is |
|---|---|
| `marola-bench.pdf` | the rendered paper |
| `design-prop.preprint.pdf` | the design proposal in pictures, rendered from `paper/design-prop.preprint.md` (`just preprint marola-bench`) |
| `paper/figures/` | the preprint's figures, drawn as SVG for it |
| `paper/paper.md` | the text, with a mark on every claim |
| `paper/refs.bib` | the references |
| `paper/REFERENCES.md` | how each reference was checked |
| `zenodo.json` | the metadata of the Zenodo record; the root `.zenodo.json` is a copy of it |
| `paper/logos.tsv` | the logos on the paper's first page: each SVG at a pinned commit, with its sha256 |
| `paper/abstract.easy.pt-BR.md` | the abstract, step by step, in easy Brazilian Portuguese |
| `notes/` | the slip box; `notes/index.md` links to every note |
| `journal/` | the journal; `journal/README.md` lists every entry |
| `site/` | the website: Gleam and Lustre. Its facts come from the files above |

## The logos

The paper's first page shows the logos of marola and of Ouroboric, as the paper of
h0ffmann/closed-source does: marola, because this is marola's research; Ouroboric, because the
work is made in the Ouroboric way (`ouro-paper`), whose ideas are Bruno Valério's.

Each logo is a trademark of its project and is not licensed by this repository. The SVG files
are not committed: `just paper` downloads each one at a pinned commit, checks its sha256 and
converts it to a vector PDF, so it is sharp at any size. The rendered `marola-bench.pdf` does
contain them. Showing a logo here does not say that the project endorses this paper.
