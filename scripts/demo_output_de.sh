#!/usr/bin/env bash
# Skriptierte Demo-Ausgabe — erzeugt die Ausgabe aus VIDEO_SCRIPT.md auf Deutsch
# Wird von demo_de.tape für eine reproduzierbare, professionelle Aufnahme verwendet
#
# Verwendung: bash scripts/demo_output_de.sh <szene>

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
    echo -e "${DIM}Sammle evolution-engine${NC}"
    sleep 0.3
    echo -e "${DIM}  Lade evolution_engine-0.3.0-py3-none-any.whl herunter (128 kB)${NC}"
    sleep 0.2
    echo -e "${DIM}Installiere gesammelte Pakete: evolution-engine${NC}"
    sleep 0.3
    echo -e "${GREEN}Erfolgreich installiert: evolution-engine-0.3.0${NC}"
}

demo_analyze() {
    echo -e "${CYAN}Quellen werden gescannt...${NC}"
    sleep 0.4
    echo -e "  ${GREEN}✓${NC} Git-Verlauf (50 Commits)"
    sleep 0.2
    echo -e "  ${GREEN}✓${NC} package-lock.json (Abhängigkeitsverfolgung)"
    sleep 0.2
    echo -e "  ${GREEN}✓${NC} .github/workflows (CI-Erkennung)"
    sleep 0.3
    echo ""
    echo -e "Phase 1: Ereignisse sammeln... ${BOLD}847 Ereignisse${NC}"
    sleep 0.4
    echo -e "Phase 2: Signale extrahieren... ${BOLD}2.541 Signale${NC}"
    sleep 0.4
    echo -e "Phase 3: Erklärungen generieren..."
    sleep 0.3
    echo -e "Phase 4: Muster abgleichen... ${BOLD}12 Muster erkannt${NC}"
    sleep 0.3
    echo -e "Phase 5: Bericht erstellen..."
    sleep 0.5
    echo ""
    echo -e "${YELLOW}⚠️  3 wesentliche Änderungen erkannt${NC}"
    echo ""
    printf " %-3s %-10s %-12s %-22s %s\n" "#" "Schwere" "Familie" "Metrik" "Abweichung"
    printf " %-3s %-10s %-12s %-22s %s\n" "─" "────────" "──────" "──────" "──────────"
    printf " %-3s ${RED}%-10s${NC} %-12s %-22s %s\n" "1" "🔴 Hoch" "git" "dispersion" "+3,2σ (0,87 vs Basis 0,32)"
    printf " %-3s ${YELLOW}%-10s${NC} %-12s %-22s %s\n" "2" "🟡 Mittel" "ci" "run_duration" "+2,1σ (340s vs Basis 180s)"
    printf " %-3s ${YELLOW}%-10s${NC} %-12s %-22s %s\n" "3" "🟡 Mittel" "dependency" "dependency_count" "+1,8σ (47 vs Basis 38)"
    echo ""
    echo -e "${BLUE}Muster:${NC} ci_failure + high_dispersion → verstreutes Refactoring (85% Konfidenz)"
}

demo_report() {
    echo -e "Bericht gespeichert unter ${BOLD}.evo/report.html${NC}"
    sleep 0.3
    echo "Wird im Browser geöffnet..."
}

demo_verify() {
    echo -e "${CYAN}Vergleiche mit vorheriger Analyse...${NC}"
    sleep 0.5
    echo ""
    echo -e " ${GREEN}✅${NC} git/dispersion — zum Normalwert zurückgekehrt (0,34)"
    sleep 0.3
    echo -e " ${YELLOW}⚠️${NC}  ci/run_duration — weicht weiterhin ab (+1,9σ)"
    sleep 0.3
    echo -e " ${GREEN}✅${NC} dependency/dependency_count — stabilisiert"
    echo ""
    echo -e "Behebungsrate: ${BOLD}67%${NC} (2 von 3 behoben)"
}

demo_investigate() {
    echo -e "${DIM}🤖 KI-Transparenz: Diese Funktion nutzt KI zur Analyse von Berichtserkenntnissen.${NC}"
    echo ""
    echo "Untersuche 3 Erkenntnisse..."
    sleep 0.5
    echo ""
    echo -e "${BOLD}Erkenntnis 1${NC} (git/dispersion +3,2σ):"
    sleep 0.3
    echo "  Commit abc1234 hat 12 Dateien in 5 Verzeichnissen geändert."
    sleep 0.2
    echo "  Dies scheint ein großes Refactoring zu sein, das in Commit def5678 begann."
    sleep 0.2
    echo "  Der Streuungsanstieg korreliert mit der erhöhten CI-Dauer."
    echo ""
    echo -e "  ${BLUE}Empfehlung:${NC} Überprüfen Sie Commits abc1234..ghi9012 auf unbeabsichtigte Scope-Erweiterung."
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
    *) echo "Verwendung: $0 {install|analyze|report|verify|investigate|all}" ;;
esac
