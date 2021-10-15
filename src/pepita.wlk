import wollok.game.*
import direcciones.*
import configuraciones.*
import niveles.*

//////////////////////////////////////////////////codigo temporal. Si hay que cambiar todo como ya dije ni lo duden //////////////////////////////////////////////////////////////
const jugador1 = new Jugador( position=game.at(3,3), nombreJugador ="jugador1")

class Jugador {																				
																						
	var property position 
	const nombreJugador
	var property image =nombreJugador+"abajo.png"
	var property orientacionAnterior=null
	
	method irHacia(orientacion){  														
			orientacionAnterior=orientacion											
			image=nombreJugador+orientacionAnterior.toString()+".png" 	
			orientacion.moverse(self) // se mueve 1 posicion para adelante											 
	}	
	method text() = position.toString()
	
	method textColor()= paleta.verde()
}

object paleta {
	const property verde = "00FF00FF"
	const property rojo = "FF0000FF"
}

 class Caja{
	 var property position= game.center() 
	 var property image= "caja.png"
	 
	method irHacia(direccion){ //(10) 
		self.cajaSonido()
		direccion.moverse(self)	// se mueve una posicion para adelante
	}
	
	method cajaSonido(){
		const cajaMoviendose =game.sound("caja_mover.mp3")
		cajaMoviendose.volume(0.1)
		cajaMoviendose.play()	
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