import wollok.game.*


const caja= new Caja(position=game.center(),image="caja.png")
const caja2=new Caja(position= game.at(2,4),image="caja.png")
const jugador1 = new Jugador( position=game.at(3,3), nombreJugador ="jugador1")

//quizas en un futuro tanto los 4 objetos direccion se conviertan en clases y tengamos que aplicar herencia tambien ,pero por ahora no lo veo necesario
object izquierda{
	
	method moverse(unObjeto){
		unObjeto.position(unObjeto.position().left(1))	// (5a) mueve a un objeto hacia la izquierda 
	}	
}
object derecha{
	
	method moverse(unObjeto){
	
		unObjeto.position(unObjeto.position().right(1))    //(5b) mueve a un objeto hacia la derecha 
		
	}
}
object abajo{
	
	method moverse(unObjeto){

		unObjeto.position(unObjeto.position().down(1))  //(5c) mueve a un objeto hacia abajo
		
	}
}
object arriba{
	
	method moverse(unObjeto){
	
		unObjeto.position(unObjeto.position().up(1))   //(5c) mueve a un objeto hacia arriba 	
	}	
}

class Jugador { //macaria y moira deberian moverse al igual que pepe ("nombre provisorio porque ayer probando un juego de un cuatrimestre pasado me di cuenta que el personaje tambien se llamaba pepe jaja)
				//sin embargo recordemos que hay cosas que moira y macaria no pueden hacer que pepe si ,creo que aca entraria herencia para un futuro
	var property position 
	const nombreJugador
	var property image =nombreJugador+"abajo.png"
	var ultimaPosicion = null
	
	
	method irHacia(direccion){  	// (2)recibe la "direccion". Direccion es un objeto que contiene un metodo que puede mover a los objetos en una direccion , existen 4 objetos direcciones(arriba,abajo,izquierda y derecha)
			ultimaPosicion=direccion //(3)ese por lo tanto sera nuestro ultimo movimiento. Ultimaposicion ( el nombre del metodo podriamos cambiarlo si quieren) lo que hace es guardar el ultimo movimiento del jugador . Si nos movimos hacia arriba ,entonces guardara al objeto arriba para luego ser utilizado para algun mensaje  
			direccion.moverse(self) // (4)se envia como parametro a si mismo  porque  el metodo "moverse" del objeto direccion (ya sea arriba ,abajo, izquierda o derecha) realiza una modificacion en la pocicion del jugador
			image=nombreJugador+ultimaPosicion.toString()+".png" // (6)  Si  la variable nombreJugador es = "jugador1" ,el objeto direccion =arriba y concatenamos todo con el string "png" formamos jugador1arriba.png que como ven coincide con el asset que muestra al personaje de espalda. 
	}
	
	method ultimaPosicion(){ //(9)
		return ultimaPosicion
	}

}

//idea para el futuro , tanto caja1 como caja 2 deben estar en una lista . Cuando las cajas llegan a su meta hay que preguntar con colecciones si todos estan en la "cruz"

 

 class Caja{
	 var property position= game.center() 
	 var property image= "caja.png"
	  
	method irHacia(direccion){ //(10) 
		direccion.moverse(self)	
	}
			
}


