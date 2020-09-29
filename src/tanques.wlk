import wollok.game.*

object tanquesito {

	var property position = new Position(x = 2, y = 2)
	var property image = "tank2.png"

}

class Muro {

	var property position = new Position(x = 0.randomUpTo(20), y = 0.randomUpTo(20))
	const property image = "muro.png"

}

