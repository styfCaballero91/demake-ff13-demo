extends CharacterBody2D

# Estados posibles del personaje
enum State { IDLE, RUN }

# Velocidad de movimiento en píxeles por segundo
const SPEED: float = 160.0

# Última dirección hacia la que miró el personaje
var facing_direction: Vector2 = Vector2.DOWN

# Estado actual del personaje
var current_state: State = State.IDLE
		
func _physics_process(_delta: float) -> void:
	# Lee la dirección desde las acciones de movimiento
	var direction: Vector2 = Input.get_vector("mover_izquierda", "mover_derecha", "mover_arriba", "mover_abajo")

	# Guarda la dirección solo si el personaje se está moviendo
	if direction != Vector2.ZERO:
		facing_direction = direction

	# Ejecuta la lógica del estado actual
	match current_state:
		State.IDLE:
			_state_idle(direction)
		State.RUN:
			_state_run(direction)
	
func change_state(new_state: State) -> void:
	# Cambia el estado actual
	current_state = new_state
	
func _state_idle(direction: Vector2) -> void:
	# En reposo el personaje no se mueve
	velocity = Vector2.ZERO
	# Pasa a correr si hay dirección
	if direction != Vector2.ZERO:
		change_state(State.RUN)

func _state_run(direction: Vector2) -> void:
	# Aplica la velocidad y mueve al personaje
	velocity = direction * SPEED
	move_and_slide()
	# Vuelve a reposo si no hay dirección
	if direction == Vector2.ZERO:
		change_state(State.IDLE)
