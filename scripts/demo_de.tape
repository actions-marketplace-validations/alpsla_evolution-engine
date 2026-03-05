# Evolution Engine — CLI-Demo (Deutsch)
#
# Ablauf: Installieren → Quellen → Analysieren → Bericht (Text) → Beheben (Prompt an KI) → Überprüfen → Bericht aktualisiert
#
# Voraussetzungen:
#   brew install charmbracelet/tap/vhs
#   brew install chafa              # für Berichts-Snapshots im Terminal
#   pip install evolution-engine
#   pip install playwright && python -m playwright install chromium
#   Pfade im Tape anpassen (source + Python-Skript), falls evolution-engine woanders liegt
#
# Verwendung:
#   cd /tmp
#   git clone --depth=100 https://github.com/alpsla/codequal.git demo-repo
#   cd demo-repo
#   evo notifications dismiss    # optional: sauberer Start für Aufnahme
#   vhs /path/to/evolution-engine/scripts/demo_de.tape
#
# Erzeugt: demo-de.gif und demo-de.mp4 im AKTUELLEN VERZEICHNIS (vhs dort ausführen, wo die Dateien landen sollen)

Output demo-de.gif
Output demo-de.mp4

# Terminal-Darstellung
Set Shell "bash"
Set FontSize 22
Set Width 1400
Set Height 800
Set Padding 24
Set Theme "Catppuccin Mocha"
Set FontFamily "Menlo"
Set TypingSpeed 50ms
Set CursorBlink false

Env PATH "/Users/Shared/OpenClaw-Workspace/repos/evolution-engine/.venv/bin:/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin"

# ── Szene 1: Installation ──
Type "source /Users/Shared/OpenClaw-Workspace/repos/evolution-engine/.venv/bin/activate"
Enter
Sleep 300ms
Type "# 1. Evolution Engine installieren"
Enter
Sleep 500ms
Type "pip install -q evolution-engine && clear"
Enter
Sleep 10s

# ── Szene 2: Quellen abrufen ──
Type "# 2. Welche Signale kann EE in diesem Repo erkennen?"
Enter
Sleep 1s
Type "evo sources ."
Enter
Sleep 8s

# ── Szene 3: Analyse ──
Type "clear"
Enter
Sleep 500ms
Type "# 3. Analyse starten — Drift über alle Signale erkennen"
Enter
Sleep 1s
Type "evo analyze . --no-open"
Enter
Sleep 9s
Sleep 5s

# ── Szene 4: Bericht (Snapshots simulieren Scrollen — erfordert playwright + chafa) ──
Type "clear"
Enter
Sleep 500ms
Type "# 4. HTML-Bericht — durch wichtige Abschnitte scrollen (Snapshots)"
Enter
Sleep 1s
Type "python /Users/Shared/OpenClaw-Workspace/repos/evolution-engine/scripts/capture-report-snapshots.py .evo/report.html 2>/dev/null || true"
Enter
Sleep 4s
Type "chafa .evo/demo-report-1.png 2>/dev/null || textutil -convert txt -stdout .evo/report.html | head -40"
Enter
Sleep 4s
Type "clear"
Enter
Sleep 400ms
Type "chafa .evo/demo-report-2.png 2>/dev/null || textutil -convert txt -stdout .evo/report.html | head -40 | tail -20"
Enter
Sleep 4s
Type "clear"
Enter
Sleep 400ms
Type "chafa .evo/demo-report-3.png 2>/dev/null"
Enter
Sleep 4s

# ── Szene 5: Beheben — Prompt + Evidenz an KI kopieren ──
Type "clear"
Enter
Sleep 500ms
Type "# 5. Prompt und Evidenz aus dem Bericht in Cursor, Claude oder Copilot einfügen"
Enter
Sleep 1s
Type "# Ihre KI wendet die Korrektur an. Dann unten überprüfen."
Enter
Sleep 1s
Type "evo analyze . --show-prompt --no-report 2>/dev/null | tail -25"
Enter
Sleep 6s
Sleep 4s

# ── Szene 6: Überprüfung nach KI-Korrekturen ──
Type "clear"
Enter
Sleep 500ms
Type "# 6. Nachdem Ihre KI die Korrektur angewendet hat — überprüfen, ob Drift behoben ist"
Enter
Sleep 1s
Type "evo analyze . --verify --no-open"
Enter
Sleep 9s
Sleep 4s

# ── Szene 7: Bericht aktualisiert (Überprüfungsbanner im Bericht) ──
Type "clear"
Enter
Sleep 500ms
Type "# 7. Bericht zeigt jetzt, was sich geändert hat — behoben, verbessert oder weiterhin abweichend"
Enter
Sleep 1s
Type "evo report . --verify 2>/dev/null; textutil -convert txt -stdout .evo/report.html | head -50"
Enter
Sleep 6s
Sleep 4s

# ── Szene 8: Abschluss ──
Type "clear"
Enter
Sleep 500ms
Type "# Beabsichtigte Änderung? Verwenden: evo accept --pr oder --permanent"
Enter
Sleep 2s
Type "# Erkennen → Beheben → Überprüfen. Ihr Code verlässt nie Ihren lokalen Rechner."
Enter
Sleep 1s
Type "# pip install evolution-engine  |  codequal.dev"
Enter
Sleep 4s
