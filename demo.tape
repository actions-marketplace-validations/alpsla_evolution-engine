# Evolution Engine — CLI Demo
#
# Flow: install → sources → analyze → report (text) → fix (copy prompt to AI) → verify → report changed
#
# Prerequisites:
#   brew install charmbracelet/tap/vhs
#   brew install chafa              # for report snapshots in terminal
#   pip install evolution-engine
#   pip install playwright && python -m playwright install chromium
#   Edit paths in tape (source + python script) if evolution-engine is elsewhere
#
# Usage:
#   cd /tmp
#   git clone --depth=100 https://github.com/alpsla/codequal.git demo-repo
#   cd demo-repo
#   evo notifications dismiss    # optional: clean slate for recording
#   vhs /path/to/evolution-engine/demo.tape
#
# Produces: demo.gif and demo.mp4 in CURRENT DIRECTORY (run vhs from where you want them)

Output demo.gif
Output demo.mp4

# Terminal appearance
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

# ── Scene 1: Install ──
Type "source /Users/Shared/OpenClaw-Workspace/repos/evolution-engine/.venv/bin/activate"
Enter
Sleep 300ms
Type "# 1. Install Evolution Engine"
Enter
Sleep 500ms
Type "pip install -q evolution-engine && clear"
Enter
Sleep 10s

# ── Scene 2: Fetch sources ──
Type "# 2. What signals can EE detect in this repo?"
Enter
Sleep 1s
Type "evo sources ."
Enter
Sleep 8s

# ── Scene 3: Analyze ──
Type "clear"
Enter
Sleep 500ms
Type "# 3. Run analysis — detect drift across all signals"
Enter
Sleep 1s
Type "evo analyze . --no-open"
Enter
Sleep 9s
Sleep 5s

# ── Scene 4: Report (snapshots simulate scroll — requires playwright + chafa) ──
Type "clear"
Enter
Sleep 500ms
Type "# 4. HTML report — scroll through key sections (snapshots)"
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

# ── Scene 5: Fix — copy prompt + evidence to your AI ──
Type "clear"
Enter
Sleep 500ms
Type "# 5. Copy the prompt and evidence from the report into Cursor, Claude, or Copilot"
Enter
Sleep 1s
Type "# Your AI applies the fix. Then run verify below."
Enter
Sleep 1s
Type "evo analyze . --show-prompt --no-report 2>/dev/null | tail -25"
Enter
Sleep 6s
Sleep 4s

# ── Scene 6: Verify after AI fixes ──
Type "clear"
Enter
Sleep 500ms
Type "# 6. After your AI applies the fix — verify drift is resolved"
Enter
Sleep 1s
Type "evo analyze . --verify --no-open"
Enter
Sleep 9s
Sleep 4s

# ── Scene 7: Report changed (verification banner in report) ──
Type "clear"
Enter
Sleep 500ms
Type "# 7. Report now shows what changed — resolved, improving, or still deviating"
Enter
Sleep 1s
Type "evo report . --verify 2>/dev/null; textutil -convert txt -stdout .evo/report.html | head -50"
Enter
Sleep 6s
Sleep 4s

# ── Scene 8: Closing ──
Type "clear"
Enter
Sleep 500ms
Type "# Intentional change? Use: evo accept --pr or --permanent"
Enter
Sleep 2s
Type "# Detect → Fix → Verify. Your code never leaves your local machine."
Enter
Sleep 1s
Type "# pip install evolution-engine  |  codequal.dev"
Enter
Sleep 4s
