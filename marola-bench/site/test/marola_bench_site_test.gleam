import gleam/list
import gleam/string
import gleeunit
import lustre/element
import marola_bench_site/app
import marola_bench_site/content

pub fn main() -> Nil {
  gleeunit.main()
}

pub fn the_page_tells_the_research_test() {
  let html = app.initial() |> app.view |> element.to_string
  assert app.title_parts().0 == "marola-bench"
  assert string.contains(html, "href=\"paper.pdf\"")
  // The owner's sentence, and his rules, come from the research's files.
  assert content.bench != ""
  assert list.length(content.rules) == 7
  assert list.all(content.rules, fn(r) { string.contains(html, r) })
  assert content.references > 0
  assert content.references
    == content.read_full_text + content.read_abstract + content.read_page
}

pub fn every_note_and_journal_entry_is_on_the_page_test() {
  let html = app.initial() |> app.view |> element.to_string
  assert content.notes != []
  assert list.all(content.notes, fn(n) {
    string.contains(html, "/notes/" <> n.file <> ".md")
  })
  assert content.journal != []
  assert list.all(content.journal, fn(e) {
    string.contains(html, "/journal/" <> e.file <> ".md")
  })
}

pub fn each_check_has_its_badge_test() {
  let html = app.initial() |> app.view |> element.to_string
  assert list.all(app.checks, fn(c: app.Check) {
    string.contains(html, "/actions/workflows/" <> c.file <> "\"")
    && string.contains(
      html,
      "/workflow/status/marola-dev/marola-research/" <> c.file,
    )
  })
}

pub fn the_easy_abstract_is_one_click_away_test() {
  assert content.abstract_easy_pt_br != ""
  let #(model, _) = app.update(app.initial(), app.ShowText(app.EasyPtBr))
  let easy = model |> app.view |> element.to_string
  assert string.contains(easy, "lang=\"pt-BR\"")
  assert string.contains(easy, "<b>1. O que já existe.</b>")
  assert string.contains(easy, "Vale o original")
}

pub fn the_logos_load_from_their_owners_test() {
  let html = app.initial() |> app.view |> element.to_string
  assert content.logos != []
  assert list.all(content.logos, fn(l) {
    string.starts_with(l.src, "https://raw.githubusercontent.com/")
    && string.contains(html, "src=\"" <> l.src <> "\"")
  })
}

pub fn the_page_states_its_terms_test() {
  let html = app.initial() |> app.view |> element.to_string
  assert string.contains(html, "All rights reserved")
  assert string.contains(html, "/blob/main/REUSE.md")
}

pub fn the_doi_is_on_the_cover_and_in_the_citation_test() {
  let html = app.initial() |> app.view |> element.to_string
  assert string.starts_with(content.doi, "10.5281/zenodo.")
  // On the cover, and in the citation at the end.
  assert list.length(string.split(html, "https://doi.org/" <> content.doi)) - 1
    >= 3
  assert string.contains(html, "https://doi.org/" <> content.version_doi)
  assert string.contains(html, content.released)
}
