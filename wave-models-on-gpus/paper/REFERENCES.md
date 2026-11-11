---
title: "Reference log for wave-models-on-gpus"
status: draft
date: 2026-11-11
related: [paper.md, paper.pt-BR.md, refs.bib]
style: reference
---

# Reference log for wave-models-on-gpus

Every entry of [`refs.bib`](refs.bib) has a row here. Both editions of the paper cite the same
entries. For each one, on the date of record, the record was read: the registry's record of a
DOI, the GitHub API for a repository, or the file at the commit named. Then a passage that
supports the claim was read. The column "Read" says how much.

Who read: the writer of the preprint, a Claude Code session under the first author's direction,
in the session that wrote h0ffmann/ww3-gpu's `pubs/preprint/` and moved it here. The DOIs of
`koldunov2026` and `on525` were read again from arXiv and DataCite when this log was written.

Date of record: 11 November 2026.

| Key | Identifier | Read | The passage, and where | Status |
|---|---|---|---|---|
| `ww3gpu` | [10.5281/zenodo.23221351](https://doi.org/10.5281/zenodo.23221351), h0ffmann/ww3-gpu at `58167d7` | the files named in the paper: `kokkos/PORT_STATUS.md`, `regtests/README.md`, `kokkos/port_report/W3SNL1_KOKKOS.md`; the GitHub API for the repository's dates and commits | the counts of Tables 1 to 4 and the DIA's regtest record, each from the file the table names | verified |
| `chaceon` | [h0ffmann/chaceon](https://github.com/h0ffmann/chaceon) at `0c098fe` | `README.md`, `docs/WW3_GPU_PARITY_202611.md`; the GitHub API for the dates and commits | the shape of the Rust port, its 96 byte-identical files and its Lean 4 proof | verified |
| `noaarecord` | [ww3-gpu `docs/NOAA_PROGRESS_RECORD_202610.md` at `58167d7`](https://github.com/h0ffmann/ww3-gpu/blob/58167d7/docs/NOAA_PROGRESS_RECORD_202610.md) | full text | the CPU results of the whole runtime with the resident spectrum, and their limits | verified |
| `diagpuv2` | [h0ffmann/ww3-dia-gpu-v2 at `32aa2ef`](https://github.com/h0ffmann/ww3-dia-gpu-v2/tree/32aa2ef) | `README.md` | the whole `W3SNL1`, inside WW3, bit for bit. Its README calls ww3-gpu private; the GitHub API shows it public, and the paper does not repeat that line | verified, with that one line not used |
| `adr0001` | [ww3-gpu `docs/ADRs/ADR-0001-proof-language.md` at `58167d7`](https://github.com/h0ffmann/ww3-gpu/blob/58167d7/docs/ADRs/ADR-0001-proof-language.md) | full text | the reasons for no proof language: SMT queries and exhaustive sweeps instead | verified |
| `oceanwaves` | [h0ffmann/proof `ocean-waves/` at `b863c15`](https://github.com/h0ffmann/proof/tree/b863c15/ocean-waves) | the README and the theorem statements listed in Section 4 | the theorems the paper lists, by name | verified as statements; the proofs were not re-checked with Lean |
| `koldunov2026` | [10.48550/arXiv.2606.11356](https://doi.org/10.48550/arXiv.2606.11356) | the passages quoted, from the arXiv full text; the record from the arXiv API | "across compilers and arithmetic orderings is neither attainable nor necessary"; the Fortran to C to C++/Kokkos route, the 0.006 °C RMS difference over five years, the per-field ceilings on the GPU | verified |
| `on525` | [10.25923/h7j3-1h25](https://doi.org/10.25923/h7j3-1h25) | the DataCite record; the report's content through ww3-gpu's `docs/AWESOME-WW3_202609.md` at `e0aa77e`, which quotes it | "Decision is a complete bottom-up rewrite in a new repository"; "C++ (likely with Kokkos) as the initial core; Rust ... developed in parallel; Fortran demoted to a solver-only language" | partial: the report itself was not read, so the paper marks these claims ⚠ |
| `ww4` | [NOAA-EMC/WW4](https://github.com/NOAA-EMC/WW4), branch `develop` at `875f49a` | the GitHub API: commits of `develop`, the tree's file extensions | 40 commits from 2025-11-17 to 2026-10-16; 66 `.cpp` and 31 `.h` files; no WW3 physics kernel | verified |

## Looked for and not cited

None.
