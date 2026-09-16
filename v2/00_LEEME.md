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
| `plantillas/CLAUDE_raiz_de_trabajo.md` | El router de la carpeta raíz del entorno de trabajo: se abre el asistente siempre desde ahí, mapa de carpetas, dónde va cada tipo de cosa, higiene de archivos. Se completa el primer día. |
| `plantillas/CLAUDE_brain.md` | Gobernanza del segundo cerebro: notas `.md` planas (nunca una carpeta por tema), wikilinks, índice al día, log append-only, ingest diferencial, provenance separado. |
| `../skills/` | Las once skills, una carpeta con su `SKILL.md`. Viven en la raíz del kit, no duplicadas acá. |
| `../SYNC.md` | Cómo se mantiene el kit al día entre la máquina personal y la de trabajo. |

## Qué cambió respecto de la v1

1. **Existe `QUIEN_SOY.md`.** Es lo nuevo: la v1 no tenía nada de esto.
2. **`CLAUDE.md` está reorganizado por momento del trabajo**, no por tema suelto: hablar, afinar el pedido, delegar, verificar, entregar. Antes las heurísticas estaban mezcladas.
3. **Se sumaron reglas que en la v1 no estaban**: no devolverme como mío lo que pensó el modelo, leer el momento (envión vs. abrumado), pedidos en tanda que corren en paralelo, persistir en cada hito, cerrar lo que se abrió, piezas editables en presentaciones, cambios de reglas de a uno, buscar antes de decir "no se puede".
4. **`PRINCIPIOS_DE_TRABAJO.md` es nuevo** y es la pieza más portátil: entra entera en las instrucciones de un proyecto.
5. **Las skills viven en `../skills/`.** Si cambian, cambian ahí y esta carpeta no se entera.
6. **Hay plantillas de estructura** (`plantillas/`): el router de la raíz de trabajo y la gobernanza del segundo cerebro. Son la parte del método que no es una regla de trato sino una forma de acomodar los archivos, y sin ellas el kit dejaba armar el entorno a mano cada vez.

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

**2. Upload al knowledge de un Project.** En la interfaz web corporativa: crear un Project, pegar `CLAUDE.md` (o `PRINCIPIOS_DE_TRABAJO.md`, que es más compacto) en las instrucciones del proyecto, y subir `QUIEN_SOY.md` más los nueve `SKILL.md` de `../skills/` al knowledge, con nombres distinguibles (`skill_matriz-decision.md`, etc.). Agregar al final de las instrucciones: *"En el knowledge de este project hay procedimientos (`skill_*.md`). Antes de ejecutar una tarea, fijate si alguno aplica por sus disparadores y seguilo."*

**3. Mail de respaldo.** Mandarme los archivos a mi propia casilla personal, como copia de seguridad y como vía de último recurso si las otras dos no están disponibles el día que las necesito. No es la vía primaria: el mail no versiona.

En Claude Code corporativo, el destino de los archivos es `CLAUDE.md` en la raíz del directorio de trabajo (o `~/.claude/CLAUDE.md` si quiero que valga para todo) y `.claude/skills/<nombre>/SKILL.md` por cada skill.

## Cómo usarlo el primer día

Primero la estructura: una carpeta raíz de trabajo con su `CLAUDE.md` (de `plantillas/CLAUDE_raiz_de_trabajo.md`, completado), el segundo cerebro como subcarpeta con su `CLAUDE.md` propio, y el asistente abierto siempre desde la raíz. Después el contenido: no pegues todo de una, arrancá con `CLAUDE.md` más `QUIEN_SOY.md`, que son los que cambian el comportamiento de base. `reglas-de-trabajo` es la primera skill que suma. Las demás entran cuando aparece la situación que cada una resuelve: la primera call larga trae `meeting-intelligence`, el primer research de cuenta trae `storm`, el primer informe que va para arriba trae `revision-multipersona` y `detecta-tics-ia`.

Después de las primeras semanas, ajustá `CLAUDE.md` con el vocabulario real del equipo, los nombres de los reportes que uso y las herramientas que efectivamente tengo. Eso es lo que lo hace útil de verdad. Este kit es el esqueleto, no la versión final.

## Conceptos portantes

1. **Se destiló el principio, no la anécdota.** Cada regla acá viene de una corrección concreta con nombre, fecha y caso, pero todo eso quedó afuera: entró la regla y su por qué en una línea. Es lo que permite que el kit sea publicable sin perder filo, y la razón de que cada principio traiga un "por qué": sin él la regla parece capricho y el modelo la abandona en cuanto aparece un caso raro.
2. **La capa persona va separada de la capa método, y por eso el kit sobrevive a un cambio de puesto.** `QUIEN_SOY.md` no cambia si mañana cambio de rol; `CLAUDE.md` sí. Mezclarlos en un solo archivo obligaría a reescribir todo cada vez.
3. **El criterio de corte se aplicó por defecto restrictivo.** Ante cada dato dudoso, afuera, aunque restara color. Un kit que se puede publicar sin revisar vale más que uno más rico que hay que auditar antes de cada uso.
