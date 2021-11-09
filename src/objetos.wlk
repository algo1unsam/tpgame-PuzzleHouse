import wollok.game.*
import direcciones.*
import configuraciones.*
import niveles.*
import jugador.*
import sonido.*
import nivelB.*

object sonidoObjeto { 
	method emitirSonido(unSonido) {
		const sonido = soundProducer.sound(unSonido)//game.sound(unSonido)
		sonido.volume(0.3)
		sonido.play()
	}
}

class Posicion {

	var property ultimaDireccion = abajo
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
	const stringDeObjeto = "caja1.png"
	const cajaEnMeta = "caja_ok.png"
	const property tipo = 1
	
    const sonido="caja_mover2.mp3"

	method esPisable() = false

	method image() = if (self.llegoMeta()) {
		resolucion + "/" + cajaEnMeta
	} else {
		resolucion + "/" + stringDeObjeto
	} 

	override method cambiarPosicion(direccion) {
		const siguienteUbicacion = direccion.moverse(self)
		ultimaDireccion=direccion
		if (self.proximaUbicacionLibre(siguienteUbicacion)) {
			self.position(direccion.moverse(self))
			configuraciones.nivelActual().verificarMetas()
		} else {
			configuraciones.elJugador().retroceder(direccion)
		}
		sonidoObjeto.emitirSonido(sonido)
	}

	method proximaUbicacionLibre(direccion) = game.getObjectsIn(direccion).all{ unObj => unObj.esPisable() }

	method llegoMeta() = game.colliders(self).any{ unaMeta => unaMeta.position() == self.position() && unaMeta.tipo() == self.tipo() } // configuraciones.nivelActual().listaMeta().any{ unaMeta => unaMeta.position() == self.position() && unaMeta.tipo() == self.tipo() }

}

class Oveja inherits Caja{
	
	override method image()= if (!self.llegoMeta()) { resolucion + "/" + stringDeObjeto + self.ultimaDireccion().toString() + ".png" } else{resolucion + "/" + stringDeObjeto+"Ok.png"}
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
	
	var property siguienteNivel
	const property tipo = 6
	
	override method hacerAlgo(direccion){
		configuraciones.configStopMusic()
		game.clear()
		siguienteNivel.cargarNivel()
	}
}

class Meta inherits Pisable {

	var property tipo = 1

}

class CheckpointSalir inherits Checkpoint {
	
	override method hacerAlgo(direccion){
		game.clear()
		game.stop()
	}
}

object paleta {

	const property verde = "00FF00FF"
	const property rojo = "FF0000FF"

}

object checkpointBonus{
	
	 method position()=game.at(16,4)
	
	 method hacerAlgo(direccion){
		if(!nivel0.nivelBonusHabilitado()){
			self.error("No puedes pasar si no terminas todos los puzzles!!")
		}
		configuraciones.configStopMusic()
		game.clear()
		pasadizo.cargarNivel()
		
	}
}

