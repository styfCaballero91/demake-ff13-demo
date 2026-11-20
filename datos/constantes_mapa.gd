extends RefCounted

class_name MapConstants

# Tamaño base de un tile en píxeles
const TILE_SIZE: int = 32

# Resolución base del juego en píxeles
const VIEWPORT_WIDTH: int = 640
const VIEWPORT_HEIGHT: int = 360

# Velocidad al correr, expresada en tiles por segundo
const RUN_SPEED_TILES: float = 5.0

# Convierte una cantidad de tiles a píxeles
static func tiles_to_pixels(amount: float) -> float:
	return amount * TILE_SIZE
