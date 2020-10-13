import wollok.game.*
import movimientos.*
import balas.*

class TanqueEnemigo {

	var property position = new Position(x = 0.randomUpTo(game.width()), y = 0.randomUpTo(game.height()))
	var property image = "enemy_up.png"
	var ultimoMovimiento = up
	var ultimaPosicion = position
	const property movimientos =[up,down,left,right]

	method identidad() {
		return "enemigo"
	}

	method atacar() {
		if (self.randomizer(10) == 4) game.addVisual(new Bala(position = ultimaPosicion, image = "bala" + image.drop(5), movimiento = ultimoMovimiento))
	}

	method realidad() {
	}

//	method moverse() {
//		if (self.randomizer(3) == 0) {
//			if(self.position().y()!=game.height()-1){
//				position = self.position().up(1)
//				ultimaPosicion = self.position().up(1)
//				ultimoMovimiento = up
//			}			
//			image = "enemy_up.png"
//		} else {
//			if (self.randomizer(3) == 1) {
//				if(self.position().y()!=0){
//					position = self.position().down(1)
//					ultimaPosicion = self.position().down(1)
//					ultimoMovimiento = down
//				}				
//				image = "enemy_down.png"
//			} else {
//				if (self.randomizer(3) == 2) {
//					if(self.position().x()!=0){
//						position = self.position().left(1)
//						ultimaPosicion = self.position().left(1)
//						ultimoMovimiento = left
//					}					
//					image = "enemy_left.png"
//				} else {
//					if (self.randomizer(3) == 3) {
//						if(self.position().x()!=game.width()-1){
//							position = self.position().right(1)
//							ultimaPosicion = self.position().right(1)
//							ultimoMovimiento = right
//						}						
//						image = "enemy_right.png"
//					} else {
//					}
//				}
//			}
//		}
//	}
	
	method cambiarTanque(apunta) {
		image = "enemy_" + apunta.movString() + ".png"
		ultimaPosicion = apunta.mov(self)
		if (game.getObjectsIn(apunta.mov(self)).isEmpty()) {
			self.position(apunta.mov(self))			
			ultimoMovimiento = apunta
		}
	}

	method randomizer(valor) {
		return 0.randomUpTo(valor).roundUp()
	}

}

