import wollok.game.*
import direcciones.*
import configuraciones.*
import niveles.*
import jugador.*


class SonidosDeObjetos { //esto por ahora es temporal

	method emitirSonido(unSonido) {
		const sonido = game.sound(unSonido)
		sonido.volume(0.1)
		sonido.play()
	}

}


//idea para el futuro , tanto caja1 como caja 2 deben estar en una lista . Cuando las cajas llegan a su meta hay que preguntar con colecciones si todos estan en la "cruz"
class Caja inherits SonidosDeObjetos {
	const resolucion
	const caja
	const cajaEnMeta
	var property position = game.center()

	const property tipo = 1
	const posicionInicial = position
	

	method esPisable() = false

	method posicioninicial() {
		
		
		
		self.emitirSonido("reinicio.mp3")
		self.position(posicionInicial)
		
	}
	method image() = if (self.llegoMeta()) {resolucion+"/"+cajaEnMeta}else{resolucion+"/"+caja} //estif (self.llegoMeta()) {"nivel0/caja_ok.png"}else{"nivel0/caja2.png"}
								  
		
	method cambiarPosicion(direccion) {
		const siguienteUbicacion = direccion.moverse(self)
		if (self.proximaUbicacionLibre(siguienteUbicacion)) {
			self.position(direccion.moverse(self))
			configuraciones.nivelActual().verificarMetas()
		} else {
			configuraciones.elJugador().position(direccion.dirOpuesto(configuraciones.elJugador()))
		}
		self.emitirSonido("caja_mover.mp3")
	}
	method hacerAlgo(direccion) {
		self.cambiarPosicion(direccion)
	}
	method proximaUbicacionLibre(direccion) = game.getObjectsIn(direccion).all{ unObj => unObj.esPisable() }


	method llegoMeta() {
		if (configuraciones.nivelActual().listaMeta().any{ unaMeta => unaMeta.position() == self.position() && !(unaMeta.tipo() == self.tipo()) }) {
			//self.emitirSonido("ouch.mp3")
		}
		return configuraciones.nivelActual().listaMeta().any{ unaMeta => unaMeta.position() == self.position() && unaMeta.tipo() == self.tipo() }
	}
}

class Muro inherits SonidosDeObjetos{

	var property position = game.at(4, 5)

//	var property image = "muro.png"
	method esPisable() = false

	method cambiarPosicion(direccion) {
		configuraciones.elJugador().position(direccion.dirOpuesto(configuraciones.elJugador()))
		
	
	}
	method hacerAlgo(direccion){
		self.cambiarPosicion(direccion)
	}

}

class MuroVisible  inherits SonidosDeObjetos{

	var property position = game.at(4, 5)
	var property image = "nivel1/muro.png"

	method esPisable() = false



	method cambiarPosicion(direccion) {
		configuraciones.elJugador().position(direccion.dirOpuesto(configuraciones.elJugador()))
	}
	method hacerAlgo(direccion){
		self.cambiarPosicion(direccion)
		
	}

}

class Checkpoint {

	var property position
	var property image = "nivel0/checkpoint.png"

	method esPisable() = true
	
	method hacerAlgo(direccion){
		
	}

}

class Meta {

	var property position = game.at(7, 7)
	var property image = "nivel1/meta1.png"
	var property tipo = 1

	method esPisable() = true

	
	method hacerAlgo(direccion){
		
	}

}

object checkpoint1 inherits Checkpoint (position = game.at(3, 2)) {
	override method hacerAlgo(direccion){
	}

}



object paleta {

	const property verde = "00FF00FF"
	const property rojo = "FF0000FF"

}

