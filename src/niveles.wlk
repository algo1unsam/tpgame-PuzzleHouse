import wollok.game.*
import objetos.*
import direcciones.*
import configuraciones.*
import timeline.*
import jugador.*

class Niveles {
	var property siguienteNivel
	method listaObjetos()

	method listaParedes()
	
	method listaMeta()

	method cargarObjetos(objeto) = objeto.forEach{ unObjeto => game.addVisual(unObjeto)}
	
	method eliminaTodo(){
		game.clear()
	}
	
	
	method avanzarA(){
		self.eliminaTodo()
		(self.siguienteNivel()).cargarNivel()
	}
	
	
	method verificarMetas(){
		const verificador=self.listaObjetos().all({unaCaja=>unaCaja.llegoMeta()})
		
		if(verificador){
			game.say(configuraciones.elJugador(),"ganaste!")
	}
	
	}
}

object nivel0 inherits Niveles (siguienteNivel = nivel1){
	
		
	const jugador1 = new Jugador(position = game.at(10, 7) ,tamanio="nivel0",nombreJugador = "jugador1", nivel= self)
	const listaObjetos = [ jugador1 ]
	
	const listaMeta =[]
		
	const listaPared =[
						new Muro(position = game.at(0,1) ) ,	
						new Muro(position = game.at(0,2) ) ,
						new Muro(position = game.at(0,3) ) ,
					    new Muro(position = game.at(0,4) ) ,
					    new Muro(position = game.at(6,4) ) ,
					    new Muro(position = game.at(11,3) ),
					    new Muro(position = game.at(12,3) ),
					    new Muro(position = game.at(13,0) ),
						new Muro(position = game.at(14,0) ),
					    new Muro(position = game.at(15,0) ),
						new Muro(position = game.at(16,0) ),
					    new Muro(position = game.at(17,0) ),
						new Muro(position = game.at(13,5) ),
						new Muro(position = game.at(14,5) ),
					    new Muro(position = game.at(15,5)) ,
					    new Muro(position = game.at(16,5) ),
					    new Muro(position = game.at(17,5) ),
					    new Muro(position = game.at(19,5) ),
						new Muro(position = game.at(20,5) ),
						new Muro(position = game.at(21,5) ),
					    new Muro(position = game.at(22,5) ),
					    new Muro(position = game.at(23,5) ),
						new Muro(position = game.at(19,0) ),
					    new Muro(position = game.at(20,0) ),
					    new Muro(position = game.at(21,0) ),
					    new Muro(position = game.at(22,0) ),
						new Muro(position = game.at(23,0) ),
		
		// HORIZONTAL 
						new Muro(position = game.at(1,0) ),
						new Muro(position = game.at(2,0) ),
					    new Muro(position = game.at(3,0) ),
					    new Muro(position = game.at(4,0) ),
		  			    new Muro(position = game.at(5,0) ),
					    new Muro(position = game.at(6,1) ),
					    new Muro(position = game.at(7,1) ),
					    new Muro(position = game.at(8,1) ),
					    new Muro(position = game.at(9,1) ),
						new Muro(position = game.at(10,1)),
					    new Muro(position = game.at(11,1)),
					    new Muro(position = game.at(12,1)),
						new Muro(position = game.at(6,3)),
						new Muro(position = game.at(8,3)),
						new Muro(position = game.at(9,3) ),
						new Muro(position = game.at(1,5) ),
						new Muro(position = game.at(2,5) ),
						new Muro(position = game.at(3,5) ),
						new Muro(position = game.at(4,5) ),
						new Muro(position = game.at(5,5) ),
						new Muro(position = game.at(12,4) ),
					    new Muro(position = game.at(18,4) ),
					    new Muro(position = game.at(18,3) ),
						new Muro(position = game.at(18,1) ),
						new Muro(position = game.at(24,4) ),
					    new Muro(position = game.at(24,3) ),
					    new Muro(position = game.at(24,2) ),
						new Muro(position = game.at(24,1) ),
		// Escaleras 
					   new Muro(position = game.at(16,4) ),
					   new Muro(position = game.at(15,4) ),
					   new Muro(position = game.at(14,4) ),
					   new Muro(position = game.at(14,3) ),
					   new Muro(position = game.at(15,3) ),
					   new Muro(position = game.at(16,3) )
	]
	
	method cargarNivel(){		
		 const duplicador=1
		configuraciones.configMusic("nivel1cc.mp3")
		game.addVisual(map)
		
		game.addVisual(checkpoint1)
		
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
		const hijo = new Jugador(position = game.at(7, 11) ,tamanio="nivel0" ,nombreJugador = "hijo", nivel= self)
		game.addVisual(hijo)
		
		game.addVisual(hab2)
		const hija = new Jugador(position = game.at(10, 11) ,tamanio="nivel0", nombreJugador = "hija", nivel= self)
		game.addVisual(hija)
		
		game.addVisual(sombraHab1)
		game.addVisual(sombraHab2)
		
		self.cargarObjetos(listaPared)
		/* ESPOSO */
		game.addVisual(jugador1)
		self.configNivel(jugador1,duplicador)
		jugador1.position(game.at(20, 3))
		jugador1.posicionInicial(game.at(20, 3))
		
		/* ESPOSA */
		const jugadora1 = new Jugador(position = game.at(23, 4) ,tamanio="nivel0", nombreJugador = "jugadora1", nivel= self)
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
	

	override method listaObjetos() = listaObjetos
	
	override method listaParedes()= listaPared
	
	override method listaMeta()= listaMeta
}

object nivel1 inherits Niveles (siguienteNivel = nivel0){
	const jugador1 = new Jugador(position = game.at(22, 1) , tamanio="nivel0",nombreJugador = "jugador1", nivel= self)
	
	
	const listaMeta =[  new Meta(position = game.at(15,7), image="menorResolucion/meta1.png" ),
						new Meta(position = game.at(8,7), image="menorResolucion/meta1.png" ),
						new Meta(position = game.at(7,9),  image="menorResolucion/meta2.png",tipo=2 ),
						new Meta(position = game.at(7,10),  image="menorResolucion/meta2.png",tipo=2 )
						
		
	]
	const listaObjetos=[new Caja(position = game.at(10,5),resolucion="menorResolucion",caja="caja1.png",cajaEnMeta="caja_ok.png"), 
					    new Caja(position = game.at(9,4),resolucion="menorResolucion",caja="caja1.png",cajaEnMeta="caja_ok.png"),
					    new Caja(position = game.at(10,7),resolucion="menorResolucion",caja="caja2.png",cajaEnMeta="caja_ok2.png",tipo=2),
					  	 new Caja(position = game.at(11,7),resolucion="menorResolucion",caja="caja2.png",cajaEnMeta="caja_ok2.png",tipo=2)
		
	]
		

	
	
	const listaPared =[new MuroVisible(position = game.at(6,0) , image ="nivel0/muro2.png"),
					   new MuroVisible(position = game.at(7,0) , image ="nivel0/muro2.png"),
					   new MuroVisible(position = game.at(8,0) , image ="nivel0/muro2.png"),
					   new MuroVisible(position = game.at(9,0) , image ="nivel0/muro2.png"),
					   new MuroVisible(position = game.at(10,0) , image ="nivel0/muro2.png"),
					   new MuroVisible(position = game.at(11,0) , image ="nivel0/muro2.png"),
					   new MuroVisible(position = game.at(12,0) , image ="nivel0/muro2.png"),
					   new MuroVisible(position = game.at(13,0) , image ="nivel0/muro2.png"),
					   new MuroVisible(position = game.at(14,0) , image ="nivel0/muro2.png"),
					   new MuroVisible(position = game.at(15,0) , image ="nivel0/muro2.png"),
					   new MuroVisible(position = game.at(16,0) , image ="nivel0/muro2.png"),
					   new MuroVisible(position = game.at(17,0) , image ="nivel0/muro2.png"),
					   new MuroVisible(position = game.at(18,0) , image ="nivel0/muro2.png"),
					 
					   
					   new MuroVisible(position = game.at(6,2) , image ="nivel0/muro2.png"),
					   
					   
					   new MuroVisible(position = game.at(6,1) , image ="nivel0/muro2.png"),
					  
					   
					   
					   new MuroVisible(position = game.at(6,11) , image ="nivel0/muro2.png"),
					   new MuroVisible(position = game.at(7,11) , image ="nivel0/muro2.png"),
					   new MuroVisible(position = game.at(8,11) , image ="nivel0/muro2.png"),
					   new MuroVisible(position = game.at(9,11) , image ="nivel0/muro2.png"),
					   new MuroVisible(position = game.at(10,11) , image ="nivel0/muro2.png"),
					   new MuroVisible(position = game.at(11,11) , image ="nivel0/muro2.png"),
					   new MuroVisible(position = game.at(12,11) , image ="nivel0/muro2.png"),
					   new MuroVisible(position = game.at(13,11) , image ="nivel0/muro2.png"),
					   new MuroVisible(position = game.at(14,11) , image ="nivel0/muro2.png"),
					   new MuroVisible(position = game.at(15,11) , image ="nivel0/muro2.png"),
					   new MuroVisible(position = game.at(16,11) , image ="nivel0/muro2.png"),
					   new MuroVisible(position = game.at(17,11) , image ="nivel0/muro2.png"),
					   new MuroVisible(position = game.at(18,11) , image ="nivel0/muro2.png"),
					   new MuroVisible(position = game.at(16,2) , image ="nivel0/muro2.png"),
					   new MuroVisible(position = game.at(16,1) , image ="nivel0/muro2.png"),
					   new MuroVisible(position = game.at(17,1) , image ="nivel0/muro2.png"),
					   new MuroVisible(position = game.at(12,5) , image ="nivel0/muro2.png"),
					   new MuroVisible(position = game.at(13,5) , image ="nivel0/muro2.png"),
					   new MuroVisible(position = game.at(13,4) , image ="nivel0/muro2.png"),
					   new MuroVisible(position = game.at(12,4) , image ="nivel0/muro2.png"),
					   
					   
					   
					   new MuroVisible(position = game.at(6,3) , image ="nivel0/muro2.png"),
					   new MuroVisible(position = game.at(6,4) , image ="nivel0/muro2.png"),
					   new MuroVisible(position = game.at(6,5) , image ="nivel0/muro2.png"),
					   new MuroVisible(position = game.at(6,6) , image ="nivel0/muro2.png"),
					   new MuroVisible(position = game.at(6,7) , image ="nivel0/muro2.png"),
					   new MuroVisible(position = game.at(6,8) , image ="nivel0/muro2.png"),
					   new MuroVisible(position = game.at(6,9) , image ="nivel0/muro2.png"),
					   new MuroVisible(position = game.at(6,10) , image ="nivel0/muro2.png"),
					   
					    new MuroVisible(position = game.at(18,1) , image ="nivel0/muro2.png"),
					    new MuroVisible(position = game.at(18,2) , image ="nivel0/muro2.png"),
					    new MuroVisible(position = game.at(18,3) , image ="nivel0/muro2.png"),
					    new MuroVisible(position = game.at(18,4) , image ="nivel0/muro2.png"),
					    new MuroVisible(position = game.at(18,5) , image ="nivel0/muro2.png"),
					    new MuroVisible(position = game.at(18,6) , image ="nivel0/muro2.png"),
					    new MuroVisible(position = game.at(18,7) , image ="nivel0/muro2.png"),
					    new MuroVisible(position = game.at(18,8) , image ="nivel0/muro2.png"),
					    new MuroVisible(position = game.at(18,9) , image ="nivel0/muro2.png"),
					    new MuroVisible(position = game.at(18,10) , image ="nivel0/muro2.png"),
					    
					    
					    new MuroVisible(position = game.at(8,1) , image ="nivel0/muro2.png"),
					    new MuroVisible(position = game.at(8,2) , image ="nivel0/muro2.png"),
					    new MuroVisible(position = game.at(9,2) , image ="nivel0/muro2.png"),
					    new MuroVisible(position = game.at(9,1) , image ="nivel0/muro2.png"),
					    new MuroVisible(position = game.at(12,2) , image ="nivel0/muro2.png"),
					    new MuroVisible(position = game.at(13,2) , image ="nivel0/muro2.png"),
					    new MuroVisible(position = game.at(14,2) , image ="nivel0/muro2.png"),
					    new MuroVisible(position = game.at(10,2) , image ="nivel0/muro2.png")
					    
					    
					    
					   
				   
	]
	
	method cargarNivel(){
		const duplicador=1	
		configuraciones.nivelActual(self)	
		configuraciones.configMusic("nivel1a.mp3")
		self.cargarObjetos(listaMeta)
		self.cargarObjetos(listaObjetos)
		self.cargarObjetos(listaPared)
		
		jugador1.position(game.at(7,1))
		jugador1.posicionInicial(game.at(7,1))
		game.addVisual(jugador1)
		
		

		self.configNivel(jugador1,duplicador)
	}
	
	method image()   = "nivel0/prueba2.png"
	
	method position()=game.at(6,2)
	
	override method listaObjetos() = listaObjetos
	
	override method listaParedes()= listaPared
	
	override method listaMeta()= listaMeta
	//override method  configNivel
	method configNivel(personaje1,duplicador){

		duplicaDireccion.direccionDuplicador(duplicador)
		configuraciones.configTeclas(personaje1) //Si las configuraciones estan en juego.wpgm no las podemos modificar in game ,por eso las coloco aca
		configuraciones.reiniciador(self.listaObjetos())
		configuraciones.configColisiones(personaje1)
	}


	
}


