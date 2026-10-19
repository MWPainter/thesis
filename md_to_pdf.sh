#!/usr/bin/env bash
#
# Convert a markdown file to PDF via pandoc + xelatex.
#
#   ./md_to_pdf.sh CORRECTIONS_COVER_LETTER.md
#   ./md_to_pdf.sh CORRECTIONS_COVER_LETTER.md Corrections_Cover_Letter.pdf
#
# Defaults to CORRECTIONS_COVER_LETTER.md if no argument is given. The output
# name defaults to the input name with a .pdf extension.
#
# Notes on the choices here:
#
#   xelatex        pdflatex cannot render the Unicode characters the cover
#                  letter contains (en dashes, curly quotes, arrows). xelatex
#                  handles them natively. Note that no text font covers U+22A4
#                  (the transpose symbol), so write that as maths: $^\top$.
#
#   style header   cover_letter_style.tex restyles markdown blockquotes as a
#                  grey panel with a left rule, so the examiners' comments are
#                  clearly quotations rather than just indented text. Omit the
#                  --include-in-header line below for plain output.
#
#   table widths   Column widths come from the dash counts in the markdown
#                  separator row, not from this script. The cover letter uses
#                  12 vs 36 dashes to get a 25%/75% split:
#                      |------------|------------------------------------|
#                  Equal dash counts give equal columns.

set -euo pipefail

IN="${1:-CORRECTIONS_COVER_LETTER.md}"
OUT="${2:-${IN%.*}.pdf}"
STYLE="cover_letter_style.tex"

if [[ ! -f "$IN" ]]; then
  echo "error: input file not found: $IN" >&2
  exit 1
fi

command -v pandoc  >/dev/null || { echo "error: pandoc not found"  >&2; exit 1; }
command -v xelatex >/dev/null || { echo "error: xelatex not found" >&2; exit 1; }

ARGS=(
  "$IN"
  -o "$OUT"
  --pdf-engine=xelatex
  -V geometry:margin=2cm
  -V fontsize=11pt
  -V colorlinks=true
  -V linkcolor=blue
)

# Apply the quote/table styling if the header file is present.
if [[ -f "$STYLE" ]]; then
  ARGS+=( --include-in-header="$STYLE" )
else
  echo "note: $STYLE not found, building without custom styling" >&2
fi

LOG="$(mktemp)"
if pandoc "${ARGS[@]}" >"$LOG" 2>&1; then
  # Missing glyphs are warnings, not errors, so surface them explicitly:
  # they render as blank space in the PDF and are easy to miss.
  if grep -q "Missing character" "$LOG"; then
    echo "WARNING: characters missing from the font (they will be blank in the PDF):" >&2
    grep -o "There is no .*" "$LOG" | sort -u >&2
  fi
  echo "wrote $OUT"
else
  echo "build failed:" >&2
  cat "$LOG" >&2
  rm -f "$LOG"
  exit 1
fi
rm -f "$LOG"
