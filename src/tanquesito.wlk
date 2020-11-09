import wollok.game.*
import movimientos.*
import inicio.*
import levels.*
import balas.*
import enemigos.*

object tanquesito {

	var property position = new Position(x = 2, y = 2)
	var property image = "tank_up.png"
	var ultimaPosicion = position
	var ultimoMovimiento = up
	var puntosAcumulados = 0

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

	method puntosGanados() = puntosAcumulados

	method chocadoPorEnemigo() {
		game.removeVisual(self)
		game.schedule(1500, {=> perdiste.gameOver("gameOver1.jpg")})
	}

	method sumaPunto(enemigoDerrotado) {
		puntosAcumulados += enemigoDerrotado.puntos()
	}

}

