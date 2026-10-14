---
title: "Reference log for marola-bench"
status: draft
date: 2026-10-13
related: [paper.md, refs.bib]
style: reference
---

# Reference log for marola-bench

Every entry of [`refs.bib`](refs.bib) has a row here. A reference is not cited before it is
fetched. For each one, two things were done on the date of record:

1. **The record.** The registry's record of the DOI (Crossref or DataCite), or the page itself,
   was fetched, and the title, authors, journal, volume, pages and year in `refs.bib` were copied
   from it.
2. **The passage.** A passage of the source that supports the paper's claim was read. The column
   "Read" says how much of the source that was: the **full text**, its **abstract**, or the
   **page**. The passage is quoted.

Who read: the records, by this paper's writer. The passages of the journal papers, of the Pekko
pages and of the Operational WeatherBench page, by three helper agents of the same session, which
returned each quotation with its address. The writer did not open those texts a second time.

Date of record: 13 October 2026.

| Key | Identifier | Read | The passage, and where | Status |
|---|---|---|---|---|
| `mip0091` | [marola-dev/marola at `cf7bd4f`](https://github.com/marola-dev/marola/blob/cf7bd4f/docs/MIPs/MIP-0091-marola-forecaster-architecture.md) | full text of its header and sections 1, 2, 4.1 to 4.3, 8, 11 and the appendix | every claim marked "(MIP §n)" or "(MIP Rn)" is from the section named | verified as a source; its own claims are its own |
| `rasp2020weatherbench` | [10.1029/2020MS002203](https://doi.org/10.1029/2020MS002203) | abstract, arXiv 2002.00469 | "Here we present a benchmark dataset for data-driven medium-range weather forecasting"; "We propose simple and clear evaluation metrics"; "we provide baseline scores" | verified |
| `rasp2024weatherbench2` | [10.1029/2023MS004019](https://doi.org/10.1029/2023MS004019) | abstract, arXiv 2308.15560 | "WeatherBench 2 consists of an open-source evaluation framework, publicly available training, ground truth and baseline data as well as a continuously updated website with the latest metrics" | verified |
| `brightband2026owb` | <https://owb.brightband.com/methodology> | the page, fetched on 13 October 2026 | "the selector here offers the global mean plus the tropics, the northern and southern hemispheres, North America, and Europe"; "Scores are computed for a wider set of regions than the dashboard exposes"; "by default each model is scored against its own analysis"; "Precipitation is the exception: it is always verified against ERA5"; "A plain climatology forecast is scored as a reference 'no-skill' curve" (the page adds that the curve is hidden by default); "Scores are computed with WeatherBench-X (WBX), Google Research's forecast-evaluation library"; "SEEPS — used for 24-hour precipitation only, in place of RMSE"; "distributed under the CC BY 4.0 license". The words "South America", "Brazil", "wave" and "ocean" are not on the page. The dashboard's own variable selector was not opened | verified. The owner's note of 12 October and MIP-0091 §4.1 read the same |
| `weatherbenchx` | <https://github.com/google-research/weatherbenchX> | GitHub's record of the repository | description "A modular framework for evaluating weather forecasts"; licence Apache-2.0 | verified |
| `hersbach2020era5` | [10.1002/qj.3803](https://doi.org/10.1002/qj.3803) | abstract, Crossref | "Within the Copernicus Climate Change Service (C3S), ECMWF is producing the ERA5 reanalysis which, once completed, will embody a detailed record of the global atmosphere, land surface and ocean waves from 1950 onwards." | verified |
| `pereira2017buoys` | [10.1007/s10236-017-1113-9](https://doi.org/10.1007/s10236-017-1113-9) | abstract, on the University of Melbourne's record of the paper; Springer asked for a login, and Crossref has no abstract | "a dense network of buoys along the Brazilian coast, equipped with several meteorological and oceanographic sensors. Out of ten currently operational buoys, three are employed to present the main characteristics of waves in the Southern part of the network." "Directional" is in the title only. The abstract does not name the buoy programme | verified for what is quoted; the body was not read |
| `li2010contextual` | [10.1145/1772690.1772758](https://doi.org/10.1145/1772690.1772758) | full text, arXiv 1003.0146 | "we model personalized recommendation of news articles as a contextual bandit problem" (abstract); "no feedback ... is observed for unchosen arms" (section 2.1) | verified |
| `rodwell2010seeps` | [10.1002/qj.656](https://doi.org/10.1002/qj.656) | abstract, Crossref | "A new equitable score is developed for monitoring precipitation forecasts"; "It is therefore called here the 'Stable Equitable Error in Probability Space' (SEEPS)." | verified |
| `gneiting2007scoring` | [10.1198/016214506000001437](https://doi.org/10.1198/016214506000001437) | full text, the author's copy at the University of Washington, section 4.2, p. 367 | "The CRPS is proper relative to the class P and strictly proper relative to the subclass P1 of the Borel probability measures that have finite first moment." | verified |
| `ferro2014fair` | [10.1002/qj.2270](https://doi.org/10.1002/qj.2270) | abstract, OpenAlex; Wiley's page refused the fetch | "The usual Brier, ranked probability and continuous ranked probability scores for ensemble forecasts are shown to be unfair, while adjusted versions of these scores are shown to be fair." The abstract does not speak of the number of members, so the paper does not. Crossref's date is 3 December 2013 (online); the year 2014 is the issue's and was not confirmed from the record | verified for what is quoted |
| `gneiting2011weighted` | [10.1198/jbes.2010.08110](https://doi.org/10.1198/jbes.2010.08110) | abstract, OpenAlex | "The weighting emphasizes regions of interest, such as the tails or the center of a variable's range, while retaining propriety" | verified |
| `freund1997hedge` | [10.1006/jcss.1997.1504](https://doi.org/10.1006/jcss.1997.1504) | full text, a copy of the journal's print on a third party's site; ScienceDirect refused the fetch | figure 1, algorithm Hedge: "Receive loss vector ... from environment", one entry for each strategy. The paper does not use the words "full information"; that is the later name | verified |
| `russo2018thompson` | [10.1561/2200000070](https://doi.org/10.1561/2200000070) | full text, arXiv 1707.02038, section 3 | "the success probability estimate ... is randomly sampled from the posterior distribution"; "The action ... with the largest estimate ... is then applied" | verified |
| `badanidiyuru2018knapsacks` | [10.1145/3164539](https://doi.org/10.1145/3164539) | abstract, Crossref | "the learner may be constrained by one or more supply (or budget) limits, in addition to the customary limitation on the time horizon." | verified |
| `kunsch1989bootstrap` | [10.1214/aos/1176347265](https://doi.org/10.1214/aos/1176347265) | abstract, OpenAlex; Project Euclid refused the fetch | "Bootstrap replicates are constructed by selecting blocks of length l randomly with replacement among the blocks of observations."; "We do not attempt a reduction to i.i.d. values." The record has no page numbers, so `refs.bib` gives none. "Paired" is the design's word, not this paper's | verified for what is quoted |
| `smith2016software` | [10.7717/peerj-cs.86](https://doi.org/10.7717/peerj-cs.86) | full text of the principles, on FORCE11's own copy; peerj.com refused the fetch | "Unique Identification: A software citation should include a method for identification that is machine actionable, globally unique, interoperable"; "Persistence: Unique identifiers and metadata describing the software and its disposition should persist – even beyond the lifespan of the software they describe." | verified; the copy was not compared word for word with PeerJ's |
| `reactivemanifesto` | <https://www.reactivemanifesto.org/> | the page | the four properties and the sentence quoted for each; "Published on September 16 2014. (v2.0)"; "Authors (in alphabetic order, with roughly equal contributions): Jonas Bonér, Dave Farley, Roland Kuhn, and Martin Thompson." | verified |
| `pekko` | <https://github.com/apache/pekko> | GitHub's record; the documentation's pages for the release and for Scala 3 | its description, Apache-2.0; the tag v1.7.1 and the download page's `apache-pekko-1.7.1`; "Pekko has support for Scala 3. Pekko is built with Scala 3.3 LTS version" | verified |
| `pekkohttp` | [Pekko HTTP docs, Introduction](https://pekko.apache.org/docs/pekko-http/current/introduction.html) | the page | "The Apache Pekko HTTP modules implement a full server- and client-side HTTP stack on top of pekko-actor and pekko-stream. It's not a web-framework but rather a more general toolkit for providing and consuming HTTP-based services." The word "CRUD" is not on the page | verified |
| `pekkosharding` | [Pekko docs, Cluster Sharding](https://pekko.apache.org/docs/pekko/current/typed/cluster-sharding.html) | the page | "actors with an identifier, so called entities, can be automatically distributed across multiple nodes in the cluster."; "If the state of the entities are persistent you may stop entities that are not used to reduce memory consumption."; "This is currently the default strategy, for compatibility, and is enabled automatically with a timeout of 2 minutes." | verified |
| `pekkopersistence` | [Pekko docs, Event Sourcing](https://pekko.apache.org/docs/pekko/current/typed/persistence.html) | the page | "A stateful actor is recovered by replaying the stored events to the actor, allowing it to rebuild its state."; recovered when an actor is "restarted, such as after a JVM crash, by a supervisor or a manual stop-start, or migrated within a cluster." | verified |
| `pekkofault` | [Pekko docs, Fault Tolerance](https://pekko.apache.org/docs/pekko/current/typed/fault-tolerance.html) | the page | typed actors "are stopped if an exception is thrown and no supervision strategy is defined"; "This example restarts the actor when it fails" | verified |
| `pekkostreams` | [Pekko docs, Basics and working with Flows](https://pekko.apache.org/docs/pekko/current/stream/stream-flows-and-basics.html) | the page | a source "guarantees that it will never emit more elements than the received total demand for any given Subscriber"; "effectively slowing down the upstream producer to match their consumption speeds"; "bounded buffer space". The page also says a publisher may drop elements or tear down the stream | verified |
| `pekkosbr` | [Pekko docs, Split Brain Resolver](https://pekko.apache.org/docs/pekko/current/split-brain-resolver.html) | the page | "both sides ... take the same decision about which part will keep running and which part will shut itself down"; strategies: Keep Majority (default), Static Quorum, Keep Oldest, Down All, Lease | verified |
| `besom` | <https://github.com/VirtusLab/besom> | GitHub's record and the README | "Besom Scala SDK for Pulumi"; "Scala support is currently in Public Beta"; Apache-2.0; latest release v0.5.2 of 18 September 2026 | verified |
| `pulumi` | <https://github.com/pulumi/pulumi> | GitHub's record | "Infrastructure as Code in any programming language"; Apache-2.0 | verified |
| `speckit` | <https://github.com/github/spec-kit> | GitHub's record and the README | "Toolkit to help you get started with SDD or any other process!"; MIT. Not checked: that MIP-0091's field "Spec-kit" means this one | verified |
| `ponytail` | <https://github.com/DietrichGebert/ponytail/tree/2961b52fc1fe6a5a87c7a959a79512e5c2f3ffe5> | the repository at the tag v5.2.0, cloned by Claude Code into `~/.claude/plugins/marketplaces/ponytail`: `.claude-plugin/plugin.json`, `skills/ponytail/SKILL.md`, `README.md`, `LICENSE` | "Lazy senior dev mode: the smallest change that fully solves the task"; version "5.2.0"; author "Dietrich Gebert"; "MIT License"; "-53% code · -41% time · -26% cost · -45% tokens", "39 tasks". The word "spec" is not in `SKILL.md` (`grep -i spec`). Not checked: the benchmark itself | verified |
| `gcpspot` | [Compute Engine docs, Spot VMs](https://cloud.google.com/compute/docs/instances/spot) | the page | "Spot VMs have significant discounts, but Compute Engine might preemptively stop or delete (preempt) Spot VMs to reclaim the capacity at any time." | verified |
| `kassis2026skills` | [arXiv:2609.00065](https://arxiv.org/abs/2609.00065); the library at [`a1043ef`](https://github.com/K-Dense-AI/scientific-agent-skills/tree/a1043ef544e3a100c28e70a736b6cf32554d0677) | arXiv's record (title, five authors, published 30 August 2026); six `SKILL.md` files of the library, in full, by a helper agent; the licence file and each repository's commit, by the writer | what the paper takes: that some steps of the skill that checked this text were learned from that library. Each idea and its quotation are in `.claude/skills/ouro-paper/REA.md` | verified |
| `hoffmann2026ww3gpu` | [10.5281/zenodo.23221351](https://doi.org/10.5281/zenodo.23221351) | DataCite's record | creator and title | verified |
| `marola2026` | [10.5281/zenodo.23224155](https://doi.org/10.5281/zenodo.23224155) | DataCite's record | six creators and title | verified |
| `hoffmann2026picasso` | [10.5281/zenodo.23311208](https://doi.org/10.5281/zenodo.23311208) | DataCite's record | creator and title | verified |
| `hoffmann2026closedsource` | [10.5281/zenodo.23333656](https://doi.org/10.5281/zenodo.23333656) | Zenodo's record | v0.3.0, type Book | verified |

## Checked in a repository, not a reference

- `marola-dev/marola-app`, `build.sbt` at commit `f769245`, read through GitHub's API on 13
  October 2026: `scalaVersion := "3.9.0"`, `kyoVersion = "1.0.0-RC7"`, and no line that names
  Pekko. This supports the two "(v)" marks under hard rule 1.

## Looked for and not cited

- Thompson's paper of 1933 (doi 10.1093/biomet/25.3-4.285): its record was fetched and its text
  could not be read, so it is not cited. Russo and others say that Thompson sampling "was first
  proposed in 1933"; the paper cites them.
- Lam and others (2023), the GraphCast paper (doi 10.1126/science.adi2336): read and correct, but
  the paper no longer names a model, so the entry was removed.
- The references that MIP-0091's private policy note may give for its algorithms were not seen.
  The six in this log were found and read for this paper; they are the standard ones, and they
  may differ from the note's.
- The Brazilian Navy's buoy programme page (`marinha.mil.br/chm/dados-do-goos-brasil/pnboia`)
  answered 403 to a fetch. It is not cited. The paper says "the national programme" where MIP-0091 says PNBOIA.
- SiMCosta (<https://simcosta.furg.br/>) and INMET (<https://portal.inmet.gov.br/>) answered 200.
  Their pages were not read for what they measure or under which licence, so the paper does not
  name them. They are candidates for the first inventory of open instruments.

## Before v1

- Read the body of Pereira and others (2017), for the name of the buoy programme and the list of
  buoys.
- Read the full text of the six papers that were read as abstracts.
- Open the texts that the helper agents read, one time each, by the writer or the owner.
