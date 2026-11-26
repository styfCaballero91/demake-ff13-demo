extends Node

# Inventario del personaje: id del objeto -> cantidad
var inventory: Dictionary = {}

# Banderas del juego: nombre de la bandera -> verdadero o falso
var flags: Dictionary = {}

# Agrega objetos al inventario
func add_item(item_id: String, amount: int = 1) -> void:
	inventory[item_id] = get_item_count(item_id) + amount

# Devuelve cuántas unidades del objeto hay en el inventario
func get_item_count(item_id: String) -> int:
	return inventory.get(item_id, 0)

# Indica si el inventario tiene al menos una unidad del objeto
func has_item(item_id: String) -> bool:
	return get_item_count(item_id) > 0

# Activa o desactiva una bandera
func set_flag(flag_name: String, value: bool = true) -> void:
	flags[flag_name] = value

# Devuelve el valor de una bandera (falso si no existe)
func get_flag(flag_name: String) -> bool:
	return flags.get(flag_name, false)
