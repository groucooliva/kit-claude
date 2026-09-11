# Kit de arranque — mi método de trabajo en el Claude corporativo

## Qué es esto

Un kit portátil con **mi método de trabajo**, listo para instalar el día que me activen el Claude de la empresa (Claude Enterprise o Claude Code corporativo). No trae ningún dato, ningún contenido y ninguna conclusión: trae **cómo quiero que se trabaje conmigo**.

Son dos cosas:

1. **`CLAUDE.md`** — el router: mi rol, las reglas duras (verificar antes de accionar, no heredar conclusiones de intermedios, la prosa final es mía), cómo quiero las respuestas, el ruteo de esfuerzo entre modelos, la higiene de entregables y qué no hacer.
2. **`skills/`** — nueve procedimientos reutilizables, cada uno en su propia carpeta con un `SKILL.md`. Se disparan solos cuando la situación los pide (los disparadores están en el `description` de cada uno).

| Skill | Para qué |
|---|---|
| `reglas-de-trabajo` | Criterio antes de ejecutar cualquier tarea delegada. Se activa siempre. |
| `matriz-decision` | Decidir con hipótesis rivales (DACI + ACH), no con un pros/cons cómodo. |
| `analisis-cualitativo` | Patrones en un corpus, síntesis de fuentes, chequeo de sesgo, informe. |
| `meeting-intelligence` | Reunión o call → decisiones, action items con dueño y fecha, cabos sueltos. |
| `ontology-generator` | Esquema semántico de un dataset: entidades, relaciones tipadas, constraints. |
| `storm` | Research multi-perspectiva con briefing citado y mapa de contradicciones. |
| `abogado-del-diablo` | Tensar un argumento antes de presentarlo: falacias, objeciones, blindajes. |
| `revision-multipersona` | Leer un texto ya escrito con varios ojos hostiles antes de mandarlo. |
| `detecta-tics-ia` | Que lo que sale con mi nombre no suene a máquina. |

## Cómo instalarlo

### En Claude Enterprise (interfaz web)

1. Crear un **Project** (algo como "Sales Ops").
2. Pegar el contenido completo de `CLAUDE.md` en **Project instructions** (o "Custom instructions" / "Set project instructions", según cómo esté nombrado en la versión desplegada).
3. Las skills: subir los archivos `SKILL.md` al **knowledge del project** (con nombres distinguibles: `skill_matriz-decision.md`, etc.), y agregar al final de las Project instructions una línea del tipo: *"En el knowledge de este project hay procedimientos (`skill_*.md`). Antes de ejecutar una tarea, fijate si alguno aplica por sus disparadores y seguilo."*
4. Alternativa más liviana si el project tiene poco espacio: pegar solo `CLAUDE.md` y traer la skill que haga falta pegándola en el chat cuando la necesite.

### En Claude Code corporativo (terminal)

1. En la raíz del directorio de trabajo, crear el archivo `CLAUDE.md` con el contenido de este kit. (Si querés que valga para todo, va en `~/.claude/CLAUDE.md`; si es por proyecto, en la raíz del repo o de la carpeta de trabajo.)
2. Crear la carpeta `.claude/skills/` y, adentro, una subcarpeta por skill con su `SKILL.md`:
   ```
   .claude/skills/reglas-de-trabajo/SKILL.md
   .claude/skills/matriz-decision/SKILL.md
   .claude/skills/analisis-cualitativo/SKILL.md
   .claude/skills/meeting-intelligence/SKILL.md
   .claude/skills/ontology-generator/SKILL.md
   .claude/skills/storm/SKILL.md
   .claude/skills/abogado-del-diablo/SKILL.md
   .claude/skills/revision-multipersona/SKILL.md
   .claude/skills/detecta-tics-ia/SKILL.md
   ```
   (Para que estén disponibles en cualquier carpeta, la ruta es `~/.claude/skills/` en vez de `.claude/skills/`.)
3. Abrir una sesión y verificar que el `CLAUDE.md` se cargó y que las skills aparecen listadas.

### Copiar desde el navegador

`kit_completo.html` tiene todo el kit en bloques de texto, cada uno con su ruta destino. Sirve para instalar desde una máquina donde no pueda copiar archivos: se abre en el navegador y se copia bloque por bloque.

## Cómo usarlo el primer día

No pegues las nueve skills de una y te olvides. Empezá por `CLAUDE.md` + `reglas-de-trabajo`, que son las que cambian el comportamiento de base. Sumá las demás a medida que aparezca la situación que cada una resuelve: la primera call larga trae `meeting-intelligence`, el primer research de cuenta trae `storm`, el primer informe que va para arriba trae `revision-multipersona` y `detecta-tics-ia`.

Después de las primeras semanas, ajustá el `CLAUDE.md`: agregá el vocabulario real del equipo, los nombres de los reportes que uso, las herramientas que efectivamente tengo. Eso es lo que lo va a hacer útil de verdad. Este kit es el esqueleto genérico, no la versión final.

## Nota sobre origen y propiedad intelectual

**Este kit fue escrito en mi máquina personal, en mi tiempo, antes de usar cualquier equipo o cuenta de la empresa.** Es método de trabajo propio, destilado de mi sistema personal: no contiene información, datos, procesos ni material de la empresa ni de ningún cliente, y no fue producido con recursos de la empresa. Lo llevo yo al entorno corporativo, no al revés.

Por la misma razón, la dirección es de una sola vía: **nada de lo que produzca dentro del entorno corporativo vuelve a mi sistema personal.** Datos de clientes, pipeline, revenue, procesos internos y cualquier material de trabajo se quedan donde pertenecen.

Si en algún momento este método se adapta con contenido interno de la empresa, esa versión adaptada ya no es este kit: se queda en el entorno corporativo y esta copia genérica se mantiene aparte, limpia.
