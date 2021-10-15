import wollok.game.*
import pepita.*
import direcciones.*
import configuraciones.*

object nivel1 {
	method cargarNivel(){
		game.boardGround("prueba.png")
		game.addVisual( new Caja(position = game.center(), image="caja.png") )
		game.addVisual( new Caja(position = game.at(5,4) , image="caja.png") )
		/* Para volver al muro anterior borarr comentario de abajo */
		//game.addVisual( new Muro(position = game.at(5,5), image="muro.png" ) )
		
		/* Muros invisibles */
		/* VERTICAL */
		game.addVisual( new Muro(position = game.at(0,5) ) )
		game.addVisual( new Muro(position = game.at(0,4) ) )
		game.addVisual( new Muro(position = game.at(0,3) ) )
		game.addVisual( new Muro(position = game.at(0,2) ) )
		game.addVisual( new Muro(position = game.at(0,1) ) )
		
		game.addVisual( new Muro(position = game.at(13,1) ) )
		game.addVisual( new Muro(position = game.at(13,4) ) )
		game.addVisual( new Muro(position = game.at(13,5) ) )	
		
		/* HORIZONTAL */
		game.addVisual( new Muro(position = game.at(1,0) ) )
		game.addVisual( new Muro(position = game.at(2,0) ) )
		game.addVisual( new Muro(position = game.at(3,0) ) )
		game.addVisual( new Muro(position = game.at(4,0) ) )
		game.addVisual( new Muro(position = game.at(5,0) ) )
		game.addVisual( new Muro(position = game.at(6,0) ) )
		game.addVisual( new Muro(position = game.at(7,0) ) )
		game.addVisual( new Muro(position = game.at(8,0) ) )
		game.addVisual( new Muro(position = game.at(9,0) ) )
		game.addVisual( new Muro(position = game.at(10,0) ) )
		game.addVisual( new Muro(position = game.at(11,0) ) )
		game.addVisual( new Muro(position = game.at(12,0) ) )
		
		game.addVisual( new Muro(position = game.at(1,6) ) )
		game.addVisual( new Muro(position = game.at(2,6) ) )
		game.addVisual( new Muro(position = game.at(3,6) ) )
		game.addVisual( new Muro(position = game.at(4,6) ) )
		game.addVisual( new Muro(position = game.at(5,6) ) )
		game.addVisual( new Muro(position = game.at(6,6) ) )
		game.addVisual( new Muro(position = game.at(7,6) ) )
		game.addVisual( new Muro(position = game.at(8,6) ) )
		game.addVisual( new Muro(position = game.at(9,6) ) )
		game.addVisual( new Muro(position = game.at(10,6) ) )
		game.addVisual( new Muro(position = game.at(11,6) ) )
		game.addVisual( new Muro(position = game.at(12,6) ) )
				
		game.addVisual(jugador1)
	}
	
}