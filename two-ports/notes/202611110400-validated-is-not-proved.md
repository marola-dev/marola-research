---
id: "202611110400"
title: "Validated by regtests is not a formal proof"
type: permanent
status: open-question
source: "Matheus Hoffmann, Claude Project thread, 2026-11-11, and ww3-gpu ADR-0001 at 58167d7"
tags: [evidence, proof]
created: 2026-11-11
---

# Validated by regtests is not a formal proof

The owner asked the paper to say that the DIA was regtested, "so it can be considered proved".
The DIA port is byte-identical to the Fortran on all 100 serial and 25 OpenMP entries of WW3's
matrix that select it, and its section 1 was swept over all 2^32 inputs.

That is strong evidence for those inputs and those builds. It is not a proof: a regtest covers
the cases it runs, and a proof covers every case. So the paper says "validated", and leaves
"proved" to the Agda work. The owner has not yet said whether this wording is his. See [[202611110401-marola-experiment-005]].
