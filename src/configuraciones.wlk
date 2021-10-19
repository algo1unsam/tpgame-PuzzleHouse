import wollok.game.*
import pepita.*
import direcciones.*
//import niveles.*

object configuraciones{
	const property altura = 10	/* height */
	const property ancho = 11		/* width */
	
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
		
		keyboard.w().onPressDo {jugador1.irHacia(arriba)}  
		keyboard.s().onPressDo {jugador1.irHacia(abajo)}
		keyboard.a().onPressDo {jugador1.irHacia(izquierda)}
		keyboard.d().onPressDo {jugador1.irHacia(derecha)}	
		
		//keyboard.r().onPressDo {niveles.elementosPorNivel().forEach{objeto=>objeto.posicioninicial()} }
	  
	    keyboard.z().onPressDo {libreMovimiento.cambio()}

		
	}
	
	method configMusic() {
		const musicaDprueba = game.sound("nivel2moiraA.mp3") // Supongo que  partir de ahora llamamos nivel1 al nivel0 de antes . esto es una musica  alternativa de varias que tengo para proponer . cuando el juego este completo vamos a elegir entre todos las musicas mas adecuadas para cada nivel. 
	    keyboard.p().onPressDo({musicaDprueba.stop()})  // Si seguimos el guion se supone que el primer nivel todo es color de rosas, por eso puse  canciones  alegres. 
	    musicaDprueba.shouldLoop(true)					
		game.schedule(0, {musicaDprueba.play()})
		musicaDprueba.volume(0.1)
	}
	
	/* 
	 * Si un jugador colisiona con una caja entonces la mueve
	 * Si un jugador intenta mover un muro se adelanta y retrocede a la vez
	 */


	 
	 
	method configColisiones(){

  		game.onCollideDo(jugador1, { elemento => jugador1.empujar(jugador1.ultimaPosicion(),elemento)})
  			
  		
	
	}
	
	
	
	
}