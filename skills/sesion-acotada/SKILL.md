---
name: sesion-acotada
description: >-
  Convierte un pedido difuso o en tanda en UNA tarea con nombre, resultado esperado y criterio de
  terminado, y cierra la sesión apenas ese resultado existe. Activar AUTOMÁTICAMENTE al abrir una
  sesión, cuando el pedido llega vago o son varias cosas juntas, cuando la conversación se va de
  tema, o cuando el contador de turnos avisa. Disparadores: "arrancamos", "te cuento lo que
  necesito", "tengo varias cosas", "no sé bien cómo encarar esto", "grill me", "ya que estoy", "y
  otra cosa". NO es `reglas-de-trabajo` (esa es el criterio para ejecutar una tarea ya definida):
  ésta define cuál es la tarea y cuándo se corta.
---

# Sesión acotada — una tarea, un resultado, cierre

El costo de una sesión lo dominan el contexto arrastrado y los cache misses, no la cantidad de trabajo útil. Una charla que encadena temas paga varias veces lo mismo y termina rindiendo menos que tres sesiones cortas. Esta skill es el mecanismo que lo evita: **fijar el problema con un grill breve, ejecutar, cerrar.**

## 1. El arranque: proponé, no preguntes (un solo turno)

No arranques a trabajar sobre un pedido difuso, pero tampoco lo frenes con preguntas: la claridad le llega reaccionando a material expuesto, no por introspección. En UN turno escribí:

1. **La tarea cerrada**, con el patrón verbo + objeto acotado + formato + corte (temporal, de alcance o de cantidad).
2. **El criterio de terminado**, en una línea, chequeable sí/no mirando el artefacto.
3. **El plan en 3 líneas.** Qué va a un subagente, qué se queda en el contexto principal.
4. **El modelo de la sesión**, si no está fijado: CRITERIO (encuadre de un análisis para liderazgo, matriz de decisión, abogado del diablo sobre algo que va para arriba, síntesis final de un research, mail difícil) pide abrir con `claude --model opus`; EJECUCIÓN (minutas, reformateo, cruce de listas, extracción de campos, borradores de insumo, research dirigido con fuentes) se queda en sonnet. Nunca se cambia a mitad de sesión: reprocesa toda la conversación sin caché.

Y cerrás con una sola pregunta: **¿va así?** Si contesta "dale", "no sé" o "vos fijate", arrancás con la lectura más acotada, declarándola en una línea. Si corrige, ajustás y arrancás. Nunca un segundo turno de preguntas. Si el pedido ya viene cerrado o ya está en la `## Cola` de `ESTADO_ACTUAL.md`, no hay propuesta: se ejecuta.

Si la tarea toca varios archivos o el enfoque no está claro, pedile Shift+Tab (plan mode) antes de ejecutar. Si el resultado se describe en una frase, directo.

## 2. Pedido vago → pedido cerrado

| Como llega | Como queda |
|---|---|
| "Mirá el pipeline a ver qué onda" | "Listar las oportunidades con close date vencido o stage sin mover hace más de 30 días, por owner, en una tabla markdown." |
| "Necesito algo para la reunión del jueves" | "Media carilla con los tres desvíos del mes y su explicación, en el archivo del frente, antes del miércoles." |
| "Ayudame con este proceso que es un quilombo" | "Escribir los pasos actuales del proceso X tal como se hacen hoy y marcar los dos que se pueden automatizar." |
| "Investigá esta cuenta" | "Briefing de una carilla: qué vende, noticias de los últimos 6 meses con fuente, y dos ángulos de entrada. ⚠ lo no verificado." |

El patrón: **verbo + objeto acotado + formato + corte** (temporal, de alcance o de cantidad).

## 3. Criterio de terminado

Se escribe en una línea, al principio, y se pega en el handoff al final. Sirve si se puede responder sí/no mirando el artefacto:

- Sirve: "existe el archivo con las 12 cuentas y cada una tiene owner y última actividad".
- No sirve: "que el análisis esté completo", "que quede bien".

Si no se puede escribir así, elegí el criterio más chico que se pueda chequear y declaralo. No vuelvas a preguntar.

## 4. Varias tareas: elegí una, el resto a la Cola

Si llegan tres cosas juntas, **no se hacen las tres acá**. Decí cuál conviene primero (la que destraba a las otras o la que tiene fecha) y anotá las demás en la sección `## Cola` de `ESTADO_ACTUAL.md`: una línea por tarea (título + frente), sin análisis. Escribir el análisis de las otras ya es hacerlas. Dentro de la tarea elegida, las partes sí corren en paralelo por subagente.

Lo mismo a mitad de sesión: si aparece un tema nuevo, offload o charla, **nombralo y mandalo a la Cola** ("eso es otra sesión, lo anoto") y volvé a la tarea. No lo sigas por cortesía: seguirlo es lo que convierte la sesión en maratón. Una consulta al margen que no hace falta que quede en la charla va por `/btw`.

**Dos correcciones fallidas, sesión nueva.** Si te corrigió dos veces lo mismo, el contexto está lleno de intentos fallidos: escribí el handoff con lo que aprendiste (qué NO funcionó y por qué) y pedí `/clear` con un prompt mejor.

**Pensar en voz alta es una tarea.** "Quiero pensar X" o "no sé cómo encararlo" es una sesión válida si se nombra así: 15 turnos, salida = nota de media carilla en el frente con lo decidido, lo descartado y la próxima acción. Se cierra igual que cualquier tarea; sin nota no hubo sesión.

**Tarea grande, por etapas.** Si el plan tiene más de 3 etapas o va a pasar de 20 turnos, cada etapa es una sesión: el plan-checklist va a `<frente>/_proceso/plan_<tarea>.md`, la etapa cierra con handoff apuntando al ítem siguiente, la sesión siguiente arranca leyendo ese archivo. Lo pesado (leer, buscar, cruzar) va a subagentes: no consume turnos de la sesión. Si abrís otra sesión en paralelo, es para OTRO frente, nunca el mismo.

## 5. El cierre

Apenas el resultado está en el archivo:

1. Anotá en el handoff la última línea de la statusline: `cat` del archivo `cc_costo_<session_id>` que el contador nombró en el turno 1 (costo USD, % de contexto, caché). Vos no ves la statusline ni podés correr `/usage`: si el archivo no existe, va ⚠ sin cifra, nunca una cifra inventada ni una pregunta. Es la única forma de saber en dos semanas dónde se va la plata.
2. Escribí el handoff según `HANDOFF.md` (DECIDIÓ / NO FUNCIONÓ / PRODUJO / PRÓXIMA ACCIÓN / COSTO), con el criterio de terminado y la evidencia (el archivo abierto, el conteo, la tabla), no "listo". Si `ESTADO_ACTUAL.md` o el `para_asistente.md` del frente no existen, se crean con este handoff.
3. Cerrá con esta frase, literal: **"Tarea cerrada. Corré `/clear` y arrancá con la próxima de la Cola (ESTADO_ACTUAL.md)."**
4. No ofrezcas "¿seguimos con otra cosa?", no propongas mejoras opcionales, no abras un frente nuevo. Ofrecer continuidad es lo que hace la maratón.

Si igual se queda ("seguimos acá"), es un override suyo: seguís sin repetir el cierre hasta el próximo ⏱; el costo lo acepta él. No reabrís la propuesta.

Presupuesto: 15-25 turnos, tres niveles. ⏱ 15 = chequeo: ¿misma tarea? si sí, seguí; si cambió el tema, handoff y `/clear`. ⏱ 25 = cerrá en el próximo hito. ⏱ 35 y siguientes (repite cada 5) = cerrá ahora aunque quede a medias, con el handoff diciendo dónde retomar. Si se va a una reunión, cerrá con handoff: en Enterprise retomar una sesión fría reprocesa el contexto entero.
