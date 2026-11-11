---
title: "Two researches, one .zenodo.json"
date: 2026-11-11
tags: [zenodo, citation, release]
status: open
---

# Two researches, one .zenodo.json

## Challenge

The owner asked that this research be the next Zenodo record he mints. The repository has one
`.zenodo.json`, and CI checked it against every research's `zenodo.json`.

## Context

`.zenodo.json` at the root is what Zenodo reads. Until now it was a copy of
`marola-bench/zenodo.json`, and CI ran `scripts/citation.py <research> --check` for each research
that has a `zenodo.json`. With two of them, one of the two checks must fail. `CITATION.cff` also
said "All rights reserved" for every research, which is marola-bench's term and not this one's.

Zenodo gives one concept DOI to a repository. A release from the fork where Zenodo's switch is on
adds a version to marola-bench's concept, 10.5281/zenodo.23352633.

## Options

1. Keep marola-bench in the root files and mint this record by hand.
2. Point the root files at this research, and make CI check only the research they point at.
3. Move this research to its own repository.

## Decision

Option 2, since the owner named this research as the next record. `citation.py --check` with no
research validates every `zenodo.json` and checks the root files against the one they copy.
`CITATION.cff` takes its message from the research's licence.

## Result

`.zenodo.json` and `CITATION.cff` describe wave-models-on-gpus. How the owner mints it, a new deposit or a
GitHub release, is his choice; the pull request says what each one does to the concept DOI.

## Lessons

A root file that only one research can own needs a check that knows whose turn it is.
