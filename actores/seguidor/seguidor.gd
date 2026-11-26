extends CharacterBody2D

# Velocidad de movimiento en píxeles por segundo
const SPEED: float = 160.0

# Distancia aproximada en píxeles que el seguidor mantiene del objetivo
const STOP_DISTANCE: float = 80.0

# Distancia en píxeles entre los puntos guardados del rastro
const TRAIL_STEP: float = 8.0

# Distancia a la que se considera alcanzado un punto del rastro
const REACH_DISTANCE: float = 8.0

# Nodo que el seguidor debe perseguir (se asigna desde el Inspector)
@export var target: Node2D

# Puntos por donde ha pasado el objetivo
var trail: Array[Vector2] = []

func _ready() -> void:
	# Guarda la posición inicial del objetivo como primer punto del rastro
	if target != null:
		trail.append(target.global_position)

func _physics_process(_delta: float) -> void:
	# No hace nada si no hay objetivo asignado
	if target == null:
		return

	# Guarda un punto nuevo cuando el objetivo se aleja del último punto
	if target.global_position.distance_to(trail.back()) >= TRAIL_STEP:
		trail.append(target.global_position)

	# Cantidad de puntos que el seguidor debe dejar entre él y el objetivo
	var delay_points: int = int(STOP_DISTANCE / TRAIL_STEP)

	# Descarta los puntos más antiguos que ya alcanzó
	while trail.size() > delay_points and global_position.distance_to(trail[0]) < REACH_DISTANCE:
		trail.pop_front()

	# Se detiene si el objetivo está cerca
	if trail.size() <= delay_points:
		velocity = Vector2.ZERO
		return

	# Se mueve hacia el punto más antiguo del rastro
	var direction: Vector2 = global_position.direction_to(trail[0])
	velocity = direction * SPEED
	move_and_slide()
