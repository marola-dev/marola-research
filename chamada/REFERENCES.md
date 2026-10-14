---
title: "Registro das referências: Marola, chamada para contribuição e publicação"
status: draft
date: 2026-10-14
related: [chamada.md, refs.bib]
style: reference
---

# Registro das referências

Cada entrada de [`refs.bib`](refs.bib) tem uma linha aqui. Tudo foi lido em 14 de outubro de 2026.
Os títulos, autores, versões e anos dos registros com DOI foram copiados da API da DataCite
(`https://api.datacite.org/dois/<doi>`), que é quem registra os DOIs do Zenodo.

| Chave | Identificador | Lido | O trecho, e onde | Situação |
|---|---|---|---|---|
| `marolasobre` | <https://github.com/marola-dev/marola-site/blob/3f05563/site/static/about.html> | a página inteira | Capítulo 1 resume as seções "o que é o marola", "por que aberto e sem fins lucrativos", "balneabilidade primeiro", "um super app da água", "por que código aberto", "parcerias sem dinheiro", "como o marola é montado", "de onde vêm os dados" e "quem faz". Os repositórios do capítulo 7 vêm da tabela do perfil `marola-dev/.github` (`profile/README.md`) | conferido |
| `marolareuse` | <https://github.com/marola-dev/marola/blob/main/REUSE.toml> | o arquivo | `path = ["**"]` … `"CC-BY-4.0"`; `path = ["scripts/**", …]` … `"AGPL-3.0-only"` | conferido |
| `marola` | [10.5281/zenodo.23224155](https://doi.org/10.5281/zenodo.23224155) | o registro da DataCite | título, versão v0.2.2, primeiros autores Hoffmann, Valério, Soares da Silva Junior. `MEMBERS.md` de `marola-dev/.github`: "Every creator of the Zenodo record is listed here" | conferido |
| `ww3gpu` | [10.5281/zenodo.23221351](https://doi.org/10.5281/zenodo.23221351) | o registro da DataCite | "a bit-for-bit GPU port of WAVEWATCH III"; v0.1.3 | conferido |
| `marolabench` | [10.5281/zenodo.23352633](https://doi.org/10.5281/zenodo.23352633) | o registro e `marola-bench/README.md` | "All rights reserved … You may read marola-bench and cite it. You may not copy it" | conferido |
| `picasso` | [10.5281/zenodo.23311208](https://doi.org/10.5281/zenodo.23311208) | o registro, e `site/data/works.tsv` de h0ffmann/h0ffmann | "nix flakes that pin every toolchain the other works build with" | conferido |
| `closedsource` | [10.5281/zenodo.23333656](https://doi.org/10.5281/zenodo.23333656) | o registro, e `works.tsv` | "a book on reverse engineering and the ethics of citation" | conferido |
| `nashkell` | [10.5281/zenodo.23356739](https://doi.org/10.5281/zenodo.23356739) | o registro, e `works.tsv` | "an open book in progress, in the voice of Nash: game theory" | conferido |
| `inpoquefazemos` | <https://inpo.org.br/o-que-fazemos/> | a página | "uma Instituição Científica e Tecnológica (ICT), sem fins lucrativos, qualificada como Organização Social"; "vinculada ao Ministério da Ciência, Tecnologia e Inovação (MCTI)". A página não fala de licença nem de dados abertos | conferido |
| `inpo2025` | <https://inpo.org.br/wp-content/uploads/2026/02/relatorio-anual-de-atividades-2025.pdf> | o texto inteiro, com `pdftotext` (82 páginas) | p. 16: "pesquisadores nacionais que queiram compartilhar os dados de seus projetos de forma aberta (open access)"; "atribuindo-lhes um DOI"; "rastrear o impacto de sua pesquisa"; "os dados fornecidos só poderão ser disponibilizados gratuitamente para entidades sem fins lucrativos". p. 23: "Aproximadamente, 40% das bases brasileiras não são totalmente de acesso aberto"; "apenas 31,5% disponibilizam seus próprios dados publicamente". Fase 2 do SADD: "em dezembro de 2025" | conferido |
| `agents` | <https://github.com/marola-dev/marola-research/blob/main/AGENTS.md> | o arquivo | "One directory at the root is one research"; "Only the owner starts one"; a release, a tag e o webhook do Zenodo | conferido |

## Procurado e não citado

- **Uma licença ou uma política de dados do INPO.** 14 de outubro de 2026: as páginas
  `inpo.org.br/o-que-fazemos/` e `inpo.org.br/quem-somos/`, uma busca na web por "INPO Instituto
  Nacional de Pesquisas Oceânicas dados abertos licença política de dados", e o relatório anual de
  2025 (busca por "licen", "dados abertos", "gratuit"). Nenhuma licença de dados foi encontrada.
  O relatório só diz a regra de gratuidade para entidades sem fins lucrativos.
