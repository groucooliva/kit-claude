---
name: ontology-generator
description: >-
  Dado CUALQUIER dataset (carpeta de documentos, export de un CRM, CSVs, tickets, notas), destila
  su ontología: entidades, relaciones TIPADAS (dirección, dominio/rango, forma lógica), jerarquías
  y constraints — el "contrato semántico" del dominio. Disparadores: "armame la ontología de este
  dataset", "qué entidades y relaciones hay acá", "generá el esquema de esto", "armá el contrato de
  estos datos". NO es analisis-cualitativo (esa codifica temas y patrones SIN tipar; ésta produce
  el ESQUEMA formal — si ya hay codeo hecho, se tipa eso, no se relee el corpus).
---

# Generador de ontologías — el contrato semántico de un dominio

Una ontología es "an explicit specification of a conceptualization" (Gruber): un artefacto con propósito, no una foto neutra del dominio. Toma un dataset crudo o semiestructurado y devuelve UN esquema chico, legible y verificable.

## Guardrails duros
1. **Propone, no aplica.** El output es CANDIDATO a esquema: no toca ningún sistema sin OK explícito. La ontología es una estipulación que el dueño del dominio valida, no "la realidad". Las validation questions se le hacen al dueño del dominio, no se responden por él.
2. **Nunca inventar.** Toda entidad y relación con evidencia textual del dataset (ejemplo in vivo + ubicación). Lo inferido no confirmado va con ⚠. Sin competency questions validadas no se modela.
3. **Relaciones tipadas solo si discriminan.** Un tipo entra si separa casos que el uso necesita distinguir; si dos tipos responden siempre igual, se fusionan. Compromiso ontológico mínimo.
4. **Vigilar dos vicios:** polisemia aplanada (¿"account" es la empresa o el registro de acceso? → partir) y "al final todo es Entidad" (colapso de distinciones).
5. **Confidencialidad:** datos de clientes o internos no salen del entorno aprobado, y solo se usa información que estoy autorizado a manejar. Ensayar primero con un dataset propio o de prueba.
6. **Audit trail obligatorio:** cada decisión de modelado (por qué X es clase y no atributo) queda anotada. En un entregable para terceros, es parte del producto.

## Pipeline (8 pasos, 2 gates humanos)
0. **Triage.** ¿El dataset trae esquema implícito (frontmatter, esquema del CRM, plantilla) o es corpus crudo? → *schema-first* (auditar y tipar lo existente) o *schema-last* (inducir bottom-up y canonicalizar). Si ya hay codeo cualitativo hecho, se tipa eso.
1. **Scope + competency questions.** 10-20 CQs derivadas del dataset y del uso declarado: "¿qué preguntas tiene que poder responder este esquema?". **GATE 1: el dueño del dominio valida las CQs.** Son spec, criterio de parada y suite de test a la vez.
2. **Extracción de términos.** Por chunks chicos, re-preguntando a cada chunk hasta saturar, con frecuencias y ejemplos textuales.
3. **Definiciones.** Cada tipo candidato recibe definición en lenguaje natural ANTES de canonicalizar: las definiciones son las anclas, no los nombres.
4. **Canonicalización.** Fusionar equivalentes contra las definiciones. Meta: esquema chico, sin sinónimos duplicados ni tipos colapsados.
5. **Modelado con tests.** Clase vs. atributo (¿alguna CQ pregunta POR él o solo A TRAVÉS de él?) · clase vs. instancia (granularidad declarada) · is-a vs. part-of vs. asociación tipada (dominio, rango, cardinalidad, inversa; reificar si la relación lleva atributos). Cada decisión, documentada.
6. **Auditoría.** Los roles nunca van como is-a ("Cliente is-a Empresa" es falso: cliente es un rol) · cosa vs. registro-de-cosa (la empresa ≠ la fila del CRM: fuente número uno de duplicados) · reversal check de jerarquías · lo dudoso queda ⚠. **GATE 2: el humano valida el SCHEMA, no tripleta por tripleta.**
7. **Validación por CQs.** Cada CQ debe responderse recorriendo el esquema; la que no, delata una pieza faltante o una CQ sobrante.

## Salida
- **Primaria:** UN archivo de esquema legible y editable (estilo YAML tipado): entidades con atributos, relaciones tipadas con dominio/rango/inversa y forma lógica (funcional, transitiva, simétrica), jerarquías `is_a`, reglas del contrato. **Tipos separados de instancias:** el esquema describe tipos; los datos se quedan donde viven y lo referencian. Así el método escala de 40 documentos a 40k filas.
- **Exports generados, nunca editados a mano:** diagrama de clases (siempre, legible en una pantalla) · JSON Schema para validación · otros formatos solo a pedido.
- **Si el destinatario es un tercero,** sumá: one-pager ejecutivo en prosa de negocio (qué entidades tiene el dominio, qué relaciones importan, qué preguntas responde ahora) · el diagrama · el esquema machine-readable · las 5 CQs top respondidas con datos reales · el audit trail de decisiones.

## Cuándo NO usar
Corpus chico o efímero que no se va a consultar estructuradamente (el contrato no paga su mantenimiento) · piden temas o patrones → `analisis-cualitativo` · piden action items de una charla → `meeting-intelligence` · no montar infraestructura semántica pesada para uso personal · nunca sobre datos no autorizados.
