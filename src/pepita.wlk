import wollok.game.*
import configuraciones.*
import niveles.*

const jugador1 = new Jugador(position = game.at(3, 3), nombreJugador = "jugador1")

class ObjetoMovible {

	method emitirSonido(unSonido) {
		const sonido = game.sound(unSonido)
		sonido.volume(0.1)
		sonido.play()
	}

}

//quizas en un futuro tanto los 4 objetos direccion se conviertan en clases y tengamos que aplicar herencia tambien ,pero por ahora no lo veo necesario
class Jugador inherits ObjetoMovible { //macaria y moira deberian moverse al igual que pepe ("nombre provisorio porque ayer probando un juego de un cuatrimestre pasado me di cuenta que el personaje tambien se llamaba pepe jaja)
	// sin embargo recordemos que hay cosas que moira y macaria no pueden hacer que pepe si ,creo que aca entraria herencia para un futuro

	var property position
	const nombreJugador
	var property image = nombreJugador + "abajo.png"
	var ultimaPosicion = null
	const posicionInicial = position

	method irHacia(direccion) { // (2)recibe la "direccion". Direccion es un objeto que contiene un metodo que puede mover a los objetos en una direccion , existen 4 objetos direcciones(arriba,abajo,izquierda y derecha)
		ultimaPosicion = direccion // (3)ese por lo tanto sera nuestro ultimo movimiento. Ultimaposicion ( el nombre del metodo podriamos cambiarlo si quieren) lo que hace es guardar el ultimo movimiento del jugador . Si nos movimos hacia arriba ,entonces guardara al objeto arriba para luego ser utilizado para algun mensaje  
		direccion.moverse(self) // (4)se envia como parametro a si mismo  porque  el metodo "moverse" del objeto direccion (ya sea arriba ,abajo, izquierda o derecha) realiza una modificacion en la pocicion del jugador
		image = nombreJugador + ultimaPosicion.toString() + ".png" // (6)  Si  la variable nombreJugador es = "jugador1" ,el objeto direccion =arriba y concatenamos todo con el string "png" formamos jugador1arriba.png que como ven coincide con el asset que muestra al personaje de espalda. 
		self.emitirSonido("pasosf.mp3")
	}

	method ultimaPosicion() { // (9)
		return ultimaPosicion
	}

	method posicioninicial() {
		self.emitirSonido("reinicio.mp3")
		self.position(posicionInicial)
	}
	
	method text() = position.toString()

	method textColor() = paleta.verde()
	

}

//idea para el futuro , tanto caja1 como caja 2 deben estar en una lista . Cuando las cajas llegan a su meta hay que preguntar con colecciones si todos estan en la "cruz"
class Caja inherits ObjetoMovible {

	var property position = game.center()
	const posicionInicial = position
	var property image = "caja.png"

	method irHacia(direccion) { // (10) 
		self.emitirSonido("caja_mover.mp3")
		direccion.moverse(self)
		
		if(self. DosObjEnUnaMismaPosicion()){
			direccion.dirOpuesta(self)
			direccion.dirOpuesta(jugador1)	
		}
	
	
	}
	

	
	method DosObjEnUnaMismaPosicion(){
		return game.getObjectsIn(position).size()>1		
	}

	method posicioninicial() {
		
		self.emitirSonido("reinicio.mp3")
		self.position(posicionInicial)
	}

}

object paleta {

	const property verde = "00FF00FF"
	const property rojo = "FF0000FF"

}



class Muro {

	/* Para volver al muro anterior borarr comentario de abajo */
	// var property image="muro.png"
	var property position

	method irHacia(direccion) { // no se que tan bien esta esto ,pero es solo para mantener polimorfismo
		direccion.dirOpuesta(jugador1) // se mueve una posicion para atras
	}

}





