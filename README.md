# Kit Claude: persona + método + skills

Mi método de trabajo, portátil, para instalar en cualquier Claude corporativo (Claude Code o la interfaz web de Enterprise). **No trae material: ningún dato, ningún contenido, ninguna conclusión.** Trae quién soy, cómo quiero que se trabaje conmigo y nueve procedimientos reutilizables.

La versión vigente es la **v2**:

| Archivo | Para qué |
|---|---|
| `v2/CLAUDE.md` | El router: rol, reglas duras, economía de tokens, y las heurísticas por momento del trabajo. |
| `v2/QUIEN_SOY.md` | La persona: cómo pienso, cómo quiero que me hablen, cómo escribo, qué decido yo siempre. |
| `v2/PRINCIPIOS_DE_TRABAJO.md` | 40 principios con su por qué. Es la pieza más portátil: entra entera en las instrucciones de un proyecto. |
| `v2/COMO_TRABAJAMOS.md` | 35 reglas de trato y método que `PRINCIPIOS` no cubre, agrupadas por momento. |
| `skills/` | Nueve skills, una carpeta con su `SKILL.md` cada una. Se disparan solas por sus disparadores. |

`v1` (los `00_LEEME.md` y `CLAUDE.md` de la raíz) es la versión anterior, sin capa persona; se conserva como referencia. `kit_completo.html` es un compuesto de la v1 para copiar y pegar desde el navegador: está desactualizado respecto de la v2 y es candidato a salir del repo.

## Cómo usarlo, en tres pasos

1. **Clonar** el repo en la máquina de trabajo: `git clone <url>` (o traer un archivo suelto por su URL raw, sin login).
2. **Apuntar el proyecto al kit.** En Claude Code: copiar `v2/CLAUDE.md` a `CLAUDE.md` en la raíz del directorio de trabajo (o a `~/.claude/CLAUDE.md` para que valga en todos), con `QUIEN_SOY.md`, `PRINCIPIOS_DE_TRABAJO.md` y `COMO_TRABAJAMOS.md` al lado. En la interfaz web: pegar `PRINCIPIOS_DE_TRABAJO.md` en las instrucciones del proyecto y subir el resto al knowledge.
3. **Instalar las skills** en `.claude/skills/<nombre>/SKILL.md` (o `~/.claude/skills/` para que valgan en cualquier carpeta). Abrir una sesión y verificar que el `CLAUDE.md` se cargó y que las skills aparecen listadas.

El primer día alcanza con `CLAUDE.md` + `QUIEN_SOY.md` + la skill `reglas-de-trabajo`. Las demás entran cuando aparece la situación que cada una resuelve.

## Origen y dirección

Escrito en mi máquina personal, en mi tiempo, antes de usar cualquier equipo o cuenta de una empresa. Es método propio: no contiene información, datos ni procesos de ninguna empresa ni de ningún cliente. La dirección es de una sola vía: nada de lo que produzca en un entorno corporativo vuelve acá. Si el kit se adapta alguna vez con contenido interno de una empresa, esa versión se queda allá y esta copia genérica se mantiene aparte, limpia.
