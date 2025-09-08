# Übersetzungsrichtlinien für "Building Nostr"

Dieses Dokument bietet detaillierte Anweisungen für Übersetzer, die an der Lokalisierung des "Building Nostr"-Buchs in verschiedene Sprachen arbeiten möchten.

## Überblick

Das "Building Nostr"-Buch ist ein technisches Werk über das Nostr-Protokoll. Übersetzungen helfen, dieses Wissen einem breiteren Publikum zugänglich zu machen.

## Verzeichnisstruktur

Für jede Sprache verwenden wir ein eigenes Unterverzeichnis nach folgendem Muster:

```
content/
  book.md         # Originalbuch (Englisch)
  de/
    book.md       # Deutsche Übersetzung
  es/
    book.md       # Spanische Übersetzung
  fr/
    book.md       # Französische Übersetzung
  ...

assets/
  de/             # Sprachspezifische Assets für Deutsch
  es/             # Sprachspezifische Assets für Spanisch
  ...

export/
  de/             # Exportierte Dateien für Deutsch
  es/             # Exportierte Dateien für Spanisch
  ...
```

## Übersetzungsprozess

### Schritt 1: Repository vorbereiten

```bash
# Fork und Clone (oder Branch erstellen)
git checkout -b translation-de

# Verzeichnisse erstellen
mkdir -p content/de assets/de export/de
```

### Schritt 2: Inhalt übersetzen

1. **Datei kopieren**: `cp content/book.md content/de/book.md`
2. **Übersetzen**: Arbeite systematisch durch die Datei
3. **Konfiguration erstellen**: `cp ibis.php ibis-de.php`

### Schritt 3: Build testen

```bash
# Vollständigen Build für Deutsch testen
./build-multilang.sh --lang=de --format=all

# Einzelne Formate testen
./build-multilang.sh --lang=de --format=pdf
./build-multilang.sh --lang=de --format=epub
./build-multilang.sh --lang=de --format=html
```

## Technische Begriffe

Einige Begriffe sollten in allen Übersetzungen gleich bleiben, da sie technische Fachbegriffe darstellen:

**Behalte englisch:**
- Nostr
- secp256k1
- WebSocket
- NIPs (Nostr Implementation Possibilities)
- Events/Kinds
- Relays
- Cryptocurrency-Begriffe (Bitcoin, Lightning, etc.)

**Übersetze kontextabhängig:**
- "Events" als "Ereignisse" im technischen Kontext
- "Keys" als "Schlüssel" oder "Schlüsseln"
- "Nodes" als "Knoten"

## Stilrichtlinien

- **Ton**: Behalte den informellen, erklärenden Ton des Originals
- **Länge**: Übersetzungen sollten ähnlich lang sein wie das Original
- **Klarheit**: Technische Konzepte müssen klar erklärt werden
- **Konsistenz**: Verwende einheitliche Terminologie

## Beispiel: Deutsche Übersetzung

### Original:
```
## Introduction: Nostr is for Builders

Nostr stands for "Notes and Other Stuff Transmitted by Relays." It was created as an answer to social media censorship by big tech companies, but has since become much more.
```

### Übersetzung:
```
## Einführung: Nostr ist für Entwickler

Nostr steht für "Notes and Other Stuff Transmitted by Relays." Es wurde als Antwort auf die Zensur sozialer Medien durch große Tech-Unternehmen entwickelt, hat sich aber seitdem zu viel mehr entwickelt.
```

## Qualitätssicherung

### Selbstprüfung:
- [ ] Alle technischen Begriffe korrekt behandelt
- [ ] Markdown-Formatierung erhalten
- [ ] Rechtschreibung und Grammatik korrekt
- [ ] Build erfolgreich

### Peer Review:
- Erstelle einen Pull Request für Review
- Mindestens ein anderer Übersetzer sollte die Arbeit prüfen

## Aktualisierung der Übersetzungen

Wenn das Originalbuch aktualisiert wird:

1. **Änderungen identifizieren**: Verwende `git diff` um Änderungen zu sehen
2. **Entsprechende Abschnitte aktualisieren**
3. **Build testen**
4. **Commit mit Referenz**: `git commit -m "Update German translation for changes in commit abc123"`

## Build-Prozess

### Lokaler Build:
```bash
# Alle Formate für Deutsch
./build-multilang.sh --lang=de --format=all

# Nur PDF
./build-multilang.sh --lang=de --format=pdf
```

### CI/CD:
Das Repository verwendet GitHub Actions für automatische Builds. Übersetzungen werden automatisch gebaut, wenn:
- Die Übersetzungsdatei geändert wird
- Die Build-Skripte aktualisiert werden

## Namenskonventionen für Exporte

Die exportierten Dateien folgen diesem Schema:
- `building-nostr-de.pdf` (PDF für Deutsch)
- `building-nostr-de.epub` (EPUB für Deutsch)
- `building-nostr-de.html` (HTML für Deutsch)

## Häufige Probleme

### Build-Fehler:
- Stelle sicher, dass `composer` und `pandoc` installiert sind
- Prüfe, ob die ibis-Konfiguration korrekt ist

### Encoding-Probleme:
- Verwende UTF-8 Encoding für alle Dateien
- Stelle sicher, dass Sonderzeichen korrekt dargestellt werden

## Ressourcen

- [Nostr Protocol Documentation](https://github.com/nostr-protocol/nostr)
- [Markdown Guide](https://www.markdownguide.org/)
- [Pandoc Manual](https://pandoc.org/MANUAL.html)

## Kontakt

Bei Fragen:
- Erstelle ein Issue im Repository
- Kontaktiere die Maintainers
- Trete der Nostr-Community bei für Unterstützung
