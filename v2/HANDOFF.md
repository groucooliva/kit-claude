# Handoff — continuidad entre sesiones

La conversación es efímera; la constancia es el archivo. Este es el protocolo. Se ejecuta cuando digo **"handoff"**, **"cerremos"** o **"lo dejamos acá"**, y también solo, cuando el artefacto de la sesión existe (cierre automático de Sesión acotada). Sin preguntar.

## Dos piezas, nada más

1. **`ESTADO_ACTUAL.md`** (en la raíz del workspace): el ÚNICO puntero de continuidad. Una pantalla máximo. Dice en qué ando, qué frentes están abiertos y cuál es la próxima acción de cada uno, con puntero al archivo del frente. Es un índice, no un acta. Tiene una sección ## Cola: una línea por tarea pendiente (título + frente), sin análisis. Es lo único que se lee al arrancar, así que la cola vive acá y no en el log de un frente.
2. **`para_asistente.md`** en la carpeta de cada frente/proyecto: el log sustantivo de ese frente, cronológico, append-only. Ahí va el detalle; en ESTADO_ACTUAL solo el puntero.

## Al arrancar una sesión
Leé `ESTADO_ACTUAL.md` primero. Decime en UNA línea desde dónde retomás y seguí. No me pidas contexto que ya está escrito.

## En cada hito (no solo al cierre)
Apenas cierra una etapa sustantiva, escribí el estado antes de encarar la siguiente, aunque no lo pida. Las sesiones se cortan a la mitad.

## Al cerrar ("handoff")
Al `para_asistente.md` del frente, un bloque con fecha:
```
## Sesión <fecha> — <título corto>
**DECIDIÓ:** qué quedó decidido (de a uno, sí/no).
**NO FUNCIONÓ:** enfoque descartado + por qué (con el error textual si lo hubo). Para que la próxima sesión no lo repita.
**PRODUJO:** qué existe ahora que antes no (archivos, drafts, tablas, con ruta).
**PRÓXIMA ACCIÓN:** la primera cosa concreta de la próxima sesión, y qué necesita de mí.
**COSTO:** la última línea de la statusline, leída con `cat` del archivo `cc_costo_<session_id>` que el contador nombró en el turno 1. Si no existe: ⚠ sin cifra (nunca inventada, nunca preguntada). Lo de `/usage` (% desde caché, causa del último miss) lo pego yo si quiero.
```
Y en `ESTADO_ACTUAL.md`: actualizá foco activo, frentes y próxima acción. Corto. Lo que no cambió no se reescribe.

## Reglas
- Nunca dos punteros de continuidad: si aparece un segundo archivo de "estado", se fusiona en ESTADO_ACTUAL.
- Los intermedios (informes de agentes, borradores por etapa) van a una subcarpeta del frente y caducan cuando se cierra la decisión que los motivó.
- Si te corrijo algo sobre cómo trabajar, guardalo como memoria/regla, no solo en el handoff: el handoff es estado, la memoria es método.
- `ESTADO_ACTUAL.md` y `para_asistente.md` son la excepción a "no crear archivos": si no existen, se crean con el primer handoff, con la estructura de este archivo.
- `ESTADO_ACTUAL.md` se edita por línea, no se reescribe: una sesión toca solo la línea de SU frente (y `Foco de hoy` si es el suyo), relee el archivo justo antes de escribir, y el detalle va append-only al `para_asistente.md` del frente. Con varias sesiones abiertas, reemplazar el archivo entero pisa lo de las otras.
- Una sesión vieja se retoma por el archivo, no por `/resume`: en Enterprise no existe el "resume from summary" de Pro/Max, así que retomar una sesión fría reprocesa el historial completo y lo paga entero.
