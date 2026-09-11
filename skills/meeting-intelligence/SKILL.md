---
name: meeting-intelligence
description: >-
  Convierte una reunión, entrevista o charla (audio o transcripción) en inteligencia accionable:
  minuta con decisiones, action items con responsable y fecha, cabos sueltos, DACI y citas
  verbatim, más After-Action Review y chequeo anti-sesgo ACH. Disparadores: "minuta de la
  reunión", "procesá esta call", "sacá los action items", "qué dijo quién", "analizá esta
  transcripción". Dispará ante cualquier conversación registrada a la que haya que sacarle valor.
---

# Meeting Intelligence

Pipeline repetible para procesar reuniones, calls y charlas densas. Produce un documento, no acciones de mundo.

## Reglas duras
- **No enviar nada ni ejecutar acciones externas.** Leer y draftear la minuta sí. Mandar mails, avisar a alguien, agendar, escribir en el CRM o compartir el documento: jamás sin OK explícito.
- **No inventar.** Ninguna cita, nombre, fecha o compromiso que no esté en el material. Lo dudoso o inaudible va con ⚠ y, si es cita, "(verbatim a cotejar)". Si no sabés quién dijo algo: "(hablante no identificado)". Un hueco honesto es mejor que un dato inventado.
- **Confidencialidad:** grabaciones y transcripciones se procesan solo dentro del entorno aprobado y con el consentimiento que corresponda. Si hay duda sobre si se podía grabar, se verifica aparte; no heredes una conclusión.
- **Tono al hueso, sin sycophancy.** Qué se decidió, quién hace qué, qué quedó abierto.
- **Si la lectura me conviene emocionalmente, el paso ACH es OBLIGATORIO.**

## Paso 0 — Orientarse
¿Audio o transcripción? Si es audio, transcribilo con la herramienta aprobada; si no hay ninguna, decilo en una frase y pedime la transcripción (no inventes el contenido). Leé el texto entero UNA vez antes de codificar nada. Identificá hablantes; si la transcripción no los separa, marcá la atribución como tentativa (⚠). Preguntame lo que no podés deducir —quiénes participaron y con qué rol, qué quería lograr yo—, una pregunta por turno. Arriba de todo, el encabezado: evento, fecha, tipo, participantes con rol, duración, de dónde sale el material.

## Paso 1 — Minuta (siempre)
```
### Decisiones
- qué se acordó, concreto. Si quedó a medias: "se inclinó hacia X pero no se cerró"
### Action items
- [acción] — [responsable] — [fecha]   (si falta dueño o plazo: ⚠, no lo inventes)
### Cabos sueltos y qué puede salir mal
- qué quedó ambiguo, qué compromiso es verbal y sin respaldo
### Quién dijo qué (DACI)
- Driver (condujo) / Approver (decidió de verdad, uno solo) / Contributors / Informed
### Citas textuales clave (verbatim)
- "…" — [hablante]   (compromisos, condiciones, cifras). ⚠ lo que no puedas transcribir con certeza.
### Resumen (2-4 frases)
```
Un action item sin dueño es un problema, no una acción: marcalo. DACI sirve para leer poder, no para etiquetar: ¿quién era el Approver real?, ¿qué se *informó* (cerrado) vs. qué se *negoció* (abierto)?

## Paso 2 — After-Action Review
Qué se suponía que iba a pasar · qué pasó realmente (lo que muestra el material, no lo recordado) · por qué el delta · qué sostengo y qué cambio. Hacelo el mismo día; anclate en el registro, no en la versión que ya me conté.

## Paso 3 — Pase cualitativo (solo si el material es denso o recurrente)
In vivo coding con las palabras textuales del otro · temas (qué valoran, qué les preocupa, qué se repite) · negative case (qué del material contradice el tema emergente) · memo de 3-5 notas · audit trail de por qué codeaste así.

## Paso 4 — ACH anti-sesgo (obligatorio si la lectura me conviene)
2-3 hipótesis rivales explícitas y mutuamente excluyentes · matriz hipótesis × evidencia marcando lo INCONSISTENTE · gana la que tiene menos inconsistencias, no la que más me gusta · negative case final. Si mi conclusión no sobrevive, decímelo directo: ahí está el valor.

## Paso 5 — Archivar
El destilado es lo que vive; el registro crudo se guarda donde corresponda y no se mueve a destinos compartidos sin OK. Dejá aparte los aprendizajes reutilizables (un patrón, una distinción, algo del negocio que aprendí), con su procedencia.
