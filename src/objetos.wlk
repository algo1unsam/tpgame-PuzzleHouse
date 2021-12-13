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

class CambiarSkin inherits Estatico(position = game.at(6, 5)) {

	var vestimenta

	override method hacerAlgo(direccion) {
		if (self.condicion()) {
			configuraciones.elJugador().nombreJugador(vestimenta)
			pasadizo.vestimenta(vestimenta)
		} else {
			self.mensaje()
		}
		configuraciones.elJugador().retroceder(direccion)
	}

	method condicion()

	method mensaje()

}

object skin1  inherits CambiarSkin(position=game.at(2,5),vestimenta="jugador1"){
	override method condicion()=true
	
	override method mensaje(){
		game.say(configuraciones.elJugador(),"No lo tienes puesto?")
		
	}
	
	override method hacerAlgo(direccion) {
		if(configuraciones.elJugador().nombreJugador()=="jugador1"){
			self.mensaje()			
		}
		configuraciones.elJugador().nombreJugador(vestimenta)
		pasadizo.vestimenta("jugador1")
		configuraciones.elJugador().retroceder(direccion)
	}
	
	
}

object skin2  inherits CambiarSkin(position=game.at(6,5),vestimenta="jugador1suiteold"){
	override method condicion()=nivel0.listaDeNivelesCompletados().asSet().size()>=3
	
	override method mensaje(){
		game.say(configuraciones.elJugador(),"Debes COMPLETAR 3 niveles  COMUNES de la casa  Para desbloquear esto")
	}
}

object skin4  inherits CambiarSkin(position=game.at(14,5),vestimenta="jugadorHT2"){
	override method condicion()= nivel0.listaDeNIvelesHardTimesCompletados().size()>=3
	override method mensaje(){
		game.say(configuraciones.elJugador(),"Debes COMPLETAR todos los niveles del modo HardTimer Para desbloquear esto")
	}
}
//14,5
//10,5

object skin3  inherits CambiarSkin(position=game.at(10,5),vestimenta="jugadorGranja"){
	override method condicion()= nivel0.listaDeNivelesCompletados().contains(nivel_bonus)
	override method mensaje(){
		game.say(configuraciones.elJugador(),"Debes COMPLETAR El nivel de la GRANJA para desbloquear esto!")
	}
}

object skin5  inherits CambiarSkin(position=game.at(18,5),vestimenta="jugadorDream"){
	override method condicion()=nivelDream.listaDeNivelesCompletados().asSet().size()>=3
	
	override method mensaje(){
		game.say(configuraciones.elJugador(),"Debes COMPLETAR todos los niveles del DREAM para desbloquear esto!!!")
	}
}

object skin6  inherits CambiarSkin(position=game.at(22,5),vestimenta="jugador1suiteFinal"){
	override method condicion()= pasadizo.listaDeSkins().take(5).all({unaSkin=>unaSkin.condicion()})
	
	
	override method mensaje(){
		game.say(configuraciones.elJugador(),"Debes completar todos los desafios anteriores  para desbloquear este traje!!!")
	}
}




class DreamCambiarSkin inherits Estatico {
	var vestimenta
	override method hacerAlgo(direccion) {
		configuraciones.elJugador().nombreJugador(vestimenta)
		configuraciones.elJugador().retroceder(direccion)
		pasadizo.vestimenta(vestimenta)
	}
}


class Estatico inherits Posicion {
	override method cambiarPosicion(direccion){	
	}
	override method hacerAlgo(direccion) {
	}
}
class Posicion {
	var property ultimaDireccion = abajo
	var property position = game.origin()
	var property posicionInicial = position
	const property modoCreativo_soyMeta = false
	const property modoCreativo_soyUnMuro = false
	const property modoCreativo_soyUnPuntoDeReinicio = false
	const property soyUnaCaja=false //agregado el 3/12/2021 para el contador de movimientos
	var property quieroAgregarAlTablero = true
	var property estaBloqueado=false
	var property tipo=100

	method posicioninicial() {
		sonidoObjeto.emitirSonido("reinicio.mp3")
		self.position(posicionInicial)
	}

	method hacerAlgo(direccion) {
		if(!configuraciones.nivelActual().soyUnNivelCreativo()){
			self.cambiarPosicion(direccion)
		}
		else{
			self.modoLibreParaElnivelCreativo(direccion)
		}
	}
	method modoLibreParaElnivelCreativo(direccion){
		if (!configuraciones.libreMoviento()) {
			self.cambiarPosicion(direccion)
		}	
	}

	method cambiarPosicion(direccion)

	method modoCreativoAgregarVisual() {
		if (quieroAgregarAlTablero) {
			game.addVisual(self)
			quieroAgregarAlTablero = false
		}
	}

	method modoCreativoBorrarVisual() {
		game.removeVisual(self)
	}
}
object paleta {

	const property verdeClaro="#08ffda"
	const property verde = "00FF00FF"
	const property rojo = "FF0000FF"
	const property aqua = "#00F1F4"
	const property fuchsia ="#FC00FF"
	const property amarillo ="#fcff00"
	const property lima = "#82ff00"
	const property naranja ="#ff6809"
	const property negro= "#000000"
	const property celeste= "#00d7ff"
	const property azul = "#0800ff"
	const property marron = "#501600"
	const property blanco ="#ffffff"
	const property crimson ="#ffffff"
	const property violeta ="#7d00ff"
	const property rosado = "#ff0087"
	const property rosadoClaro ="#ffc3ed"
}

class Caja inherits Posicion (soyUnaCaja=true){
	var property yaEstubeEnMeta=false
	const resolucion = "menorResolucion"
	const stringDeObjeto = "caja1.png"
	const cajaEnMeta = "caja_ok.png"
	var property hardCoreTimeBonificacion=7
	var property elCaballoSeTrabo = false
	const sonido = "caja_mover2.mp3"
	const property colorDelTextoDeLaCaja=paleta.celeste()
	var property estoyEnMeta=false
	
	method textColor()=colorDelTextoDeLaCaja
	
	method esPisable() = false

	
	method image() = if (self.estoyEnMeta()) {resolucion + "/" + cajaEnMeta} else {	resolucion + "/" + stringDeObjeto}

	
	method text() =if (configuraciones.nivelActual().soyUnNivelHardcoreTime()){self.modoHardCoreTimer()}else{""}
	
	method modoHardCoreTimer()=if(!yaEstubeEnMeta){"+"+self.hardCoreTimeBonificacion().toString()}else{""}
	
	override method cambiarPosicion(direccion) {
		const siguienteUbicacion = direccion.moverse(self)
		ultimaDireccion = direccion
		if (self.proximaUbicacionLibre(siguienteUbicacion)) {
			self.position(direccion.moverse(self))
			self.contador()
			self.activarVerificador()
		} else {
			configuraciones.elJugador().retroceder(direccion)
			
			
		}
		sonidoObjeto.emitirSonido(sonido)
	}
	
	method activarVerificador(){
		
		if(self.llegoMeta()){
				estoyEnMeta=true
				configuraciones.nivelActual().verificarMetas()
				if(configuraciones.nivelActual().soyUnNivelHardcoreTime()){self.modoCronometro()}
			}
			else{
				
				estoyEnMeta=false
			}
		
	}
	
	method modoCronometro() {
		if (!self.yaEstubeEnMeta()) {
			configuraciones.nivelActual().cronometro().sumarSegundos(self.hardCoreTimeBonificacion())
			yaEstubeEnMeta = true
		}
	}
	
	method proximaUbicacionLibre(direccion) = game.getObjectsIn(direccion).all{ unObj => unObj.esPisable() }
	
	method coordenadaX()=position.x()
	method coordenadaY()=position.y()

	method llegoMeta() = game.colliders(self).any{ unaMeta => unaMeta.position() == self.position() && unaMeta.tipo() == self.tipo() } // configuraciones.nivelActual().listaMeta().any{ unaMeta => unaMeta.position() == self.position() && unaMeta.tipo() == self.tipo() }
	
	method contador(){
		if(configuraciones.nivelActual().soyUnNivelPuzzle())
		configuraciones.elcontadorDePasos().incrementar()
		configuraciones.contadorDeEmpujes().incrementar()
	}

}


class Oveja inherits Caja {
	override method image() = if (!self.estoyEnMeta()) {resolucion + "/" + stringDeObjeto + self.ultimaDireccion().toString() + ".png"} else {resolucion + "/" + stringDeObjeto + "Ok.png"}
}

class Caballo inherits Oveja {
	var seTrabo = false

	override method cambiarPosicion(direccion) {
		2.times({ i => self.moverCaballo(direccion)})
		if (seTrabo) {
			configuraciones.elJugador().retroceder(direccion)
		}
		sonidoObjeto.emitirSonido(sonido)
	}
	method moverCaballo(direccion) {
		const siguienteUbicacion = direccion.moverse(self)
		ultimaDireccion = direccion
		if (self.proximaUbicacionLibre(siguienteUbicacion)) {
			self.position(direccion.moverse(self))
			self.contador()
			self.activarVerificador()
			seTrabo = false
		} else {
			seTrabo = true
		}
	}

}
class MuroVisible inherits Posicion(modoCreativo_soyUnMuro=true) {

	
	var property image = "menorResolucion/muro.png"
	
	method esPisable() = false

	override method cambiarPosicion(direccion) {
	
	configuraciones.elJugador().retroceder(direccion)  //29-11-2021 Con el el metodo antiBug del jugador uno pensaria que este metodo quedo inservible pero no es asi, EN el modo creativo esto se sigue usando ya que en el jugador
	//constructor no existe el metodo antibug por lo que el jugador puede empujar una caja incluso si esta arriba de un muro (para lograr eso hay que apretar la Z obviamente)
	}
}
class Pisable inherits Estatico { 

	var property image = "menorResolucion/invisible.png"

	method esPisable() = true

	
}
class Checkpoint inherits Pisable {

	var property siguienteNivel
	

	override method hacerAlgo(direccion) {
		configuraciones.configStopMusic()
		game.clear()
		siguienteNivel.cargarNivel()
	}
}

class Meta inherits Pisable(tipo=1) {
}

class CheckpointSalir inherits Checkpoint {

	override method hacerAlgo(direccion) {
		game.clear()
		game.stop()
	}
	
}

class CheckpointConRequisito inherits Estatico (position = game.at(16, 4)) {
	
	var property destino
	var property condicion
	var property mensajeDeError=""

	override method hacerAlgo(direccion) { //!nivelBase.nivelBonusHabilitado()
		if (self.condicion()) {
			configuraciones.elJugador().retroceder(direccion)
			self.error(self.mensajeDeError())
		}
		configuraciones.configStopMusic()
		game.clear()
		destino.cargarNivel()
	}

}

class CheckpointBonus inherits Estatico (position = game.at(16, 4)) {
	var property nivelBase
	var property bonus

	override method hacerAlgo(direccion) {
		if (!nivelBase.nivelBonusHabilitado()) {
			self.error("No puedes pasar si no terminas todos los puzzles!!")
		}
		configuraciones.configStopMusic()
		game.clear()
		bonus.cargarNivel()
	}

}



class ContadorDePasos inherits Estatico(position=game.at(12,5)){
	var property texto ="Moves : "
	const colorTexto="FF0000FF"

	
	var numeroDePasos=0
	
	method incrementar(){
		if(configuraciones.habilitarConteo()){
			numeroDePasos=numeroDePasos+1
		}
		
	}
	method reiniciar(){
		numeroDePasos=0
	}
	method text()=texto+numeroDePasos.toString()
	
	method textColor()=colorTexto
	
}
class Cronometro inherits Estatico(position=game.at(12,12)){
	var property segundos=8
	var property nivelCompletado=false
	var property segundoDeReset=8
	

	method descontar(){
		if(segundos>0){
			sonidoObjeto.emitirSonido("cronometro1.mp3")
			segundos=segundos-1
			
		}
		else{
			sonidoObjeto.emitirSonido("tiempoAgotado.mp3")
			self.reiniciar()
			configuraciones.nivelActual().reiniciar()
			
		}		
	}
	
	method sumarSegundos(bonificacion){
		segundos=segundos+bonificacion
		sonidoObjeto.emitirSonido("segBonificacion.mp3")
	}
	
	method reiniciar(){
		segundos=segundoDeReset
	}
	
	
	method text()=if(!self.nivelCompletado()){self.segundos().toString()}else{"YEAH!"}
	method textColor()="FF0000FF"
	method activarCronometro(){
		game.onTick(1000,"Cronometro",{self.descontar()})
	}
	
	method desactivarCronometro(){
		game.removeTickEvent("Cronometro")
		nivelCompletado=true
	}
	
	method esPisable()=true
	
	method image()="cronometro.png"
	
}
object sonidoObjeto {

	method emitirSonido(unSonido) {
		const sonido = soundProducer.sound(unSonido) // game.sound(unSonido)
		sonido.volume(0.3)
		
		if(configuraciones.habilitarSonido()){
			sonido.play()
		}
		
	}
}
class ReadyYGO inherits Estatico{
	
	var property ready=true
	var property delay1=2500
	var property delay2=600
	
	override method position()=if(self.ready()){game.at(10,6)}else{game.at(11,6)}
	method image()=if(self.ready()){"menorResolucion/ready.png"}else{"menorResolucion/go.png"}
	
	method iniciarReady(){
		game.addVisual(self)
		sonidoObjeto.emitirSonido("ready.mp3")
		game.schedule(delay1,{self.go()})
	}
	method go(){
		ready=false
		sonidoObjeto.emitirSonido("go.mp3")
		self.arrancar()
		
	}
	method arrancar(){
		game.schedule(delay2,{self.modoCreativoBorrarVisual()})
		configuraciones.nivelActual().Comenzar()
		
	}
	method reiniciar(){
		ready=true
	}
	
	method esPisable()=true
	
	
}

class Animacion inherits Estatico {
	
	var property imagen
	var property entero = 1
	var property limite = 5
	var property velocidad = 150
	
	method image() = imagen + entero.toString() + ".png"
	
	method animar(){ game.onTick(velocidad,"animar", {self.aumentarEntero()}) }
	
	method aumentarEntero(){
		if(entero<limite){
			entero=entero+1
		}
		else{
			entero=1
		}			
	}
}

class CheckpointHardTimer inherits Animacion {
	
	var property siguienteNivel
	
	
	override method hacerAlgo(direccion) {
		configuraciones.configStopMusic()
		game.clear()
		siguienteNivel.cargarNivel()
	}
}



