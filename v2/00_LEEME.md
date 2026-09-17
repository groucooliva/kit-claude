# Kit v2: el método, ahora con la persona adentro

## Qué es esto

La v1 de este kit traía **solo método**, deliberadamente despersonalizado: reglas de trabajo que servirían para cualquiera. Funcionaba, pero le faltaba la mitad: un asistente que no sabe cómo pienso, cómo hablo y qué decido yo termina produciendo salidas correctas y ajenas.

La **v2 agrega la capa persona**. Sigue sin traer material: ningún dato, ningún contenido, ninguna conclusión, ni míos ni de nadie.

| Archivo | Para qué |
|---|---|
| `QUIEN_SOY.md` | Quién es la persona con la que se trabaja: formación, cómo pienso, cómo quiero que me hablen, cómo escribo, qué tics de IA no tolero, qué decido yo siempre. |
| `CLAUDE.md` | El router: rol, reglas duras, y las heurísticas agrupadas en cómo hablarme / cómo delegar / cómo verificar / cómo entregar. Apunta a `QUIEN_SOY.md`. |
| `HANDOFF.md` | Protocolo de continuidad: qué pasa cuando digo "handoff" o "cerremos" (puntero único + log por frente + DECIDIÓ / PRODUJO / PRÓXIMA ACCIÓN). |
| `PRINCIPIOS_DE_TRABAJO.md` | 40 principios de una o dos líneas con su por qué. Formato pensado para pegar en "Project instructions" o subir al knowledge. |
| `COMO_TRABAJAMOS.md` | 38 reglas de trato y método que `PRINCIPIOS` no cubre, agrupadas por momento: hablarme, afinar el pedido, delegar, verificar, entregar, cerrar, incorporar inputs. |
| `plantillas/MAPA_DE_CARPETAS.md` | La sección *Mapa de carpetas* que se pega al final del `CLAUDE.md` de la raíz: regla cero (abrir siempre desde la raíz), estructura, dónde va cada tipo de cosa. Se completa el primer día. No es un router alternativo: el router es `CLAUDE.md`. |
| `plantillas/CLAUDE_brain.md` | Gobernanza del segundo cerebro: notas `.md` planas (nunca una carpeta por tema), wikilinks, índice al día, log append-only, ingest diferencial, provenance separado. |
| `plantillas/settings_dell.json` | Los settings de usuario de la máquina de trabajo: modelo por defecto, techo de contexto, modelo de subagentes, statusline de costo y los dos hooks (arranque y contador). |
| `../hooks/` | Tres scripts: `contador_turnos.sh` (cuenta los prompts y avisa en el turno 1, 15, 25 y desde el 35), `arranque_estado.sh` (inyecta `ESTADO_ACTUAL.md` al arrancar) y `statusline_costo.sh` (costo, contexto y caché abajo del prompt). Son el mecanismo que hace cumplir la sesión acotada. |
| `../skills/` | Las doce skills, una carpeta con su `SKILL.md`. Viven en la raíz del kit, no duplicadas acá. |
| `../SYNC.md` | Cómo se mantiene el kit al día entre la máquina personal y la de trabajo. |

## Qué cambió respecto de la v1

1. **Existe `QUIEN_SOY.md`.** Es lo nuevo: la v1 no tenía nada de esto.
2. **`CLAUDE.md` está reorganizado por momento del trabajo**, no por tema suelto: hablar, afinar el pedido, delegar, verificar, entregar. Antes las heurísticas estaban mezcladas.
3. **Se sumaron reglas que en la v1 no estaban**: no devolverme como mío lo que pensó el modelo, leer el momento (envión vs. abrumado), pedidos en tanda que corren en paralelo, persistir en cada hito, cerrar lo que se abrió, piezas editables en presentaciones, cambios de reglas de a uno, buscar antes de decir "no se puede".
4. **`PRINCIPIOS_DE_TRABAJO.md` es nuevo** y es la pieza más portátil: entra entera en las instrucciones de un proyecto.
5. **Las skills viven en `../skills/`.** Si cambian, cambian ahí y esta carpeta no se entera.
6. **Hay plantillas de estructura** (`plantillas/`): el mapa de carpetas que se agrega al router y la gobernanza del segundo cerebro. Son la parte del método que no es una regla de trato sino una forma de acomodar los archivos, y sin ellas el kit dejaba armar el entorno a mano cada vez.

7. **La sesión acotada tiene mecanismo, no solo regla.** Antes el kit pedía "una sesión por tarea, corta" y quedaba en buena intención. Ahora hay tres piezas que la sostienen: la sección *Sesión acotada* de `CLAUDE.md` (propuesta en un turno con una sola pregunta, plan de 3 líneas, cierre automático con `/clear`), la skill `sesion-acotada` con el detalle, y los hooks que inyectan el estado al arrancar, cuentan los turnos y muestran el costo abajo del prompt.

## La regla de corte

**Persona y método SÍ. Material NO.**

Entra: cómo pienso, cómo trabajo, cómo escribo, qué decido yo, qué formación tengo, qué me hace bien y qué me traba.

No entra: contenido de la tesis, material académico, finanzas, salud, familia, nombres de instituciones donde trabajé o estudié más allá de la mención de la formación, nombres de terceros privados, alumnos, montos, direcciones, documentos, ni nada que un tercero no debería leer.

El criterio de decisión: **esto podría terminar en un repo público de GitHub y en los sistemas de la empresa. Si dudás de un dato, afuera.**

Y en la otra dirección, la regla que ya traía la v1 y sigue valiendo: este kit se escribió en mi máquina, en mi tiempo, antes de usar cualquier equipo o cuenta de la empresa. Es método propio, no contiene información de la empresa ni de ningún cliente. La dirección es de una sola vía: **nada de lo que produzca en el entorno corporativo vuelve a mi sistema personal**, y nada personal se trabaja desde el equipo de la empresa.

## Antes de subir esto a cualquier lado, verificá que no haya

- [ ] Nombres propios de terceros (colegas, docentes, amigos, familia, alumnos, contactos).
- [ ] Nombres de las instituciones donde trabajé o trabajo por fuera del puesto actual.
- [ ] Nombre de la empresa actual, de clientes, de cuentas o de compañeros.
- [ ] Montos, sueldos, precios, cifras de facturación, categorías impositivas.
- [ ] CUIT, DNI, direcciones, teléfonos, mails, números de cuenta.
- [ ] Rutas de archivo de mi máquina, nombres de carpetas personales, nombres de vaults o repos privados.
- [ ] Contenido de la tesis: títulos de capítulo o sección, tesis defendida, autores del corpus, citas.
- [ ] Detalles de proyectos personales o de trabajos anteriores que permitan identificarlos.
- [ ] Referencias a conectores, cuentas o herramientas personales.
- [ ] Cualquier dato de la empresa: procesos internos, políticas, vocabulario propietario, nombres de sistemas internos.

Si el kit se adapta alguna vez con contenido interno de la empresa, esa versión adaptada ya no es este kit: se queda en el entorno corporativo y esta copia genérica se mantiene aparte, limpia.

## Cómo lo llevo

Tres vías previstas, en orden de preferencia. **La primera es la que está en uso; el mantenimiento y el paso a la máquina de trabajo están en `../SYNC.md`.**

**1. Repo público de GitHub.** La carpeta completa del kit (v1, v2, `plantillas/` y `skills/`) en un repo propio. Desde la máquina de trabajo: `git clone`, o traer un archivo suelto por su URL raw. Ventaja: se actualiza en un lugar y se baja donde haga falta, y no requiere mandarse nada por mail. Condición: el checklist de arriba tiene que estar cerrado, porque público es público.

**2. Upload al knowledge de un Project.** En la interfaz web corporativa: crear un Project, pegar `CLAUDE.md` (o `PRINCIPIOS_DE_TRABAJO.md`, que es más compacto) en las instrucciones del proyecto, y subir `QUIEN_SOY.md` más los doce `SKILL.md` de `../skills/` al knowledge, con nombres distinguibles (`skill_matriz-decision.md`, etc.). Agregar al final de las instrucciones: *"En el knowledge de este project hay procedimientos (`skill_*.md`). Antes de ejecutar una tarea, fijate si alguno aplica por sus disparadores y seguilo."*

**3. Mail de respaldo.** Mandarme los archivos a mi propia casilla personal, como copia de seguridad y como vía de último recurso si las otras dos no están disponibles el día que las necesito. No es la vía primaria: el mail no versiona.

En Claude Code corporativo, el destino de los archivos es `CLAUDE.md` en la raíz del directorio de trabajo (o `~/.claude/CLAUDE.md` si quiero que valga para todo) y `.claude/skills/<nombre>/SKILL.md` por cada skill.

## Instalar el freno de sesión

El problema que resuelve: las sesiones-maratón (abrir una conversación, tirarle todo lo que se cruza y no cerrarla nunca) se pagan caras, porque el costo lo dominan el contexto arrastrado y los cache misses, no el trabajo útil. Son tres scripts en `hooks/` más los settings, y cinco pasos.

**0. Verificación de terreno (una vez, el día 1).** Una cuenta Enterprise puede tener settings fijados por el admin que pisan los tuyos sin avisar. En una sesión: `/status` (si dice "Enterprise managed settings", hay claves que no podés cambiar); `/hooks` (tienen que aparecer `SessionStart` y `UserPromptSubmit`; si no aparecen y hay managed, es `allowManagedHooksOnly`: el freno queda solo como regla del CLAUDE.md, y hay que pedírselo al admin); `/model` (si dice "Org default ... applies on restart", el `model` del settings no vale entre lanzamientos: abrí con `claude --model sonnet`); `/memory` (auto memory tiene que estar ON: ahí se guardan solas tus correcciones, y en esta máquina arranca vacía; abrí siempre desde la raíz para que sea una sola); `claude --version` (los campos de caché del statusline y de `/usage` piden 2.1.251 o posterior; con menos, se degradan sin romper).

**1. Copiar los tres scripts** de `hooks/` a `~/.claude/hooks/`. Sin `chmod`: se invocan como `bash <ruta>`, que no necesita bit de ejecución. Los tres usan solo builtins de bash (sin jq, sed ni find) porque Git for Windows no trae jq y el hook puede correr con un PATH pelado. **Fin de línea:** si al primer prompt aparece un error rojo con `$'\r': command not found`, `numeric argument required` o `syntax error near unexpected token`, los scripts llegaron con CRLF (Git for Windows convierte al clonar con `core.autocrlf=true`). El repo trae `.gitattributes` que lo evita; si el clon es anterior a ese archivo: `git pull` y después `git rm --cached -r . && git reset --hard` (o reclonar), y volver a copiar los scripts.

**2. Copiar `v2/plantillas/settings_dell.json`** a `~/.claude/settings.json`. Si ya existe, fusionar las claves a mano. Las rutas van con `/` o `~`, nunca con barras invertidas: Git Bash se las come como escapes y el comando falla sin error visible. Si Git Bash no está en el PATH: `"env": {"CLAUDE_CODE_GIT_BASH_PATH": "C:/Program Files/Git/bin/bash.exe"}`.

**3. Verificar** abriendo una sesión desde la raíz de trabajo. Tres señales: (a) abajo del prompt aparece `[Sonnet] $0.00 · ctx 0% ...` (la statusline); (b) al primer prompt aparece en pantalla "⏱ Contador de turnos activo"; (c) si hay `ESTADO_ACTUAL.md` en la raíz, la primera respuesta dice desde dónde retoma sin que se lo pidas. Si falta alguna: `/hooks`, y `claude doctor` lista lo que descartó.

**4. Una vez por semana: `/usage`** (tecla `w` para 7 días). Muestra la atribución del gasto (skills, subagentes, MCP) y los "behavior flags" (contexto largo, cache misses) cuando uno pasa del 10%. La línea `Prompt cache (main)` dice cuántos misses hubo y por qué: si la causa es `ttl_expired_5m`, agregá `"promptCacheTtl": "1h"` al settings; si no hay misses, no. `/insights` arma un informe HTML de hábitos (gasta tokens: una vez al mes).

### Qué hace cada clave de `settings_dell.json`

- `"model": "sonnet"`: el modelo con el que arranca la sesión. **Se elige al abrir, no a mitad:** cambiarlo con `/model` con la sesión andando reprocesa toda la conversación sin caché (cada modelo tiene su caché). Sesión de criterio (encuadrar un análisis para liderazgo, decidir, tensar un argumento): `claude --model opus`. Sesión de ejecución (minutas, reformateo, cruces, borradores): sonnet. Si una parte de la sesión necesita el caro, va a un subagente, no a `/model`. Lo mismo el esfuerzo: default `high`; `claude --effort low` para sesiones mecánicas, fijado al abrir (`MAX_THINKING_TOKENS` no aplica a Sonnet 5).
- `"crossSessionInbound": "hold"`: los mensajes de otras sesiones se muestran como aviso y no se entregan solos. Evita que una sesión ajena empuje contexto (y tokens) adentro de la que trabaja.
- `"autoContinueAtUsageLimit": false`: si un límite de uso frena la sesión, no se reanuda sola después del reset (el default es que sí, hasta dos veces). Para alguien cuyo problema es no cerrar, la reanudación automática es la maratón con piloto automático. Que te frene un límite es señal de handoff.
- `"CLAUDE_CODE_DISABLE_1M_CONTEXT": "1"`: el alias `sonnet` resuelve a Sonnet 5, que corre con ventana de 1M y no compacta hasta ~967K tokens. Sin esto, una maratón arrastra cientos de miles de tokens que se releen en cada turno y se reescriben enteros en cada miss. Techo duro de 200K: la sesión compacta ahí aunque nadie cierre, y el `ctx %` de la statusline vuelve a ser legible (contra 1M, "8%" son 80K tokens).
- `"CLAUDE_CODE_SUBAGENT_MODEL": "sonnet"`: los subagentes heredan el modelo de la sesión. Sin esto, el día que abrís en opus todo lo delegado corre en opus. El caro discierne, el barato ejecuta.
- `"statusLine"`: `statusline_costo.sh` muestra abajo del prompt modelo, costo de la sesión en USD, % de contexto, estado del caché (warm/fría, TTL, hit) y el turno. Cero tokens. En Enterprise no hay barras de plan; el costo es a precio de lista salvo que el admin haya fijado `modelPricing`. Se resetea con `/clear`. El modelo no la ve: por eso el script deja su última línea en un archivo temporal (`cc_costo_<session_id>`), que el contador le nombra al modelo en el turno 1 y le copia en cada aviso ⏱; de ahí sale el campo COSTO del handoff, sin cifras inventadas.
- `hooks.SessionStart`: `arranque_estado.sh` inyecta `ESTADO_ACTUAL.md` en el contexto al arrancar, después de `/clear` y después de compactar; avisa si pasa de 4000 caracteres. Al retomar una sesión vieja (`/resume`) no inyecta nada: muestra cuánto cuesta reprocesarla. Es lo que en la máquina personal hace que el asistente arranque sabiendo dónde quedó; antes el kit se lo pedía por instrucción, que el modelo puede saltear.
- `hooks.UserPromptSubmit`: `contador_turnos.sh`, el contador de turnos. Avisa en pantalla (`systemMessage`) y al modelo (`additionalContext`) en el turno 1, 15, 25 y desde el 35 cada 5. En el turno 1 le dice al modelo dónde quedó la línea de la statusline; en cada aviso ⏱ se la copia (costo y % de contexto), que es lo que le permite cumplir "ctx > 50% = cerrar" sin verla.

**Lo que NO está, y por qué.** `promptCacheTtl`/`subagentPromptCacheTtl` en `1h`: la escritura de caché a una hora cuesta 2x el input base (a cinco minutos, 1.25x), en cada turno; paga solo si dejás la sesión idle más de cinco minutos y volvés a la MISMA tarea. Con sesión acotada eso casi no pasa, y un subagente nunca queda idle. Default 5m, y la regla de `/usage` del paso 4 decide si subir. `effortLevel` global: bajaría la calidad justo donde molesta; se baja por sesión con `--effort`. Un tope en dólares por sesión: no existe en modo interactivo (`--max-budget-usd` es solo para `claude -p`); el tope es el spend limit que fija el admin y se ve en `/usage`; si querés uno propio, pedile al admin un límite individual.

### Sobre los hooks, lo verificado en la documentación oficial

- `UserPromptSubmit` no acepta `matcher`; corre en cada prompt. El stdout plano de este hook **no aparece en pantalla**: solo lo ve el modelo. Por eso el contador devuelve JSON con `systemMessage` (pantalla) y `additionalContext` (modelo). Exit 2 bloquea y borra el prompt: los scripts salen siempre con 0.
- `SessionStart` dispara en `startup`, `resume`, `clear`, `compact` y `fork`; su stdout entra al contexto antes del primer turno, y la primera respuesta espera a que termine. No acepta bloqueo.
- En Enterprise no existe el diálogo "resume from summary" de Pro/Max: retomar una sesión vieja reprocesa el historial completo. Se retoma por el archivo (`ESTADO_ACTUAL.md`), no por `/resume`.
- Windows: los hooks y la statusline corren en Git Bash si está instalado (si no, PowerShell). El shell primario del modelo será PowerShell; no afecta a los hooks. `~` y `/` en el JSON funcionan; las barras invertidas no.
- Timeout de los hooks: 30 segundos; los tres scripts corren en milisegundos.
- Los hooks no frenan nada por la fuerza: un `Stop` hook que bloquee el cierre hace que Claude SIGA (cada bloqueo es un turno pago), y `exit 2` en el contador borra lo que tecleaste. El freno es visibilidad (pantalla + statusline) más el protocolo del CLAUDE.md; si en dos semanas `/usage` muestra que los avisos se ignoran, el freno duro es el paso siguiente, no el primero.

## Cómo usarlo el primer día

Primero la estructura: una carpeta raíz de trabajo con su `CLAUDE.md` (es `CLAUDE.md` de esta carpeta, copiado tal cual, más la sección de `plantillas/MAPA_DE_CARPETAS.md` pegada al final y completada; no hay otro router), el segundo cerebro como subcarpeta con su `CLAUDE.md` propio, y el asistente abierto siempre desde la raíz. Después el contenido: no pegues todo de una, arrancá con `CLAUDE.md` más `QUIEN_SOY.md`, que son los que cambian el comportamiento de base. `reglas-de-trabajo` es la primera skill que suma. Las demás entran cuando aparece la situación que cada una resuelve: la primera call larga trae `meeting-intelligence`, el primer research de cuenta trae `storm`, el primer informe que va para arriba trae `revision-multipersona` y `detecta-tics-ia`.

Después de las primeras semanas, ajustá `CLAUDE.md` con el vocabulario real del equipo, los nombres de los reportes que uso y las herramientas que efectivamente tengo. Eso es lo que lo hace útil de verdad. Este kit es el esqueleto, no la versión final.

## Conceptos portantes

1. **Se destiló el principio, no la anécdota.** Cada regla acá viene de una corrección concreta con nombre, fecha y caso, pero todo eso quedó afuera: entró la regla y su por qué en una línea. Es lo que permite que el kit sea publicable sin perder filo, y la razón de que cada principio traiga un "por qué": sin él la regla parece capricho y el modelo la abandona en cuanto aparece un caso raro.
2. **La capa persona va separada de la capa método, y por eso el kit sobrevive a un cambio de puesto.** `QUIEN_SOY.md` no cambia si mañana cambio de rol; `CLAUDE.md` sí. Mezclarlos en un solo archivo obligaría a reescribir todo cada vez.
3. **El criterio de corte se aplicó por defecto restrictivo.** Ante cada dato dudoso, afuera, aunque restara color. Un kit que se puede publicar sin revisar vale más que uno más rico que hay que auditar antes de cada uso.
