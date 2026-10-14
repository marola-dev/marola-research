# Marola: Chamada para CONTRIBUIÇÃO e PUBLICAÇÃO

Uma chamada do marola para quem está terminando a graduação, no mestrado ou no doutorado: o que é
o marola, os requisitos para **publicar** no marola.dev e os requisitos para **colaborar** com o
marola. Não é uma pesquisa: é um texto do marola inteiro, por isso fica fora dos diretórios de
pesquisa.

- **O texto:** [`chamada.md`](chamada.md), em português fácil.
- **O PDF:** [`chamada.pdf`](chamada.pdf), feito com `just chamada`. Só texto, sem arte.
- **As referências:** [`refs.bib`](refs.bib), e como cada uma foi conferida em
  [`REFERENCES.md`](REFERENCES.md).

## De que commit o PDF foi feito

O PDF começa com o commit que mudou o texto pela última vez (`chamada.md` ou `refs.bib`), com um
link para o repositório nesse commit. Assim, quem lê o PDF volta ao repositório e vê como o
documento foi construído: o texto, as referências, como cada uma foi conferida e o pull request
com a conversa. Por isso a ordem é esta: commit do texto, depois `just chamada`, depois commit do
PDF. `just chamada` recusa um texto que ainda não foi commitado.

## Regras fixas

As regras do dono (Hoffmann, 14 de outubro de 2026). Não estão abertas à escolha de um agente.

1. **A chamada tem no máximo 5 páginas.** `just chamada` falha se o PDF passar disso.

## Verificação

`just chamada-check` confere que cada referência tem a sua linha no registro, que o PDF tem no
máximo 5 páginas e que o PDF publicado é o que o texto gera. O CI roda a mesma verificação
(`pdf / chamada`).
