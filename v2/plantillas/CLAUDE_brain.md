# CLAUDE.md — segundo cerebro de trabajo (PLANTILLA)

> Plantilla: copiar como `CLAUDE.md` en la raíz de la carpeta del cerebro. Lo lee cualquier agente que entre acá y manda sobre el formato de las notas.

## Qué es esto

Wiki personal en markdown con el contexto de trabajo destilado: qué es cada frente, quién hace qué, qué se decidió y por qué, cómo se hacen las cosas acá. Crece por interés compuesto: cada nota se vincula con las anteriores. Modelo de referencia: el patrón "LLM wiki" — se navega por índices y enlaces, no por búsqueda vectorial.

No es un depósito de documentos ni un backup. Es la capa destilada; los documentos originales viven donde ya viven.

## Estructura: archivos planos, no carpetas por tema

- `index.md` — mapa de navegación. Cada nota listada con una línea que dice qué es. **Se actualiza en cada ingest**, sin excepción: un índice viejo vuelve el cerebro inservible.
- `log.md` — cronológico, append-only. Una entrada por sesión de curación, con prefijo parseable: `## [YYYY-MM-DD] ingest | <qué entró>`.
- `raw/` — inbox de fuentes crudas (transcripciones, exports, recortes). **Inmutable**: se lee, nunca se edita.
- `wiki/` — las notas. **Estructura PLANA.**

Reglas de forma, no negociables:

1. **Archivos `.md` planos, una nota por concepto, entidad o decisión.** `wiki/forecast-mensual.md`, `wiki/proceso-de-aprobacion.md`, `wiki/<nombre-del-frente>.md`.
2. **NUNCA una carpeta por tema.** Una carpeta por tema rompe el grafo: las notas quedan aisladas en su silo, el índice se vuelve un árbol de directorios y la navegación por enlaces deja de funcionar. Si un tema crece, se parte en más notas planas que se enlazan entre sí, no en una carpeta con capítulos. Subcarpetas dentro de `wiki/` recién cuando el volumen lo pida de verdad, y como mucho un nivel (`entities/`, `concepts/`, `sources/`).
3. **Nombres en kebab-case minúscula**, descriptivos y literales.
4. **Enlazar generosamente con `[[wikilinks]]`.** Toda nota nueva enlaza con al menos una existente. Un `[[enlace]]` a una nota que todavía no existe es válido: marca algo por escribir.
5. **Frontmatter mínimo:** `title`, `created` (YYYY-MM-DD), `tags`.
6. Antes de crear una nota, revisar si ya existe. Duplicados no: se amplía la que está.

## Ingest: diferencial, no resumen

Cada fuente que entra se procesa preguntando **qué hay acá que todavía no está en el cerebro**, no "de qué habla". Un resumen iguala, generaliza y pierde el detalle, que es donde está el valor.

Cada nota de fuente lleva:

1. **Qué es** — dos o tres líneas de contexto, no más.
2. **El diferencial** — qué de esto es nuevo respecto de lo que ya sabemos o hacemos, y el detalle fino aprovechable. Si no hay nada nuevo, se dice seco: "nada nuevo".
3. **Conexiones** — wikilinks a las notas con las que se toca, y en especial dónde **contradice** a otra nota. Las contradicciones se marcan, no se promedian.
4. **Qué cambia** — de una a tres cosas concretas que este input sugiere cambiar en cómo trabajamos (un procedimiento, una regla, una automatización, un reporte). Si no hay ninguna honesta, "sin propuesta". El cerebro vale por el cambio que produce, no por lo acumulado.

Flujo: la fuente cae en `raw/` → se lee → se crean o amplían notas en `wiki/` → se actualiza `index.md` → se appendea la entrada en `log.md`.

## Provenance: separado siempre

En cada nota se distingue explícitamente:

- **Lo mío** — mi criterio, mi hipótesis, mi decisión.
- **La fuente** — qué documento, quién lo dijo, con fecha y ubicación. Un dato de un reporte va con su corte temporal y su filtro.
- **La inferencia del asistente** — lo que no está en ninguna fuente y salió del modelo. Se marca como tal.
- **Lo no verificado** va con ⚠ y así queda hasta que se verifique. Nunca se inventa una cifra, un nombre, una fecha ni una cita para completar el hueco.

## Qué entra y qué no

Entra: contexto de frentes y clientes; decisiones **y su por qué**; quién es quién y qué decide cada uno; cómo se hace cada cosa (procedimientos, mañas, dónde está el dato); definiciones del vocabulario de la casa; síntesis buenas que si no se escriben se pierden con la conversación.

No entra: copias de documentos ni pegados enteros; dumps de exports o de conversaciones sin destilar; material efímero (un machete, una lista de una vez); nada que solo tenga sentido dentro de un frente y no sirva fuera de él (eso va al log del frente).

## Mantenimiento

- Al cerrar una sesión que escribió notas: entrada en `log.md` e `index.md` al día.
- **Lint periódico** (cada tanto o a pedido): notas huérfanas sin enlaces entrantes, contradicciones entre notas, ⚠ viejos sin verificar, conceptos mencionados en tres o más notas sin nota propia, duplicados. Read-only: el informe se entrega y las correcciones con criterio las decido yo.
- **Ninguna síntesis buena muere en el chat.** Si en una conversación aparece una comparación o una conexión que voy a querer reencontrar, se escribe como nota acá.
- Confidencialidad: acá solo va lo que puede vivir en el entorno aprobado por la empresa. Nada de esto se copia afuera.
