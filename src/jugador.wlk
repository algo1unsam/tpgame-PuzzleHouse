import wollok.game.*
import direcciones.*
import configuraciones.*
import niveles.*
import objetos.*


class Jugador  { //cambiar

	var property position
	const nombreJugador
	var property ultimaDireccion = abajo
	var property posicionInicial = position
	var property tamanio

	method image() = tamanio + "/" + nombreJugador.toString() + ultimaDireccion.toString() + ".png" //vean el string "nivel0" ,revisen porque lo puse asi. 
	
	method cambiarPosicion(direccion) {
	
		ultimaDireccion = direccion
		self.position(direccion.moverse(self))
		SonidoObjeto.emitirSonido("pasosf.mp3")	
	
	}	
	method victoria(){
		SonidoObjeto.emitirSonido("victoriaFem.mp3")
	}							
	
	method posicioninicial() {
		SonidoObjeto.emitirSonido("reinicio.mp3")
		self.position(posicionInicial) 
	}
	
	method text() = if (!configuraciones.libreMoviento()) {	""} else {"[ " + position.x().toString() + " , " + position.y().toString() + " ]"}

	method textColor() = paleta.verde()
	
	method esPisable() = false
	
	method desbloquear(sombra){
		try 
			game.removeVisual( sombra )
		catch e {}		
		
	}
	
	method llegoCheckpoint(){
		configuraciones.nivelActual().avanzarA()
	}
	method hacerAlgo(direccion){
		configuraciones.elJugador().position(direccion.dirOpuesto(configuraciones.elJugador()))
		game.say(self,"que sucede?")
	}
}
	