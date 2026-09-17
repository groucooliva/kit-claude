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

n=0
[ -r "$archivo" ] && read -r n < "$archivo"
[[ $n =~ ^[0-9]+$ ]] || n=0
n=$((n + 1))
printf '%s\n' "$n" > "$archivo" 2>/dev/null || true

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

if [ -n "$msg" ]; then
  printf '{"systemMessage":"%s","hookSpecificOutput":{"hookEventName":"UserPromptSubmit","additionalContext":"%s"}}\n' "$msg" "$msg"
fi

exit 0
