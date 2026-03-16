# Beitrag zum Building Nostr-Buch

Willkommen! Dieses Dokument erklärt, wie du zum "Building Nostr"-Projekt beitragen kannst, insbesondere bei Übersetzungen.

## Übersetzungen

Wir freuen uns über Übersetzungen in andere Sprachen! Hier ist der Prozess:

### 1. Vorbereitung

1. Forke das Repository
2. Erstelle einen Branch für deine Übersetzung: `git checkout -b translation-<sprachcode>`
3. Erstelle die Verzeichnisstruktur für deine Sprache:
   ```bash
   mkdir -p content/<sprachcode>
   mkdir -p assets/<sprachcode>
   mkdir -p export/<sprachcode>
   ```

### 2. Übersetzung erstellen

1. Kopiere die Originaldatei: `cp content/book.md content/<sprachcode>/book.md`
2. Übersetze den Inhalt der `content/<sprachcode>/book.md` Datei
3. Erstelle eine sprachspezifische ibis-Konfiguration: `cp ibis.php ibis-<sprachcode>.php`
4. Passe die ibis-Konfiguration an (Titel, Autor, Sample-Notice usw.)

### 3. Testen

Teste deinen Build:
```bash
./build-multilang.sh --lang=<sprachcode> --format=all
```

### 4. Pull Request

1. Committe deine Änderungen
2. Pushe deinen Branch
3. Erstelle einen Pull Request mit der Beschreibung deiner Übersetzung

## Richtlinien für Übersetzungen

- **Technische Begriffe**: Behalte englische Fachbegriffe bei (Nostr, secp256k1, WebSocket, etc.)
- **Konsistenz**: Verwende einheitliche Übersetzungen für wiederkehrende Begriffe
- **Markdown**: Erhalte die Markdown-Formatierung
- **Qualität**: Stelle sicher, dass die Übersetzung korrekt und flüssig ist

## Andere Beiträge

- **Fehlerkorrekturen**: Erstelle Issues oder Pull Requests für Fehler im Originaltext
- **Verbesserungen**: Vorschläge für Inhaltsverbesserungen sind willkommen
- **Dokumentation**: Hilf bei der Verbesserung dieser Dokumentation

## Kontakt

Bei Fragen wende dich an die Maintainers oder erstelle ein Issue.
