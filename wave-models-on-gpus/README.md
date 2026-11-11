# wave-models-on-gpus

*Wave models on GPUs*, a preprint. Two ports of WAVEWATCH III (WW3) written by coding agents, ww3-gpu in C++/Kokkos and chaceon in
Rust, and the one rule they share: the port gives the Fortran's bits. It compares how each
project defines and checks its evidence.

- **The paper:** [`wave-models-on-gpus.pdf`](wave-models-on-gpus.pdf), rendered from
  [`paper/paper.md`](paper/paper.md). A preprint, v0, not peer reviewed. It claims no speed-up.
- **The Portuguese edition:** [`wave-models-on-gpus.pt-BR.pdf`](wave-models-on-gpus.pt-BR.pdf), rendered from
  [`paper/paper.pt-BR.md`](paper/paper.pt-BR.md), in Português Técnico Controlado
  ([kayquer/portugues-tecnico-controlado](https://github.com/kayquer/portugues-tecnico-controlado)
  at `8938f58`, level `descritivo`).
- **The authors:** Matheus Hoffmann (UFRJ); Pedro Veras Guimarães (LabECO, UFSC), co-advisor of
  the first author; Pedro Cruz (GTA, UFRJ), advisor of the first author. Their ORCIDs are in
  [`zenodo.json`](zenodo.json) and in the paper.
- **Where it comes from:** h0ffmann/ww3-gpu, `pubs/preprint/` at
  [`935495e`](https://github.com/h0ffmann/ww3-gpu/tree/935495e/pubs/preprint), which builds the
  same prose with h0ffmann/closed-source's template. This directory renders it in this
  repository's format.
- **The repositories:** [ww3-gpu](https://github.com/h0ffmann/ww3-gpu),
  [chaceon](https://github.com/h0ffmann/chaceon).
- **The notes:** [`notes/index.md`](notes/index.md). **The journal:**
  [`journal/README.md`](journal/README.md).
- **The site:** none yet. The root names `site/` as a part of every research; it is not written,
  and the pull request that opened this research says so.
- **The experiment:** `marola-experiment-005`.

## Hard rules

The owner's words (Hoffmann, 11 November 2026, in the thread that wrote the preprint). They are
not open to an agent's choice.

1. Pedro Veras and Pedro Cruz are authors with their ORCIDs, and the paper makes clear "they are
   my advisors".
2. A disclaimer says there is an ongoing effort to make ww3-gpu and chaceon usable by any
   agent, "or even with Ollama local models".
3. This research is "the next zenodo record I will mint in my mac".

## Status

Draft, v0. Not released; no DOI. Both advisors must agree to be authors before the record is
public.

## Terms

The root's terms: the texts are CC BY 4.0 (`REUSE.toml`). Cite it by its DOI once it has one.
