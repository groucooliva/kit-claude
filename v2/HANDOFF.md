# Handoff — continuidad entre sesiones

La conversación es efímera; la constancia es el archivo. Este es el protocolo. Cuando digo **"handoff"**, **"cerremos"** o **"lo dejamos acá"**, ejecutalo sin preguntar.

## Dos piezas, nada más

1. **`ESTADO_ACTUAL.md`** (en la raíz del workspace): el ÚNICO puntero de continuidad. Una pantalla máximo. Dice en qué ando, qué frentes están abiertos y cuál es la próxima acción de cada uno, con puntero al archivo del frente. Es un índice, no un acta.
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
**PRODUJO:** qué existe ahora que antes no (archivos, drafts, tablas — con ruta).
**PRÓXIMA ACCIÓN:** la primera cosa concreta de la próxima sesión, y qué necesita de mí.
```
Y en `ESTADO_ACTUAL.md`: actualizá foco activo, frentes y próxima acción. Corto. Lo que no cambió no se reescribe.

## Reglas
- Nunca dos punteros de continuidad: si aparece un segundo archivo de "estado", se fusiona en ESTADO_ACTUAL.
- Los intermedios (informes de agentes, borradores por etapa) van a una subcarpeta del frente y caducan cuando se cierra la decisión que los motivó.
- Si te corrijo algo sobre cómo trabajar, guardalo como memoria/regla, no solo en el handoff: el handoff es estado, la memoria es método.
