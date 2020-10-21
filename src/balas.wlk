import wollok.game.*
import movimientos.*
import enemigos.*
import muros.*
import tanquesito.*

//
class Bala {

	var property position
	var property image
	const movimiento
	const property movimientos = [ down, down, up, left, right ]

//
//	method identidad() {
//		return "bala"
//	}
	method realidad() {
		position = movimiento.mover(self)
	}

	method atacar() {
	}

	method colisionador() {
		game.onCollideDo(self, { c =>
			c.chocado()
			game.removeVisual(self)
		})
	}

	method chocado() {
		game.removeVisual(self)
	}

	method chocadoPorEnemigo() {
		game.removeVisual(self)
	}

	method cambiarTanqueE(valor) {
	}

//	method randomizer(valor) {
//		const val = valor
//	}
}

class BalaEnemigos inherits Bala {

	override method colisionador() {
		game.onCollideDo(self, { c =>
			c.chocadoPorEnemigo()
			game.removeVisual(self)
		})
	}

}

