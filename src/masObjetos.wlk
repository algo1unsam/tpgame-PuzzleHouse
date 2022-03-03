import wollok.game.*
import direcciones.*
import configuraciones.*
import niveles.*
import jugador.*
import sonido.*
import nivelB.*
import objetosDelModoCreativo.*
import nivelW.*
import nivelBel.*
import nivelL.*
import nivelDream.*
import nivelB2.*
import objetos.*
import nivelTests.*



object requisito inherits Estatico(position=game.at(8,10)){
	 var property numeroDeSkin = 1
	 var property invisible=true
	 var property imagen = configuraciones.elJugador().nombreJugador() 
	 method image()=if(invisible){"menorResolucion/invisible.png"}else{"requisitos/"+imagen+"req"+numeroDeSkin.toString()+".png"}
	
}


class CambiarSkin inherits Estatico(position = game.at(6, 5)) {
	
	var vestimenta

	override method hacerAlgo(direccion) {
		if (self.condicion()) {
			configuraciones.elJugador().nombreJugador(vestimenta)
			requisito.invisible(true)
			pasadizo.vestimenta(vestimenta)
		} else {
			requisito.invisible(false)
			self.mensaje()
		}
		configuraciones.elJugador().retroceder(direccion)
	}
	
	method caambiarImagen(){
		requisito.imagen(configuraciones.elJugador().nombreJugador())
	}
	

	method condicion()

	method mensaje()

}

object skin1 inherits CambiarSkin(position = game.at(2, 5), vestimenta = "jugador1") {

	override method condicion() = true

	override method mensaje() {
		requisito.invisible(true)
		game.say(configuraciones.elJugador(), "No lo tienes puesto?")
	}

	override method hacerAlgo(direccion) {
		if (configuraciones.elJugador().nombreJugador() == "jugador1") {
			self.mensaje()
		}
		configuraciones.elJugador().nombreJugador(vestimenta)
		pasadizo.vestimenta("jugador1")
		configuraciones.elJugador().retroceder(direccion)
	}

}

object skin2 inherits CambiarSkin(position = game.at(6, 5), vestimenta = "jugador1suiteold") {

	override method condicion() = nivel0.listaDeNivelesCompletados().asSet().size() >= 3

	override method mensaje() {
		requisito.imagen("jugador1")
		requisito.numeroDeSkin(1)	
	}

}
object skin3 inherits CambiarSkin(position = game.at(10, 5), vestimenta = "jugadorGranja") {

	override method condicion() = nivel0.listaDeNivelesCompletados().contains(nivel_bonus)

	override method mensaje() {
		self.caambiarImagen()
		requisito.numeroDeSkin(3)	
	}

}

object skin4 inherits CambiarSkin(position = game.at(14, 5), vestimenta = "jugadorHT2") {

	override method condicion() = nivel0.listaDeNIvelesHardTimesCompletados().size() >= 3

	override method mensaje() {
		self.caambiarImagen()
		requisito.numeroDeSkin(4)	
	}

}

//14,5
//10,5


object skin5 inherits CambiarSkin(position = game.at(18, 5), vestimenta = "jugadorDream") {

	override method condicion() = nivelDream.listaDeNivelesCompletados().asSet().size() >= 3

	override method mensaje() {
		self.caambiarImagen()
		requisito.numeroDeSkin(5)
	}

}

object skin6 inherits CambiarSkin(position = game.at(22, 5), vestimenta = "jugador1suiteFinal") {

	override method condicion() = pasadizo.listaDeSkins().take(5).all({ unaSkin => unaSkin.condicion() })

	override method mensaje() {
		self.caambiarImagen()
		requisito.numeroDeSkin(6)
	}

}
