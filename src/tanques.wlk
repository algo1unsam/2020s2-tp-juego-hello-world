import wollok.game.*

object tanquesito {

	var property position = new Position(x = 2, y = 2)
	var property image = "tank_up.png"

}

class Muro {

	var property position = new Position(x = 0.randomUpTo(39), y = 0.randomUpTo(24))
	const property image = "muro.png"

}

class TanqueEnemigo {

	var property position = new Position(x = 0.randomUpTo(39), y = 0.randomUpTo(24))
	var property image = "enemy_up.png"

}

