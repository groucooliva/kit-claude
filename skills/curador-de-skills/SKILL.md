---
name: curador-de-skills
description: >-
  Releva, audita y optimiza el banco de skills entero: mapea todas, detecta huecos, solapamientos
  y skills obesas, afina las descripciones-gatillo para que disparen solas, y ejecuta los cambios
  vía skill-creator (siempre con OK humano). Corre a demanda o como revisión periódica.
  Disparadores: "relevá/auditá/optimizá mis skills", "qué skill me falta o me sobra", "esta skill
  nunca dispara", "armame el mapa del banco de skills". Ante un pedido de crear, editar u
  optimizar skills, esta manda por sobre skill-creator, que queda como herramienta ejecutora.
---

# Curador de skills — el banco entero, no una skill

Meta-skill que cuida el sistema de skills. Hermano de `skill-creator`: skill-creator CREA o edita UNA skill; ésta **mira el banco completo**, decide qué tocar y delega la ejecución. Todo esto es aparato: sistemático y delegable. Qué entra y qué sale lo decide la persona.

## Cuándo corre

- **A demanda:** cuando se pide relevar, auditar u optimizar el banco.
- **Revisión periódica:** una pasada ligera (relevamiento, huecos, recomendaciones) cada tanto, por si se olvida. **La revisión automática no edita nada:** diagnostica y propone.

## El pipeline

1. **Relevamiento.** Inventariar todas las skills instaladas: qué hace cada una, con qué dispara y su **salud contra buenas prácticas** — la descripción funciona como gatillo y no como manual, el `SKILL.md` no pasa de unos cientos de líneas, y el proceso está separado del material de referencia (progressive disclosure). Marcar las que fallan cada criterio.
2. **Huecos y solapamientos.** Dónde FALTA una skill (una tarea que se repite a mano cada semana), dónde DOS se pisan y compiten por el mismo disparador, dónde una está obesa y conviene partirla. Cruzar contra el trabajo real de los últimos meses, no contra un ideal.
3. **Brainstorm de mejora.** Por skill candidata, ángulos de optimización. Acá entra `storm`: buscar perspectivas de mejora que no son la primera lectura.
4. **Contrariamiento.** Cada mejora propuesta pasa por `abogado-del-diablo` o `revision-multipersona`: ¿va a disparar de verdad? ¿se solapa con otra? ¿agrega ruido sin valor? Las propuestas débiles mueren acá.
5. **Selección.** Qué cambios entran y en qué orden, por impacto contra esfuerzo. **Checkpoint humano: acá frena y decide la persona.**
6. **Ejecución con `skill-creator`.** Crear, editar o partir con su proceso real (draft, prompts de prueba, evaluación, iteración). No a ojo. Solo lo aprobado en el paso 5.
7. **Ganchos de disparo.** Afinar las descripciones para que salten solas sin que nadie las recuerde, y actualizar el puntero a las skills en el archivo de instrucciones del entorno.
8. **Mapa del banco.** Una vista simple del banco agrupado por función, para tenerlo a la vista. Una por corrida, fechada.

## Guardrails

- **Human-in-the-loop en lo que toca skills.** Relevamiento, diagnóstico, recomendaciones y mapa corren solos. Crear, editar o borrar una skill espera OK explícito.
- **Criterio de arquitectura, no parche por parche.** Las decisiones se proponen mirando el banco entero; no se improvisa skill por skill.
- **Si una mejora viene de una skill externa mejor hecha, contemplar tener las dos capas:** la original de quienes saben y la adaptada al flujo propio.
- **No inflar el banco.** Una skill nueva solo si cubre un hueco real y va a dispararse. Menos y mejor gana.
- Cada corrida deja UNA síntesis en un archivo, no un hilo de conversación.

## Referencias

Buenas prácticas de autoría de skills: documentación oficial de Anthropic. Proceso de creación y evaluación: `skill-creator`. Multi-perspectiva: `storm`. Crítica: `abogado-del-diablo`, `revision-multipersona`. Higiene y síntesis: `analisis-cualitativo`.
