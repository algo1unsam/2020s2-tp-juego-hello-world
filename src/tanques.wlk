import wollok.game.*

object tanquesito {

	var property position = new Position(x = 2, y = 2)
	var property image = "tank_up.png"

	method cambiarTanque(apunta) {
		image = "tank_" + apunta + ".png"
	}

	method atacar() {
	}

	method ataque() {
		game.addVisual(new Bala(position = self.position().up(1)))
	}

	method realidad() {
	}

	method moverse() {
	}

}

class Muro {

	var property position = new Position(x = 0.randomUpTo(39), y = 0.randomUpTo(24))
	const property image = "muro.png"

	method atacar() {
	}

	method realidad() {
	}

	method moverse() {
	}

}

class TanqueEnemigo {

	var property position = new Position(x = 0.randomUpTo(39), y = 0.randomUpTo(24))
	var property image = "enemy_up.png"

	method atacar() {
		game.addVisual(new Bala(position = self.position().up(1)))
	}

	method realidad() {
	}

	method moverse() {
		if (self.randomizer() == 0) {
			position = self.position().up(1)
		} else {
			if (self.randomizer() == 1) {
				position = self.position().down(1)
			} else {
				if (self.randomizer() == 2) {
					position = self.position().left(1)
				} else {
					if (self.randomizer() == 3) {
						position = self.position().right(1)
					} else {
					}
				}
			}
		}
	}

	method randomizer() {
		return 0.randomUpTo(3).roundUp()
	}

}

class Bala {

	var property position
	var property image = "bala_up.png"

	method atacar() {
	}

	method realidad() {
		position = position.up(1)
	}

	method moverse() {
	}

}

