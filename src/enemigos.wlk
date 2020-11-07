import wollok.game.*
import movimientos.*
import inicio.*
import balas.*

class TanqueEnemigo {

	var property position
	var property image = "enemy_up.png"
	var property ultimoMovimiento = up
	var ultimaPosicion = position
	const property movimientos = [ down, down, up, left, right ] // el primero no lo toma

	method atacar() {
		if (self.randomizer(3) == 2) {
			const bala = new BalaEnemigos(position = ultimaPosicion)
			bala.disparada(ultimoMovimiento)
		}
	}

	method cambiarTanqueE(apunta) {
		if (game.getObjectsIn(apunta.mov(self)).isEmpty()) {
			self.position(apunta.mov(self))
		}
		image = "enemy_" + apunta.movString() + ".png"
		ultimaPosicion = apunta.mov(self)
		ultimoMovimiento = apunta
	}

	method randomizer(valor) {
		return 0.randomUpTo(valor).roundUp()
	}

	method chocado() {
		game.removeVisual(self)
		carga.eliminarEnemigo(self)
	}

	method chocadoPorEnemigo() {
	}

	method crear() {
		game.addVisual(self)
	}

}

class TanqueEnemigoAtkSpeed inherits TanqueEnemigo {

	override method atacar() {
		if (self.randomizer(1) == 1) {
			const bala = new BalaEnemigos(position = ultimaPosicion)
			bala.disparada(ultimoMovimiento)
		}
	}

}

class TanqueEnemigo3HP inherits TanqueEnemigo {

	var vidas = 3

	override method chocado() {
		if (vidas == 1) {
			vidas -= 1
		} else {
			game.removeVisual(self)
			carga.eliminarEnemigo(self)
		}
	}

}

