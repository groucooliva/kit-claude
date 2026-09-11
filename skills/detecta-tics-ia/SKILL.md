---
name: detecta-tics-ia
description: >-
  Audita un texto que va a salir con mi nombre (mail, resumen ejecutivo, informe, comentario en un
  deck, mensaje al equipo) y marca línea por línea los tics que lo hacen sonar a IA, con la
  dirección para que suene a mí. Disparadores: "¿suena a IA esto?", "pasale el filtro anti-IA",
  "¿qué de esto me delata?", "leelo y decime si suena a máquina". También de reflejo si pego un
  borrador y dudo. NO reescribe: marca y sugiere.
---

# Detecta tics de IA — control de fidelidad a mi voz

Un texto que suena a IA en un contexto profesional cuesta credibilidad: da la impresión de que no lo pensé yo. Esta skill lee un texto mío (o un insumo que voy a reescribir) y devuelve, **línea por línea, dónde se delata y cómo sonaría más a mí**.

## Regla dura — marca y sugiere, no reescribe
El filtro soy yo. Señalás el tic, explicás por qué delata y ofrecés una dirección o una variante *como insumo*. Nunca devuelvas el texto "ya arreglado" como si fuera la versión final: si me das la frase hecha, me anclo y vuelve a sonar a IA. Una sugerencia es una puerta, no la frase.

## Los tics a cazar
Para cada uno: citá el fragmento textual, nombrá el tic, decí por qué delata en una frase, y proponé la dirección de arreglo.

1. **Metalenguaje de anuncio** — el tic MÁS grave. Frases que hablan DEL texto en vez DEL problema: "a continuación mostraré que…", "en esta sección analizaremos…", "esto habrá que medirlo". El texto narra lo que va a hacer en lugar de hacerlo. Regla simple: **si una frase habla del texto y no del problema, sobra.** Cura: ejecutar el análisis directamente. Los títulos que repiten la consigna también leen como andamio cantado.
2. **Cierre lapidario en cada párrafo** — rematar todo con una sentencia de efecto. Una vez es elegante; como patrón fijo es de los tells más fuertes. Cura: romper el patrón — cerrar a veces con un dato, con una pregunta, o encadenando con el párrafo siguiente.
3. **Afirmación sin dato** — prosa que flota sin apoyarse en una cifra, una fuente o un caso concreto. En un informe de negocio es letal: toda afirmación fuerte va con su número, su corte temporal y su fuente.
4. **Cero ejemplos concretos** — todo en abstracto. Cura: anclar a un caso real (una cuenta, un mes, un desvío puntual). Menos descripción, más análisis.
5. **Guion largo decorativo y aposición abusada** — el guion medio/largo a cada rato como muleta de ritmo. Cura: usar el conector lógico que avanza el razonamiento ("en efecto", "sin embargo", "ahora bien", "por lo tanto", "en cambio").
6. **El sonsonete "no es X, es Y"** — la antítesis pegadiza repetida ("no se trata de A, sino de B"). Una vez ordena; repetida es fórmula que reemplaza al pensamiento. Cura: afirmar derecho cuando alcanza; reservar la antítesis para cuando la distinción es real.
7. **Staccato enumerativo** — la tríada de cláusulas cortas paralelas como tic de cadencia ("Es claro. Es preciso. Es medible."). Cura: variar el largo de frase y de párrafo.
8. **Adjetivación de relleno y densidad falsa** — apilar adjetivos para sonar denso. Lo bueno densifica por distinción conceptual fina, no por adjetivos.
9. **Conexiones afirmadas y no sostenidas** — vínculos entre dos fenómenos que el texto da por dados sin evidencia. En análisis de negocio: correlación presentada como causa.
10. **Tono de validación / sycophancy** — "es importante notar que", "cabe destacar", "resulta fundamental", entusiasmo genérico, remates grandilocuentes. Lo importante se nota solo.
11. **Bullets simétricos y vacíos** — todos del mismo largo, todos empezando igual, cada uno diciendo una generalidad. Cura: que cada bullet cargue un hecho distinto, o que sea prosa.

## Cómo entregar
Fragmento por fragmento, en orden del texto: **fragmento** (verbatim entre comillas) · **tic** (por nombre) · **por qué delata** (una frase) · **dirección** (una pista, no la frase final). Cerrá con un diagnóstico corto: los 2-3 tics dominantes del texto, que es lo accionable. Si el texto está limpio, decilo plano: no inventes tics para justificar la pasada.

## Calibración
- **El tic es el patrón, no el caso único.** Un guion largo no es pecado; el guion largo como muleta, sí. Marcá frecuencia, no solo presencia.
- **No domestiques mi voz.** Escribo con frases largas y subordinadas: eso es mío, no un tic. El tic es la cadencia de máquina, no la complejidad.
- **El registro depende del destino:** un mail interno es más seco que un informe a liderazgo; un análisis escrito es más denso que un mensaje en un canal. Calibrá contra el destino, no contra un ideal de prosa.
