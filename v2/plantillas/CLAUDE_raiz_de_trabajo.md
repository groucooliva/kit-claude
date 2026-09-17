# CLAUDE.md — raíz del entorno de trabajo (PLANTILLA)

> Plantilla para completar el primer día. Todo lo que está entre `<>` se reemplaza; lo demás vale tal cual. Este archivo es un **router**: dice dónde vive cada cosa y con qué criterio se trabaja, no explica el contenido.

## Regla cero: el asistente se abre desde acá

Claude Code se abre **siempre desde esta carpeta raíz**, nunca desde una subcarpeta. Abrirlo desde adentro de un proyecto o del segundo cerebro deja al asistente con media foto: no ve el resto del entorno, arranca sin este router y crea archivos donde no van. Si hace falta trabajar sobre una subcarpeta, se le pasa la ruta; no se cambia el punto de entrada.

## Mapa de carpetas

- `brain/` — el segundo cerebro: contexto de trabajo destilado (clientes, frentes, decisiones, quién es quién, cómo se hacen las cosas). Es un repo aparte con su propio `CLAUDE.md` de formato, que manda ahí adentro.
- `proyectos/<cliente-o-frente>/` — una carpeta por frente vivo. Cada una con su `para_asistente.md` (log del frente: qué se decidió, qué se produjo, próxima acción) y sus archivos de trabajo.
- `_inbox/` — bandeja de entrada: lo que cae para procesar (exports, capturas, documentos que me mandan). Se procesa, se persiste lo que importa en el frente o en `brain/`, y se limpia. Si algo lleva semanas acá, no era material: era ruido.
- `_archivo/` — lo que ya cumplió su función y no quiero borrar. No se lee salvo que lo pida.
- `ESTADO_ACTUAL.md` — el único puntero de continuidad: en qué ando, frentes abiertos, próxima acción de cada uno. Una pantalla máximo. Tiene una sección ## Cola: una línea por tarea pendiente (título + frente), sin análisis. Es lo único que se lee al arrancar, así que la cola vive acá y no en el log de un frente.

## Al arrancar la sesión

Leé `ESTADO_ACTUAL.md` y decime en UNA línea desde dónde retomamos. Nada más: el contexto de la persona está en `QUIEN_SOY.md`, el método en `COMO_TRABAJAMOS.md` y el protocolo de cierre en `HANDOFF.md`. No me pidas contexto que ya está escrito.

## Dónde va cada cosa

- **Nota o insumo durable** (análisis, procedimiento, apunte que voy a volver a abrir): markdown, en la carpeta del frente.
- **Contexto que vale más allá del frente** (cómo funciona un proceso, qué decidió tal área y por qué, quién hace qué): una nota en `brain/`, no un archivo suelto en el proyecto.
- **Efímero** (un machete, una lista para mirar una vez, un cálculo intermedio): no genera archivo. Va en pantalla o en un documento descartable.
- **Documentos grandes que no son míos** (reportes, decks, planillas pesadas, PDFs): **no se copian a `brain/`.** En `brain/` va una nota que dice qué es, qué tiene adentro que importa y dónde está el original. El cerebro es destilado, no depósito.
- **Lo que va a otra persona:** se produce en la carpeta del frente y se exporta al formato que use el equipo. El texto final lo redacto yo.

## Higiene de archivos

- **Todo trabajo delegado deja UNA síntesis** que yo abro y entiendo. No cinco archivos de proceso sueltos.
- **Los intermedios van a una subcarpeta del frente y caducan.** Apéndices, salidas por etapa, notas de agente: a `<frente>/_proceso/`. Cuando se cierra la decisión que los motivó, se archivan en `_archivo/`.
- **Ante la duda entre crear un archivo o no crearlo, no crearlo.**
- La raíz es solo para lo vivo: si algo de la raíz no está en curso, va a `_archivo/`.
- Al cerrar un frente, preguntate qué archivos de proceso ya vencieron.

## Reglas locales

1. **No ejecutás acciones hacia afuera sin mi OK.** Leer, analizar y draftear: sí. Mandar, publicar, escribir en un sistema, compartir, agendar: jamás sin que yo lo apruebe.
2. **Nada sale del entorno aprobado.** Datos de trabajo no se copian a servicios externos ni se pegan en herramientas de terceros.
3. **Un solo puntero de continuidad.** Si aparece un segundo archivo de "estado", se fusiona en `ESTADO_ACTUAL.md`.
4. **Los cambios a este archivo se proponen de a uno** y los valido yo. Carta blanca hay para ejecutar cosas reversibles, no para rediseñar la estructura.
5. Si algo de acá choca con una política de la empresa, manda la política y avisame del desfasaje.

## Punteros

- `QUIEN_SOY.md` — quién soy, cómo pienso, cómo hablarme, cómo escribo, qué decido yo siempre. Leelo antes de producir nada que salga con mi nombre.
- `COMO_TRABAJAMOS.md` — las reglas de método, agrupadas por momento del trabajo.
- `PRINCIPIOS_DE_TRABAJO.md` — la versión compacta de los principios, para pegar en las instrucciones de un proyecto.
- `HANDOFF.md` — qué hacer cuando digo "handoff" o "cerremos".
- `brain/CLAUDE.md` — cómo se escribe en el segundo cerebro. Manda ahí adentro.

## Para completar el primer día

- [ ] Reemplazar `<cliente-o-frente>` por los frentes reales y crear una carpeta por cada uno, con su `para_asistente.md` vacío.
- [ ] Crear `ESTADO_ACTUAL.md` con los frentes abiertos de hoy.
- [ ] Clonar o crear `brain/` y copiarle `CLAUDE_brain.md` como su `CLAUDE.md`.
- [ ] Agregar acá abajo, en una lista corta, el vocabulario del equipo, los nombres de los reportes que uso y las herramientas que efectivamente tengo. Eso es lo que hace útil a este archivo.
