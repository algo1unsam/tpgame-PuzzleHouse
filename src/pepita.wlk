import wollok.game.*
import configuraciones.*
import niveles.*

const jugador1 = new Jugador(position = game.at(3, 3), nombreJugador = "jugador1")



//Como pueden ver se repite masomenos la logica en los objetos ,solo que tienen variaciones. Se que esto se puede solucoionar, Si alguno esta canchero con herencia ya sabe
class ObjetoMovible {

	var property atravesable = false

	method emitirSonido(unSonido) {
		const sonido = game.sound(unSonido)
		sonido.volume(0.1)
		sonido.play()
	}
	
}

class Jugador inherits ObjetoMovible {

	var property position
	const nombreJugador
	var property image = nombreJugador + "abajo.png"
	var ultimaPosicion = null
	const posicionInicial = position

	method irHacia(direccion) {
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

	method text() {
		if (!libreMovimiento.activado()) {
			return ""
		} else {
			return "[ " + position.x().toString() + " , " + position.y().toString() + " ]"
		}
	}

	method textColor() = paleta.verde()

}

//idea para el futuro , tanto caja1 como caja 2 deben estar en una lista . Cuando las cajas llegan a su meta hay que preguntar con colecciones si todos estan en la "cruz"
class Caja inherits ObjetoMovible {

	var property position = game.center()
	const posicionInicial = position
	var property image = "caja.png"

	method irHacia(direccion) { // (10) 
		if (!libreMovimiento.activado()) {    //Esto esta tambien en la clase muro . Para la version final este if va a desaparecer. Sirve basicamente para desahibilitar cualquier accion que haga el objeto cuando el jugador colisiona con el. Permitiendole asi al jugador moverse libremente por el mapa. Se activa y se desactiva con la Z.
													 //quise implementarlo en configuraciones pero por razones que desconosco en el  juego no me hacia caso cuando apretaba la Z. 
			
			self.emitirSonido("caja_mover.mp3")
			direccion.moverse(self)
			if (self.DosObjEnUnaMismaPosicion()) {
				direccion.dirOpuesta(self)
				direccion.dirOpuesta(jugador1)
			}
		}
	}

	method DosObjEnUnaMismaPosicion() {
		return game.getObjectsIn(position).size() > 1
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
		if (!libreMovimiento.activado()) {
			direccion.dirOpuesta(jugador1) // se mueve una posicion para atras
		}
	}

}

object libreMovimiento {
	var numero = 1
	

	method cambio() {
		numero += 1
	}

	method activado() {
		return numero % 2 == 0
	}


}





