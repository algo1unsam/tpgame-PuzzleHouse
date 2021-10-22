import wollok.game.*
import direcciones.*
import niveles.*
import pepita.*

//import niveles.*
object configuraciones {

	var property altura = 13 /* height lo vuelvo var solo por ahora, Lo correcto es que sea Const*/
	var property ancho = 25 /* width */
	var numero = 1

	/*
	 *  Dependiendo que tecla presione el jugador se movera.
	 * 	Jugador1.irHacia(parametro) esta en pepita.wlk 
	 * (Por ahora es innecesario aclarar esto pero cuando 
	 * tengamos mas archivos va a ser una buena practica para guiarnos)
	 */
	method configTeclas() {

			
		keyboard.up().onPressDo{ jugador1.preIrHacia(arriba)} // irHacia(arriba)
		keyboard.down().onPressDo{ jugador1.preIrHacia(abajo)}
		keyboard.left().onPressDo{ jugador1.preIrHacia(izquierda)}
		keyboard.right().onPressDo{ jugador1.preIrHacia(derecha)}
		keyboard.w().onPressDo{ jugador1.preIrHacia(arriba)}
		keyboard.s().onPressDo{ jugador1.preIrHacia(abajo)}
		keyboard.a().onPressDo{ jugador1.preIrHacia(izquierda)}
		keyboard.d().onPressDo{ jugador1.preIrHacia(derecha)}
		//keyboard.r().onPressDo {niveles.elementosPorNivel().forEach{objeto=>objeto.posicioninicial()} }	
		keyboard.x().onPressDo{ game.clear()} //el game.clear puede ser clave para transiciones entre niveles
		keyboard.z().onPressDo{ self.cambio()}
		
	}

	method configMusic(cancionNivel) {
		const musicaDprueba = game.sound(cancionNivel) // Supongo que  partir de ahora llamamos nivel1 al nivel0 de antes . esto es una musica  alternativa de varias que tengo para proponer . cuando el juego este completo vamos a elegir entre todos las musicas mas adecuadas para cada nivel. 
		keyboard.p().onPressDo({ musicaDprueba.stop()}) // Si seguimos el guion se supone que el primer nivel todo es color de rosas, por eso puse  canciones  alegres. 
		musicaDprueba.shouldLoop(true)
		game.schedule(0, { musicaDprueba.play()})
		musicaDprueba.volume(0.1)
	}

	/* 
	 * Si un jugador colisiona con una caja entonces la mueve
	 * Si un jugador intenta mover un muro se adelanta y retrocede a la vez
	 */
	method configColisiones() {
		
			game.onCollideDo(jugador1, { elemento => jugador1.preColisionaConAlgo(jugador1.ultimaPosicion(), elemento)})
		
		
		/* 
		if(!libreMovimiento.activado()){
			game.onCollideDo(jugador1, { elemento => jugador1.colisionaConAlgo(jugador1.ultimaPosicion(), elemento)})
		}
		* 
		* No funciona para nada bien esto y desconosco la razon . No voy a profundizar mucho ya que al final es codigo que se va a descartar en la version final
		*/
		
	}
	method reiniciador(lista){
		keyboard.r().onPressDo {lista.forEach{objeto=>objeto.posicioninicial() }}	
	}

	method libreMoviento() = numero % 2 == 0
	
	method cambio() {
		numero += 1
	}

}



