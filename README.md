# DemakeFinalFantasyXIIIDEMO

## Convenciones

### Idiomas

- Código (variables, funciones, señales, clases y nodos): inglés.
- Comentarios: español.
- Archivos y carpetas: español.

### Nombres de archivos y carpetas

- Se usa `snake_case`: minúsculas y guion bajo entre palabras.
- No se usan tildes, eñes ni espacios (ejemplo: `senal_salto`).
- Extensiones: `.tscn` para escenas, `.gd` para scripts y `.tres` para recursos.

### Una carpeta por entidad

Cada entidad tiene su propia carpeta. Dentro van su escena y su script, con el mismo nombre que la carpeta.

Ejemplo: `actores/jugador/jugador.tscn` y `actores/jugador/jugador.gd`.

Excepciones:

- Los scripts sin escena (Autoload, constantes, datos) van directamente en su carpeta.
- Los sistemas reutilizables van en `sistemas/`, con carpeta propia si tienen escena.
- El arte y el audio van en `activos/`.

### Nombres dentro del código

- Variables y funciones: `snake_case` en inglés.
- Constantes: `MAYUSCULAS_CON_GUION_BAJO`.
- Señales: `snake_case` en pasado (`item_collected`).
- Clases (`class_name`) y nodos: `PascalCase` en inglés (`Player`).
- Al adjuntar un script, Godot propone el nombre según el nodo (`player.gd`). Se cambia al nombre en español (`jugador.gd`).
- `class_name` se usa solo cuando otro script necesita referirse a esa clase.

### Equivalencias de entidades

| Carpeta | class_name |
|---|---|
| actores/jugador | Player |
| actores/seguidor | Follower |
| interactuables/esfera_objeto | ItemOrb |
| interactuables/estacion_control | ControlStation |
| interactuables/estacion_guardado | SaveStation |
| interactuables/senal_salto | JumpSign |
| iu/menu_pausa | PauseMenu |
| iu/subtitulos_dialogos | DialogueSubtitles |
| iu/titulo_ubicacion | LocationTitle |
| niveles/pasillo_prueba | TestRoom |
| niveles/mapa_principal | MainMap |

## Unidad de medida base

| Concepto | Valor | En tiles |
|---|---|---|
| Tamaño de tile | 32 × 32 px | 1 |
| Resolución base | 640 × 360 px (16:9) | 20 × 11,25 |
| Fotograma del personaje | 32 × 48 px | 1 × 1,5 |
| Colisión del personaje (pies) | ≈ 20 × 12 px | ≈ 0,6 × 0,4 |
| Velocidad al correr | 160 px/s | 5 tiles/s |
| Ancho del pasillo de prueba | 128 px | 4 |
| Zona de interacción | 32 × 32 px frente al personaje | 1 |
| Alcance del salto de las señales | ≈ 64 px | 2 |

- Los valores de colisión, velocidad, pasillo, interacción y salto son iniciales. Se ajustarán al probar el personaje.
- Las constantes están en `datos/constantes_mapa.gd` (`MapConstants`).
- El `TileSet` usa tiles de 32 × 32 px.
