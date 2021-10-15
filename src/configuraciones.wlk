import wollok.game.*
import pepita.*
import direcciones.*
import niveles.*

object configuraciones{
	const property altura = 8		/* height */
	const property ancho = 14		/* width */
	
	/*
	 *  Dependiendo que tecla presione el jugador se movera.
	 * 	Jugador1.irHacia(parametro) esta en pepita.wlk 
	 * (Por ahora es innecesario aclarar esto pero cuando 
	 * tengamos mas archivos va a ser una buena practica para guiarnos)
	 */
	
	method configTeclas() {
		keyboard.up().onPressDo {jugador1.irHacia(arriba)}  
		keyboard.down().onPressDo {jugador1.irHacia(abajo)}
		keyboard.left().onPressDo {jugador1.irHacia(izquierda)}
		keyboard.right().onPressDo {jugador1.irHacia(derecha)}		
	}
	
	method configMusic() {
		const musicaDprueba = game.sound("nivel0b.mp3")
	    keyboard.p().onPressDo({musicaDprueba.stop()})
	    musicaDprueba.shouldLoop(true)
		game.schedule(0, {musicaDprueba.play()})
		musicaDprueba.volume(0.3)
	}
	
	/* 
	 * Si un jugador colisiona con una caja entonces la mueve
	 * Si un jugador intenta mover un muro se adelanta y retrocede a la vez
	 */
	method configColisiones(){
		game.onCollideDo(jugador1, { elemento => elemento.irHacia(jugador1.orientacionAnterior()) })
	}
	
	
}