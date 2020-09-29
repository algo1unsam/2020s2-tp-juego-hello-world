import wollok.game.*

object tanquesito {

	var property position = new Position(x = 2, y = 2)
	var property image = "tank_up.png"

	method atacar() {
	}

	method ataque() {
		game.addVisual(new Bala(position = self.position().up(1)))
	}

	method realidad() {
	}

}

class Muro {

	var property position = new Position(x = 0.randomUpTo(39), y = 0.randomUpTo(24))
	const property image = "muro.png"

	method atacar() {
	}

	method realidad() {
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

}

class Bala {

	var property position
	var property image = "bala.png"

	method atacar() {
	}

	method realidad() {
		position = position.up(1)
	}

}

