import wollok.game.*
import movimientos.*

class Bala {

	var property position
	var property image
	const movimiento

	method identidad() {
		return "bala"
	}

	method realidad() {
		position = movimiento.mov(self)
	}

}

