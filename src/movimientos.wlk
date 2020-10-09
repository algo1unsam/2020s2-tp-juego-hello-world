import wollok.game.*

object up {

	method mov(cosa) {
		return cosa.position().up(1)
	}

	method movString() {
		return "up"
	}

}

object down {

	method mov(cosa) {
		return cosa.position().down(1)
	}

	method movString() {
		return "down"
	}

}

object left {

	method mov(cosa) {
		return cosa.position().left(1)
	}

	method movString() {
		return "left"
	}

}

object right {

	method mov(cosa) {
		return cosa.position().right(1)
	}

	method movString() {
		return "right"
	}

}

