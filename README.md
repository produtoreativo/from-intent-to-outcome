# From Intent To Outcome

Upstream, Downstream e o Novo Modelo Operacional para Produtos Digitais

![Capa](capa/capa-intent-to-outcome.png)

---

## Índice

| # | Título | Arquivo | Status |
|---|---|---|---|
| — | Prólogo | [prologo.md](prologo.md) | Final |
| 1 | A confusão não é de processo; é de compromisso | [capitulo-01.md](capitulo-01.md) | Final |
| 2 | Por que a leitura de mercado não resolve | [capitulo-02.md](capitulo-02.md) | Final |
| 3 | O que é um modo de execução | [capitulo-03.md](capitulo-03.md) | Final |
| 4 | Assessment, a jornada que acompanha todas | [capitulo-04.md](capitulo-04.md) | Revisão 9 |
| 5 | Upstream: o modo da incerteza explícita | [capitulo-05.md](capitulo-05.md) | Revisão 9 |
| 6 | Downstream: o modo do compromisso | [capitulo-06.md](capitulo-06.md) | Revisão 9 |
| 7 | O Commitment Gate: a fronteira com nome | [capitulo-07.md](capitulo-07.md) | Revisão 9 |
| 8 | Observabilidade como epistemologia, não como infraestrutura | [capitulo-08.md](capitulo-08.md) | Revisão 9 |
| 9 | Diligence: guardião da consistência | [capitulo-09.md](capitulo-09.md) | Revisão 9 |
| 10 | O problema de modo para agentes de IA | [capitulo-10.md](capitulo-10.md) | Revisão 9 |
| 11 | A Magazine Siará como evidência | [capitulo-11.md](capitulo-11.md) | Revisão 9 |
| — | Conclusão | [conclusao.md](conclusao.md) | Revisão 9 |
| — | Apêndice: Corpus de experimentos | [apendice-experimentos.md](apendice-experimentos.md) | Revisão 9 |
| — | Apêndice: Notas de pesquisa | [apendice-pesquisa.md](apendice-pesquisa.md) | Revisão 9 |
| — | Apêndice: Cagan, Torres e a evolução recente do pensamento de produto | [apendice-pesquisa-cagan-torres.md](apendice-pesquisa-cagan-torres.md) | Revisão 9 |

---

## Versão EPUB

O livro completo (Prólogo, Capítulos 1-11, Conclusão e Apêndices, em português) está disponível em EPUB na [última release](https://github.com/produtoreativo/from-intent-to-outcome/releases/latest/download/from-intent-to-outcome.epub).

O CI está configurado em [`.github/workflows/build-epub.yml`](.github/workflows/build-epub.yml), mas sem créditos ativos no GitHub Actions o EPUB é gerado localmente e publicado manualmente.

Para gerar o arquivo localmente (requer [pandoc](https://pandoc.org)):

```bash
./scripts/build-epub.sh
```

---

## Terminologia

Os termos canônicos do framework ProdOps estão documentados em [TERMINOLOGY.md](TERMINOLOGY.md).

---

## Status possíveis

- **Não iniciado** — capítulo ainda não foi escrito
- **Rascunho** — primeira versão escrita, aguarda revisão
- **Revisão N** — em ciclo de revisão N (inconsistências sendo corrigidas)
- **Final** — revisado, sem inconsistências abertas

---

## Ciclos de revisão

| Ciclo | Status | Inconsistências encontradas | Resolvidas |
|---|---|---|---|
| 1 — Escrita | Concluído | 0 | 0 |
| 2 — Revisão | Concluído | 4 | 3 (1 aberta — ambiguidade de origem) |
| 3 — Imagens e Diagramas | Concluído | 0 | 0 |
| 4 — Remoção de Em Dashes | Concluído | 0 | 0 |
| 5 — Universalização (remoção de EXP-NNN) | Concluído | 0 | 0 |
| 6 — Consolidação editorial (issue #12) | Concluído | 50+ | Todas resolvidas (Ciclos A–C, E–F) |
| 7 — Ciclo Cap. 5 (issue #13) | Concluído | 20 | 9 resolvidas (itens 1–4, 10, 12, 13, 15, 17); 11 adiadas para Ciclo 8 |
| 8 — Ciclo Cap. 4 + Cap. 5 (issue #13) | Concluído | 11 | Todas resolvidas (Bloco 1: caps. 4 e 5; Bloco 2: cap. 5 editorial) |
| 9 — Auditoria transversal (issue #15) | Concluído | 20 | 18 resolvidas |
| 10 — Auditoria transversal (issue #17) | Concluído | 21 | Todas resolvidas |
| 11 — Auditoria transversal (issue #18 e #19) | Concluído | 30 | Todas resolvidas |
