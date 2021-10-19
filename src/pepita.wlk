import wollok.game.*
import direcciones.*



const jugador1 = new Jugador(position = game.at(5, 6), nombreJugador = "jugador1")




class ObjetoMovible {

	

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
	var property ultimaPosicion = null
	const posicionInicial = position

	method irHacia(direccion) {
		
		const proximaDireccion = direccion.moverse(self)
		
		ultimaPosicion = direccion
		
		if (self.puedeEmpujar(proximaDireccion) or self.atravesable(proximaDireccion) or self.algunoAtravesable(proximaDireccion)) {
			self.position(proximaDireccion)
		}
		image = nombreJugador + ultimaPosicion.toString() + ".png"
		self.emitirSonido("pasosf.mp3")
	}

	method empujar(direccion, objeto) {
		const opuesto=direccion.dirOpuesto(self)
		const proximaDireccion = direccion.moverse(objeto)
		if (objeto.esEmpujable()) {
			if (self.atravesable(proximaDireccion)) {
				objeto.position(proximaDireccion)
				objeto.emitirSonido("caja_mover.mp3")
			} else {
				self.position(opuesto)
			}
		}
	}
	
	
	method posicioninicial() {
		self.emitirSonido("reinicio.mp3")
		self.position(posicionInicial)
	}
	
	

	method puedeEmpujar(direccion) {
		return game.getObjectsIn(direccion).all{ unObj => unObj.esEmpujable() }
	}

	method atravesable(direccion) {
		return game.getObjectsIn(direccion).all{ unObj => unObj.esAtravesable() }
	}

	method algunoAtravesable(direccion) {
		return game.getObjectsIn(direccion).any{ unObj => unObj.esAtravesable() }
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
	var property image = "caja.png"
	const posicionInicial = position
	method esEmpujable() {
		return true
	}

	method esAtravesable() {
		return false
	}
	
	method posicioninicial() {
		self.emitirSonido("reinicio.mp3")
		self.position(posicionInicial)
	}

}

class Muro {

	var property position = game.at(4, 5)
	var property image = "muro.png"

	method esEmpujable() {
		return false
	}

	method esAtravesable() {
		return false
	}

}

class Meta {

	var property position = game.at(7, 7)
	var property image = "meta.png"

	method esEmpujable() {
		return false
	}

	method esAtravesable() {
		return true
	}

}
object paleta {

	const property verde = "00FF00FF"
	const property rojo = "FF0000FF"

}
object libreMovimiento {
	var numero = 2
	

	method cambio() {
		numero += 1
	}

	method activado() {
		return numero % 2 == 0
	}


}
class MuroVisible {

	var property position = game.at(4, 5)
	var property image = "muro.png"

	method esEmpujable() {
		return false
	}

	method esAtravesable() {
		return false
	}

}
