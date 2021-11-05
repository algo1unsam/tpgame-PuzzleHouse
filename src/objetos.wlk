import wollok.game.*
import direcciones.*
import configuraciones.*
import niveles.*
import jugador.*

//configuraciones.nivelActual().listaMeta().any{ unaMeta => unaMeta.position() == self.position() && unaMeta.tipo() == self.tipo() }
object sonidoObjeto { ///Me parece que queda mejor como objeto que como clase

	method emitirSonido(unSonido) {
		const sonido = game.sound(unSonido)
		sonido.volume(0.3)
		sonido.play()
	}

}

class Posicion {

	var property position
	const property posicionInicial = position

	method posicioninicial() {
		sonidoObjeto.emitirSonido("reinicio.mp3")
		self.position(posicionInicial)
	}

	method hacerAlgo(direccion) {
		self.cambiarPosicion(direccion)
	}

	method cambiarPosicion(direccion)

}

class Caja inherits Posicion {

	const resolucion = "menorResolucion"
	const caja = "caja1.png"
	const cajaEnMeta = "caja_ok.png"
	const property tipo = 1

	method esPisable() = false

	method image() = if (self.llegoMeta()) {
		resolucion + "/" + cajaEnMeta
	} else {
		resolucion + "/" + caja
	} // estif (self.llegoMeta()) {"nivel0/caja_ok.png"}else{"nivel0/caja2.png"}

	override method cambiarPosicion(direccion) {
		const siguienteUbicacion = direccion.moverse(self)
		if (self.proximaUbicacionLibre(siguienteUbicacion)) {
			self.position(direccion.moverse(self))
			configuraciones.nivelActual().verificarMetas()
		} else {
			configuraciones.elJugador().retroceder(direccion)
		}
		sonidoObjeto.emitirSonido("caja_mover2.mp3")
	}

	method proximaUbicacionLibre(direccion) = game.getObjectsIn(direccion).all{ unObj => unObj.esPisable() }

	method llegoMeta() = game.colliders(self).any{ unaMeta => unaMeta.position() == self.position() && unaMeta.tipo() == self.tipo() } // configuraciones.nivelActual().listaMeta().any{ unaMeta => unaMeta.position() == self.position() && unaMeta.tipo() == self.tipo() }

}
class MuroVisible inherits Posicion {

	const property tipo = 6
	var property image = "menorResolucion/muro.png"

	method esPisable() = false

	override method cambiarPosicion(direccion) {
		configuraciones.elJugador().retroceder(direccion)
	}
}

class Pisable {

	var property position
	var property image

	method esPisable() = true

	method hacerAlgo(direccion) {
	}

}

class Checkpoint inherits Pisable {

	const property tipo = 6

}

class Meta inherits Pisable {

	var property tipo = 1

}

class Checkpoint1 inherits Checkpoint {

	override method position() = game.at(3, 2)

}

object paleta {

	const property verde = "00FF00FF"
	const property rojo = "FF0000FF"

}


