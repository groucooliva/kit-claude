#!/usr/bin/env bash
# Instalador del kit v2 en la máquina de trabajo (Git Bash en Windows, o bash en Mac/Linux).
# Uso, desde la carpeta donde se clonó o descomprimió el kit:   bash instalar.sh
# No usa Claude ni gasta créditos. Lo que ya existía queda con sufijo .backup.

set -u
KIT="$(cd "$(dirname "$0")" && pwd)"
cd "$KIT" || exit 1

echo "== Kit Claude v2: instalación =="

# 1. hooks, settings y skills (nivel usuario)
mkdir -p ~/.claude/hooks ~/.claude/skills
cp hooks/*.sh ~/.claude/hooks/
[ -f ~/.claude/settings.json ] && cp ~/.claude/settings.json ~/.claude/settings.backup.json
cp v2/plantillas/settings_dell.json ~/.claude/settings.json
cp -r skills/* ~/.claude/skills/
echo "OK hooks, settings y skills en ~/.claude"

# 2. router en la carpeta de trabajo
echo
echo "Arrastrá a esta ventana la carpeta desde donde abrís Claude en el laburo y apretá Enter."
echo "(Si la dejás vacía, se usa tu carpeta de usuario.)"
IFS= read -r RAIZ
RAIZ="${RAIZ%"${RAIZ##*[![:space:]]}"}"; RAIZ="${RAIZ#"${RAIZ%%[![:space:]]*}"}"
RAIZ="${RAIZ%\"}"; RAIZ="${RAIZ#\"}"; RAIZ="${RAIZ%\'}"; RAIZ="${RAIZ#\'}"
[ -z "$RAIZ" ] && RAIZ="$HOME"
command -v cygpath >/dev/null 2>&1 && RAIZ="$(cygpath -u "$RAIZ")"
if [ ! -d "$RAIZ" ]; then
  echo "ERROR: no encuentro la carpeta: $RAIZ"
  echo "Volvé a correr: bash instalar.sh"
  exit 1
fi

[ -f "$RAIZ/CLAUDE.md" ] && cp "$RAIZ/CLAUDE.md" "$RAIZ/CLAUDE.backup.md"
cp v2/CLAUDE.md v2/QUIEN_SOY.md v2/HANDOFF.md v2/COMO_TRABAJAMOS.md v2/PRINCIPIOS_DE_TRABAJO.md "$RAIZ/"
[ -f "$RAIZ/ESTADO_ACTUAL.md" ] || printf '# ESTADO ACTUAL\n\n## Cola\n' > "$RAIZ/ESTADO_ACTUAL.md"
echo "OK router en: $RAIZ"

echo
echo "LISTO. Cuando tengas créditos, abrí claude desde esa carpeta y fijate:"
echo "  - abajo del prompt, una línea tipo [Sonnet] \$0.00 · ctx 0%"
echo "  - al primer mensaje, el aviso del contador de turnos"
