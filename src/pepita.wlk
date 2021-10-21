import wollok.game.*
import direcciones.*
import niveles.*
import configuraciones.*

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
	var property posicionInicial = position

	method sinColision() {
	}

	method preIrHacia(direccion) { // los metodos pre+algo son metodos que van a desaparecer en la version final del juego. son metodos que se encargan de preguntar si el jugador esta en modoLibre o no. EL modo libre permite al jugador saltarse las colisiones con los objetos y por lo tanto navegar por todo el mapa libremente 
		if (!configuraciones.libreMoviento()) {
			self.irHacia(direccion)
		} else {
			self.position(direccion.moverse(self)) // El modo libre movimento esta activado ,sin embargo el jugador necesita moverse aun asi que incorpore esta linea. SI NO lo hacia el jugador practicamente no se movia
		}
	}

	method irHacia(direccion) {
		const proximaDireccion = direccion.moverse(self)
		ultimaPosicion = direccion
		if (self.puedeEmpujar(proximaDireccion) or self.algunoAtravesable(proximaDireccion)) {
			self.position(proximaDireccion)
		}
		image = nombreJugador + ultimaPosicion.toString() + ".png"
		self.emitirSonido("pasosf.mp3")
	}

	method preColisionaConAlgo(direccion, objeto) { // los metodos pre+algo son metodos que van a desaparecer en la version final del juego. son metodos que se encargan de preguntar si el jugador esta en modoLibre o no. EL modo libre permite al jugador saltarse las colisiones con los objetos y por lo tanto navegar por todo el mapa libremente 
		if (!configuraciones.libreMoviento()) {
			self.colisionaConAlgo(direccion, objeto) // si el modo libre esta activado entonces se desactiva cualquier colision del jugador con cajas
		}
	}

	method colisionaConAlgo(direccion, objeto) {
		if (objeto.esEmpujable()) {
			self.puedeEmpujar(direccion, objeto)
		// objeto.emitirSonido("caja_mover.mp3") //si el sonido esta aca el jugador cada vez que intente empujar la cajja independientemente de si esta puede moverse o no el sonido se emitira
		}
	}

	method puedeEmpujar(direccion, objeto) {
		const proximaDireccion = direccion.moverse(objeto)
		if (self.atravesable(proximaDireccion)) {
			objeto.position(proximaDireccion)
			objeto.emitirSonido("caja_mover.mp3") // Solo se emite si la caja puede ser empujable ,osea no haya ningun otro objeto que impida que esto suceda. Ustedes decidan donde queda mejor
		} else {
			self.position(direccion.dirOpuesto(self)) // Si esto desaparece el jugador bajo ciertas condiciones atraviesa la caja! 
		}
	}

	method posicioninicial() {
		self.emitirSonido("reinicio.mp3")
		self.position(posicionInicial)
	}

	method puedeEmpujar(direccion) = game.getObjectsIn(direccion).all{ unObj => unObj.esEmpujable() }

	method atravesable(direccion) = game.getObjectsIn(direccion).all{ unObj => unObj.esAtravesable() }

	method algunoAtravesable(direccion) = game.getObjectsIn(direccion).any{ unObj => unObj.esAtravesable() }

	method text() = if (!configuraciones.libreMoviento()) {""} else {"[ " + position.x().toString() + " , " + position.y().toString() + " ]"}

	method textColor() = paleta.verde()

	method llegoMeta() = nivel1.listaMeta().any{ unaMeta => unaMeta.position() == self.position() } // Este es codigo de commits anteriores ,lo agregue recien porque con el cambio de logica de colisiones  lo borre sin querer .ahi esta denuevo ,aun asi no se como usarlo ahora mismo.

	method esAtravesable()=false
	
	method esEmpujable()=false
}

//idea para el futuro , tanto caja1 como caja 2 deben estar en una lista . Cuando las cajas llegan a su meta hay que preguntar con colecciones si todos estan en la "cruz"
class Caja inherits ObjetoMovible {

	var property position = game.center()
	var property image = "caja.png"
	const posicionInicial = position

	method esEmpujable() = true

	method esAtravesable() = false

	method posicioninicial() {
		self.emitirSonido("reinicio.mp3")
		self.position(posicionInicial)
	}

}

class Muro {

	var property position = game.at(4, 5)

//	var property image = "muro.png"
	method esEmpujable() = false

	method esAtravesable() = false

}

class Meta {

	var property position = game.at(7, 7)
	var property image = "meta.png"

	method esEmpujable() = false

	method esAtravesable() = true

}

object paleta {

	const property verde = "00FF00FF"
	const property rojo = "FF0000FF"

}

class MuroVisible {

	var property position = game.at(4, 5)
	var property image = "muro.png"

	method esEmpujable() = false

	method esAtravesable() = false

}

