import wollok.game.*
import direcciones.*
import niveles.*
import timeline.*
import jugador.*
import objetos.*

//import niveles.*
object configuraciones {

	var property altura = 13 /* height lo vuelvo var solo por ahora, Lo correcto es que sea Const*/
	var property ancho = 25 /* width */
	var jugadorp
	var numero = 1
	var nivelActual
	var elJugador

 
	 
	method nivelActual(unNivel){
		nivelActual=unNivel
		
	}
	method nivelActual() = nivelActual
	
	
	method elJugador() = jugadorp
	
	
	
	method configTeclas(jugador) {

		elJugador=jugador
		keyboard.up().onPressDo{ jugador.cambiarPosicion(arriba)} // irHacia(arriba)
		keyboard.down().onPressDo{ jugador.cambiarPosicion(abajo)}
		keyboard.left().onPressDo{ jugador.cambiarPosicion(izquierda)}
		keyboard.right().onPressDo{ jugador.cambiarPosicion(derecha)}
		keyboard.w().onPressDo{ jugador.cambiarPosicion(arriba)}
		keyboard.s().onPressDo{ jugador.cambiarPosicion(abajo)}
		keyboard.a().onPressDo{ jugador.cambiarPosicion(izquierda)}
		keyboard.d().onPressDo{ jugador.cambiarPosicion(derecha)}
		keyboard.r().onPressDo{ jugador.posicioninicial()}
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


	method configColisiones(jugador) {
			jugadorp=jugador
			
				
			
			game.onCollideDo(jugador, { elemento => elemento.hacerAlgo(jugador.ultimaDireccion())})
			
			 //game.onCollideDo(jugador, { elemento => elemento.cambiarPosicion(jugador.ultimaDireccion())})
	
	}
	method reiniciador(lista){
		keyboard.r().onPressDo {lista.forEach{objeto=>objeto.posicioninicial() }}	
	}

	method libreMoviento() = numero % 2 == 0
	
	method cambio() {
		numero += 1
	}
	
	method configColisionesNivel0() {
		
		game.onCollideDo(sombraInv1, {elemento => elemento.desbloquear(sombra1)} )
		game.onCollideDo(sombraInv2, {elemento => elemento.desbloquear(sombra2)} )
		game.onCollideDo(sombraInv3, {elemento => elemento.desbloquear(sombra3)} )
		
		game.onCollideDo(pasadizoInv2, {elemento => elemento.desbloquear(pasadizo2)} )
		game.onCollideDo(pasadizoInv4, {elemento => elemento.desbloquear(pasadizo4)} )
		
		game.onCollideDo(sombraHabInv1, {elemento => elemento.desbloquear(sombraHab1)} )
		game.onCollideDo(sombraHabInv2, {elemento => elemento.desbloquear(sombraHab2)} )
		
		/* AVANZAR AL NIVEL 1 
		game.onCollideDo(checkpoint1, { elemento => ( elemento.llegoCheckpoint() ) })
		* Por algun motivo se rompe al empezar desde el nivel 0, al terminar el nivel 1
		* ya no pasa al siguiente nivel
		*/
	}


}



