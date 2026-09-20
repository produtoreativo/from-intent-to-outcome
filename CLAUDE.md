# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## O que é este repositório

Manuscrito do livro *From Intent To Outcome — Upstream, Downstream e o Novo Modelo Operacional para Produtos Digitais*, de Christiano Milfont. O livro documenta o framework ProdOps e é escrito em Markdown, com versão PT (raiz) e versão EN (`en/`).

## Comandos

**Gerar EPUB local** (requer [pandoc](https://pandoc.org)):
```bash
./scripts/build-epub.sh
# Saída: ebook/from-intent-to-outcome.epub
```

O CI está configurado em `.github/workflows/build-epub.yml`, mas sem créditos ativos no GitHub Actions o EPUB deve ser gerado localmente e publicado manualmente com `gh release create`.

**Criar release manual** (sem CI ativo, publicar o EPUB gerado localmente):
```bash
gh release create vX.Y.Z --title "vX.Y.Z" --notes "..." ebook/from-intent-to-outcome.epub
```

## Estrutura do manuscrito

```
prologo.md + capitulo-01.md … capitulo-11.md + conclusao.md   ← PT (canônico)
apendice-experimentos.md, apendice-pesquisa.md, apendice-pesquisa-cagan-torres.md
en/prologue.md + en/chapter-01.md … en/chapter-11.md          ← EN (espelho)
images/capNN-*.svg                                             ← diagramas por capítulo
scripts/build-epub.sh + scripts/epub-metadata.yaml
```

**Atenção — deslocamento sistemático nos nomes de arquivo SVG:** os arquivos `images/` dos capítulos 6–11 têm prefixo `cap(N-1)` no lugar de `capN` (artefato de renumeração histórica). Não "corrigir" o nome nos `<img>` sem renomear o arquivo físico correspondente.

## Convenções editoriais obrigatórias

- **Sem em-dash em prosa.** Nunca gerar `—` como separador. Substituir por vírgula, dois-pontos, ponto-e-vírgula ou parênteses conforme o contexto.
- **Bilinguismo sincronizado.** Toda alteração substantiva na versão PT deve ser refletida na versão EN correspondente na mesma sessão. Números, nomes de artefatos, listas e diagramas devem ser idênticos nas duas versões.
- **Commit e push ao fim de cada sessão.** Encerrar sempre com `git commit` + `git push` para master.

## Terminologia canônica do framework ProdOps

Ver [TERMINOLOGY.md](TERMINOLOGY.md).

## Ciclos de revisão e issues

Inconsistências são rastreadas via GitHub Issues com o padrão `Ciclo N — <escopo>`. O arquivo README.md mantém a tabela de ciclos e status de cada capítulo. Antes de iniciar uma correção, verificar a issue ativa para evitar trabalho duplicado.

O repositório de referência do framework (acesso adicional configurado em `.claude/settings.json`) está em:
```
/Users/christiano.m.almeida/produtos/prodops-framework/prodops/framework
```
