# marola-research. One directory is one research. A research is a directory at the root that has
# `paper/paper.md`. The tools come from picasso's paper lab through flake.nix, pinned in
# flake.lock. No recipe uses an attribute, so the `just` of Ubuntu 24.04 (1.21) reads this file.

set shell := ["bash", "-euo", "pipefail", "-c"]

nix := "nix develop --extra-experimental-features 'nix-command flakes' --no-update-lock-file"

default:
    @just --list

# The researches, one name on each line. CI builds its matrix from this.
researches:
    @for f in */paper/paper.md; do [ -f "$f" ] && echo "${f%%/*}"; done

# Render <research>/paper/paper.md to <research>/<research>.pdf, with the logos of
# <research>/paper/logos.tsv under the title. A pandoc warning stops it.
paper research:
    {{nix}} --command just _paper {{research}} "{{research}}/{{research}}.pdf"

# Render <research>/paper/design-prop.preprint.md, the design in pictures, to
# <research>/design-prop.preprint.pdf. pandoc turns its SVG figures into PDF with rsvg-convert.
preprint research:
    {{nix}} --command just _paper {{research}} "{{research}}/design-prop.preprint.pdf" design-prop.preprint.md

# The call for contribution and publication (chamada/chamada.md): a text of marola as a whole,
# not of one research, so it has no logos and no site. Hard rule: at most 5 pages.
chamada:
    {{nix}} --command just _chamada chamada/chamada.pdf

_chamada out:
    mkdir -p "$(dirname "{{out}}")"
    cd chamada && pandoc chamada.md \
      --from markdown --citeproc --bibliography refs.bib --metadata link-citations=true \
      --lua-filter ../format/title.lua \
      --pdf-engine=xelatex --fail-if-warnings -H ../format/header.tex \
      -V geometry:margin=2.6cm -V fontsize=11pt -V colorlinks=true \
      -o "$OLDPWD/{{out}}"
    pages="$(pdfinfo "{{out}}" | awk '/^Pages/ {print $2}')"; [ "$pages" -le 5 ] || { echo "chamada: {{out}} has $pages pages; the hard rule is at most 5" >&2; exit 1; }
    @echo "chamada: {{out}} ($(pdfinfo "{{out}}" | awk '/^Pages/ {print $2}') pages)"

# What CI runs for the call: every reference has its row, at most 5 pages, the PDF is current.
chamada-check:
    for k in $(grep -oE '^@[a-z]+\{[^,]+' chamada/refs.bib | cut -d'{' -f2); do grep -q "\`$k\`" chamada/REFERENCES.md || { echo "chamada: $k has no row in REFERENCES.md" >&2; exit 1; }; grep -q "@$k\b" chamada/chamada.md || { echo "chamada: $k is in refs.bib and the text does not cite it" >&2; exit 1; }; done
    {{nix}} --command just _chamada build/chamada/chamada.pdf
    diff <(pdftotext chamada/chamada.pdf -) <(pdftotext build/chamada/chamada.pdf -) > /dev/null \
      || { echo "chamada: chamada/chamada.pdf was not made from this text; run just chamada and commit it" >&2; exit 1; }
    @echo "chamada: every reference has its row, and chamada/chamada.pdf is the one its text makes"

# Render every research's paper.
papers:
    for r in $(just researches); do just paper "$r"; done

_paper research out src="paper.md":
    [ -f "{{research}}/paper/{{src}}" ] || { echo "paper: no {{research}}/paper/{{src}}" >&2; exit 1; }
    scripts/logos.sh {{research}}
    mkdir -p "$(dirname "{{out}}")"
    cd "{{research}}/paper" && pandoc {{src}} \
      --from markdown --citeproc --bibliography refs.bib --metadata link-citations=true \
      --lua-filter ../../format/title.lua \
      --pdf-engine=xelatex --fail-if-warnings \
      -H ../../build/{{research}}/logos.tex -H ../../format/header.tex \
      -V geometry:margin=2.6cm -V fontsize=11pt -V colorlinks=true \
      -o "$OLDPWD/{{out}}"
    @echo "paper: {{out}}"

# Every entry of refs.bib has a row in REFERENCES.md, and the paper cites it.
refs research:
    for k in $(grep -oE '^@[a-z]+\{[^,]+' "{{research}}/paper/refs.bib" | cut -d'{' -f2); do grep -q "\`$k\`" "{{research}}/paper/REFERENCES.md" || { echo "refs: $k has no row in REFERENCES.md" >&2; exit 1; }; done
    for k in $(grep -oE '^@[a-z]+\{[^,]+' "{{research}}/paper/refs.bib" | cut -d'{' -f2); do grep -q "@$k\b" "{{research}}/paper/paper.md" || { echo "refs: $k is in refs.bib and the paper does not cite it" >&2; exit 1; }; done
    @echo "refs: every entry of {{research}}/paper/refs.bib has a row and is cited"

# The committed PDF is the one its text makes: render to build/ and compare the words of the two.
current research:
    {{nix}} --command just _current {{research}}

_current research:
    [ -f "{{research}}/{{research}}.pdf" ] || { echo "current: {{research}}/{{research}}.pdf is not committed; run just paper {{research}}" >&2; exit 1; }
    just _paper {{research}} "build/{{research}}/{{research}}.pdf"
    diff <(pdftotext "{{research}}/{{research}}.pdf" -) <(pdftotext "build/{{research}}/{{research}}.pdf" -) > /dev/null \
      || { echo "current: {{research}}/{{research}}.pdf was not made from this text; run just paper {{research}} and commit it" >&2; exit 1; }
    @echo "current: {{research}}/{{research}}.pdf is the one its text makes"
    just _current_preprint {{research}}

# A research with a preprint commits its PDF, and it too is the one its text makes.
_current_preprint research:
    [ ! -f "{{research}}/paper/design-prop.preprint.md" ] || [ -f "{{research}}/design-prop.preprint.pdf" ] || { echo "current: {{research}}/design-prop.preprint.pdf is not committed; run just preprint {{research}}" >&2; exit 1; }
    [ ! -f "{{research}}/paper/design-prop.preprint.md" ] || just _paper {{research}} "build/{{research}}/design-prop.preprint.pdf" design-prop.preprint.md
    [ ! -f "{{research}}/paper/design-prop.preprint.md" ] || diff <(pdftotext "{{research}}/design-prop.preprint.pdf" -) <(pdftotext "build/{{research}}/design-prop.preprint.pdf" -) > /dev/null \
      || { echo "current: {{research}}/design-prop.preprint.pdf was not made from this text; run just preprint {{research}} and commit it" >&2; exit 1; }

# What CI runs for one research: its references, and its PDF built and compared.
check research:
    just refs {{research}}
    just current {{research}}
    {{nix}} --command scripts/doi-check.sh {{research}}

# Three analysers over the Markdown files: markdownlint-cli2, Vale, lychee.
# `just md-quality --online` also fetches every web link; `--self-test` gives each one a bad file.
md-quality *args:
    {{nix}} .#md --command scripts/md-quality.sh {{args}}

# Cut the release of ONE research: tag `<research>-vX.Y.Z` and push it. Only the owner, or an
# agent he asked for that release by name: a DOI cannot be deleted. Add --dry-run to check first.
release research version *args:
    scripts/release.sh {{research}} {{version}} {{args}}

# Write `.zenodo.json` and `CITATION.cff` from <research>/zenodo.json and <research>/doi.tsv.
# `just citation <research> --check` fails when either is stale.
citation research *args:
    python3 scripts/citation.py {{research}} {{args}}

# The DOI of a released research is in every place a reader or an index looks for it.
doi research:
    scripts/doi-check.sh {{research}}

# Other people's skills, used by link: `just skills list`, `just skills check` (the pins are
# still what the lock names), `just skills fetch` (bring them to .claude/skills/.vendor/, ignored).
skills *args:
    scripts/skills.sh {{args}}

# The slip box of a research keeps its rules (NOTES.md).
notes research:
    scripts/notes-check.sh {{research}}

# Licence and copyright for every file (REUSE.toml).
reuse:
    {{nix}} .#md --command reuse lint

# Build <research>/site into <research>/site/dist: the content from the research's files
# (tools/content, shared by every research), the tests, the bundle, the first render, and the
# committed PDF as paper.pdf.
site research:
    {{nix}} .#site --command just _site {{research}}

_site research:
    [ -f "{{research}}/site/gleam.toml" ] || { echo "site: {{research}} has no site/" >&2; exit 1; }
    # The page names workflows: each one must be a file in .github/workflows/.
    for f in $(grep -oE '"[a-z]+\.yml"' {{research}}/site/src/*/app.gleam | tr -d '"' | sort -u); do [ -f ".github/workflows/$f" ] || { echo "site: the page names $f, which is not a workflow" >&2; exit 1; }; done
    cd tools/content && gleam format --check src test && gleam test && gleam run --no-print-progress -- {{research}} "$(sed -n 's/^name = "\(.*\)"$/\1/p' ../../{{research}}/site/gleam.toml)"
    cd "{{research}}/site" && gleam format src/*/content.gleam && gleam format --check src test
    cd "{{research}}/site" && gleam test
    cd "{{research}}/site" && rm -rf dist && mkdir -p dist && gleam build \
      && esbuild entry.mjs --bundle --minify --format=esm --outfile=dist/app.js --log-level=warning \
      && gleam run -m "$(sed -n 's/^name = "\(.*\)"$/\1/p' gleam.toml)/prerender" --no-print-progress > dist/index.html \
      && cp -R static/. dist/
    [ ! -f "{{research}}/{{research}}.pdf" ] || cp "{{research}}/{{research}}.pdf" "{{research}}/site/dist/paper.pdf"
    @echo "site: {{research}}/site/dist"

# Every research's site, as one tree for GitHub Pages: build/pages/<research>/ and an index.
pages:
    rm -rf build/pages && mkdir -p build/pages
    for f in */site/gleam.toml; do r="${f%%/*}"; just site "$r" && cp -R "$r/site/dist" "build/pages/$r"; done
    scripts/site-index.sh build/pages
    @echo "pages: build/pages"

