import wollok.game.*
import direcciones.*
import niveles.*
import timeline.*
import jugador.*
import objetos.*
import sonido.*

object configuraciones {

	const property altura = 13 
	const property ancho = 25 
	var property elcontadorDePasos=null
	var property contadorDeEmpujes=null
	var property habilitarConteo=true
	var property habilitarSonido=true
	var jugadorp
	var numero = 1
	var nivelActual
	var cancionActual = null

	method nivelActual(unNivel) {
		nivelActual = unNivel
	}
	

	method nivelActual() = nivelActual

	method elJugador() = jugadorp

	method configTeclas(jugador) {
		keyboard.up().onPressDo{ jugador.cambiarPosicion(arriba)}
		keyboard.down().onPressDo{ jugador.cambiarPosicion(abajo)}
		keyboard.left().onPressDo{ jugador.cambiarPosicion(izquierda)}
		keyboard.right().onPressDo{ jugador.cambiarPosicion(derecha)}
		keyboard.w().onPressDo{ jugador.cambiarPosicion(arriba)}
		keyboard.s().onPressDo{ jugador.cambiarPosicion(abajo)}
		keyboard.a().onPressDo{ jugador.cambiarPosicion(izquierda)}
		keyboard.d().onPressDo{ jugador.cambiarPosicion(derecha)}
		keyboard.r().onPressDo{ nivelActual.reiniciar()}
		keyboard.z().onPressDo{ self.cambio()}
		keyboard.p().onPressDo({ self.configStopMusic()})
		keyboard.backspace().onPressDo({self.nivelActual().abandonarNivel()})

	}

	method configMusic(cancionNivel) {
		
			const musicaDprueba = soundProducer.sound(cancionNivel)//game.sound(cancionNivel)
			cancionActual = musicaDprueba
			musicaDprueba.shouldLoop(true)
			game.schedule(0, { musicaDprueba.play()})
			musicaDprueba.volume(0.2)		
		
		
	}
	method configStopMusic() {
		if (cancionActual != null) {
			cancionActual.stop()
		}
		cancionActual = null
	}

	method configColisiones(jugador) {
		jugadorp = jugador
		game.onCollideDo(jugador, { elemento => elemento.hacerAlgo(jugador.ultimaDireccion())})
	}


	method libreMoviento() = numero % 2 == 0

	method cambio() {
		numero += 1
	}
	
	

}
