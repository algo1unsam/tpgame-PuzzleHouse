import wollok.game.*
import objetos.*
import direcciones.*
import configuraciones.*
import timeline.*
import jugador.*
import nivel1.*
import nivelB.*
import nivelW.*

class Nivel {
	var property siguienteNivel
	const duplicador=1
	method listaCajas()

	method cargarObjetos(objeto) = objeto.forEach{ unObjeto => game.addVisual(unObjeto)}
	
	method dibujarMuros(objeto) = game.addVisual(objeto)

	method bordearVerticalmente(yInicial,yFinal,xCoordenada,stringObjeto){
		const lista=[]
		new Range(start = yInicial, end =yFinal , step = duplicador).forEach({ n => lista.add( new Position( x=xCoordenada, y=n))})
		lista.forEach { p => self.dibujarMuros(new MuroVisible(position = p, image=stringObjeto))}
	}
	method bordearHorizontalmente(xInicial,xFinal,yCordenada,stringObjeto){
		const lista=[]
		new Range(start = xInicial, end =xFinal , step = duplicador).forEach({ n => lista.add( new Position( x=n, y=yCordenada))}) 	
		lista.forEach { p => self.dibujarMuros(new MuroVisible(position = p, image=stringObjeto))}	
	}

	method verificarMetas() {
		const verificador = self.listaCajas().all({ unaCaja => unaCaja.llegoMeta() })
		if (verificador) {
			sonidoObjeto.emitirSonido("victoriaFem.mp3") // es temporal
			game.say(configuraciones.elJugador(), "ganaste!")
			configuraciones.configStopMusic()
			game.schedule(1200,{self.cambiarNivel()})
		}
	}
	
	method cambiarNivel(){
		game.clear()
		siguienteNivel.cargarNivel()
	}
	
	method reiniciarNivel(){
		configuraciones.nivelActual().listaCajas().forEach{ objeto => objeto.posicioninicial()}
		configuraciones.elJugador().posicioninicial()	
	}
	
	method configNivel(personaje){
		duplicaDireccion.direccionDuplicador(duplicador)
		configuraciones.configTeclas(personaje) //Si las configuraciones estan en juego.wpgm no las podemos modificar in game ,por eso las coloco aca
		configuraciones.configColisiones(personaje)
	}

}

object menu inherits Nivel(siguienteNivel = nivel1, duplicador = 2){
	const jugador1 = new Jugador(position = game.at(10, 1) ,resolucion="mayorResolucion",nombreJugador = "jugador1")
	
	method cargarNivel(){
		configuraciones.configMusic("menu.mp3")
		game.addVisual(self)
		game.addVisual(new Checkpoint(position = game.at(6,5), image = "mayorResolucion/invisible.png", siguienteNivel = nivel1))
		game.addVisual(new Checkpoint(position = game.at(4,5), image = "mayorResolucion/invisible.png", siguienteNivel = nivel1))
		game.addVisual(new Checkpoint(position = game.at(2,5), image = "mayorResolucion/invisible.png", siguienteNivel = nivel1))
		
		game.addVisual(new CheckpointSalir(position = game.at(16,5), image = "mayorResolucion/invisible.png", siguienteNivel = nivel0))
		game.addVisual(new CheckpointSalir(position = game.at(18,5), image = "mayorResolucion/invisible.png", siguienteNivel = nivel0))
		game.addVisual(new CheckpointSalir(position = game.at(20,5), image = "mayorResolucion/invisible.png", siguienteNivel = nivel0))
		
		game.addVisual(jugador1)
		configuraciones.nivelActual(self)
		self.configNivel(jugador1)
		
		/* Falta agregar bloques invisibles o una interrupcion cuando salga del mapa */
	}
	override method listaCajas() = []
	
	method image() = "oscuro.png"
	method position()=game.at(0,0)
}

object nivel0 inherits Nivel (siguienteNivel = pasadizo){

	const jugador1 = new Jugador(position = game.at(3, 1) ,resolucion="menorResolucion",nombreJugador = "jugador1")
	const listaCajas=[]
	const listaMeta =[]

		method cargarNivel(){		
		
		configuraciones.configMusic("hogar1.mp3")
		game.addVisual(self)
		//game.addVisual(mapR)
		
		//game.addVisual(new Checkpoint1(position = game.at(3,2), image = "menorResolucion/checkpoint.png"))
		game.addVisual(sombra4)
		
		//hab hijo
		const hijo = new Jugador(position = game.at(7, 11) ,resolucion="menorResolucion" ,nombreJugador = "hijo")
		game.addVisual(hijo)
		game.addVisual(sombraHab1)
		
		//hab hija
		const hija = new Jugador(position = game.at(10, 11) ,resolucion="menorResolucion", nombreJugador = "hija")
		game.addVisual(hija)
		game.addVisual(sombraHab2)
		
		//esposa
		const jugadora1 = new Jugador(position = game.at(23, 4) ,resolucion="menorResolucion", nombreJugador = "jugadora1")
		game.addVisual(jugadora1)	
		
		game.addVisual(sombraInv1)
		game.addVisual(sombraInv2)
		game.addVisual(sombraInv3)
		game.addVisual(pasadizoInv2)
		game.addVisual(pasadizoInv4)
		game.addVisual(sombraHabInv1)
		game.addVisual(sombraHabInv2)
		
		game.addVisual(sombra3)
		/*  */
		game.addVisual(new Checkpoint(position = game.at(16,4), image = "mayorResolucion/invisible.png", siguienteNivel = pasadizo))
		
		// Puerta 2 
		game.addVisual(pasadizo5)
		game.addVisual(pasadizo4)
		// Puerta 1 
		game.addVisual(pasadizo3)
		game.addVisual(pasadizo2)
		// Escena Pasadizo 
		game.addVisual(pasadizo0)
		game.addVisual(sombra2)
		game.addVisual(sombra1)
		
		
		self.generarMuros()
		//esposo
		game.addVisual(jugador1)
		self.configNivel(jugador1)
		
		game.addVisual(new Checkpoint(position = game.at(7,11), image = "menorResolucion/invisible.png", siguienteNivel = nivelW))
	}
		override method configNivel(personaje1){
		duplicaDireccion.direccionDuplicador(duplicador)
		configuraciones.configTeclas(personaje1)
		configuraciones.configColisiones(personaje1)
		configuraciones.configColisionesNivel0()
		configuraciones.nivelActual(self)
		//Recomiendo crear un metodo en configuraciones que retorne como parametros el nivel actual y el siguiente
	}
	
	override method listaCajas() = listaCajas

    method listaMeta()= listaMeta
	
	method generarMuros(){
		
		const muroInvisible = "menorResolucion/invisible.png"
		
		self.bordearHorizontalmente(0,2,0,muroInvisible)
		self.bordearHorizontalmente(4,5,0,muroInvisible)
		self.bordearHorizontalmente(3,3,-1,muroInvisible)
		self.bordearHorizontalmente(13,17,0,muroInvisible)
		self.bordearVerticalmente(0,1,18,muroInvisible)
		self.bordearHorizontalmente(19,24,0,muroInvisible)
		self.bordearVerticalmente(1,5,24,muroInvisible)
		self.bordearVerticalmente(3,4,18,muroInvisible)
		self.bordearHorizontalmente(12,23,5,muroInvisible)
		self.bordearHorizontalmente(14,16,3,muroInvisible)
		self.bordearHorizontalmente(14,15,4,muroInvisible)
		self.bordearHorizontalmente(6,12,1,muroInvisible)
		self.bordearVerticalmente(3,4,12,muroInvisible)
		self.bordearVerticalmente(3,7,11,muroInvisible)
		self.bordearVerticalmente(3,11,9,muroInvisible)
		self.bordearVerticalmente(3,11,8,muroInvisible)
		self.bordearVerticalmente(3,7,6,muroInvisible)
		self.bordearHorizontalmente(0,16,12,muroInvisible)
		self.bordearHorizontalmente(0,5,7,muroInvisible)
		self.bordearHorizontalmente(12,17,7,muroInvisible)
		self.bordearVerticalmente(8,11,17,muroInvisible)
		self.bordearVerticalmente(8,11,0,muroInvisible)
		self.bordearVerticalmente(1,5,0,muroInvisible)
		self.bordearHorizontalmente(1,5,5,muroInvisible)
	}
	
	method image() = "nivel0/map2.png"
	method position()=game.at(0,0)
}
