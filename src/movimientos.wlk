import wollok.game.*

object up {

	method mov(cosa) {
		return if(cosa.identidad()=="bala"||cosa.position().y()<game.height()-1) cosa.position().up(1)
		else cosa.position()
	}

	method movString() {
		return "up"
	}

}

object down {

	method mov(cosa) {
		return if(cosa.identidad()=="bala"||cosa.position().y()>0) cosa.position().down(1)
		else cosa.position()
	}

	method movString() {
		return "down"
	}

}

object left {

	method mov(cosa) {
		return if(cosa.identidad()=="bala"||cosa.position().x()>0) cosa.position().left(1)
		else cosa.position()
	}

	method movString() {
		return "left"
	}

}

object right {

	method mov(cosa) {
		return if(cosa.identidad()=="bala"||cosa.position().x()<game.width()-1) cosa.position().right(1)
		else cosa.position()
	}

	method movString() {
		return "right"
	}

}

