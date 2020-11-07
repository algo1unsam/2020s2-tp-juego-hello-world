import wollok.game.*
import movimientos.*
import inicio.*
import enemigos.*
import tanquesito.*

class Bala {

	var property direccion = down
	var property position
	var property image = null
	//const movimiento
	//const property movimientos = [ down, down, up, left, right ]
	
	
	method disparada(direccion_){
		self.direccion(direccion_)
		self.image("bala_"+direccion_+".png")
		
		game.addVisual(self)
		

		game.onTick(50, "balaMoviendose"+self.identity().toString(), { => 
			self.realidad()
			
		})			
		self.colisionador()
	
	}

	method realidad() {
		position = direccion.mover(self)
	}

	method colisionador() {
		game.onCollideDo(self, { c =>
			c.chocado()
			//game.removeTickEvent("balaMoviendose"+self.identity().toString())
			game.removeVisual(self)
		})
		game.onTick(800, "eliminar balaMoviendose"+self.identity().toString(), { =>self.eliminar()})
		}
			
			
	method eliminar(){		
		game.removeTickEvent("balaMoviendose"+self.identity().toString())
		game.removeTickEvent("eliminar balaMoviendose"+self.identity().toString())	
	}

	method chocado() {
		game.removeVisual(self)
	}

	/*method chocadoPorEnemigo() {
		carga.eliminarBala(self)
		game.removeVisual(self)
	}

	method cambiarTanqueE(valor) {
	}

	/*method crear() {
		game.addVisual(self)
	}*/


}

class BalaEnemigos inherits Bala {

	override method colisionador() {
		game.onCollideDo(self, { c =>
			c.chocadoPorEnemigo()
				game.removeVisual(self)
		})
		game.onTick(800, "eliminar balaMoviendose"+self.identity().toString(), { =>self.eliminar()})
	}

}

