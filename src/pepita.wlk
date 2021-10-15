import wollok.game.*

//////////////////////////////////////////////////codigo temporal. Si hay que cambiar todo como ya dije ni lo duden //////////////////////////////////////////////////////////////

const caja= new Caja(position=game.center(),image="caja.png")
const caja2=new Caja(position= game.at(5,4),image="caja.png")
const jugador1 = new Jugador( position=game.at(3,3), nombreJugador ="jugador1")


object izquierda{
	method moverse(unObjeto)=unObjeto.position(unObjeto.position().left(1))	
	method dirOpuesta(unObjeto)=unObjeto.position(unObjeto.position().right(1))
		
}
object derecha{
	
	method moverse(unObjeto)=unObjeto.position(unObjeto.position().right(1))   
	method dirOpuesta(unObjeto)=unObjeto.position(unObjeto.position().left(1))
}
object abajo{
	
	method moverse(unObjeto)= unObjeto.position(unObjeto.position().down(1))  					
	method dirOpuesta(unObjeto)=unObjeto.position(unObjeto.position().up(1))
}
object arriba{
	
	method moverse(unObjeto)=unObjeto.position(unObjeto.position().up(1))   						
	method dirOpuesta(unObjeto)=unObjeto.position(unObjeto.position().down(1))
}

class Jugador {																				
																						
	var property position 
	const nombreJugador
	var property image =nombreJugador+"abajo.png"
	var property orientacionAnterior=null
	
	method irHacia(orientacion){  														
			orientacionAnterior=orientacion											
			image=nombreJugador+orientacionAnterior.toString()+".png" 	
			orientacion.moverse(self) 											 
	}	
	method text() = position.toString()
	
	method textColor()= paleta.verde()
}

 class Caja{
	 var property position= game.center() 
	 var property image= "caja.png"
	 
	method irHacia(direccion){ //(10) 
		self.cajaSonido()
		direccion.moverse(self)	
	}
	
	method cajaSonido(){
		const cajaMoviendose =game.sound("caja_mover.mp3")
		cajaMoviendose.volume(0.1)
		cajaMoviendose.play()	
	}		
}
object muro{
	var property image="muro.png"
	var property position=game.at(5,5)

	method irHacia(direccion){ //no se que tan bien esta esto ,pero es solo para mantener polimorfismo
		direccion.dirOpuesta(jugador1)
	}	
}

object paleta {
	const property verde = "00FF00FF"
	const property rojo = "FF0000FF"
}

