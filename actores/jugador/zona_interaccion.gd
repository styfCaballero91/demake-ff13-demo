extends Area2D

# Distancia en píxeles entre los pies del jugador y el centro de la zona
const OFFSET_DISTANCE: float = 32.0

# Posición de los pies del jugador respecto a su origen
const FEET_OFFSET: Vector2 = Vector2(0, 16)

# Nodo Jugador (padre de esta zona)
@onready var player: CharacterBody2D = get_parent()

func _physics_process(_delta: float) -> void:
	# Coloca la zona frente al jugador según su dirección
	position = FEET_OFFSET + player.facing_direction.normalized() * OFFSET_DISTANCE
	
func _unhandled_input(event: InputEvent) -> void:
	# Al presionar la tecla de interacción, activa el primer objeto dentro de la zona
	if event.is_action_pressed("interactuar"):
		for area in get_overlapping_areas():
			if area is Interactable:
				area.interact()
				break
