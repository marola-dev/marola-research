---
title: "A freedom that a check can see"
date: 2026-10-14
tags: [licence, rules, checks, overrides]
status: closed
---

# A freedom that a check can see

## Challenge

The owner, 14 October 2026: "all the discipline comes from the root of this repository, but
every researcher is free to update licenses in his OWN terms, and his OWN workflow. Override
policies must be create use OVERRIDE_CONFIG.toml to declare how much users can override."
marola-bench had already used both freedoms, all rights reserved and its own stack, and nothing
recorded them as overrides. A check could not tell a freedom that was taken from a rule that
drifted.

## Context

marola-bench's terms were in three places: its block in `REUSE.toml`, `REUSE.md` and its
`README.md`. Its workflow was in its hard rules 1, 2, 3 and 7. The root's rules were in
`AGENTS.md`, with no level that said which of them a research may change.

## Options

- Say it in prose only, in the README and `AGENTS.md`.
- Let `REUSE.toml` alone be the record of a licence, and say nothing of a workflow.
- A root `OVERRIDE_CONFIG.toml` with a level for each policy (`free`, `stricter-only`,
  `never`), a `<research>/OVERRIDE_CONFIG.toml` with what the research changes, and a check
  that reads both, and `REUSE.toml` too.

## Decision

The third. The check (`scripts/override-check.py`, `just overrides`, in CI's `.md` job) refuses
a policy the root does not name, a `never` policy, a declaration without its value, date or
files, and a licence that `REUSE.toml` and the declaration do not agree on.

## Result

marola-bench declares two overrides, its licence and its workflow, and `just overrides`
passes; the self-test has eight cases, and each fails when it should. The README's new header,
centred as picasso's is, needed HTML, so the Markdown check now allows six elements of HTML.
That widens a check, and the pull request says so for the owner to decide.

## Lessons

A freedom needs a place where it is written. Then a check can see it, and a change that nobody
declared is a fault again.
