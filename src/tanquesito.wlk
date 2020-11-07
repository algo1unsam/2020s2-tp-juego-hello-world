import wollok.game.*
import movimientos.*
import inicio.*
import balas.*

object tanquesito {

	var property position = new Position(x = 2, y = 2)
	var property image = "tank_up.png"
	var ultimaPosicion = position
	var ultimoMovimiento = up

	method cambiarTanque(apunta) {
		if (game.getObjectsIn(apunta.mov(self)).isEmpty()) {
			self.position(apunta.mov(self))
		}
		image = "tank_" + apunta.movString() + ".png"
		ultimaPosicion = apunta.mov(self)
		ultimoMovimiento = apunta
	}

	method ataque() {
		const bala = new Bala(position = ultimaPosicion)
		bala.disparada(ultimoMovimiento)
	}

	method chocado() {
	}

	method chocadoPorEnemigo() {
		game.removeVisual(self)
	}

}

