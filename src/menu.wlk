import wollok.game.*
import inicio.*

object menu {

	var property image = "menu.png"

	method cargar() {
		game.addVisualIn(self, game.at(0, 0))
		self.empezar()
	}

	method empezar() {
		keyboard.enter().onPressDo({ game.sound("begin.wav").play()
			game.removeVisual(self)
			carga.creacion()
		})
		keyboard.backspace().onPressDo({ game.stop()})
	}

}

