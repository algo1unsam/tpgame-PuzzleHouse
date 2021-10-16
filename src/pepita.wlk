import wollok.game.*
import direcciones.*
import configuraciones.*
import niveles.*

//////////////////////////////////////////////////codigo temporal. Si hay que cambiar todo como ya dije ni lo duden //////////////////////////////////////////////////////////////
const jugador1 = new Jugador( position=game.at(2,1), nombreJugador ="jugador1")

class ObjetoMovible {

	method emitirSonido(unSonido){
		const sonido =game.sound(unSonido)
		sonido.volume(0.1)
		sonido.play()	
		
	}
	
}

class Jugador  inherits ObjetoMovible {																				
																						
	var property position 
	const posicionInicial= position
	const nombreJugador
	var property image =nombreJugador+"abajo.png"
	var property orientacionAnterior=null

	
	method irHacia(orientacion){  														
			orientacionAnterior=orientacion											
			image=nombreJugador+orientacionAnterior.toString()+".png"
			self.emitirSonido("pasosf.mp3") 	//si resulta muy molesto o lo pueden sacar o pueden poner pasos.mp3 () . El pasosf.mp3 es el mismo sonido que el anterior pero esta editado para que suene mas fuerte
			
			orientacion.moverse(self) // se mueve 1 posicion para adelante											 
	}	
	method text() = position.toString()
	
	method textColor()= paleta.verde()
	
	method posicioninicial() {
		self.emitirSonido("reinicio.mp3")
		self.position(posicionInicial)
	}
}

object paleta {
	const property verde = "00FF00FF"
	const property rojo = "FF0000FF"
}

 class Caja inherits ObjetoMovible{
	 var property position= game.center() 
	 var property image= "caja.png"
	 const posicionInicial= position
	 
	method irHacia(direccion){ //(10) 
		self.emitirSonido("caja_mover.mp3")
		direccion.moverse(self)	// se mueve una posicion para adelante
	}
	
	
	
	method posicioninicial() {
		self.position(posicionInicial)
	}
	
		
}

class Muro{
	/* Para volver al muro anterior borarr comentario de abajo */
	//var property image="muro.png"
	var property position

	method irHacia(direccion){ //no se que tan bien esta esto ,pero es solo para mantener polimorfismo
		direccion.dirOpuesta(jugador1) // se mueve una posicion para atras
	}	
}