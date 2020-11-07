import wollok.game.*
import movimientos.*

class Muro {

	var property position
	const property movimientos = [ down, down, up, left, right ]

	method chocado() {
	}

	method chocadoPorEnemigo() {
	}

	method crear() {
		game.addVisual(self)
	}

}

class Ladrillo inherits Muro {

	var property image = "brick.png"

	override method chocado() {
		game.removeVisual(self)
	}

	override method chocadoPorEnemigo() {
		game.removeVisual(self)
	}

}

class Cemento inherits Muro { //no se rompe

	var property image = "muro.png"

	override method chocado() {
	}

	override method chocadoPorEnemigo() {
	}

}

class Piedra inherits Muro { //se rompe con 3 hits

	var vidas = 3
	var property image = "piedra.jpg"

	override method chocado() {
		if (vidas == 0) {
			game.removeVisual(self)
		} else {
			vidas -= 1
		}
	}

	override method chocadoPorEnemigo() {
		self.chocado()
	}

}

