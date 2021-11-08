import wollok.game.*
import direcciones.*
import configuraciones.*
import niveles.*
import objetos.*

class Jugador inherits Posicion{ //cambiar

	const nombreJugador
	
	var property resolucion
	var property tipo =3
	
	method image() = resolucion + "/" + nombreJugador.toString() + ultimaDireccion.toString() + ".png" //vean el string "nivel0" ,revisen porque lo puse asi. 
	
	
	
	override method cambiarPosicion(direccion) {
	
		ultimaDireccion = direccion
		self.position(direccion.moverse(self))
		sonidoObjeto.emitirSonido("pasosf.mp3")	
	
	}	
	method victoria(){
		sonidoObjeto.emitirSonido("victoriaFem.mp3")
	}							
	
	method text() = if (!configuraciones.libreMoviento()) {	""} else {"[ " + position.x().toString() + " , " + position.y().toString() + " ]"}

	method textColor() = paleta.verde()
	
	method esPisable() = false
	
	
	method llegoCheckpoint(){
		configuraciones.nivelActual().avanzarA()
	}
	override method hacerAlgo(direccion){
		configuraciones.elJugador().position(direccion.dirOpuesto(configuraciones.elJugador()))
		game.say(self,"que sucede?")
	}
	
	method retroceder(direccion){
		self.position(direccion.dirOpuesto(configuraciones.elJugador()))	
	}
}
	