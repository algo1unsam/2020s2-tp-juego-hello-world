import wollok.game.*

class Muro {

	var property position = new Position(x = 0.randomUpTo(game.width()), y = 0.randomUpTo(game.height()))
	const property image = "muro.png"

	method identidad() {
		return "muro"
	}

}

