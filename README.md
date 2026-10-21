<div align="center">

<img alt="A small wave that curls into a loop, over a line of sand, under a sun: an original drawing for marola-research" src="drawings/marola-research.svg" width="300"/>

# marola-research

<sub>since 2026 · the science of <a href="https://github.com/marola-dev/marola">marola</a> · <a href="https://marola-dev.github.io/marola-research/">the sites</a> · <a href="#researches">researches</a> · <a href="#a-new-paper-explained-like-you-are-five">a new paper</a> · <a href="#discipline-from-the-root-freedom-in-a-research">overrides</a> · <a href="#cite">cite</a></sub>

[![since 2026](https://img.shields.io/badge/since-2026-1682D4?style=flat-square)](#history)
[![experiments: 4](https://img.shields.io/badge/experiments-4-F2B705?style=flat-square)](#researches)
[![marola-bench: DOI 10.5281/zenodo.23352633](https://img.shields.io/badge/marola--bench-10.5281%2Fzenodo.23352633-1682D4?style=flat-square)](https://doi.org/10.5281/zenodo.23352633)
[![pdf](https://img.shields.io/github/actions/workflow/status/marola-dev/marola-research/pdf.yml?branch=main&label=pdf&style=flat-square)](https://github.com/marola-dev/marola-research/actions/workflows/pdf.yml)
[![.md](https://img.shields.io/github/actions/workflow/status/marola-dev/marola-research/md.yml?branch=main&label=.md&style=flat-square)](https://github.com/marola-dev/marola-research/actions/workflows/md.yml)
[![live links](https://img.shields.io/github/actions/workflow/status/marola-dev/marola-research/links.yml?branch=main&label=live%20links&style=flat-square)](https://github.com/marola-dev/marola-research/actions/workflows/links.yml)
[![site](https://img.shields.io/github/actions/workflow/status/marola-dev/marola-research/site.yml?branch=main&label=site&style=flat-square)](https://github.com/marola-dev/marola-research/actions/workflows/site.yml)
[![licence: per research](https://img.shields.io/badge/licence-per%20research-1682D4?style=flat-square)](#licence)

The science of [marola](https://github.com/marola-dev/marola). One directory is one research:
its paper, its sources, the log of how each source was checked, its notes, its journal, its
site and later its code. The discipline comes from the root; each research is its owner's.

marola-research was minted by the owner's other repositories: its rules came from
[closed-source](https://github.com/h0ffmann/closed-source),
[ww3-gpu](https://github.com/h0ffmann/ww3-gpu), [picasso](https://github.com/h0ffmann/picasso)
and [marola](https://github.com/marola-dev/marola) ([history](#history)).
</div>

## Researches

Each research is numbered as a marola experiment, in the order it was opened.

| # | Research | What it is | Status |
|---|---|---|---|
| 001 | [marola-bench](#marola-bench-a-weatherbench-for-brazil) | a WeatherBench for Brazil | a proposal, v0.1.0, [DOI](https://doi.org/10.5281/zenodo.23352633) |
| 002 | [marola-gpt](#marola-gpt-its-base-and-its-corpus) | a LoRA adapter over Tucano-2b4, on marola's ocean corpus | 0.1.0 not published; no DOI |
| 003 | [ww3-gpu](#ww3-gpu-the-dia-on-a-gpu-without-changing-the-answer) | WAVEWATCH III in C++20/Kokkos, bit for bit with the Fortran | 20.12 % translated, [DOI](https://doi.org/10.5281/zenodo.23221351) |
| 004 | [ptbr-writter](#ptbr-writter-technical-writing-in-brazilian-portuguese-for-agents) | a Claude Code plugin for technical writing in Brazilian Portuguese | v0.1.0 released; no paper, no DOI |

Each experiment is `marola-experiment-NNN`. Its block below has its links, its status and its
details.

### marola-bench, a WeatherBench for Brazil

- **Experiment:** `marola-experiment-001`, in this repository:
  [`marola-bench/`](marola-bench/README.md)
- **What it is:** a WeatherBench for Brazil: Brazilian regions, wave variables, instruments as
  the truth
- **Site:** [marola-dev.github.io/marola-research/marola-bench](https://marola-dev.github.io/marola-research/marola-bench/)
- **Paper:** [PDF](marola-bench/marola-bench.pdf), [source](marola-bench/paper/paper.md)
- **Status:** a proposal, v0.1.0, DOI
  [10.5281/zenodo.23352633](https://doi.org/10.5281/zenodo.23352633). No score has been computed

Later it will be filed as a case study of how marola-research, the tool, improves itself. Each
research tests the rules, the checks and the skill of this repository. What a research finds goes
back to the root. The study is not written yet.

### marola-gpt, its base and its corpus

- **Experiment:** `marola-experiment-002`, in
  [marola-ml](https://github.com/marola-dev/marola-ml#marola-gpt)
- **What it is:** a LoRA adapter over [Tucano-2b4](https://huggingface.co/TucanoBR/Tucano-2b4), an
  open model trained from scratch in Brazilian Portuguese, trained on marola's ocean corpus,
  [marola-corpus](https://github.com/marola-dev/marola-corpus)
- **Site and paper:** none
- **Status:** on Hugging Face, 0.0.1 is the old nanoGPT; 0.1.0, the first on Tucano, is not
  published. No paper and no DOI

marola-gpt lives in marola-ml. This index points to it; no directory here holds it.

<details>
<summary>The base model</summary>

Since 0.1.0, marola-gpt is
[Tucano-2b4](https://huggingface.co/TucanoBR/Tucano-2b4) at revision `b8def49a1931` with a LoRA
adapter (r=8 on `q_proj` and `v_proj`) that marola trains. Tucano-2b4 has 2.44 billion
parameters. Its authors are Nicholas Kluge Corrêa, Aniket Sen, Sophia Falk and Shiza Fatimah,
its licence is Apache-2.0, and its paper is *Tucano: Advancing Neural Text Generation for
Portuguese* ([arXiv:2411.07854](https://arxiv.org/abs/2411.07854), 2024). The base weights do not
change: a release of marola-gpt keeps only the adapter, under Apache-2.0 as Tucano. The code in
marola-ml is MIT ([ADR 0004](https://github.com/marola-dev/marola-ml/blob/main/docs/adr/0004-marola-gpt-sobre-tucano.md)).
A work that uses marola-gpt cites Tucano too. The 0.0.x releases were a fork of Andrej
Karpathy's [nanoGPT](https://github.com/karpathy/nanoGPT), trained from random weights. On 15
October 2026, `huggingface.co/h0ffmann/marola-gpt` had one tag, `v0.0.1`.

</details>

<details>
<summary>The corpus</summary>

marola-gpt trains on the marola-corpus tag that marola-ml pins in
`corpus.version`, today `v0.1.0`. marola-corpus `main` at
[`355bf83`](https://github.com/marola-dev/marola-corpus/tree/355bf83) adds 12 notes in Portuguese
from Brazilian oceanography institutes and from papers under an open licence
([marola-corpus#30](https://github.com/marola-dev/marola-corpus/pull/30)). No tag holds them yet:
the tag `v0.2.0` and the bump of `corpus.version` in marola-ml and marola-app wait for the owner.
No released marola-gpt was trained on these notes.

Each note is marola.dev's summary of one source. A summary of a CC BY 4.0 article stays CC BY
4.0 and credits the article's authors. A note on a Brazilian official act (not protected, Lei
9.610/98, art. 8º, IV) or on MIT text is MIT. The table copies marola-corpus's
[`REUSE.toml`](https://github.com/marola-dev/marola-corpus/blob/355bf83/REUSE.toml).

| Note (`knowledge/`) | Source | Licence | Copyright |
|---|---|---|---|
| `lioc-medir-ondas-com-camera.md` | LIOc/COPPE-UFRJ, Anuário IGEO-UFRJ 37(1), 2014, [doi:10.11137/2014_1_36_45](https://doi.org/10.11137/2014_1_36_45) | CC BY 4.0 | Henrique Rapizo, Victor D'Ávila, Nelson Violante-Carvalho, Uggo Pinho, Carlos Eduardo Parente; marola.dev |
| `ressacas-rio-de-janeiro-1948-2008.md` | Anuário IGEO-UFRJ 44, 2021, [doi:10.11137/1982-3908_2021_44_41726](https://doi.org/10.11137/1982-3908_2021_44_41726) | CC BY 4.0 | Rafael de França Lima, Flavia Moraes Lins-de-Barros, Mauro Cirano; marola.dev |
| `ressacas-e-danos-rio-de-janeiro-1979-2013.md` | Rev. Gestão Costeira Integrada 18(2), 2018, [doi:10.5894/rgci-n146](https://doi.org/10.5894/rgci-n146) | CC BY 4.0 | Flavia Moraes Lins-de-Barros, Leonardo Klumb-Oliveira, Rafael de França Lima; marola.dev |
| `safety/correntes-de-retorno-rio-de-janeiro.md` | Sociedade & Natureza 22(1), 2010, [doi:10.1590/S1982-45132010000100009](https://doi.org/10.1590/S1982-45132010000100009) | CC BY 4.0 | Eduardo Manuel Rosa Bulhões; marola.dev |
| `balneabilidade-e-coli-chuva-florianopolis.md` | RBEPT 2(3), 2010, [doi:10.15628/rbept.2010.18028](https://doi.org/10.15628/rbept.2010.18028) | CC BY 4.0 | Débora Monteiro Brentano, Letícia Meurer Laurinavicius; marola.dev |
| `mares-de-tempestade-armacao-e-canasvieiras.md` | Rev. Bras. Geogr. Física 13(4), 2020, [doi:10.26848/rbgf.v13.4.p1730-1755](https://doi.org/10.26848/rbgf.v13.4.p1730-1755) | CC BY 4.0 | Karine Bastos Leal, Jarbas Bonetti, Pedro de Souza Pereira; marola.dev |
| `inundacao-costeira-enseada-de-tijucas.md` | Rev. Bras. Geogr. Física 14(5), 2021, [doi:10.26848/rbgf.v14.5.p2534-2549](https://doi.org/10.26848/rbgf.v14.5.p2534-2549) | CC BY 4.0 | Elaine Cristina dos Santos, Jarbas Bonetti; marola.dev |
| `energia-das-ondas-litoral-catarinense.md` | Rev. Bras. Geogr. Física 11(4), 2018, [doi:10.26848/rbgf.v11.4.p1303-1320](https://doi.org/10.26848/rbgf.v11.4.p1303-1320) | CC BY 4.0 | Thaísa Beloti Trombetta, Phelype Haron Oleinik, Bruno Vasconcellos Lopes, Ricardo Cardoso Guimarães, Wiliam Correa Marques, Liércio André Isoldi; marola.dev |
| `temperatura-do-mar-e-corrente-do-brasil.md` | Rev. Bras. Geogr. Física 13(6), 2020, [doi:10.26848/rbgf.v13.6.p2531-2552](https://doi.org/10.26848/rbgf.v13.6.p2531-2552) | CC BY 4.0 | Marilia Mitidieri Fernandes de Oliveira, Jorge Luiz Fernandes de Oliveira, Pedro José Farias Fernandes, Nelson Francisco Favilla Ebecken; marola.dev |
| `labeco-previsao-de-ondas-ww3.md` | LabECO/UFSC, the proposal in [ww3-gpu](https://github.com/h0ffmann/ww3-gpu/tree/main/pubs/proposal) (MIT) | MIT | Matheus Hoffmann; marola.dev |
| `inpo-edital-de-chamamento.md` | INPO, MCTI's call, [Diário Oficial da União](https://www.in.gov.br/web/dou/-/edital-de-chamamento-publico-n-31/2021-346703585) (an official act) | MIT | marola.dev |
| `inpo-organizacao-social.md` | INPO, [Decreto 11.275/2022](https://www.lexml.gov.br/urn/urn:lex:br:federal:decreto:2022-12-06;11275) (an official act) | MIT | marola.dev |

</details>

### ww3-gpu: the DIA on a GPU without changing the answer

- **Experiment:** `marola-experiment-003`, in [ww3-gpu](https://github.com/h0ffmann/ww3-gpu)
- **What it is:** WAVEWATCH III's Fortran ported to C++20/Kokkos and checked bit for bit against
  the Fortran with WW3's own regtests, starting with the DIA nonlinear source term (`W3SNL1`)
- **Repositories:** [ww3-gpu](https://github.com/h0ffmann/ww3-gpu),
  [ww3-dia-gpu](https://github.com/h0ffmann/ww3-dia-gpu),
  [ww3-dia-gpu-v2](https://github.com/h0ffmann/ww3-dia-gpu-v2)
- **Site:** [h0ffmann.github.io/ww3-gpu](https://h0ffmann.github.io/ww3-gpu/)
- **Paper:** [PDF](https://github.com/h0ffmann/ww3-gpu/blob/f83aa0c/pdf/ww3-lab-course.pdf), DOI
  [10.5281/zenodo.23221351](https://doi.org/10.5281/zenodo.23221351)
- **Status:** **20.12 %** of WW3's Fortran translated to C++20/Kokkos, 53 004 of 263 375 lines of
  `model/src`

ww3-gpu lives in its own repository. This index points to it; no directory here holds it.
Read on 17 October 2026 at
[`f83aa0c`](https://github.com/h0ffmann/ww3-gpu/tree/f83aa0c).

<details>
<summary>What it is</summary>

The discrete interaction approximation (DIA) of WAVEWATCH III® (WW3), `W3SNL1`
with its table builder `INSNL1` (`model/src/w3snl1md.F90:115-786` at `WW3@6d1bcdfe`),
translated to C++ with Kokkos, one source for Serial, OpenMP and CUDA. WW3's own `W3SRCE` calls
it through a `bind(C)` shim on the fork `h0ffmann/WW3`, behind the `KOKKOS` switch, and
`WW_KOKKOS_SNL1=0|1` picks the Fortran or the Kokkos DIA in one executable. The code is under
[`kokkos/`](https://github.com/h0ffmann/ww3-gpu/tree/f83aa0c/kokkos); its record is the
[port report](https://github.com/h0ffmann/ww3-gpu/blob/f83aa0c/kokkos/port_report/W3SNL1_KOKKOS.md).

</details>

<details>
<summary>The method</summary>

The rules are ww3-gpu's
[`AGENTS.md`](https://github.com/h0ffmann/ww3-gpu/blob/f83aa0c/AGENTS.md):

- translate, don't improve: each line of the Fortran in the same order, `float` for WW3's
  `REAL`, no algebraic rewrite;
- bit for bit with the Fortran of the same WW3 executable, never a widened tolerance; the
  reference is the `-O3` build, so `AF11 = (SIG*TPIINV)**11` follows gfortran's `-O3` power
  chain, found in WW3's optimised GIMPLE
  ([log](https://github.com/h0ffmann/ww3-gpu/blob/f83aa0c/docs/log/2026-10-14-snl1-bitwise-af11.md));
- no floating-point contraction: `-ffp-contract=off` on the CPU, `--fmad=false` on CUDA;
- the port has no tests of its own: WW3's regtests are its tests
  ([ADR-0010](https://github.com/h0ffmann/ww3-gpu/blob/f83aa0c/docs/ADRs/ADR-0010-kokkos-validated-by-ww3-regtests-only.md)),
  run at checkpoints
  ([ADR-0011](https://github.com/h0ffmann/ww3-gpu/blob/f83aa0c/docs/ADRs/ADR-0011-port-in-units-regtest-at-checkpoints.md));
- no timing without parity: a speed figure enters a table only after the regtest replay passed
  on the same commit.

</details>

<details>
<summary>What is measured</summary>

On an i9-14900, CPU only, each regtest entry ran twice from one executable:
once with the Fortran DIA, once with the Kokkos DIA. WW3's `test.comp` compared the outputs byte for
byte. The 100 serial `NL1` entries of WW3's `matrix.base` had 0 differing files
([record](https://github.com/h0ffmann/ww3-gpu/blob/f83aa0c/docs/data/hoff_matrix_2026-10-15.tsv)),
and so did the 25 shared-memory OpenMP entries
([record](https://github.com/h0ffmann/ww3-gpu/blob/f83aa0c/docs/data/hoff_matrix_omp_2026-10-15.tsv)).
The run of all 311 `NL1` entries (serial, OpenMP, MPI, PDLIB, `ww3_multi`) was in progress on 15
October 2026; ww3-gpu has no record of it at `f83aa0c`. Nothing has run inside WW3 on a GPU: that
run needs the owner. On 15 September 2026, 1 000 points per call, NK=25 and NTH=24, the kernel ran
in 24.96 ms on one core and 0.047 ms on an RTX 4090. Through the shim, with the copies, it ran in
25.88 ms and 0.75 ms ([`PORT_STATUS.md`](https://github.com/h0ffmann/ww3-gpu/blob/f83aa0c/kokkos/PORT_STATUS.md)).
Neither number is a speed-up of WW3.

</details>

<details>
<summary>ww3-dia-gpu against ww3-dia-gpu-v2</summary>

[ww3-dia-gpu](https://github.com/h0ffmann/ww3-dia-gpu) (v1) is the owner's fork, with no file
changed, of [consigcody94/ww3-dia-gpu](https://github.com/consigcody94/ww3-dia-gpu) at `38919d2`:
a CUDA benchmark proposed to NOAA in March 2026 (BSD-3-Clause).
[ww3-dia-gpu-v2](https://github.com/h0ffmann/ww3-dia-gpu-v2) (v2, MIT) documents ww3-gpu's port and
compares the two; it copies no code. The comparison, section by section of the Fortran, is
ww3-gpu's
[`docs/W3SNL1_GPU_COMPARISON_202610.md`](https://github.com/h0ffmann/ww3-gpu/blob/f83aa0c/docs/W3SNL1_GPU_COMPARISON_202610.md).

| | v1, ww3-dia-gpu | v2, ww3-dia-gpu-v2 |
|---|---|---|
| What it computes | `SA1`, `SA2`: part of section 3 of `W3SNL1`, on synthetic inputs | all of `W3SNL1` and `INSNL1`: the source `S` and the diagonal `D` |
| Called by WW3 | no: a stand-alone benchmark | yes, from `W3SRCE`, behind the `KOKKOS` switch |
| "Bit-identical" against | itself, in another loop order | the Fortran DIA, in the same WW3 executable |
| WW3 regtest entries | 0 runnable | 125 of 125 byte-identical (100 serial, 25 OpenMP) |
| Published speed | 16.8x, one layout against another on one RTX 3060 | 34x through the shim against one core, RTX 4090 |

The two speeds are not comparable: other GPUs, a fraction of the work per bin in v1, and neither
is a speed-up of WW3.

</details>

<details>
<summary>How far the translation is</summary>

Of WW3's Fortran (`model/src` at `WW3@03adda91`), 53 004 of
263 375 lines, 20.12 %, have a C++20/Kokkos translation: 293 of 1 023 routines, in 56 of 147
files. WW3 calls the Kokkos code for 3 082 lines (1.17 %), and WW3's regtests have passed on 663
of them (0.25 %), the DIA. The port is 44 911 lines of C++ in 313 files. ww3-gpu's
`scripts/port_score.py --write` writes these numbers into
[`PORT_STATUS.md`](https://github.com/h0ffmann/ww3-gpu/blob/f83aa0c/kokkos/PORT_STATUS.md).

</details>

**Cite.** ww3-gpu, the lab and its book, is cited by its concept DOI,
[10.5281/zenodo.23221351](https://doi.org/10.5281/zenodo.23221351). ww3-dia-gpu-v2 has no DOI yet;
it will be published later.

### ptbr-writter: technical writing in Brazilian Portuguese, for agents

- **Experiment:** `marola-experiment-004`, in
  [ptbr-writter](https://github.com/h0ffmann/ptbr-writter)
- **What it is:** a Claude Code plugin that rewrites technical text in Brazilian Portuguese for
  one reading: explicit subject, one proposition per sentence, frozen terms. Its goal is to keep
  a repository's documentation in pt-BR and English with fewer tokens
- **Site:** [h0ffmann.github.io/ptbr-writter](https://h0ffmann.github.io/ptbr-writter/)
- **Paper:** none
- **Status:** the plugin's first release,
  [v0.1.0](https://github.com/h0ffmann/ptbr-writter/releases/tag/v0.1.0), 20 October 2026. No
  paper and no DOI

ptbr-writter lives in its own repository. This index points to it; no directory here holds it.
Read on 20 October 2026 at
[`51b317f`](https://github.com/h0ffmann/ptbr-writter/tree/51b317f).

<details>
<summary>What it is</summary>

A conceptual fork of
[kayquer/portugues-tecnico-controlado](https://github.com/kayquer/portugues-tecnico-controlado)
(PTC, MIT), a controlled Portuguese inspired by ASD-STE100. The plugin has three skills:
`ptbr-writter` (13 rules, PTW-1 to PTW-13), its alias `ptbr`, and `cientifico` (12 more rules,
CIE-1 to CIE-12, for text with sources). A request runs at one of five levels of rigour:
`estrito`, `descritivo`, `leve`, `científico` and `smart-note`; the last one writes notes for a
second brain and combines with the others. PTW-1 to PTW-8 come from the PTC; PTW-9 to PTW-13 adapt
rules of this repository's `ouro-paper` skill and its Vale styles, and of ww3-gpu's `AGENTS.md`. A skill's body holds
instructions only: the credits are in the
[README](https://github.com/h0ffmann/ptbr-writter/blob/51b317f/README.md), because a skill is
loaded into other people's context.

</details>

<details>
<summary>What is measured</summary>

- The plugin adds about 173 tokens to every session, the descriptions of its three skills, by
  `claude plugin details` in the repository's `scripts/plugin-smoke.sh`. CI installs the plugin
  into an empty Claude Code configuration on each change and fails above 300.
- The regression cases (`claude plugin eval`, three cases at `51b317f`) run only by hand. One
  case, run once on 20 October 2026, scored 1.00; the suite has not run as a whole ⚠.
- A `.pdf` output is in review, not in `main`
  ([#29](https://github.com/h0ffmann/ptbr-writter/pull/29)) ⚠. Its toolchain,
  picasso's `labs/ptbr-pdf`, is a 206 MiB download and 729 MiB on disk, and ran first in 27 s
  on a fresh GitHub runner
  ([run](https://github.com/h0ffmann/ptbr-writter/actions/runs/39515637972)).

</details>

**Cite.** ptbr-writter has no DOI yet. Cite the repository at its release tag, and the PTC.

Not a research: [`chamada/`](chamada/README.md), *Marola: Chamada para CONTRIBUIÇÃO e
PUBLICAÇÃO* ([PDF](chamada/chamada.pdf), at most 5 pages). It is a call in easy Brazilian
Portuguese to undergraduates, master's and doctoral students. It says what marola is, and what
it takes to publish on marola.dev and to collaborate with it.

## A new paper, explained like you are five

Think of this repository as a school. The rulebook is on the front door, and every classroom
follows it: never make up a source, say how you checked each claim, credit whoever you learned
from. Each research is a classroom with its own teacher. The teacher picks the language, the
tools, the way of working and who may copy from the blackboard. The teacher cannot tear a page
out of the rulebook.

To open a classroom:

1. **Ask.** Open an issue in this repository with a name for your research, one sentence about
   it, and the licence you want. The owner of the repository opens the directory
   ([`AGENTS.md`](AGENTS.md), rule 4); from then on the research is yours.
2. **Make the parts.** Every research has the same parts (the tree below). Start with notes:
   one idea in one note ([`NOTES.md`](NOTES.md)).
3. **Write the paper from the notes.** Put a mark on every claim: `(v)` when you checked it,
   `⚠` when you did not. Write in `paper/REFERENCES.md` how you checked each source.
4. **Run the checks** on your machine, or let CI run them (below).
5. **Open a pull request.** CI renders the paper and checks it. A human merges it.
6. **Release** only when you ask the owner by name: a release makes a DOI, and a DOI cannot be
   deleted.

### The parts of a research

```text
<research>/
  README.md               what it is, its hard rules (yours), its status, its terms
  OVERRIDE_CONFIG.toml    what it changes of the root's discipline (optional)
  <research>.pdf          the rendered paper (`just paper <research>`)
  paper/
    paper.md              front matter, then the text, a mark on every claim
    refs.bib              every reference, with a DOI where one exists
    REFERENCES.md         one row for each entry of refs.bib: how it was checked
  notes/                  the slip box: index.md, then one note for each idea
  journal/                one entry for each challenge met
  site/                   its website, Gleam and Lustre, built from the files above
```

A `paper.md` starts like this, and its last two sections are always "What is not known" and
"Where the thesis comes from" ([`ouro-paper`](.claude/skills/ouro-paper/SKILL.md)):

```markdown
---
title: "<the title>"
author: "<you>"
status: draft
version: 0.1.0
date: 2026-10-14
related: []
style: research
---
```

## Discipline from the root, freedom in a research

All the discipline comes from the root of this repository: [`AGENTS.md`](AGENTS.md),
[`REUSE.md`](REUSE.md), [`TRADEMARKS.md`](TRADEMARKS.md), [`NOTES.md`](NOTES.md) and the
[`ouro-paper`](.claude/skills/ouro-paper/SKILL.md) skill. Every research starts with all of it.
Each researcher is free to set the licence of their research on their own terms, and to work in
their own way.

[`OVERRIDE_CONFIG.toml`](OVERRIDE_CONFIG.toml) at the root declares how much a research may
override, policy by policy. A research writes what it changes in its own
`<research>/OVERRIDE_CONFIG.toml`, and `just overrides` refuses what the root does not allow.

| Level | Policies | What a research may do |
|---|---|---|
| `free` | licence, workflow, language | set its own value, with the date and the files where a reader finds it |
| `stricter-only` | checks, parts | add a check or a part; never remove or loosen one of the root's |
| `never` | citation, trademarks, references, humans-steer, private-sources, isolation, branches, release | nothing: the root's rule holds as written |

marola-bench declares two overrides
([`marola-bench/OVERRIDE_CONFIG.toml`](marola-bench/OVERRIDE_CONFIG.toml)): its licence (all
rights reserved) and its workflow (its hard rules 1, 2, 3 and 7). A licence in
[`REUSE.toml`](REUSE.toml) that a research does not declare fails the check, and so does a
declared one that `REUSE.toml` does not give.

## Install it on your machine

You need Git, [Nix](https://nixos.org/) and [`just`](https://github.com/casey/just). Nix brings
every other tool, at the versions pinned in `flake.lock`. On Ubuntu 24.04:

```console
curl -fsSL https://install.determinate.systems/nix | sh -s -- install   # Nix (Determinate's installer)
sudo apt install just                                                  # just 1.21 reads this justfile
git clone https://github.com/marola-dev/marola-research && cd marola-research
just paper marola-bench    # marola-bench/paper/*.md -> marola-bench/marola-bench.pdf
just site marola-bench     # the research's files -> marola-bench/site/dist/
just pages                 # every research's site, as one tree for GitHub Pages
```

The first `just paper` downloads the toolchain; later runs reuse it. The scripts that check citations and overrides need Python 3.11 or later (Ubuntu 24.04
has 3.12).

<details>
<summary>Environment details</summary>

The tools come from [picasso](https://github.com/h0ffmann/picasso)'s labs, through
[`flake.nix`](flake.nix).

| Shell | From | Programs |
| :---- | :--- | :------- |
| default (`nix develop`) | picasso's `paper` lab | pandoc and citeproc, XeLaTeX, just, poppler, librsvg |
| `md` (`nix develop .#md`) | the `paper` lab's nixpkgs | markdownlint-cli2, Vale, lychee, reuse, git |
| `site` (`nix develop .#site`) | picasso's `gleam-website` lab | Gleam, Node, esbuild |

</details>

## With a Claude Project (not Claude Code)

A Claude Project is a project on claude.ai: a set of instructions, files and repositories that
every chat in it shares. You do not install anything. Claude reads the repository and the
rules, writes with you, and proposes the change as a pull request; CI runs the checks you would
run by hand.

<details>
<summary>The five steps</summary>

1. **Make the project** on claude.ai, and add the repository `marola-dev/marola-research`. Add
   `h0ffmann/picasso` too: the flake reads its labs. marola's own project file records that a
   session got "403" from GitHub for a flake input outside the project's repositories
   ([`CLAUDE_PROJECT.config.md`](https://github.com/marola-dev/marola/blob/e208ae6/CLAUDE_PROJECT.config.md),
   section 2).
2. **Give it the rules.** Paste into the project instructions: "Read AGENTS.md, then the
   README.md of the research you work on, then .claude/skills/ouro-paper/SKILL.md. Work on a
   branch and open a pull request; never push to main."
3. **Say which research** you work on, and what you want: a note, a section, a reference to
   check.
4. **Read the pull request's checks.** When `pdf`, `.md` or `site` fails, paste the failure into
   the chat and ask for a fix. Do not ask it to skip a check.
5. **Read the PDF** that the pull request renders before you merge.

</details>

This way of working has not been tried yet with this repository. The steps come from marola's
project, which runs the same way.

## How to read a paper here

Every claim carries a mark: `(v)` was checked, and the paper's `REFERENCES.md` says how; `⚠`
was not. Every paper ends with what is not known.

## Checks

`just check <research>`, `just md-quality`, `just overrides` and `just pages` are what CI runs,
on each pull request and on `main`: [`pdf`](.github/workflows/pdf.yml) (one job for each
research), [`.md`](.github/workflows/md.yml), [`live links`](.github/workflows/links.yml) and
[`site`](.github/workflows/site.yml), which also publishes the sites from `main`.
[`AGENTS.md`](AGENTS.md) says what each one checks.

## For agents

[`AGENTS.md`](AGENTS.md) has the map and the rules;
[`ouro-paper`](.claude/skills/ouro-paper/SKILL.md) is how a text is written and checked. The
skill has no evals yet.

## History

marola-research was minted by the owner's other repositories. Its rules are theirs, each read
at a commit ([`ouro-paper`](.claude/skills/ouro-paper/SKILL.md), "Sources"):

<details>
<summary>The four repositories and what each gave</summary>

| Repository | DOI | What it gave |
|---|---|---|
| [h0ffmann/closed-source](https://github.com/h0ffmann/closed-source) | [10.5281/zenodo.23333656](https://doi.org/10.5281/zenodo.23333656) | humans steer; never invent a reference; borrow, cite, propagate; the reference log; the easy pt-BR version |
| [h0ffmann/ww3-gpu](https://github.com/h0ffmann/ww3-gpu) | [10.5281/zenodo.23221351](https://doi.org/10.5281/zenodo.23221351) | the `(v)` and `⚠` marks; every number with its command; no result before parity |
| [h0ffmann/picasso](https://github.com/h0ffmann/picasso) | [10.5281/zenodo.23311208](https://doi.org/10.5281/zenodo.23311208) | a pinned toolchain (the labs this flake reads); `.zenodo.json` as the one hand-edited citation file; the shape of this README |
| [marola-dev/marola](https://github.com/marola-dev/marola) | [10.5281/zenodo.23224155](https://doi.org/10.5281/zenodo.23224155) | design first, in a MIP; the release chain; "a DOI cannot be deleted" |

</details>

<details>
<summary>When it happened, pull request by pull request</summary>

| When | Pull requests | What happened |
|---|---|---|
| 2026-10-10 | none | the first commit |
| 2026-10-13 | [#2](https://github.com/marola-dev/marola-research/pull/2)–[#6](https://github.com/marola-dev/marola-research/pull/6) | one directory for each research; the `ouro-paper` skill; marola-bench, its site, notes and journal; its v0.1.0 and its DOI; other people's skills by link |
| 2026-10-14 | [#8](https://github.com/marola-dev/marola-research/pull/8), [#9](https://github.com/marola-dev/marola-research/pull/9) | marola-bench's hard rule 7 and its design in pictures; the call for contribution, `chamada/` |

</details>

## Cite

Each research that was released has its own DOI, and its page says how to cite it.

| Research | Cite the work | This version |
|---|---|---|
| marola-bench | [10.5281/zenodo.23352633](https://doi.org/10.5281/zenodo.23352633) | v0.1.0: [10.5281/zenodo.23352634](https://doi.org/10.5281/zenodo.23352634) |

> Hoffmann, M. (2026). *marola-bench: a proposal for a WeatherBench for Brazil*. Zenodo.
> <https://doi.org/10.5281/zenodo.23352633>

GitHub's "Cite this repository" gives the same, from [`CITATION.cff`](CITATION.cff).

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

<details>
<summary>The ouroboric-dev repositories, in their owners' words</summary>

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

</details>

What this repository takes from them, and where: the working rules in
[`ouro-paper`](.claude/skills/ouro-paper/SKILL.md) (its "Sources"), the journal's six headings
([`NOTES.md`](NOTES.md)) and the licence file's pattern ([`REUSE.toml`](REUSE.toml)). The name
and the logo of Ouroboric are trademarks of that project and are not licensed here.

## Not here yet

Any code of a research. The case study of marola-experiment 001.

## Credits

The layout of this README (the drawing, the line of links, the badges, the collapsed table of
the environment) follows [picasso's README](https://github.com/h0ffmann/picasso), which credits
its own to [Gabriel Volpe's `nix-config`](https://github.com/gvolpe/nix-config). The drawing at
the top is an original, made for this repository.

## Licence

**A research is not open because this repository is public.** Each research has the terms its
owner sets ([discipline and freedom](#discipline-from-the-root-freedom-in-a-research)).
marola-bench is **all rights reserved**: read it and cite it; do not copy it or share it without
the author's acknowledgement. [`REUSE.md`](REUSE.md) says who may work on it and what an agent
must do, and [`TRADEMARKS.md`](TRADEMARKS.md) has the names and logos.

At the root, the code that builds and checks a research is MIT ([`LICENSE`](LICENSE)). The
texts that explain the repository, and the drawing, are CC BY 4.0. One file says it for every
file, with no header in any file: [`REUSE.toml`](REUSE.toml), in the pattern of the
ouroboric-dev repositories. The licence texts are in [`LICENSES/`](LICENSES/). `just reuse`
checks it.
