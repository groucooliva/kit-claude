#!/usr/bin/env bash
# Contador de turnos por sesión — hook UserPromptSubmit.
#
# Cuenta los prompts de la sesión y, en los turnos 15, 25 y 35, imprime UNA línea
# por stdout. Claude Code agrega el stdout de un hook UserPromptSubmit al contexto
# como texto que el modelo ve, así que esa línea funciona como recordatorio de cerrar.
# En los demás turnos no imprime nada (silencio = cero tokens).
#
# Entrada: JSON por stdin con session_id, transcript_path, cwd, prompt, hook_event_name.
# Salida: texto plano por stdout, exit 0. Nunca exit 2 (eso BORRARÍA el prompt).
# Portable: bash sin jq. Timeout del hook: 30 s (esto corre en milisegundos).

set -u

entrada=$(cat)

# session_id sin jq: se aplana el JSON y se saca el primer valor entrecomillado.
sesion=$(printf '%s' "$entrada" | tr -d '\n' \
  | sed -n 's/.*"session_id"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p')
[ -n "$sesion" ] || sesion="sin_id"
# Se sanea para usarlo como nombre de archivo.
sesion=$(printf '%s' "$sesion" | tr -c 'A-Za-z0-9_.-' '_')

tmp="${TMPDIR:-/tmp}"
archivo="$tmp/cc_turnos_$sesion"

n=$(cat "$archivo" 2>/dev/null || echo 0)
case "$n" in ''|*[!0-9]*) n=0 ;; esac
n=$((n + 1))
printf '%s' "$n" > "$archivo" 2>/dev/null || true

# Higiene: los contadores de sesiones viejas se borran solos.
find "$tmp" -maxdepth 1 -name 'cc_turnos_*' -mtime +2 -delete 2>/dev/null || true

case "$n" in
  15)
    echo "⏱ Turno 15 de esta sesión: cerrá en el próximo hito — escribí el handoff y pedile que corra /clear y abra una sesión nueva para lo que siga."
    ;;
  25)
    echo "⏱ Turno 25: la sesión ya está cara. Terminá lo que está a mano, escribí el handoff con la próxima acción y cerrá; lo demás va a la lista para otra sesión."
    ;;
  35)
    echo "⏱ Turno 35: cerrá ahora aunque la tarea quede a medias. Handoff con el estado exacto y dónde retomar, y sesión nueva."
    ;;
esac

exit 0
