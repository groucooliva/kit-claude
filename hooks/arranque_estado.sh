#!/usr/bin/env bash
# Arranque orientado — hook SessionStart (startup, clear, compact, resume, fork).
#
# En startup/clear/compact: imprime ESTADO_ACTUAL.md de la raíz de trabajo por
# stdout, que Claude Code mete en el contexto antes del primer turno. Así la
# sesión nueva arranca sabiendo dónde quedó todo sin que nadie se lo pida ni el
# modelo tenga que buscarlo (es lo que hace un hook igual en la máquina personal).
# Si el archivo pasa de 4000 caracteres avisa: la vértebra es un puntero, no un
# acta, y un puntero gordo se paga en cada arranque.
#
# En resume/fork: no inyecta nada; devuelve un systemMessage con lo que cuesta
# retomar esa sesión (campos context_tokens y estimated_cache_write_usd, Claude
# Code v2.1.251+). Si los campos no vienen, no dice nada.
#
# Solo builtins de bash. Exit 0 siempre.

set -u

IFS= read -r -d '' entrada || true

fuente="startup"
[[ $entrada =~ \"source\"[[:space:]]*:[[:space:]]*\"([a-z]+)\" ]] && fuente="${BASH_REMATCH[1]}"

raiz="${CLAUDE_PROJECT_DIR:-$PWD}"
estado="$raiz/ESTADO_ACTUAL.md"

case "$fuente" in
  resume|fork)
    tok=""; usd=""
    [[ $entrada =~ \"context_tokens\"[[:space:]]*:[[:space:]]*([0-9]+) ]] && tok="${BASH_REMATCH[1]}"
    [[ $entrada =~ \"estimated_cache_write_usd\"[[:space:]]*:[[:space:]]*([0-9.]+) ]] && usd="${BASH_REMATCH[1]}"
    if [ -n "$tok" ]; then
      k=$((tok / 1000))
      printf '{"systemMessage":"Retomar esta sesión reprocesa ~%sk tokens (~$%s). Si la tarea cambió: /clear y retomá por ESTADO_ACTUAL.md."}\n' "$k" "${usd:-?}"
    fi
    ;;
  *)
    if [ -r "$estado" ]; then
      contenido=$(<"$estado")
      echo "Vértebra de continuidad (ESTADO_ACTUAL.md). Decí en una línea desde dónde retomás y seguí; no la resumas ni preguntes si retomamos o arrancamos de cero:"
      printf '%s\n' "$contenido"
      if [ "${#contenido}" -gt 4000 ]; then
        echo "⚠ ESTADO_ACTUAL.md pasa de 4000 caracteres: es un puntero, no un acta. Podarlo antes de seguir."
      fi
    fi
    ;;
esac

exit 0
