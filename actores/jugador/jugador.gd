extends CharacterBody2D

# Velocidad de movimiento en píxeles por segundo
const SPEED: float = 160.0

# Última dirección hacia la que miró el personaje
var facing_direction: Vector2 = Vector2.DOWN

func _physics_process(_delta: float) -> void:
	# Lee la dirección desde las acciones de movimiento
	var direction: Vector2 = Input.get_vector("mover_izquierda", "mover_derecha", "mover_arriba", "mover_abajo")
		# Guarda la dirección solo si el personaje se está moviendo
	if direction != Vector2.ZERO:
		facing_direction = direction
		# Aplica la velocidad y mueve al personaje
	velocity = direction * SPEED
	move_and_slide()
