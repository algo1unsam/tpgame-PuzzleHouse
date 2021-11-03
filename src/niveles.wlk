import wollok.game.*
import objetos.*
import direcciones.*
import configuraciones.*
import timeline.*
import jugador.*
import Nivel1R.*

class Nivel {
	var property siguienteNivel
	method listaCajas()

	method cargarObjetos(objeto) = objeto.forEach{ unObjeto => game.addVisual(unObjeto)}
	
	method dibujarMuros(objeto) = game.addVisual(objeto)
	

	method bordearVerticalmente(yInicial,yFinal,xCoordenada,stringObjeto){
		const lista=[]
		(yInicial .. yFinal).forEach({ n => lista.add( new Position( x=xCoordenada, y=n))})
		lista.forEach { p => self.dibujarMuros(new MuroVisible(position = p, image=stringObjeto))}
	}
	method bordearHorizontalmente(xInicial,xFinal,yCordenada,stringObjeto){
		const lista=[]
		(xInicial.. xFinal).forEach({ n => lista.add( new Position( x=n, y=yCordenada))}) 	
		lista.forEach { p => self.dibujarMuros(new MuroVisible(position = p, image=stringObjeto))}	
	}
	


	method verificarMetas() {
		const verificador = self.listaCajas().all({ unaCaja => unaCaja.llegoMeta() })
		if (verificador) {
			sonidoObjeto.emitirSonido("victoriaFem.mp3") // es temporal
			game.say(configuraciones.elJugador(), "ganaste!")
			configuraciones.configStopMusic()
			game.clear()
			siguienteNivel.cargarNivel()
		}
	}
	method reiniciarNivel(){
		configuraciones.nivelActual().listaCajas().forEach{ objeto => objeto.posicioninicial()}
		configuraciones.elJugador().posicioninicial()	
	}

}

object nivel0 inherits Nivel (siguienteNivel = nivel1){

	const jugador1 = new Jugador(position = game.at(20, 3) ,resolucion="menorResolucion",nombreJugador = "jugador1")
	
	const listaCajas=[]
	const listaMeta =[]
	
	method cargarNivel(){		
		 const duplicador=1
		configuraciones.configMusic("hogar1.mp3")
		game.addVisual(map)
		game.addVisual(new Checkpoint1(position = game.at(3,2), image = "menorResolucion/checkpoint.png"))
		game.addVisual(sombra4)
		game.addVisual(sombraInv1)
		game.addVisual(sombraInv2)
		game.addVisual(sombraInv3)
		game.addVisual(pasadizoInv2)
		game.addVisual(pasadizoInv4)
		game.addVisual(sombraHabInv1)
		game.addVisual(sombraHabInv2)
		game.addVisual(sombra3)
		/* Puerta 2 */
		game.addVisual(pasadizo5)
		game.addVisual(pasadizo4)
		/* Puerta 1 */
		game.addVisual(pasadizo3)
		game.addVisual(pasadizo2)
		/* Escena Pasadizo */
		game.addVisual(pasadizo0)
		game.addVisual(sombra2)
		game.addVisual(sombra1)
		
		/* Habitaciones */
		game.addVisual(hab1)
		const hijo = new Jugador(position = game.at(7, 11) ,resolucion="menorResolucion" ,nombreJugador = "hijo")
		game.addVisual(hijo)
		
		game.addVisual(hab2)
		const hija = new Jugador(position = game.at(10, 11) ,resolucion="menorResolucion", nombreJugador = "hija")
		game.addVisual(hija)
		
		game.addVisual(sombraHab1)
		game.addVisual(sombraHab2)
		
		self.generarMuros()
		/* ESPOSO */
		game.addVisual(jugador1)
		self.configNivel(jugador1,duplicador)
	
		
		/* ESPOSA */
		const jugadora1 = new Jugador(position = game.at(23, 4) ,resolucion="menorResolucion", nombreJugador = "jugadora1")
		game.addVisual(jugadora1)
			
	}
	
		method configNivel(personaje1,duplicador){
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
		
		self.bordearHorizontalmente(0,5,0,muroInvisible)
		self.bordearHorizontalmente(13,17,0,muroInvisible)
		self.bordearVerticalmente(0,1,18,muroInvisible)
		self.bordearHorizontalmente(19,24,0,muroInvisible)
		self.bordearVerticalmente(1,5,24,muroInvisible)
		self.bordearVerticalmente(3,4,18,muroInvisible)
		self.bordearHorizontalmente(12,23,5,muroInvisible)
		self.bordearHorizontalmente(14,16,3,muroInvisible)
		self.bordearHorizontalmente(14,16,4,muroInvisible)
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
	
}

object nivel1 inherits Nivel (siguienteNivel = nivel1R){
	
	const jugador1 = new Jugador(position = game.at(15, 3) , resolucion="menorResolucion",nombreJugador = "jugador1")
	const meta1 = "menorResolucion/meta1.png"
	const meta2 = "menorResolucion/meta2.png"
	const resolucionCaja = "menorResolucion"
	const caja1 = "caja1.png"
	const caja2 = "caja2.png"
	const cajaMeta1 = "caja_ok.png"
	const cajaMeta2 = "caja_ok2.png"

	const listaMeta =[   new Meta(position = game.at(7,1), image= meta1),
						 new Meta(position = game.at(10,1),image= meta2,tipo=2),
						 new Meta(position = game.at(7,2), image= meta2,tipo=2),
						 new Meta(position = game.at(7,3), image= meta1),
						 new Meta(position = game.at(7,4), image= meta1),
						 new Meta(position = game.at(7,5), image= meta2,tipo=2),
						 new Meta(position = game.at(8,3), image= meta1),
						 new Meta(position = game.at(8,4), image= meta1),
						 new Meta(position = game.at(8,5), image= meta1)
					
		
	]
	const listaCajas=[   new Caja(position = game.at(13,3),resolucion=resolucionCaja,caja=caja1,cajaEnMeta=cajaMeta1,tipo=1),
						 new Caja(position = game.at(11,4),resolucion=resolucionCaja,caja=caja1,cajaEnMeta=cajaMeta1,tipo=1),
						 new Caja(position = game.at(10,5),resolucion=resolucionCaja,caja=caja1,cajaEnMeta=cajaMeta1,tipo=1),
						 new Caja(position = game.at(11,2),resolucion=resolucionCaja,caja=caja1,cajaEnMeta=cajaMeta1,tipo=1),
						 new Caja(position = game.at(13,6),resolucion=resolucionCaja,caja=caja1,cajaEnMeta=cajaMeta1,tipo=1),
						 new Caja(position = game.at(11,7),resolucion=resolucionCaja,caja=caja1,cajaEnMeta=cajaMeta1,tipo=1),
						 new Caja(position = game.at(13,9),resolucion=resolucionCaja,caja=caja2,cajaEnMeta=cajaMeta2,tipo=2),
						 new Caja(position = game.at(9,9),resolucion=resolucionCaja,caja=caja2,cajaEnMeta=cajaMeta2,tipo=2),
						 new Caja(position = game.at(13,1),resolucion=resolucionCaja,caja=caja2,cajaEnMeta=cajaMeta2,tipo=2)	  
	]

	method cargarNivel(){
		const duplicador=1	
		configuraciones.configMusic("Nivel2MoiraB.mp3")
		self.cargarObjetos(listaMeta)
		self.cargarObjetos(listaCajas)
		self.generarMuros()
		game.addVisual(jugador1)
		configuraciones.nivelActual(self)	
		self.configNivel(jugador1,duplicador)
	}
	
	method generarMuros(){
		
		const muro2 = "menorResolucion/muro2.png"
		self.bordearHorizontalmente(6,15,0,muro2)
		self.bordearHorizontalmente(8,9,1,muro2)
		self.bordearHorizontalmente(8,10,2,muro2)
		self.bordearVerticalmente(1,6,6,muro2)
		self.bordearHorizontalmente(12,14,2,muro2)
		self.bordearHorizontalmente(12,13,4,muro2)
		self.bordearHorizontalmente(12,13,5,muro2)
		self.bordearVerticalmente(6,7,15,muro2)
		self.bordearVerticalmente(7,11,14,muro2)
		self.bordearHorizontalmente(6,13,11,muro2)
		self.bordearVerticalmente(0,2,16,muro2)
		self.bordearHorizontalmente(17,18,1,muro2)
		self.bordearVerticalmente(2,5,18,muro2)
		self.bordearHorizontalmente(15,17,5,muro2)
		self.bordearHorizontalmente(7,9,6,muro2)
		self.bordearVerticalmente(7,8,9,muro2)
		self.bordearHorizontalmente(6,8,8,muro2)
		self.bordearVerticalmente(9,10,6,muro2)

	}
	
	method image()   = "menorResolucion/prueba2.png"
	
	method position()=game.at(6,2)
	
	override method listaCajas() = listaCajas

 method listaMeta()= listaMeta
	//override method  configNivel
	method configNivel(personaje1,duplicador){
		duplicaDireccion.direccionDuplicador(duplicador)
		configuraciones.configTeclas(personaje1) //Si las configuraciones estan en juego.wpgm no las podemos modificar in game ,por eso las coloco aca	
		configuraciones.configColisiones(personaje1)
	}

}
