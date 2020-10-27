import wollok.game.*
import movimientos.*
import inicio.*
import enemigos.*
import tanquesito.*

class Bala {

	var property position
	var property image
	const movimiento
	const property movimientos = [ down, down, up, left, right ]

	method realidad() {
		position = movimiento.mover(self)
	}

	method colisionador() {
		game.onCollideDo(self, { c =>
			c.chocado()
			game.removeVisual(self)
		})
	}

	method chocado() {
		game.removeVisual(self)
		carga.eliminarBala(self)
	}

	method chocadoPorEnemigo() {
		carga.eliminarBala(self)
		game.removeVisual(self)
	}

	method cambiarTanqueE(valor) {
	}

	method crear() {
		game.addVisual(self)
	}

}

class BalaEnemigos inherits Bala {

	override method colisionador() {
		game.onCollideDo(self, { c =>
			c.chocadoPorEnemigo()
			game.removeVisual(self)
		})
	}

}

