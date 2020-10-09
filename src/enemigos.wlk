import wollok.game.*
import movimientos.*
import balas.*

class TanqueEnemigo {

	var property position = new Position(x = 0.randomUpTo(39), y = 0.randomUpTo(24))
	var property image = "enemy_up.png"
	var ultimoMovimiento = up
	var ultimaPosicion = position

	method identidad() {
		return "enemigo"
	}

	method atacar() {
		if (self.randomizer(10) == 4) game.addVisual(new Bala(position = ultimaPosicion, image = "bala" + image.drop(5), movimiento = ultimoMovimiento))
	}

	method realidad() {
	}

	method moverse() {
		if (self.randomizer(3) == 0) {
			position = self.position().up(1)
			ultimaPosicion = self.position().up(1)
			ultimoMovimiento = up
			image = "enemy_up.png"
		} else {
			if (self.randomizer(3) == 1) {
				position = self.position().down(1)
				ultimaPosicion = self.position().down(1)
				ultimoMovimiento = down
				image = "enemy_down.png"
			} else {
				if (self.randomizer(3) == 2) {
					position = self.position().left(1)
					ultimaPosicion = self.position().left(1)
					ultimoMovimiento = left
					image = "enemy_left.png"
				} else {
					if (self.randomizer(3) == 3) {
						position = self.position().right(1)
						ultimaPosicion = self.position().right(1)
						ultimoMovimiento = right
						image = "enemy_right.png"
					} else {
					}
				}
			}
		}
	}

	method randomizer(valor) {
		return 0.randomUpTo(valor).roundUp()
	}

}

