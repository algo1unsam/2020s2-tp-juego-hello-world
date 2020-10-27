import wollok.game.*
import tanquesito.*
import movimientos.*
import balas.*
import enemigos.*
import muros.*

object carga {

	const enemigos = []
	const muros = []
	const balas = []

	method creacion() {
		game.addVisual(tanquesito)
		7.times({ i => enemigos.add(new TanqueEnemigo())})
		enemigos.forEach({ e => e.crear()})
		30.times({ i => muros.add(new Muro())})
		muros.forEach({ e => e.crear()})
	}

	method controles() {
		keyboard.up().onPressDo({ tanquesito.cambiarTanque(up)})
		keyboard.down().onPressDo({ tanquesito.cambiarTanque(down)})
		keyboard.left().onPressDo({ tanquesito.cambiarTanque(left)})
		keyboard.right().onPressDo({ tanquesito.cambiarTanque(right)})
		keyboard.space().onPressDo({ tanquesito.ataque()})
	}

	method disparoEnemigo() {
		game.onTick(5000, "disparo enemigos", { enemigos.forEach({ t => t.atacar()})})
	}

	method movimientoBala() {
		game.onTick(300, "movimiento bala", { balas.forEach({ t => t.realidad()})})
	}

	method crearBala(objeto) {
		balas.add(objeto)
		objeto.crear()
		objeto.colisionador()
	}

	method movimientoEnemigo() {
		game.onTick(2000, "movimiento enemigos", { enemigos.forEach({ t => t.cambiarTanqueE(t.movimientos().anyOne())})})
	}

	method eliminarEnemigo(tanqueE) {
		enemigos.remove(tanqueE)
	}

	method eliminarBala(bala) {
		balas.remove(bala)
	}

}

