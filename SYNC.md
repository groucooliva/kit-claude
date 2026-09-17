# Cómo se mantiene el kit al día

El kit vive en dos máquinas: la personal, donde se escribe, y la de trabajo, donde se usa. Este archivo dice cómo viaja de una a la otra hoy (a mano) y cómo podría automatizarse después (esbozo, sin implementar).

La dirección es de una sola vía: **de personal a trabajo.** Nada producido en el entorno corporativo vuelve a este repo.

## 1. A mano (lo que vale hoy)

### En la máquina personal

```
git add -A && git commit -m "<qué cambió>"
git push
```

Antes del push, el checklist de `v2/00_LEEME.md` sobre todo lo nuevo o modificado. El repo es público: lo que entra no se puede despublicar.

### En la máquina de trabajo

La primera vez:

```
git clone https://github.com/groucooliva/kit-claude.git
```

Es un repo público: se clona sin login y sin token. Una cuenta corporativa de GitHub (EMU) puede clonar un repo público de cualquier cuenta sin problema; el único límite de una EMU es interactuar con repos privados ajenos, que acá no aplica. Si por política de red el clone estuviera bloqueado, la alternativa es bajar cada archivo por su URL raw.

Después, cada vez:

```
git pull
```

Y solo pull: este clon no se commitea ni se pushea desde el trabajo.

### Qué copiar a dónde

| Del kit | A la máquina de trabajo |
|---|---|
| `v2/CLAUDE.md` | `CLAUDE.md` de la raíz de trabajo, tal cual. **Es el único router.** |
| `v2/QUIEN_SOY.md`, `v2/COMO_TRABAJAMOS.md`, `v2/PRINCIPIOS_DE_TRABAJO.md`, `v2/HANDOFF.md` | al lado, en la raíz de trabajo. `QUIEN_SOY.md` tiene que quedar al lado del `CLAUDE.md` para que el import `@QUIEN_SOY.md` resuelva |
| `v2/plantillas/MAPA_DE_CARPETAS.md` | se pega **al final** de ese mismo `CLAUDE.md`, completando los `<>` con los frentes, el vocabulario y las herramientas reales. No es un segundo `CLAUDE.md` |
| `v2/plantillas/CLAUDE_brain.md` | `brain/CLAUDE.md`, sin cambios |
| `skills/*` | `~/.claude/skills/<nombre>/SKILL.md` (una carpeta por skill) |
| `hooks/*.sh` | `~/.claude/hooks/`, sin `chmod` (se invocan como `bash <ruta>`) |
| `v2/plantillas/settings_dell.json` | `~/.claude/settings.json` (si ya existe, se fusionan las claves a mano) |

Una sola vía: el `CLAUDE.md` de la raíz es `v2/CLAUDE.md` (rol, reglas duras, sesión acotada, heurísticas) con la sección *Mapa de carpetas* pegada abajo. Antes había dos formas descritas y no se elegía; quedó esta.

Fin de línea: el repo trae `.gitattributes` (`*.sh`, `*.json` y `*.md` en LF) porque Git for Windows instala con `core.autocrlf=true` y con CRLF los hooks fallan en la primera línea. Un clon hecho antes de ese archivo se arregla con `git pull` y `git rm --cached -r . && git reset --hard` (o reclonando).

Después de copiar: abrir una sesión desde la raíz y verificar que el `CLAUDE.md` se cargó y que las skills aparecen listadas.

### Cuándo se actualiza

Cuando en la máquina personal se afina una regla de método que vale en cualquier entorno. No cada vez que cambia algo del sistema personal: la mayoría de eso es material y no entra.

## 2. Automatización (esbozo para decidir después, no implementado)

### Lado personal: regeneración del kit

Una rutina programada (`launchd`, cron o una routine de Claude Code) que cada tanto lea las memorias de método nuevas desde la última corrida, las destile con el filtro persona-sí-material-no, las agregue a `COMO_TRABAJAMOS.md` o `PRINCIPIOS_DE_TRABAJO.md`, y commitee.

Riesgo: **una regeneración automática sin ojo humano puede filtrar material a un repo público, y lo publicado no se despublica.** Mitigación, en orden de preferencia: (a) la rutina commitea pero **no pushea**, y el push queda para después de revisar el diff; (b) sumar un check automático que corra el grep del checklist sobre el diff y aborte si encuentra algo; (c) que la rutina no escriba en los archivos del kit sino que deje un archivo de candidatos para aprobar de a uno. La opción (a) más (b) es la más barata y la que más se parece a cómo se hace hoy a mano.

### Lado trabajo: bajada y sincronización

Un hook `SessionStart` o un script corto que haga `git pull` del clon del kit y sincronice las skills a `~/.claude/skills/`, avisando en una línea qué cambió.

Riesgo: **un pull automático cambia las reglas de trabajo en medio de una sesión sin que nadie lo decida**, y un sync que sobreescribe puede pisar un ajuste hecho a mano en el entorno corporativo. Mitigación: que el hook solo avise que hay cambios (`git fetch` y un conteo de commits nuevos) y que el pull y la copia de skills los dispare una decisión, no el arranque de la sesión.

### Lo que no se automatiza

El checklist de material. Es el único paso donde el criterio no es delegable: un grep detecta las palabras que se le enseñaron, no el dato que no se le ocurrió buscar.
