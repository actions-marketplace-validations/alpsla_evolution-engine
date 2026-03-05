# Evolution Engine — Demo CLI (Español)
#
# Flujo: Instalar → Fuentes → Analizar → Informe (texto) → Corregir (copiar prompt a IA) → Verificar → Informe actualizado
#
# Requisitos previos:
#   brew install charmbracelet/tap/vhs
#   brew install chafa              # para capturas del informe en terminal
#   pip install evolution-engine
#   pip install playwright && python -m playwright install chromium
#   Editar rutas en el tape (source + script Python) si evolution-engine está en otro lugar
#
# Uso:
#   cd /tmp
#   git clone --depth=100 https://github.com/alpsla/codequal.git demo-repo
#   cd demo-repo
#   evo notifications dismiss    # opcional: estado limpio para la grabación
#   vhs /path/to/evolution-engine/scripts/demo_es.tape
#
# Produce: demo-es.gif y demo-es.mp4 en el DIRECTORIO ACTUAL (ejecutar vhs desde donde quiera los archivos)

Output demo-es.gif
Output demo-es.mp4

# Apariencia del terminal
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

# ── Escena 1: Instalación ──
Type "source /Users/Shared/OpenClaw-Workspace/repos/evolution-engine/.venv/bin/activate"
Enter
Sleep 300ms
Type "# 1. Instalar Evolution Engine"
Enter
Sleep 500ms
Type "pip install -q evolution-engine && clear"
Enter
Sleep 10s

# ── Escena 2: Obtener fuentes ──
Type "# 2. ¿Qué señales puede detectar EE en este repositorio?"
Enter
Sleep 1s
Type "evo sources ."
Enter
Sleep 8s

# ── Escena 3: Análisis ──
Type "clear"
Enter
Sleep 500ms
Type "# 3. Ejecutar análisis — detectar drift en todas las señales"
Enter
Sleep 1s
Type "evo analyze . --no-open"
Enter
Sleep 9s
Sleep 5s

# ── Escena 4: Informe (capturas simulan desplazamiento — requiere playwright + chafa) ──
Type "clear"
Enter
Sleep 500ms
Type "# 4. Informe HTML — desplazarse por secciones clave (capturas)"
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

# ── Escena 5: Corregir — copiar prompt + evidencia a su IA ──
Type "clear"
Enter
Sleep 500ms
Type "# 5. Copiar el prompt y la evidencia del informe en Cursor, Claude o Copilot"
Enter
Sleep 1s
Type "# Su IA aplica la corrección. Luego ejecute verificar abajo."
Enter
Sleep 1s
Type "evo analyze . --show-prompt --no-report 2>/dev/null | tail -25"
Enter
Sleep 6s
Sleep 4s

# ── Escena 6: Verificar después de correcciones de IA ──
Type "clear"
Enter
Sleep 500ms
Type "# 6. Después de que su IA aplique la corrección — verificar que el drift se resolvió"
Enter
Sleep 1s
Type "evo analyze . --verify --no-open"
Enter
Sleep 9s
Sleep 4s

# ── Escena 7: Informe actualizado (banner de verificación en el informe) ──
Type "clear"
Enter
Sleep 500ms
Type "# 7. El informe ahora muestra qué cambió — resuelto, mejorando o aún desviándose"
Enter
Sleep 1s
Type "evo report . --verify 2>/dev/null; textutil -convert txt -stdout .evo/report.html | head -50"
Enter
Sleep 6s
Sleep 4s

# ── Escena 8: Cierre ──
Type "clear"
Enter
Sleep 500ms
Type "# ¿Cambio intencional? Use: evo accept --pr o --permanent"
Enter
Sleep 2s
Type "# Detectar → Corregir → Verificar. Su código nunca sale de su máquina local."
Enter
Sleep 1s
Type "# pip install evolution-engine  |  codequal.dev"
Enter
Sleep 4s
