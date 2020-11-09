import wollok.game.*
import movimientos.*
import inicio.*
import balas.*
import tanquesito.*
import levels.*

class TanqueEnemigo {

	var property position
	var property image = "enemy_up.png"
	var property ultimoMovimiento = down
	var ultimaPosicion = position
	const property movimientos = [ down, down, up, left, right ] // el primero no lo toma

	method atacar() {
		if (self.randomizer(3) == 2) {
			game.sound("shoot.wav").play()
			const bala = new BalaEnemigos(position = ultimaPosicion)
			bala.disparada(ultimoMovimiento)
		}
	}

	method puntos() = 100

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

	method activar() {
		// game.addVisual(self)
		game.onTick(1500, "movimiento enemigos" + self.identity().toString(), { => self.cambiarTanqueE(self.movimientos().anyOne())})
		game.onTick(3000, "disparo Enemigo" + self.identity().toString(), { => self.atacar()})
	}

	method chocado() {
		game.sound("kill.wav").play()
		game.removeTickEvent("disparo Enemigo" + self.identity().toString())
		game.removeTickEvent("movimiento enemigos" + self.identity().toString())
		game.removeVisual(self)
		level1.eliminarEnemigo(self)
		tanquesito.sumaPunto(self)
	}

	method chocadoPorEnemigo() {
	}

/*method crear() {
 * 	game.addVisual(self)
 }*/
}

class TanqueEnemigoAtkSpeed inherits TanqueEnemigo {

	override method atacar() {
		if (self.randomizer(1) == 1) {
			const bala = new BalaEnemigos(position = ultimaPosicion)
			bala.disparada(ultimoMovimiento)
		}
	}

	override method cambiarTanqueE(apunta) {
		if (game.getObjectsIn(apunta.mov(self)).isEmpty()) {
			self.position(apunta.mov(self))
		}
		image = "enemy2_" + apunta.movString() + ".png"
		ultimaPosicion = apunta.mov(self)
		ultimoMovimiento = apunta
	}

	override method puntos() = 300

}

class TanqueEnemigo3HP inherits TanqueEnemigo {

	var vidas = 3

	override method chocado() {
		if (vidas == 1) {
			super()
		} else {
			vidas -= 1
		}
	}

	override method cambiarTanqueE(apunta) {
		if (game.getObjectsIn(apunta.mov(self)).isEmpty()) {
			self.position(apunta.mov(self))
		}
		image = "enemy3_" + apunta.movString() + ".png"
		ultimaPosicion = apunta.mov(self)
		ultimoMovimiento = apunta
	}

	override method puntos() = 500

}

