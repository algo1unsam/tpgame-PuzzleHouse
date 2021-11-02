import wollok.game.*
import direcciones.*
import configuraciones.*
import niveles.*
import jugador.*

object sonidoObjeto { ///Me parece que queda mejor como objeto que como clase

	method emitirSonido(unSonido) {
		const sonido = game.sound(unSonido)
		sonido.volume(0.3)
		sonido.play()
	}
}

class Caja   {

	const resolucion="menorResolucion"
	const caja="caja1.png"
	const cajaEnMeta ="caja_ok.png"
	var property position = game.center()
	const property tipo = 1
	const posicionInicial = position

	method esPisable() = false

	method posicioninicial() {
		sonidoObjeto.emitirSonido("reinicio.mp3")
		self.position(posicionInicial)
	}

	method image() = if (self.llegoMeta()) {resolucion + "/" + cajaEnMeta} else {resolucion + "/" + caja} // estif (self.llegoMeta()) {"nivel0/caja_ok.png"}else{"nivel0/caja2.png"}

	method cambiarPosicion(direccion) {
		const siguienteUbicacion = direccion.moverse(self)
		if (self.proximaUbicacionLibre(siguienteUbicacion)) {
			self.position(direccion.moverse(self))
			configuraciones.nivelActual().verificarMetas()
		} else {
			configuraciones.elJugador().position(direccion.dirOpuesto(configuraciones.elJugador()))
		}
		sonidoObjeto.emitirSonido("caja_mover2.mp3")
	}

	method hacerAlgo(direccion) {
		self.cambiarPosicion(direccion)
	}

	method proximaUbicacionLibre(direccion) = game.getObjectsIn(direccion).all{ unObj => unObj.esPisable() }

	method llegoMeta() = game.colliders(self).any{ unaMeta => unaMeta.position() == self.position() && unaMeta.tipo() == self.tipo() }
	

}

class Muro  {

	var property position = game.at(4, 5)
	const property tipo = 6
//	var property image = "muro.png"
	method esPisable() = false

	method cambiarPosicion(direccion) {
		configuraciones.elJugador().position(direccion.dirOpuesto(configuraciones.elJugador()))
	}

	method hacerAlgo(direccion) {
		self.cambiarPosicion(direccion)
	}

}

class MuroVisible   {
	const property tipo = 6
	var property position = game.at(4, 5)
	var property image = "menorResolucion/muro.png"

	method esPisable() = false

	method cambiarPosicion(direccion) {
		configuraciones.elJugador().position(direccion.dirOpuesto(configuraciones.elJugador()))
	}

	method hacerAlgo(direccion) {
		self.cambiarPosicion(direccion)
	}

}

class Checkpoint {
	const property tipo = 6
	var property position
	var property image = "menorResolucion/checkpoint.png"

	method esPisable() = true

	method hacerAlgo(direccion) {
	}

}

class Meta {

	var property position = game.at(7, 7)
	var property image = "menorResolucion/meta1.png"
	var property tipo = 1

	method esPisable() = true

	method hacerAlgo(direccion) {
	}

}

object checkpoint1 inherits Checkpoint (position = game.at(3, 2)) {

	override method hacerAlgo(direccion) {
	}

}

object paleta {

	const property verde = "00FF00FF"
	const property rojo = "FF0000FF"

}


