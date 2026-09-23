# Instalar el kit en la máquina de trabajo

Tarda unos cinco minutos. No usa Claude ni gasta créditos. Lo que ya tenías queda guardado con sufijo `.backup`.

## 1. Bajar el kit

En esta página: botón verde **Code → Download ZIP**. Descomprimilo en tu carpeta de usuario, por ejemplo `C:\Users\<vos>\kit-claude`.

## 2. Abrir Git Bash en esa carpeta

Abrí la carpeta descomprimida en el Explorador, hacé **clic derecho en un espacio vacío → "Open Git Bash here"**. En Windows 11 puede estar dentro de "Mostrar más opciones".

## 3. Correr el instalador

Escribí esto a mano y apretá Enter:

```
bash instalar.sh
```

Cuando te pida la carpeta de trabajo, **arrastrá esa carpeta desde el Explorador a la ventana de Git Bash** y apretá Enter.

> **Para pegar en Git Bash**, `Ctrl+V` no funciona. Usá **`Shift+Insert`** o clic derecho → **Paste**.

## 4. Verificar (cuando tengas créditos)

Abrí `claude` desde la carpeta de trabajo. Tienen que aparecer:

- abajo del prompt, una línea tipo `[Sonnet] $0.00 · ctx 0%`;
- al primer mensaje, el aviso "⏱ Contador de turnos activo".

Si falta alguna, escribí `/hooks` y `/status` y sacale una foto.

## Si algo falla

- **Error rojo con `$'\r'`:** el ZIP trajo saltos de línea de Windows. Bajá el ZIP de nuevo; si sigue, abrí `instalar.sh` y los `.sh` de `hooks/` en el Bloc de notas y guardalos con "LF" (o pedí ayuda en la primera sesión).
- **"no encuentro la carpeta":** volvé a correr `bash instalar.sh` y escribí la ruta con barras normales, por ejemplo `/c/Users/<vos>/Trabajo`.

El detalle de cada pieza está en `v2/00_LEEME.md`.
