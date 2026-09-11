---
name: storm
description: >-
  Research multi-perspectiva estilo STORM: corre un tema por varias perspectivas de experto
  descubiertas del propio tema, interroga con retrieval real de fuentes, mapea dónde se
  contradicen, verifica y entrega un BRIEFING citado. Para research de mercado, industry trends,
  competidores, key accounts o cualquier tema nuevo que haya que entender antes de decidir.
  Disparadores: "hacé un storm de…", "armame un briefing de…", "qué se está diciendo sobre…",
  "panorama de…", "investigá este mercado / esta cuenta / este competidor".
---

# STORM — research multi-perspectiva

Implementación del método STORM de Stanford (*Synthesis of Topic Outlines through Retrieval and Multi-perspective Question asking*) y de su variante colaborativa Co-STORM ("unknown unknowns"). Replica el método con agentes y búsqueda; no depende de ningún repo externo.

## La intuición de fondo
Un solo ángulo tiene puntos ciegos que otro ángulo detecta. En vez de preguntarle al tema de una sola manera, se lo interroga desde varias perspectivas **que emergen del propio tema**, y se busca explícitamente lo que uno no sabe que no sabe. El valor está en la pre-escritura: descubrir, interrogar y mapear ANTES de redactar.

## Fases
1. **Descubrir perspectivas (emergentes, no fijas).** Derivá 4-7 perspectivas pertinentes al tema. Podés inspirarte en las lentes canónicas —*practitioner* (el que lo hace todos los días), *academic* (la lectura fundada), *skeptic* (cree que la visión dominante está mal y trae su mejor contra-argumento), *economist* (sigue la plata: quién gana, quién paga, qué incentivos hay), *historian* (ya vio este patrón antes)— pero adaptándolas al tema. Declará qué perspectivas elegiste y por qué.
2. **Interrogar por perspectiva.** Cada perspectiva genera preguntas y repreguntas, respondidas con **retrieval real de fuentes** (búsqueda web, documentos públicos, reportes, el material interno que corresponda). Distintos ángulos → distintas preguntas → cobertura de puntos ciegos.
3. **Mapa de contradicciones.** Cruzá lo recolectado: dónde las perspectivas o las fuentes CHOCAN. No aplanes el desacuerdo: nombralo. Es el entregable más valioso para jerarquizar.
4. **Verificación.** Cada afirmación fuerte va con su fuente y su fecha. ⚠ lo no verificado. Un dato de mercado sin fecha no sirve.
5. **Outline → briefing.** Curá en un esquema y redactá un briefing citado. Cerrá con un peer-review propio: qué ángulo quedó sin cubrir, qué fuente sin leer, qué vínculo es endeble.

## Cómo se ejecuta
Un agente en background por perspectiva, cada uno dejando su salida en un archivo de trabajo; el orquestador arma el mapa de contradicciones y el briefing. Retrieval por web para temas externos; el material interno solo desde el entorno aprobado. Salida a un documento legible (briefing + mapa de contradicciones + fuentes), no a la conversación cruda.

## Guardrails duros
- **Produce mapa y briefing, no la conclusión que yo tengo que firmar.** El briefing es insumo: la lectura que va al liderazgo la escribo yo encima.
- **Provenance separada.** Distinguí hipótesis de fuente-con-fecha. Vinculá generosamente pero marcá la procedencia.
- **Vigilá la sobre-asociación.** El límite declarado del método no es alucinar datos sino **vincular de más y citar de más** (red herrings, sesgo de fuentes). Sirve para ABRIR ángulos, no para cerrar vínculos.
- **Nada de cifras de mercado inventadas ni benchmarks "aproximados".** Si no hay fuente, se dice que no hay fuente.
- **Confidencialidad:** no pongas datos internos, de cuentas o de pipeline en búsquedas externas.

## Relación con el resto
Se apoya en `revision-multipersona` (lentes adversariales sobre un texto ya escrito), `abogado-del-diablo` (tensar un argumento) y `analisis-cualitativo` modo síntesis (la matriz fuente × dimensión). Para una decisión concreta con opciones sobre la mesa, el destino natural del briefing es `matriz-decision`.
