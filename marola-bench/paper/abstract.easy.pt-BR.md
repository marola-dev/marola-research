---
title: "Resumo, versão fácil: marola-bench"
status: draft
date: 2026-10-14
related: [paper.md]
---

# Versão fácil: o resumo do marola-bench

> **Esta é a versão fácil, em português, do resumo (*abstract*) de [paper.md](paper.md).**
>
> - **Vale o original.** Se este texto e o original discordarem, vale o original, em inglês.
> - **Feita a partir de:** o resumo de 14 de outubro de 2026.
> - **Para quem é:** quem quer entender a ideia sem ser da área.
> - **O que ficou de fora:** nada. Cada frase do resumo está aqui, na mesma ordem.
> - **O que entrou a mais:** a explicação de cada palavra difícil, na hora em que ela aparece. As
>   explicações não dizem nada novo sobre o trabalho.
> - **Escrita por:** Claude, com a skill `ouro-paper`; revisão de Matheus Hoffmann.

<!-- easy-abstract:start -->
**1. O que já existe.** Um *benchmark* é uma régua comum: todos os modelos de previsão do tempo são medidos do mesmo jeito, e assim dá para comparar. Já existem réguas públicas para isso.

**2. O que falta para quem está numa praia do Brasil.** Faltam três coisas nessas réguas. Nenhuma região delas é o Brasil. Nenhuma nota é para ondas do mar. E a "verdade" delas não é um instrumento: elas comparam o modelo com uma análise feita por computador, e não com o que uma boia mediu.

**3. A proposta.** O marola-bench guarda o método dessas réguas (WeatherBench, WeatherBench 2 e Operational WeatherBench) e troca essas três coisas: regiões do Brasil, ondas, e instrumentos como verdade.

**4. O que é o "bench".** É o conjunto das séries de notas. Uma nota é uma previsão comparada com uma medição. Uma série são as notas de um mesmo previsor, num mesmo ponto, em ordem de tempo. Previsor é qualquer coisa que faz uma previsão: um modelo de outra instituição hoje, e o previsor da própria marola no futuro.

**5. Quem faz o trabalho.** Os pontos de observação (uma boia, uma estação) são cadastrados à mão, por uma pessoa. Para cada ponto existe um ator: um pequeno programa que cuida só daquele ponto. Ele pergunta aos previsores e registra as notas.

**6. As sete regras do dono.** O texto traz sete regras fixas. Cinco são para a construção: usar Apache Pekko e Scala 3 (as ferramentas de programação), rodar na nuvem do Google (GCP), descrever a infraestrutura com Besom, morar neste repositório, e ter um conjunto de máquinas barato e confiável. Uma é sobre os direitos: todos reservados. Uma é sobre o assistente que escreve o código: o Ponytail 5, um *plugin* (um complemento) do Claude Code. O texto também diz onde essas regras mudam o projeto que já estava aceito, o MIP-0091.

**7. O que ainda não existe.** O texto não traz resultado nenhum. Nenhuma previsão recebeu nota ainda, e nada foi construído.
<!-- easy-abstract:end -->
