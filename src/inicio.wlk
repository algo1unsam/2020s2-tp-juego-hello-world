import wollok.game.*
import tanquesito.*
import movimientos.*
import balas.*
import enemigos.*
import muros.*
import levels.*

object carga {

	const property enemigos = []
	const property muros = []
	//const balas = []

	method creacion() {
		game.addVisual(tanquesito)
		level1.renderEnemies()
		enemigos.forEach({ e => e.crear()})
//		30.times({ i => muros.add(new Muro())})
		level1.renderBlocks()
		muros.forEach({ e => e.crear()})
		self.controles()
		
	}

	method controles() {
		keyboard.up().onPressDo({ tanquesito.cambiarTanque(up)})
		keyboard.down().onPressDo({ tanquesito.cambiarTanque(down)})
		keyboard.left().onPressDo({ tanquesito.cambiarTanque(left)})
		keyboard.right().onPressDo({ tanquesito.cambiarTanque(right)})
		keyboard.space().onPressDo({ tanquesito.ataque()})
		self.disparoEnemigo()
	}


	method disparoEnemigo() {
		enemigos.forEach({ t => t.activar()})
		//self.movimientoEnemigo()
	}

	/*method movimientoBala() {
		game.onTick(300, "movimiento bala", { balas.forEach({ t => t.realidad()})})
		self.movimientoEnemigo()
	}

	/*method crearBala(objeto) {
		balas.add(objeto)
		objeto.crear()
		objeto.colisionador()
	}*/

	//method movimientoEnemigo() {
	//	game.onTick(2000, "movimiento enemigos", { enemigos.forEach({ t => t.cambiarTanqueE(t.movimientos().anyOne())})})
	//}

	method eliminarEnemigo(tanqueE) {
		enemigos.remove(tanqueE)
	}

	/*method eliminarBala(bala) {
		balas.remove(bala)
	}*/

}

