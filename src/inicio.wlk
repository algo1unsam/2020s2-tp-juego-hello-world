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

	method creacion() {
		game.addVisual(tanquesito)
		level1.renderEnemies()
		//enemigos.forEach({ e => e.crear()})
		level1.renderBlocks()
		muros.forEach({ e => e.crear()})
		self.controles()
		//self.movimientoEnemigo()
		//self.disparoEnemigo()
		//self.movimientos()
	}

	method controles() {
		keyboard.up().onPressDo({ tanquesito.cambiarTanque(up)})
		keyboard.down().onPressDo({ tanquesito.cambiarTanque(down)})
		keyboard.left().onPressDo({ tanquesito.cambiarTanque(left)})
		keyboard.right().onPressDo({ tanquesito.cambiarTanque(right)})
		keyboard.space().onPressDo({ tanquesito.ataque()})
	}

	/*method disparoEnemigo() {
		game.onTick(2000, "disparo enemigos", { enemigos.forEach({ t => t.atacar()})})
	}
	
	method movimientos(){
		enemigos.forEach({t => t.activar()})
	}

	/*method movimientoEnemigo() {
		game.onTick(2000, "movimiento enemigos", { enemigos.forEach({ t => t.cambiarTanqueE(t.movimientos().anyOne())})})
	}*/

	/*method eliminarEnemigo(tanqueE) {
		enemigos.remove(tanqueE)
	}*/


}

