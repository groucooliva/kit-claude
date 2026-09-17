# Kit Claude: persona + método + skills

Mi método de trabajo, portátil, para instalar en cualquier Claude corporativo (Claude Code o la interfaz web de Enterprise). **No trae material: ningún dato, ningún contenido, ninguna conclusión.** Trae quién soy, cómo quiero que se trabaje conmigo, cómo armo el entorno de trabajo y doce procedimientos reutilizables.

La versión vigente es la **v2**:

| Archivo | Para qué |
|---|---|
| `v2/CLAUDE.md` | El router: rol, reglas duras, economía de tokens, y las heurísticas por momento del trabajo. |
| `v2/QUIEN_SOY.md` | La persona: cómo pienso, cómo quiero que me hablen, cómo escribo, qué decido yo siempre. |
| `v2/PRINCIPIOS_DE_TRABAJO.md` | 40 principios con su por qué. Es la pieza más portátil: entra entera en las instrucciones de un proyecto. |
| `v2/COMO_TRABAJAMOS.md` | 38 reglas de trato y método que `PRINCIPIOS` no cubre, agrupadas por momento. |
| `v2/plantillas/` | Tres plantillas: `CLAUDE_raiz_de_trabajo.md` (el router de la carpeta raíz, con el mapa de carpetas y la higiene de archivos), `CLAUDE_brain.md` (gobernanza del segundo cerebro: notas planas, wikilinks, índice, ingest diferencial) y `settings_dell.json` (los settings de usuario de la máquina de trabajo: modelo, vida del caché y el hook del contador de turnos). |
| `hooks/` | `contador_turnos.sh`: cuenta los prompts de la sesión y avisa en el turno 15, 25 y 35 para que la sesión se cierre en vez de volverse maratón. |
| `skills/` | Doce skills, una carpeta con su `SKILL.md` cada una. Se disparan solas por sus disparadores. |
| `SYNC.md` | Cómo viaja el kit de la máquina personal a la de trabajo: push, clone, pull, qué copiar a dónde, y el esbozo de automatización con sus riesgos. |

`v1` (los `00_LEEME.md` y `CLAUDE.md` de la raíz) es la versión anterior, sin capa persona; se conserva como referencia.

## Cómo usarlo, en tres pasos

1. **Clonar** el repo en la máquina de trabajo: `git clone https://github.com/groucooliva/kit-claude.git` (es público: no pide login). El detalle de ida y vuelta está en `SYNC.md`.
2. **Apuntar el proyecto al kit.** En Claude Code: copiar `v2/CLAUDE.md` a `CLAUDE.md` en la raíz del directorio de trabajo (o a `~/.claude/CLAUDE.md` para que valga en todos), con `QUIEN_SOY.md`, `PRINCIPIOS_DE_TRABAJO.md` y `COMO_TRABAJAMOS.md` al lado. En la interfaz web: pegar `PRINCIPIOS_DE_TRABAJO.md` en las instrucciones del proyecto y subir el resto al knowledge.
3. **Instalar las skills** en `.claude/skills/<nombre>/SKILL.md` (o `~/.claude/skills/` para que valgan en cualquier carpeta). Abrir una sesión y verificar que el `CLAUDE.md` se cargó y que las skills aparecen listadas.
4. **Armar la estructura de carpetas** con `v2/plantillas/`: el router de la raíz adaptado, y `CLAUDE_brain.md` dentro de la carpeta del segundo cerebro. Claude Code se abre siempre desde la raíz, nunca desde una subcarpeta.

El primer día alcanza con `CLAUDE.md` + `QUIEN_SOY.md` + la skill `reglas-de-trabajo`. Las demás entran cuando aparece la situación que cada una resuelve.

## Origen y dirección

Escrito en mi máquina personal, en mi tiempo, antes de usar cualquier equipo o cuenta de una empresa. Es método propio: no contiene información, datos ni procesos de ninguna empresa ni de ningún cliente. La dirección es de una sola vía: nada de lo que produzca en un entorno corporativo vuelve acá. Si el kit se adapta alguna vez con contenido interno de una empresa, esa versión se queda allá y esta copia genérica se mantiene aparte, limpia.
