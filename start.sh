#!/bin/bash
# ============================================
# 🚀 Alfaken Startup - Iniciar Servidor Local
# ============================================

PORT=${1:-8080}
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo ""
echo -e "${CYAN}╔════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║   🚀 ALFAKEN STARTUP - SERVIDOR LOCAL     ║${NC}"
echo -e "${CYAN}╚════════════════════════════════════════════╝${NC}"
echo ""

cd "$(dirname "$0")"

# Detectar servidor disponível
if command -v python3 &> /dev/null; then
    echo -e "${GREEN}✅ Usando Python 3${NC}"
    echo -e "${YELLOW}🌐 Acesse: http://localhost:${PORT}${NC}"
    echo -e "${YELLOW}   Para parar: Ctrl+C${NC}"
    echo ""
    python3 -m http.server "$PORT"
elif command -v python &> /dev/null; then
    echo -e "${GREEN}✅ Usando Python 2${NC}"
    echo -e "${YELLOW}🌐 Acesse: http://localhost:${PORT}${NC}"
    echo -e "${YELLOW}   Para parar: Ctrl+C${NC}"
    echo ""
    python -m SimpleHTTPServer "$PORT"
elif command -v npx &> /dev/null; then
    echo -e "${GREEN}✅ Usando npx serve${NC}"
    echo -e "${YELLOW}🌐 Acesse: http://localhost:${PORT}${NC}"
    echo -e "${YELLOW}   Para parar: Ctrl+C${NC}"
    echo ""
    npx serve -l "$PORT"
elif command -v php &> /dev/null; then
    echo -e "${GREEN}✅ Usando PHP${NC}"
    echo -e "${YELLOW}🌐 Acesse: http://localhost:${PORT}${NC}"
    echo -e "${YELLOW}   Para parar: Ctrl+C${NC}"
    echo ""
    php -S "localhost:${PORT}"
else
    echo -e "\033[0;31m❌ Nenhum servidor encontrado!${NC}"
    echo "Instale Python 3, Node.js ou PHP."
    exit 1
fi
