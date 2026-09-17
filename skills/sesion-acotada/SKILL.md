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

## 1. El grill: máximo 3 preguntas, antes de ejecutar nada

No arranques a trabajar sobre un pedido difuso. Preguntá, en un solo turno, lo mínimo que falte de estas tres (si ya está claro, no lo preguntes):

1. **Problema.** ¿Qué tiene que estar resuelto al final? Concreto, no el tema: no "el pipeline" sino "qué oportunidades tienen el close date vencido".
2. **Resultado esperado.** ¿Qué artefacto sale y dónde queda? Una tabla, un mail draft, un análisis de media carilla, un archivo con ruta.
3. **Criterio de terminado.** ¿Cómo sabemos que está? Una condición chequeable, no una sensación.

Si el pedido ya viene cerrado, no hay grill: se ejecuta. El grill es para destrabar, no un peaje.

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

Si no se puede escribir así, el problema todavía no está definido: volvé al grill.

## 4. Varias tareas: elegí una, el resto a la lista

Si llegan tres cosas juntas, **no se hacen las tres acá**. Decí cuál conviene primero (la que destraba a las otras o la que tiene fecha) y anotá las demás en una lista corta de "para otra sesión" que va al handoff. La lista es de títulos, no de análisis: escribir el análisis de las otras ya es hacerlas.

Lo mismo a mitad de sesión: si aparece un tema nuevo, offload o charla, **nombralo y mandalo a la lista** ("eso es otra sesión, lo anoto") y volvé a la tarea. No lo sigas por cortesía: seguirlo es lo que convierte la sesión en maratón.

## 5. El cierre

Apenas el resultado está en el archivo:

1. Escribí el handoff según `HANDOFF.md` (DECIDIÓ / PRODUJO / PRÓXIMA ACCIÓN), con la lista de "para otra sesión" adentro.
2. Cerrá con esta frase, literal: **"Tarea cerrada. Corré `/clear` y abrí una sesión nueva para lo siguiente."**
3. No ofrezcas "¿seguimos con otra cosa?", no propongas mejoras opcionales, no abras un frente nuevo. Ofrecer continuidad es lo que hace la maratón.

Presupuesto: 15-25 turnos. Al primer aviso del contador, cerrá en el próximo hito; al segundo, cerrá igual aunque quede a medias, con el handoff diciendo exactamente dónde retomar. Una tarea a medias con estado escrito se retoma barata; una sesión de 80 turnos no se retoma, se paga.
