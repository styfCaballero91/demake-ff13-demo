class_name ItemOrb
extends Interactable

# Id del objeto que contiene la esfera
@export var item_id: String = ""

# Cantidad de unidades que se agregan al inventario
@export var amount: int = 1

# Nombre de la bandera que recuerda que la esfera ya fue recogida (único por esfera)
@export var flag_name: String = ""

func interact() -> void:
	# No hace nada si la esfera ya fue recogida
	if EstadoGlobal.get_flag(flag_name):
		return

	# Agrega el objeto al inventario y recuerda que la esfera fue recogida
	EstadoGlobal.add_item(item_id, amount)
	EstadoGlobal.set_flag(flag_name)
