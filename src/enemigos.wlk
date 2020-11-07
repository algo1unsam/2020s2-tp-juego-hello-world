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
		const bala = new BalaEnemigos(position = ultimaPosicion)
		bala.disparada(ultimoMovimiento)
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

	
	/// hay ver porq el onTick rompe el juego
	method activar() {
		game.onTick(2000, "movimiento enemigos"+self.identity().toString(), { => self.cambiarTanqueE(self.movimientos().anyOne())})
		game.onTick(3000, "disparo enemigo"+self.identity().toString(), { => self.atacar()})
	}


	method chocado() {
		game.removeTickEvent("disparo enemigo"+self.identity().toString())
		game.removeTickEvent("movimiento enemigos"+self.identity().toString())
		game.removeVisual(self)
		carga.eliminarEnemigo(self)
	}

	method chocadoPorEnemigo() {
	}

	method crear() {
		game.addVisual(self)
	}

}

