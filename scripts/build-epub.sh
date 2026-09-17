#!/usr/bin/env bash
# Gera a versão EPUB do livro a partir dos arquivos Markdown (PT-BR).
# Requer: pandoc (https://pandoc.org)
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

OUT_DIR="ebook"
OUT_FILE="$OUT_DIR/from-intent-to-outcome.epub"

mkdir -p "$OUT_DIR"

pandoc scripts/epub-metadata.yaml \
  prologo.md \
  capitulo-01.md capitulo-02.md capitulo-03.md capitulo-04.md capitulo-05.md \
  capitulo-06.md capitulo-07.md capitulo-08.md capitulo-09.md capitulo-10.md capitulo-11.md \
  conclusao.md \
  apendice-experimentos.md apendice-pesquisa.md apendice-pesquisa-cagan-torres.md \
  -o "$OUT_FILE" \
  --epub-cover-image=capa/capa-intent-to-outcome.png \
  --toc --toc-depth=1

echo "EPUB gerado em $OUT_FILE"
