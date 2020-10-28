import wollok.game.*
import movimientos.*

class Muro {

	var property position
	const property image = "muro.png"
	const property movimientos = [ down, down, up, left, right ]

	method chocado() {
		game.removeVisual(self)
	}

	method chocadoPorEnemigo() {
		game.removeVisual(self)
	}

	method crear() {
		game.addVisual(self)
	}

}

