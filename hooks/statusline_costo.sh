#!/usr/bin/env bash
# Status line de costo — se muestra abajo del prompt, en vivo, sin gastar tokens.
# Muestra: modelo · costo de la sesión en USD · % de contexto (y tokens) ·
# caché warm/fría + TTL + hit ratio · turno del contador.
#
# Claude Code le pasa un JSON por stdin (docs: statusline). Solo builtins de bash:
# Git for Windows no trae jq. El costo es estimado a precio de lista salvo que el
# admin haya fijado modelPricing. En Enterprise no hay barras de plan: solo esto.
# Los campos de caché requieren Claude Code v2.1.251+; si faltan, muestra "caché ?".

IFS= read -r -d '' input || true
num()  { [[ $input =~ \"$1\"[[:space:]]*:[[:space:]]*(-?[0-9.]+) ]] && printf '%s' "${BASH_REMATCH[1]}"; }
str()  { [[ $input =~ \"$1\"[[:space:]]*:[[:space:]]*\"([^\"]*)\" ]] && printf '%s' "${BASH_REMATCH[1]}"; }
bool() { [[ $input =~ \"$1\"[[:space:]]*:[[:space:]]*(true|false) ]] && printf '%s' "${BASH_REMATCH[1]}"; }

model=$(str display_name); cost=$(num total_cost_usd); pct=$(num used_percentage)
tin=$(num total_input_tokens); warm=$(bool warm); ttl=$(str ttl); hit=$(num hit_ratio)
sid=$(str session_id)

printf -v costf '%.2f' "${cost:-0}" 2>/dev/null || costf="${cost:-0}"
pct=${pct%%.*}; ktok=$(( ${tin:-0} / 1000 ))

cache="caché ?"
[ "$warm" = true ]  && cache="caché warm"
[ "$warm" = false ] && cache="caché FRÍA"
[ -n "$ttl" ] && cache="$cache $ttl"
if [ -n "$hit" ]; then
  if [ "$hit" = "1" ]; then h=100; else h="${hit#0.}"; h="${h:0:2}"; fi
  cache="$cache hit ${h}%"
fi

turno=""
if [ -n "$sid" ]; then
  f="${TMPDIR:-${TEMP:-/tmp}}/cc_turnos_${sid//[^A-Za-z0-9_.-]/_}"
  [ -r "$f" ] && read -r turno < "$f" && turno=" · turno $turno"
fi

echo "[${model:-?}] \$${costf} · ctx ${pct:-0}% (${ktok}k tok) · ${cache}${turno}"
