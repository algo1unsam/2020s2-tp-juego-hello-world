import wollok.game.*

object up { //eso estaba

	method mov(cosa) {
		// return if (cosa.position().y() < game.height() - 1) cosa.position().up(1) else cosa.position()
		if (cosa.position().y() < game.height() - 1) {
			return cosa.position().up(1)
		} else {
			return cosa.position()
		}
	}

	method mover(cosa) {
		return cosa.position().up(1)
	}

	method movString() {
		return "up"
	}

}

object down {

	method mov(cosa) {
		// return if (cosa.position().y() > 0) cosa.position().down(1) else cosa.position()
		if (cosa.position().y() > 0) {
			return cosa.position().down(1)
		} else {
			return cosa.position()
		}
	}

	method mover(cosa) {
		return cosa.position().down(1)
	}

	method movString() {
		return "down"
	}

}

object left {

	method mov(cosa) {
		// return if (cosa.position().x() > 0) cosa.position().left(1) else cosa.position()
		if (cosa.position().x() > 0) {
			return cosa.position().left(1)
		} else {
			return cosa.position()
		}
	}

	method mover(cosa) {
		return cosa.position().left(1)
	}

	method movString() {
		return "left"
	}

}

object right {

	method mov(cosa) {
		// return if (cosa.position().x() < game.width() - 1) cosa.position().right(1) else cosa.position()
		if (cosa.position().x() < game.width() - 1) {
			return cosa.position().right(1)
		} else {
			return cosa.position()
		}
	}

	method mover(cosa) {
		return cosa.position().right(1)
	}

	method movString() {
		return "right"
	}

}

