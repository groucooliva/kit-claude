#!/usr/bin/env bash
# Contador de turnos por sesión — hook UserPromptSubmit.
#
# Cuenta los prompts de la sesión y avisa en el turno 15, en el 25 y desde el 35
# cada 5 turnos. Devuelve JSON con dos campos: systemMessage (lo ve la persona en
# pantalla) y additionalContext (lo ve el modelo). Con stdout plano el aviso NO
# aparece en pantalla: solo lo ve el modelo, y un aviso que la persona no ve no
# frena nada. En el turno 1 avisa "contador activo" para que se sepa que corre.
#
# Solo builtins de bash (sin jq, sed, tr ni find): Git Bash en Windows puede
# lanzar el hook con un PATH pelado y ahí cualquier comando externo falla en
# silencio. Exit 0 siempre; nunca exit 2 (borraría el prompt).
#
# La statusline (statusline_costo.sh) deja su última línea en $tmp/cc_costo_<id>.
# En el turno 1 este hook le dice al modelo esa ruta (para el COSTO del handoff) y
# en cada aviso ⏱ le copia la línea, así el modelo ve costo y % de contexto sin
# tener que preguntar ni inventar.

set -u

IFS= read -r -d '' entrada || true

# Clave de la sesión: session_id; si falta, el nombre del transcript (cambia con
# cada conversación, incluido /clear); si tampoco está, "sin_id".
clave=""
if [[ $entrada =~ \"session_id\"[[:space:]]*:[[:space:]]*\"([^\"]+)\" ]]; then
  clave="${BASH_REMATCH[1]}"
elif [[ $entrada =~ \"transcript_path\"[[:space:]]*:[[:space:]]*\"([^\"]+)\" ]]; then
  clave="${BASH_REMATCH[1]##*/}"
fi
[ -n "$clave" ] || clave="sin_id"
clave="${clave//[^A-Za-z0-9_.-]/_}"

tmp="${TMPDIR:-${TEMP:-/tmp}}"
archivo="$tmp/cc_turnos_$clave"
costo_f="$tmp/cc_costo_$clave"

n=0
[ -r "$archivo" ] && read -r n < "$archivo"
[[ $n =~ ^[0-9]+$ ]] || n=0
n=$((n + 1))
{ printf '%s\n' "$n" > "$archivo"; } 2>/dev/null || true

msg=""
if [ "$n" -eq 1 ]; then
  msg="⏱ Contador de turnos activo."
elif [ "$n" -eq 15 ]; then
  msg="⏱ Turno 15: ¿seguimos en la MISMA tarea? Si sí, seguí. Si el tema cambió, eso es otra sesión: handoff y /clear."
elif [ "$n" -eq 25 ]; then
  msg="⏱ Turno 25: la sesión ya está cara. Cerrá en el próximo hito: handoff y /clear."
elif [ "$n" -ge 35 ] && [ $(((n - 35) % 5)) -eq 0 ]; then
  msg="⏱ Turno $n: cerrá AHORA aunque quede a medias. Handoff con dónde retomar, y /clear."
fi

# Escapa lo mínimo para que el JSON sea válido (barras y comillas; no hay saltos).
json() { local s=$1; s=${s//\\/\\\\}; s=${s//\"/\\\"}; printf '%s' "$s"; }

if [ -n "$msg" ]; then
  ctx="$msg"
  if [ "$n" -eq 1 ]; then
    ctx="$msg La statusline (modelo, costo USD, % de contexto, caché) la ve la persona, no vos; su última línea queda en $costo_f. Para el campo COSTO del handoff leela con cat (si el archivo no existe, dejá ⚠ sin cifra)."
  elif [ -r "$costo_f" ]; then
    linea=""; read -r linea < "$costo_f" || true
    [ -n "$linea" ] && { msg="$msg Statusline: $linea"; ctx="$msg"; }
  fi
  printf '{"systemMessage":"%s","hookSpecificOutput":{"hookEventName":"UserPromptSubmit","additionalContext":"%s"}}\n' "$(json "$msg")" "$(json "$ctx")"
fi

exit 0
