#!/bin/bash

# Build-Skript für mehrsprachige Versionen des Building Nostr-Buchs
# Verwendet: ./build-multilang.sh [--lang=<sprachcode>] [--format=<pdf|epub|html>]

LANG="en"  # Standardsprache (Englisch)
FORMAT="all"  # Standard: alle Formate

# Parameter verarbeiten
for i in "$@"; do
  case $i in
    --lang=*)
      LANG="${i#*=}"
      shift
      ;;
    --format=*)
      FORMAT="${i#*=}"
      shift
      ;;
    *)
      # Unbekannter Parameter
      ;;
  esac
done

echo "Building for language: $LANG, format: $FORMAT"

# Definiere Quellpfade basierend auf der Sprache
if [ "$LANG" = "en" ]; then
  # Englische Version (Original)
  CONTENT_PATH="content/book.md"
  EXPORT_PREFIX="building-nostr"
  IBIS_CONFIG="ibis.php"
else
  # Übersetzungen
  CONTENT_PATH="content/$LANG/book.md"
  EXPORT_PREFIX="building-nostr-$LANG"
  IBIS_CONFIG="ibis-$LANG.php"
fi

# Prüfe, ob die Quelldatei existiert
if [ ! -f "$CONTENT_PATH" ]; then
  echo "Error: Content file $CONTENT_PATH does not exist!"
  echo "Please create the translation file first."
  exit 1
fi

# Erzeuge die Ausgabeverzeichnisse
mkdir -p export
if [ "$LANG" != "en" ]; then
  mkdir -p export/$LANG
fi

# Funktion zum Erzeugen von PDF mit ibis-next
build_pdf() {
  echo "Generating PDF..."
  if [ "$LANG" = "en" ]; then
    OUTPUT_PATH="export/${EXPORT_PREFIX}-light.pdf"
  else
    OUTPUT_PATH="export/$LANG/${EXPORT_PREFIX}-light.pdf"
  fi

  # Kopiere ibis-Konfiguration für die Sprache (falls vorhanden)
  if [ -f "$IBIS_CONFIG" ]; then
    cp "$IBIS_CONFIG" ibis.php
  fi

  # PDF mit ibis-next erzeugen
  composer global exec ibis-next pdf "$CONTENT_PATH" "$OUTPUT_PATH"
}

# Funktion zum Erzeugen von EPUB mit Pandoc
build_epub() {
  echo "Generating EPUB..."
  if [ "$LANG" = "en" ]; then
    OUTPUT_PATH="export/${EXPORT_PREFIX}.epub"
  else
    OUTPUT_PATH="export/$LANG/${EXPORT_PREFIX}.epub"
  fi

  # EPUB mit Pandoc erzeugen
  pandoc "$CONTENT_PATH" \
    --toc \
    --epub-title-page=false \
    --epub-cover-image=assets/cover.png \
    -M title:"Building Nostr" \
    -M author:hodlbod \
    -M language:$LANG \
    -o "$OUTPUT_PATH"
}

# Funktion zum Erzeugen von HTML
build_html() {
  echo "Generating HTML..."
  if [ "$LANG" = "en" ]; then
    OUTPUT_PATH="export/${EXPORT_PREFIX}.html"
  else
    OUTPUT_PATH="export/$LANG/${EXPORT_PREFIX}.html"
  fi

  # HTML mit Pandoc erzeugen
  pandoc "$CONTENT_PATH" \
    --toc \
    --standalone \
    --css=assets/style.css \
    -M title:"Building Nostr" \
    -M author:hodlbod \
    -M language:$LANG \
    -o "$OUTPUT_PATH"
}

# Build basierend auf Format
case $FORMAT in
  pdf)
    build_pdf
    ;;
  epub)
    build_epub
    ;;
  html)
    build_html
    ;;
  all)
    build_pdf
    build_epub
    build_html
    ;;
  *)
    echo "Unknown format: $FORMAT"
    echo "Supported formats: pdf, epub, html, all"
    exit 1
    ;;
esac

echo "Build completed successfully!"
