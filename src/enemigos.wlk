import wollok.game.*
import movimientos.*
import balas.*

class TanqueEnemigo {

	var property position = new Position(x = 0.randomUpTo(game.width()), y = 0.randomUpTo(game.height()))
	var property image = "enemy_up.png"
	var ultimoMovimiento = up
	var ultimaPosicion = position
	const property movimientos = [ down, down, up, left, right ] // el primero no lo toma

//	method identidad() {
//		return "enemigo"
//	}

	method atacar() {
		if (self.randomizer(10) == 4) game.addVisual(new BalaEnemigos(position = position, image = "bala" + image.drop(5), movimiento = ultimoMovimiento))
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
	}

	method chocadoPorEnemigo() {
	}

	method realidad() {
	}

	method colisionador() {
	}

}

