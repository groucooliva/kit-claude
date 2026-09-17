> **Sección para pegar al final del `CLAUDE.md` de la raíz de trabajo** (el router es `v2/CLAUDE.md`, copiado tal cual; esto se le agrega abajo). No es un `CLAUDE.md` alternativo. Todo lo que está entre `<>` se reemplaza; lo demás vale tal cual. Borrá esta nota al pegar.

## Mapa de carpetas

**Regla cero: el asistente se abre desde acá.** Claude Code se abre **siempre desde esta carpeta raíz**, nunca desde una subcarpeta. Abrirlo desde adentro de un proyecto o del segundo cerebro deja al asistente con media foto: no ve el resto del entorno, arranca sin este router y crea archivos donde no van. Si hace falta trabajar sobre una subcarpeta, se le pasa la ruta; no se cambia el punto de entrada.

- `brain/` — el segundo cerebro: contexto de trabajo destilado (clientes, frentes, decisiones, quién es quién, cómo se hacen las cosas). Es un repo aparte con su propio `CLAUDE.md` de formato, que manda ahí adentro.
- `proyectos/<cliente-o-frente>/` — una carpeta por frente vivo. Cada una con su `para_asistente.md` (log del frente: qué se decidió, qué se produjo, próxima acción) y sus archivos de trabajo.
- `_inbox/` — bandeja de entrada: lo que cae para procesar (exports, capturas, documentos que me mandan). Se procesa, se persiste lo que importa en el frente o en `brain/`, y se limpia. Si algo lleva semanas acá, no era material: era ruido.
- `_archivo/` — lo que ya cumplió su función y no quiero borrar. No se lee salvo que lo pida.
- `ESTADO_ACTUAL.md` — el único puntero de continuidad (lo inyecta el hook al arrancar; el protocolo está en `HANDOFF.md`). Una pantalla máximo, con su sección `## Cola`.
- `QUIEN_SOY.md`, `HANDOFF.md`, `PRINCIPIOS_DE_TRABAJO.md`, `COMO_TRABAJAMOS.md` — al lado de este archivo. Cuándo se lee cada uno lo dice la sección *Quién soy* de arriba: no se releen por las dudas.

### Dónde va cada cosa

- **Nota o insumo durable** (análisis, procedimiento, apunte que voy a volver a abrir): markdown, en la carpeta del frente.
- **Contexto que vale más allá del frente** (cómo funciona un proceso, qué decidió tal área y por qué, quién hace qué): una nota en `brain/`, no un archivo suelto en el proyecto.
- **Efímero** (un machete, una lista para mirar una vez, un cálculo intermedio): no genera archivo. Va en pantalla o en un documento descartable.
- **Documentos grandes que no son míos** (reportes, decks, planillas pesadas, PDFs): **no se copian a `brain/`.** En `brain/` va una nota que dice qué es, qué tiene adentro que importa y dónde está el original. El cerebro es destilado, no depósito.
- **Lo que va a otra persona:** se produce en la carpeta del frente y se exporta al formato que use el equipo. El texto final lo redacto yo.
- **Intermedios** (apéndices, salidas por etapa, notas de agente): a `<frente>/_proceso/`. Cuando se cierra la decisión que los motivó, se archivan en `_archivo/`. La raíz es solo para lo vivo; al cerrar un frente, preguntate qué archivos de proceso ya vencieron.

### Vocabulario, reportes y herramientas del equipo

<completar después de las primeras semanas: nombres de los reportes que uso, vocabulario del equipo, herramientas que efectivamente tengo. Esto es lo que hace útil al router.>

### Para completar el primer día

- [ ] Reemplazar `<cliente-o-frente>` por los frentes reales y crear una carpeta por cada uno, con su `para_asistente.md` vacío.
- [ ] Crear `ESTADO_ACTUAL.md` con los frentes abiertos de hoy y una `## Cola` (aunque esté vacía).
- [ ] Clonar o crear `brain/` y copiarle `CLAUDE_brain.md` como su `CLAUDE.md`.
- [ ] Borrar esta lista y la nota de arriba cuando esté hecho.
