import wollok.game.*
import movimientos.*
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

	method identidad() {
		return "tanquesito"
	}

	method ataque() {
		game.addVisual(new Bala(position = ultimaPosicion, image = "bala" + image.drop(4), movimiento = ultimoMovimiento))
	}

}

