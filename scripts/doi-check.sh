#!/usr/bin/env bash
# doi-check: the DOI of a research is in every place a reader or an index looks for it.
# A DOI that is in one page and not in the next is how a work stops being cited. So, for a
# research that has a `doi.tsv` (it has been released), the DOI of the work must be in:
#   the index (README.md), the research's own page, the terms (REUSE.md), the rules for agents
#   (AGENTS.md), the citation file (CITATION.cff, while the root files are this research's),
#   the paper's text, the rendered PDF, and the
#   table the site is built from (doi.tsv itself: the site's content is generated from it).
# And the DOI of the released version must be in the research's own page.
# A research with no doi.tsv has not been released: nothing to check.
#   scripts/doi-check.sh <research>
set -euo pipefail
cd "$(git rev-parse --show-toplevel)"
research="${1:?doi-check: usage: scripts/doi-check.sh <research>}"
table="$research/doi.tsv"
[ -f "$table" ] || { echo "doi-check: $research has no doi.tsv: not released, nothing to check" >&2; exit 0; }
value() { grep -v '^#' "$table" | awk -F'\t' -v k="$1" '$1 == k { print $2 }'; }
doi="$(value doi)"; version_doi="$(value version_doi)"; version="$(value version)"
[[ "$doi" =~ ^10\.[0-9]+/.+ ]] || { echo "doi-check: $table has no doi" >&2; exit 1; }
bad=0
need() { # need <file> <text> <what>
  if [ ! -f "$1" ]; then echo "doi-check: $1 is missing" >&2; bad=1
  elif ! grep -qF "$2" "$1"; then echo "doi-check: $1 does not have $3 ($2)" >&2; bad=1; fi
}
for f in README.md "$research/README.md" REUSE.md AGENTS.md "$research/paper/paper.md"; do
  need "$f" "$doi" "the DOI of $research"
done
# CITATION.cff is the root's, and it follows the research released next (scripts/citation.py).
if cmp -s .zenodo.json "$research/zenodo.json"; then
  need CITATION.cff "$doi" "the DOI of $research"
fi
need "$research/README.md" "$version_doi" "the DOI of $version"
need "$research/README.md" "https://doi.org/$doi" "the DOI as a link"
# The PDF, when the tool to read it is here (the paper shell has it; CI's pdf job runs this too).
if command -v pdftotext >/dev/null 2>&1 && [ -f "$research/$research.pdf" ]; then
  pdftotext "$research/$research.pdf" - | tr -d '\n' | grep -qF "$doi" \
    || { echo "doi-check: $research/$research.pdf does not have the DOI; run just paper $research" >&2; bad=1; }
fi
[ "$bad" = 0 ] || { echo "doi-check: the DOI of $research is not in every place" >&2; exit 1; }
echo "doi-check: $research: $doi is in the index, the research's page, the terms, the rules, the citation file and the paper" >&2
