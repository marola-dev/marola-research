---
title: "Marola: Chamada para CONTRIBUIÇÃO e PUBLICAÇÃO"
subtitle: "Para quem está terminando a graduação, no mestrado ou no doutorado em ciências do mar"
author: "Matheus Hoffmann"
status: draft
version: "v0 (rascunho; não revisado por pares)"
date: 2026-10-14
lang: pt-BR
related: [REFERENCES.md, refs.bib, ../AGENTS.md, ../REUSE.md]
style: easy-pt-BR
---

# Marola: Chamada para CONTRIBUIÇÃO e PUBLICAÇÃO

> **O que é este texto.** Uma chamada do marola. Ela explica o que é o marola, como publicar um
> trabalho no marola.dev e como pesquisar junto com quem faz o marola. É um posicionamento
> interno do projeto, escrito pelo seu fundador. Não é um artigo científico e não foi revisado
> por pares.
>
> **Para quem é.** Para quem está terminando a graduação (o TCC), para quem faz mestrado e para
> quem faz doutorado, em oceanografia ou em áreas próximas.
>
> **Como foi escrito.** Em português fácil, por Matheus Hoffmann, com o Claude Code (um
> assistente de programação com IA), em 14 de outubro de 2026.
>
> **Como ler as marcas.** **(v)** quer dizer que a frase foi conferida na fonte, e o arquivo
> [`REFERENCES.md`](REFERENCES.md) mostra o trecho. **(posição)** quer dizer que a frase é uma
> decisão ou uma opinião do marola, e não um fato que se confere. **⚠** quer dizer que ninguém
> conferiu ainda.

## 1. O que é o marola, em resumo

Este capítulo resume a página "sobre" do site [@marolasobre] **(v)**.

- **Um amigo que conhece o mar.** Você pergunta "dá pra nadar amanhã? que horas?", e o marola
  olha as ondas, o vento, a maré e a qualidade da água, e diz o melhor horário, e por quê.
- **Hoje, um mapa.** O [marola.dev](https://marola.dev/) dá uma nota para hoje e outra para
  amanhã a cada praia de Florianópolis, do Rio de Janeiro e de Salvador.
- **Ele não inventa.** Todo número vem de dados públicos; o risco é decidido por regras simples,
  que qualquer pessoa lê; e quando não sabe, ele diz "sem dados".
- **Aberto e sem fins lucrativos.** Boa parte dos dados do mar brasileiro está com empresas e
  instituições privadas. Quem promete devolver tudo para todo mundo pode pedir esses dados.
- **A balneabilidade primeiro.** Balneabilidade é a qualidade da água para banho. Antes do surfe
  ou do mergulho, vem a pergunta "posso entrar nessa água?".
- **Um super app da água.** Um lugar só para a praia, o mar, a balneabilidade e os riscos, que
  entrega a resposta pronta.
- **Código aberto, para durar.** Código aberto é o que qualquer pessoa pode ler, usar e melhorar.
  Assim o projeto segue vivo mesmo depois que quem começou vai embora.
- **Parcerias sem dinheiro.** Armazenamento, placas de vídeo (GPU) ou dados de empresas, com um
  crédito discreto no site. Sem anúncio e sem rastreamento.
- **Montado como uma cozinha.** Cada bancada é um repositório: o app que calcula a nota, o mapa,
  as anotações sobre o mar, os testes da IA, o arquivo de dados e as ferramentas.
- **Os dados** vêm do OpenStreetMap (praias), do Open-Meteo (mar e tempo) e dos boletins do IMA
  (SC), do INEA (RJ) e do INEMA (BA) (balneabilidade).
- **Quem faz** está na página de membros, a mesma lista de autores do registro do marola no
  Zenodo [@marola] **(v)**.

O texto do marola é CC BY 4.0 (pode copiar e adaptar, dando o crédito), e o código do
repositório principal é AGPL-3.0-only (quem modifica o código abre também as suas mudanças)
[@marolareuse] **(v)**.

## 2. Por que uma área de pesquisa

A área de pesquisa do marola.dev ainda está em construção **(posição)**. A ideia é divulgar
trabalhos brasileiros de oceanografia sobre:

- previsão de ondas;
- clima;
- desenvolvimento sustentável;
- emissão de alertas para a defesa civil;
- políticas de risco costeiro e marítimo.

Por isso o marola sempre foi feito às claras, no GitHub. O GitHub é um site onde se guarda
código, com o histórico de cada mudança.

Hoje, o único membro do marola que faz pesquisa é Matheus Hoffmann. A ideia é ter um grupo de
pesquisadores que compartilhe um **material comum de pesquisa**: ferramentas, dados abertos,
regras de citação e um jeito de publicar. A pesquisa de cada um não é compartilhada; ela é de
quem a faz **(posição)**.

## 3. O que o marola não quer, e o que pede

**Nem Matheus Hoffmann, nem ninguém do marola, tem interesse no conteúdo da pesquisa privada de
qualquer pesquisador** **(posição)**. A sua pesquisa é sua. O marola não pede os seus dados, o
seu texto nem os seus resultados.

O marola também não exige ciência aberta de ninguém **(posição)**. Ciência aberta é publicar os
dados, o código e o texto para todo mundo ler e usar. É uma escolha de cada pesquisador.

Mas é preciso olhar para as mudanças tecnológicas de 2026. **Qualquer paper público pode ser
destilado** **(posição)**. Destilar é dar um texto a uma IA e pedir que ela o resuma, o
reescreva ou aprenda com ele. Um texto publicado já não fica escondido de ninguém. O que protege o
crédito de quem pesquisou é outra coisa: a **citação profissional**. Citar profissionalmente é
dizer, toda vez, quem fez, o título, o ano e um identificador permanente (o DOI, explicado no
capítulo 4). É isso que o marola pede **(posição)**.

## 4. Requisitos para PUBLICAR no marola.dev

Para um trabalho aparecer na área de pesquisa do marola.dev, ele precisa de **um registro no
Zenodo com DOI** **(posição)**.

- **Zenodo** é um repositório público de pesquisa. Ali se guarda um texto, um
  conjunto de dados ou um código, com os seus autores e a sua licença.
- **DOI** (Digital Object Identifier) é um identificador permanente. É um endereço que não muda
  e que leva sempre ao mesmo trabalho. Com ele, qualquer pessoa cita o trabalho do jeito certo.

Esse é o único requisito para publicar. A licença do trabalho é do autor: pode ser aberta ou
fechada **(posição)**. Na mesma casa, o texto do marola é CC BY 4.0 [@marolareuse], e o
marola-bench é "todos os direitos reservados": pode-se ler e citar, mas não copiar [@marolabench]
**(v)**.

Como chegar a um DOI sem trabalho manual: o Zenodo se liga ao GitHub. Cada versão lançada no
GitHub vira, sozinha, uma versão no Zenodo, com um DOI novo [@agents] **(v)**. O capítulo 7
mostra as ferramentas do marola que fazem isso.

## 5. Requisitos para COLABORAR com o marola

Colaborar é fazer a sua pesquisa dentro do marola.dev, junto com os membros do projeto. Aqui a
regra é outra **(posição)**:

1. **O código é aberto.** Toda ciência desenvolvida dentro do marola tem o seu código com uma
   licença de código aberto. Isso vale para o código, e não para a documentação.
2. **A documentação é sua.** O texto, a tese, os rascunhos e as notas podem ter a licença que você
   escolher, inclusive "todos os direitos reservados".
3. **Cada pesquisa tem o seu lugar.** No repositório `marola-research`, um diretório é uma
   pesquisa, e só quem é dono do repositório abre um diretório novo [@agents] **(v)**. Você
   conversa com o marola e, se fizer sentido, a sua pesquisa ganha o seu diretório, com as suas
   regras.
4. **Quem usa, cita.** O que você pegar do material comum, você cita. O que o marola pegar do
   seu, o marola cita.

## 6. O alinhamento com o INPO

O INPO, Instituto Nacional de Pesquisas Oceânicas, é "uma Instituição Científica e Tecnológica
(ICT), sem fins lucrativos, qualificada como Organização Social", "vinculada ao Ministério da
Ciência, Tecnologia e Inovação (MCTI)" [@inpoquefazemos] **(v)**.

O INPO está construindo o SADD, o Sistema de Armazenamento e Disponibilização de Dados
[@inpo2025] **(v)**. Segundo o relatório anual de 2025 do instituto:

- o SADD vai juntar dados do oceano e da costa de vários repositórios, e entregá-los ao usuário;
- ele também vai ser um repositório para "pesquisadores nacionais que queiram compartilhar os
  dados de seus projetos de forma aberta (open access)";
- os dados submetidos vão receber um DOI, o que deixa o pesquisador "rastrear o impacto de sua
  pesquisa";
- "os dados fornecidos só poderão ser disponibilizados gratuitamente para entidades sem fins
  lucrativos";
- a fase piloto acabou, e a segunda fase começou em dezembro de 2025.

O que isso tem a ver com o marola **(posição)**: o marola é sem fins lucrativos, pede DOI para
publicar e cita cada fonte. São as mesmas três ideias do SADD. Por isso este posicionamento é
alinhado com o modo como o INPO vai disponibilizar dados.

O que este texto **não** afirma: não há aqui nenhum acordo assinado entre o INPO e o marola. A
licença de cada conjunto de dados do SADD ainda não está publicada: em 14 de outubro de 2026,
procurou-se uma política de dados ou uma licença no site do INPO e não se encontrou **⚠**.
Quando o INPO publicar essa informação oficial, este texto será atualizado.

## 7. O material comum que já existe

Ferramentas que já estão no marola-dev e que qualquer pesquisa pode usar:

- **O repositório `marola-research`.** Guarda as pesquisas, uma por diretório, cada uma com o seu
  texto, as suas referências, o seu PDF e o seu site [@agents] **(v)**.
- **A skill `ouro-paper`.** Uma skill é um conjunto de instruções para um agente de IA. Esta
  ensina a escrever um texto em que cada frase tem uma marca que diz como foi conferida, e um
  registro (log) que mostra o trecho de cada fonte. Nenhuma referência é inventada.
- **A publicação integrada ao GitHub.** `just release` lança uma versão de uma pesquisa, e o
  Zenodo cria o DOI dessa versão. `just doi` confere que o DOI está em todo lugar onde um leitor o
  procura: o texto, o PDF, o site e o arquivo de citação.
- **A ferramenta de licenciamento.** `just reuse` confere que cada arquivo tem uma licença e um
  dono, pela especificação REUSE (um padrão que diz a licença de cada arquivo de um projeto).
  `just citation` escreve o arquivo de citação (`CITATION.cff`) e os metadados do Zenodo a partir
  de um arquivo só.
- **O histórico (track record).** Cada pesquisa tem notas (uma ideia por nota) e um diário (um
  desafio por entrada, inclusive os que deram errado). Cada mudança é um pull request revisado.
- **Os outros repositórios do marola-dev:** `marola-skills`, `marola-agents`, `marola-devkit`,
  `marola-corpus` (anotações sobre o mar, com fonte) e `marola-oods` (dados abertos de praias)
  [@marolasobre] **(v)**.

Outros trabalhos do mesmo autor do Marola, com DOI e repositório público **(v)**:

- **WW3 GPU Lab**, o modelo de ondas WAVEWATCH III na placa de vídeo, idêntico ao original bit a
  bit [@ww3gpu]: [h0ffmann/ww3-gpu](https://github.com/h0ffmann/ww3-gpu).
- **marola-bench**, a proposta de um WeatherBench para o Brasil [@marolabench]:
  [marola-research/marola-bench](https://github.com/marola-dev/marola-research/tree/main/marola-bench).
- **picasso**, as ferramentas fixadas em versões exatas com que os outros são construídos
  [@picasso]: [h0ffmann/picasso](https://github.com/h0ffmann/picasso).
- **Closed Source**, um livro sobre engenharia reversa e a ética da citação [@closedsource]:
  [h0ffmann/closed-source](https://github.com/h0ffmann/closed-source).
- **Nashkell**, um livro aberto sobre teoria dos jogos [@nashkell]:
  [h0ffmann/nashkell](https://github.com/h0ffmann/nashkell).

**As tabelas de todas as publicações** de Matheus Hoffmann estão em
<https://h0ffmann.github.io/h0ffmann/#index>. A fonte dessas tabelas, com a licença e o DOI de cada
trabalho, está em
<https://github.com/h0ffmann/h0ffmann/blob/main/site/data/works.tsv>.

## 8. Como começar

1. Leia o seu caso: você quer **publicar** (capítulo 4) ou **colaborar** (capítulo 5)?
2. Para publicar: crie o registro do seu trabalho no Zenodo e mande o DOI ao marola, por uma
   issue em [github.com/marola-dev/marola](https://github.com/marola-dev/marola/issues). Uma issue
   é uma mensagem pública num repositório do GitHub, em português ou em inglês.
3. Para colaborar: abra uma issue contando a sua pesquisa em poucas linhas: o tema, o que o seu
   código vai fazer e qual licença de código aberto você prefere. Não é preciso mandar o conteúdo
   da pesquisa.

Siga o marola no Instagram, [\@rj.marola](https://www.instagram.com/rj.marola/) e
[\@sc.marola](https://www.instagram.com/sc.marola/), e no LinkedIn,
[marola-dev](https://www.linkedin.com/company/marola-dev/).

## 9. O que ainda não está decidido

- **A área de pesquisa do marola.dev** ainda está em construção: como os trabalhos aparecem no
  site não está definido **⚠**.
- **O código do marola-bench** é "todos os direitos reservados" ("code included", no
  `REUSE.toml` deste repositório) **(v)**, e esta chamada pede código aberto. O dono do
  marola-bench decide como as duas regras se encontram, antes de ele ter código.

## Referências

::: {#refs}
:::
