import wollok.game.*
import muros.*
import enemigos.*
import inicio.*
import menu.*
import tanquesito.*

object level1 {
	const bloques=[[1,1],[1,2],[1,3],[1,7],[1,8],[1,9],[2,5],[3,2],[3,3],[3,5],[3,7],[3,8],[3,9],[5,2],[5,3],[5,5],
		[5,7],[5,8],[5,9],[6,3],[7,2],[7,3],[7,5],[7,7],[7,8],[7,9],[9,1],[9,2],[9,3],[9,7],[9,8],[9,9],[10,5],[11,1],
		[11,2],[11,3],[11,5],[11,7],[11,8],[11,9]
	]
	//const posicionesInciales = [game.at(0,10),game.at(12,10),game.at(6,10)]
	
	method renderBlocks(){
		bloques.forEach({bloque=>carga.muros().add(new Ladrillo(position=game.at(bloque.head(),bloque.last())))})
	}
	
	method renderEnemies() {
		
		const posicionesIniciales = [game.at(0,10),game.at(12,10),game.at(6,10)]
		var tanqueEnemigos
		
		const tipoEnemigo = [{tanqueEnemigos=new TanqueEnemigo(position=posicionesIniciales.anyOne())},
		{tanqueEnemigos= new TanqueEnemigoAtkSpeed(position=posicionesIniciales.anyOne())},
		{tanqueEnemigos= new TanqueEnemigo3HP(position=posicionesIniciales.anyOne())}]
		
		//carga.enemigos().add(new TanqueEnemigo(position=new Position(x=12,y=10)))
		//carga.enemigos().add(new TanqueEnemigo(position=new Position(x=6,y=10)))
		//game.schedule(10000, {=>	carga.enemigos().add(tanqueE1)
		//tanqueE1.crear()})
		
		game.onTick(13000, "generacio Enemigos",{=> tipoEnemigo.anyOne().apply()
			game.addVisual(tanqueEnemigos)
			tanqueEnemigos.activar()
		})

		/*carga.enemigos().add(new TanqueEnemigo(position=new Position(x=0,y=10)))
		carga.enemigos().add(new TanqueEnemigo(position=new Position(x=12,y=10)))
		carga.enemigos().add(new TanqueEnemigo(position=new Position(x=6,y=10)))*/
		
		
		}
}

object perdiste {
	var property image= "gameOver.jpg"
	var property position = game.at(0,0)

		method gameOver() {
			game.clear()
			game.addVisual(self)
			game.addVisual(tanquesito)
			game.say(tanquesito, "Tu puntaje "+ tanquesito.puntosGanados()) 
		    keyboard.enter().onPressDo{
			game.clear()
			menu.cargar()}
	}
}
