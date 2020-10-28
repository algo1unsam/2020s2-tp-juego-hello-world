import wollok.game.*
import muros.*
import enemigos.*
import inicio.*

object level1 {
	const bloques=[[1,1],[1,2],[1,3],[1,7],[1,8],[1,9],[2,5],[3,2],[3,3],[3,5],[3,7],[3,8],[3,9],[5,2],[5,3],[5,5],
		[5,7],[5,8],[5,9],[6,3],[7,2],[7,3],[7,5],[7,7],[7,8],[7,9],[9,1],[9,2],[9,3],[9,7],[9,8],[9,9],[10,5],[11,1],
		[11,2],[11,3],[11,5],[11,7],[11,8],[11,9]
	]
	
	method renderBlocks(){
		bloques.forEach({bloque=>carga.muros().add(new Muro(position=game.at(bloque.head(),bloque.last())))})
	}
	method renderEnemies() {		
		carga.enemigos().add(new TanqueEnemigo(position=new Position(x=0,y=10)))
		carga.enemigos().add(new TanqueEnemigo(position=new Position(x=0,y=6)))
		carga.enemigos().add(new TanqueEnemigo(position=new Position(x=11,y=6)))
	}
}
