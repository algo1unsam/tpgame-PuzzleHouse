import wollok.game.*
import pepita.*
import direcciones.*
import configuraciones.*

object nivel1 {
	method cargarNivel(){
		game.boardGround("pasto.png")
		game.addVisual( new Caja(position = game.center(), image="caja.png") )
		game.addVisual( new Caja(position = game.at(5,4) , image="caja.png") )
		
		game.addVisual( new Muro(position = game.at(5,5) , image="muro.png") )
		game.addVisual(jugador1)
	}
	
}