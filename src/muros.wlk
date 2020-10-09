import wollok.game.*

class Muro {

	var property position = new Position(x = 0.randomUpTo(39), y = 0.randomUpTo(24))
	const property image = "muro.png"

	method identidad() {
		return "muro"
	}

}

