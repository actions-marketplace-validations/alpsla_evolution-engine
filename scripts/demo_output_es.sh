#!/usr/bin/env bash
# Salida de demo con script — produce la salida de VIDEO_SCRIPT.md en español
# Usado por demo_es.tape para una grabación reproducible y profesional
#
# Uso: bash scripts/demo_output_es.sh <escena>

set -euo pipefail

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
DIM='\033[2m'
NC='\033[0m'

scene="${1:-all}"

demo_install() {
    echo -e "${DIM}Recopilando evolution-engine${NC}"
    sleep 0.3
    echo -e "${DIM}  Descargando evolution_engine-0.3.0-py3-none-any.whl (128 kB)${NC}"
    sleep 0.2
    echo -e "${DIM}Instalando paquetes recopilados: evolution-engine${NC}"
    sleep 0.3
    echo -e "${GREEN}Instalado correctamente: evolution-engine-0.3.0${NC}"
}

demo_analyze() {
    echo -e "${CYAN}Escaneando fuentes...${NC}"
    sleep 0.4
    echo -e "  ${GREEN}✓${NC} historial git (50 commits)"
    sleep 0.2
    echo -e "  ${GREEN}✓${NC} package-lock.json (seguimiento de dependencias)"
    sleep 0.2
    echo -e "  ${GREEN}✓${NC} .github/workflows (detección de CI)"
    sleep 0.3
    echo ""
    echo -e "Fase 1: Recopilando eventos... ${BOLD}847 eventos${NC}"
    sleep 0.4
    echo -e "Fase 2: Extrayendo señales... ${BOLD}2.541 señales${NC}"
    sleep 0.4
    echo -e "Fase 3: Generando explicaciones..."
    sleep 0.3
    echo -e "Fase 4: Comparando patrones... ${BOLD}12 patrones detectados${NC}"
    sleep 0.3
    echo -e "Fase 5: Construyendo informe..."
    sleep 0.5
    echo ""
    echo -e "${YELLOW}⚠️  3 cambios significativos detectados${NC}"
    echo ""
    printf " %-3s %-10s %-12s %-22s %s\n" "#" "Severidad" "Familia" "Métrica" "Desviación"
    printf " %-3s %-10s %-12s %-22s %s\n" "─" "────────" "──────" "──────" "──────────"
    printf " %-3s ${RED}%-10s${NC} %-12s %-22s %s\n" "1" "🔴 Alto" "git" "dispersion" "+3,2σ (0,87 vs base 0,32)"
    printf " %-3s ${YELLOW}%-10s${NC} %-12s %-22s %s\n" "2" "🟡 Medio" "ci" "run_duration" "+2,1σ (340s vs base 180s)"
    printf " %-3s ${YELLOW}%-10s${NC} %-12s %-22s %s\n" "3" "🟡 Medio" "dependency" "dependency_count" "+1,8σ (47 vs base 38)"
    echo ""
    echo -e "${BLUE}Patrón:${NC} ci_failure + high_dispersion → refactorización dispersa (85% confianza)"
}

demo_report() {
    echo -e "Informe guardado en ${BOLD}.evo/report.html${NC}"
    sleep 0.3
    echo "Abriendo en el navegador..."
}

demo_verify() {
    echo -e "${CYAN}Comparando con el análisis anterior...${NC}"
    sleep 0.5
    echo ""
    echo -e " ${GREEN}✅${NC} git/dispersion — volvió a la normalidad (0,34)"
    sleep 0.3
    echo -e " ${YELLOW}⚠️${NC}  ci/run_duration — sigue desviándose (+1,9σ)"
    sleep 0.3
    echo -e " ${GREEN}✅${NC} dependency/dependency_count — estabilizado"
    echo ""
    echo -e "Tasa de resolución: ${BOLD}67%${NC} (2 de 3 resueltos)"
}

demo_investigate() {
    echo -e "${DIM}🤖 Transparencia de IA: Esta función usa IA para analizar hallazgos del informe.${NC}"
    echo ""
    echo "Investigando 3 hallazgos..."
    sleep 0.5
    echo ""
    echo -e "${BOLD}Hallazgo 1${NC} (git/dispersion +3,2σ):"
    sleep 0.3
    echo "  Commit abc1234 modificó 12 archivos en 5 directorios."
    sleep 0.2
    echo "  Parece ser una refactorización grande que comenzó en el commit def5678."
    sleep 0.2
    echo "  El pico de dispersión se correlaciona con el aumento de duración del CI."
    echo ""
    echo -e "  ${BLUE}Recomendación:${NC} Revise los commits abc1234..ghi9012 para detectar expansión de alcance no intencionada."
}

case "$scene" in
    install)     demo_install ;;
    analyze)     demo_analyze ;;
    report)      demo_report ;;
    verify)      demo_verify ;;
    investigate) demo_investigate ;;
    all)
        demo_install
        echo ""
        demo_analyze
        echo ""
        demo_report
        echo ""
        demo_investigate
        echo ""
        demo_verify
        ;;
    *) echo "Uso: $0 {install|analyze|report|verify|investigate|all}" ;;
esac
