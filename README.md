# DemakeFinalFantasyXIIIDEMO

Demake en 2D con vista cenital de Final Fantasy XIII, en formato de demo, desarrollado con Godot 4. Género: acción y RPG.

> Proyecto de fans no oficial. No está afiliado ni respaldado por Square Enix. Final Fantasy es una marca registrada de Square Enix Holdings Co., Ltd.

## Estado del proyecto

En desarrollo. Se trabaja en la **Etapa A: pasillo de prueba (test room)**. Por ahora solo se desarrolla el modo aventura; el modo combate se desarrollará después.

## Características

### Modo aventura

- El personaje corre por el escenario en 8 direcciones. No camina.
- Un personaje secundario sigue siempre al personaje principal.
- Obstáculos que guían al personaje en ciertas direcciones.
- Objetos interactivos:
  - Estaciones de guardado.
  - Esferas con un objeto que se agrega al inventario.
  - Señales que hacen saltar al personaje para superar un obstáculo.
  - Estaciones de control que modifican el mapa o transportan al personaje.
- Sucesos en segundo plano que no afectan directamente al escenario donde está el personaje.
- Interfaz:
  - Título grande con el sector al iniciar la escena.
  - Título (lugar específico) y subtítulo (sector) en la parte inferior derecha.
  - Subtítulos de diálogos en la parte inferior izquierda.
  - Menú de pausa con Condición, Habilidades y Objetos.

### Modo combate

Pendiente de desarrollo. Se activará al entrar en contacto con un enemigo.

## Controles

Solo teclado.

| Acción | Teclas |
|---|---|
| Moverse | W, A, S, D o flechas |

## Cómo ejecutar el proyecto

Requisito: [Godot](https://godotengine.org/) 4.7.2.

1. Clona el repositorio:
   ```
   git clone https://github.com/<usuario>/demake-ff13-demo.git
   ```
2. Abre Godot, elige **Importar** y selecciona el archivo `project.godot`.
3. Abre la escena `niveles/pasillo_prueba/pasillo_prueba.tscn`.
4. Presiona F6 para ejecutar la escena actual.

## Hoja de ruta

### Etapa A: pasillo de prueba (test room)

- [x] 1. Fundamentos y preparación
- [x] 2. Personaje, movimiento y cámara
- [x] 3. Pasillo cortado en 2 y seguidor (en curso)
- [ ] 4. Interacción base y estado global
- [ ] 5. Objetos interactivos
- [ ] 6. Datos del personaje y guardado
- [ ] 7. Interfaz
- [ ] 8. Sucesos en segundo plano
- [ ] 9. Prueba integrada del pasillo (Hito 1: test room completa)

### Etapa B: mapa final

- [ ] 10. Armado del mapa final
- [ ] 11. Pruebas, ajustes y exportación

## Versiones

- **V.0.5:** pruebas finales del pasillo de prueba y del seguidor, y corrección de errores del TileSet.
- **V.0.4:** personaje seguidor que recorre el camino del jugador y no se bloquea con él.
- **V.0.3:** pasillo de prueba en 2 mitades con tiles, colisiones y obstáculos.
- **V.0.2:** máquina de estados básica del jugador.

## Estructura del proyecto

```
demake-final-fantasy-xiii-demo/
├── activos/                  Arte y audio (por ahora, texturas provisionales)
├── actores/
│   ├── jugador/
│   └── seguidor/
├── autoload/                 Scripts globales
├── datos/                    Datos y constantes
├── interactuables/
│   ├── esfera_objeto/
│   ├── estacion_control/
│   ├── estacion_guardado/
│   └── senal_salto/
├── iu/
│   ├── menu_pausa/
│   ├── subtitulos_dialogos/
│   └── titulo_ubicacion/
├── niveles/
│   ├── mapa_principal/
│   └── pasillo_prueba/
├── sistemas/                 Sistemas reutilizables
├── project.godot
└── README.md
```

## Especificaciones técnicas

### Unidad de medida base

| Concepto | Valor | En tiles |
|---|---|---|
| Tamaño de tile | 32 × 32 px | 1 |
| Resolución base | 640 × 360 px (16:9) | 20 × 11,25 |
| Ventana | 1280 × 720 px | 40 × 22,5 |
| Fotograma del personaje | 32 × 48 px | 1 × 1,5 |
| Colisión del personaje (pies) | 24 × 16 px | 0,75 × 0,5 |
| Velocidad al correr | 160 px/s | 5 tiles/s |
| Distancia del seguidor al jugador | ≈ 80 px | 2,5 |
| Zona de interacción | 32 × 32 px frente al personaje | 1 |
| Alcance del salto de las señales | ≈ 64 px | 2 |

- Los valores de zona de interacción y alcance del salto son iniciales y se ajustarán al probar.
- Modo de estiramiento de la ventana: `canvas_items`.
- El `TileSet` usa tiles de 32 × 32 px.
- Las constantes están en `datos/constantes_mapa.gd` (`MapConstants`).

### Pasillo de prueba

| Zona | Tamaño |
|---|---|
| Mitad 1 (suelo) | 20 × 12 tiles |
| Vacío entre mitades | 12 tiles de ancho |
| Mitad 2 (suelo) | 26 × 12 tiles |
| Total, con paredes | 60 × 14 tiles (1920 × 448 px) |

- Las paredes rodean el suelo por fuera.
- La mitad 1 tiene 2 obstáculos. La mitad 2 no tiene obstáculos.

### Capas de colisión

| Capa | Contenido |
|---|---|
| 1 | Mundo (paredes y obstáculos) |
| 2 | Jugador |
| 3 | Seguidor |

El jugador y el seguidor solo detectan la capa 1, por lo que no se bloquean entre sí.

## Convenciones

### Idiomas

- Código (variables, funciones, señales y clases): inglés.
- Nodos y acciones del Mapa de entrada (Input Map): español.
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
- Clases (`class_name`): `PascalCase` en inglés (`Player`).
- Nodos: `PascalCase` en español (`Jugador`, `MarcadorVisual`).
- Acciones del Mapa de entrada (Input Map): `snake_case` en español (`mover_arriba`).
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

## Licencia

Por definir.
