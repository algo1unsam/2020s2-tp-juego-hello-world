import wollok.game.*
import movimientos.*
import inicio.*
import balas.*

object tanquesito {

	var property position = new Position(x = 2, y = 2)
	var property image = "tank_up.png"
	var ultimaPosicion = position
	var ultimoMovimiento = up
	const property movimientos = [ down, down, up, left, right ]

	method cambiarTanque(apunta) {
		if (game.getObjectsIn(apunta.mov(self)).isEmpty()) {
			self.position(apunta.mov(self))
		}
		image = "tank_" + apunta.movString() + ".png"
		ultimaPosicion = apunta.mov(self)
		ultimoMovimiento = apunta
	}

	method ataque() {
		carga.crearBala(new Bala(position = position, image = "bala" + image.drop(4), movimiento = ultimoMovimiento))
	}

	method chocado() {
	}

	method chocadoPorEnemigo() {
		game.removeVisual(self)
	}

}

