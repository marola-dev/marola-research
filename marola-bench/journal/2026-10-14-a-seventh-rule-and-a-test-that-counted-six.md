---
title: "A seventh rule, and a test that counted six"
date: 2026-10-14
tags: [rules, numbers, checks, ponytail]
status: closed
---

# A seventh rule, and a test that counted six

## Challenge

The owner gave a seventh hard rule: "Ponytail 5 will be adopted as Coding Assistant (Claude Code
Plugin)". The count of the rules is written in nine places, and a count that is right in some of
them and wrong in others is the fault that the entry of 13 October,
[five rules in one place and six in another](2026-10-13-five-rules-in-one-place-and-six-in-another.md),
recorded.

## Context

The places were found with `grep` for "six" and "seis": the paper's abstract, its block of rules,
the sentence that introduces them, its list of what is not known, the README, the note and its
index line, and the easy Portuguese abstract. The ninth was not in the list: the site's test,
`assert list.length(content.rules) == 6`. `just pages` failed on it, 6 passed and 1 failed.

## Options

- Remove the count from the test, so that a new rule never fails it.
- Change the count to seven.

## Decision

Change it to seven. The test is the only check that counts the rules, and it did what the entry
of 13 October wished a check would do. Removing it would weaken a check to get green.

## Result

Seven in every place, and `just pages` passes: 7 passed in the site's tests, 6 in the generator's.
`zenodo.json` still says "five hard rules", as it did before this change: it is the metadata of the
next release, and it is rewritten then.

## Lessons

- A rule's count lives in a test too. Search the tests as well as the texts.
- A tool that draws a diagram can send it out. K-Dense's `scientific-schematics` skill sends its
  prompt to OpenRouter (its own `compatibility` field asks for "an OpenRouter API key"), and the
  terms of marola-bench do not allow sharing it outside marola-dev and ouroboric-dev. The figures
  of the preprint were drawn by hand as SVG and rendered with the pinned `rsvg-convert`.
