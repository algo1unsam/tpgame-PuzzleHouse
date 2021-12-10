import wollok.game.*
import direcciones.*
import configuraciones.*
import niveles.*
import objetos.*
import sonido.*
import creativo.*
import objetosDelModoCreativo.*
import jugador.*

class Ghost inherits Jugador{
	var cont = 0
	var property ms1 = 'Qué sucede?'
	var property ms2 = 'Deja de hinchar!'
	var property ms3 = 'Te lo adverti!'
	
	var property siguienteNivel
	
	override method hacerAlgo(direccion){
		configuraciones.elJugador().position(direccion.dirOpuesto(configuraciones.elJugador()))
		if (cont == 0)	game.say(self,ms1)
		if( cont == 1)	game.say(self,ms2)
		if (cont == 2) {
			game.say(self,ms3)
			
			game.schedule(1200,{
				configuraciones.configStopMusic()
				cont=0
				game.clear()
				siguienteNivel.cargarNivel()
			})
		}
		cont = cont +1
	}
	
}