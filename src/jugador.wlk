import wollok.game.*
import direcciones.*
import configuraciones.*
import niveles.*
import objetos.*
import sonido.*
import creativo.*
import objetosDelModoCreativo.*

class Jugador inherits Posicion{
	var property impedirConteo=false
	var property nombreJugador
	var property resolucion
	
	
	 method  image()=resolucion + "/" + nombreJugador.toString() + ultimaDireccion.toString() + ".png"


	override method cambiarPosicion(direccion) {
		ultimaDireccion=direccion
		self.verificarColisionConMuro(direccion)
	
	}	
	method victoria(){
		sonidoObjeto.emitirSonido("victoriaFem.mp3")
	}							
	
	method text() = if (!configuraciones.libreMoviento()) {	""} else {"[ " + position.x().toString() + " , " + position.y().toString() + " ]"}

	method textColor() = "00FF00FF"
	
	method esPisable() = false
	
	method llegoCheckpoint(){
		configuraciones.nivelActual().avanzarA()
	}
	override method hacerAlgo(direccion){
		configuraciones.elJugador().position(direccion.dirOpuesto(configuraciones.elJugador()))
		game.say(self, 'Qué sucede?')
	}
	
	method retroceder(direccion){
		
		self.position(direccion.dirOpuesto(configuraciones.elJugador()))	
		
	}
	
	method moverse(direccion) {
		
		
		
		self.position(direccion.moverse(self))
		sonidoObjeto.emitirSonido("pasosf.mp3")
		self.incrementarContador()
	
		}
	method incrementarContador(){
		if(!self.colisionaConUnaCaja() and configuraciones.nivelActual().soyUnNivelPuzzle()){
			configuraciones.elcontadorDePasos().incrementar() // de esta forma desactivamos el conteo del jugador y dejamos que la suma la haga unicamente la caja	
		}
	}
	
	method verificarColisionConMuro(direccion) { // 29/11/2021 El muro tiene un metodo llamado  cambiarPosicion  que lo que haces es que cuando un jugador colisiona con un muro este ultimo hace retroceder al jugador una posicion hacia atras, impidiendo de esta forma atravesar paredes al jugador !!  sin embargo si apretabamos por ejemplo arriba y derecha muchas veces cuando estamos al lado de un muro

	const siguienteUbicacion = direccion.moverse(self)
	
	if (self.verificarQueNoHayaUnMuroAdelante(siguienteUbicacion)) {
			self.verificarSiElModoLibreEstaActivado(direccion)
		} else {
			self.moverse(direccion)
		}

	}
	method verificarSiElModoLibreEstaActivado(direccion){
		if (configuraciones.libreMoviento()) {
				self.moverse(direccion)
				
		}
	}
	
	
	
	
	
	method verificarQueNoHayaUnMuroAdelante(direccion) = game.getObjectsIn(direccion).any{ unObj => unObj.modoCreativo_soyUnMuro() }
	method colisionaConUnaCaja()= game.colliders(self).any({unObjeto=>unObjeto.soyUnaCaja()})
//Se va achicar la cantidad de ifs antes de entregar el juego al CONCURSO!!
	
	
	
	
	
	/*La logica del movimiento del jugador se ha complicado de forma temporal solo por el modo libre, en la version final va a quedar mas o menos asi
	  override method cambiarPosicion(direccion) {
		const siguienteUbicacion = direccion.moverse(self)
		* 
		ultimaDireccion=direccion
		if(!self.verificarQueNoHayaUnMuroAdelante(siguienteUbicacion)){
			posicionAnterior=self.position()
			self.position(direccion.moverse(self))
			sonidoObjeto.emitirSonido("pasosf.mp3")	
			contadorDePasos.incrementar()
			
		}
	}
	 */
}

	