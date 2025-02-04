import wollok.game.*
import movimientos.*
import inicio.*
import enemigos.*
import tanquesito.*

class Bala {

	var property direccion = down
	var property position
	var property image = null

	method disparada(direccion_) {
		self.direccion(direccion_)
		self.image("bala_" + direccion_ + ".png")
		game.addVisual(self)
		game.onTick(50, "balaMoviendose" + self.identity().toString(), { => self.realidad()})
		self.colisionador()
	}

	method realidad() {
		position = direccion.mover(self)
	}

	method colisionador() {
		game.onCollideDo(self, { c =>
			c.chocado()
			if (game.hasVisual(self)) {
				self.eliminar()
			}
		})
	}

	method eliminar() {
		game.removeTickEvent("balaMoviendose" + self.identity().toString())
		game.removeVisual(self)
	}

	// Si las balas chocan ya se eliminan solas
	method chocado() {
	}

	method chocadoPorEnemigo() {
	}

}

class BalaEnemigos inherits Bala {

	override method colisionador() {
		game.onCollideDo(self, { c =>
			c.chocadoPorEnemigo()
			if (game.hasVisual(self)) {
				self.eliminar()
			}
		})
	}

}

