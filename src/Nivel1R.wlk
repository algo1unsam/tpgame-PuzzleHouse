import wollok.game.*
import objetos.*
import direcciones.*
import configuraciones.*
import timeline.*
import jugador.*
import niveles.*

object nivel1R inherits Niveles (siguienteNivel = nivel0){
	const jugador1 = new Jugador(position = game.at(14, 1) ,tamanio="mayorResolucion" ,nombreJugador = "jugadora1")
	
	const listaObjetos=[new Caja(position = game.at(16,7),resolucion="mayorResolucion",caja="caja2.png",cajaEnMeta="caja_ok2.png",tipo=2), 
						new Caja(position = game.at(16,3),resolucion="mayorResolucion",caja="caja1.png",cajaEnMeta="caja_ok1.png",tipo=1),
						new Caja(position = game.at(12,5),resolucion="mayorResolucion",caja="caja1.png",cajaEnMeta="caja_ok1.png",tipo=1)
						
						
	]
	
	const listaMeta= [ 
						new Meta(position = game.at(8,7),	image="mayorResolucion/meta1.png"  ),
						new Meta(position = game.at(8,1),	image="mayorResolucion/meta1.png" ),
					    new Meta(position = game.at(16,1)  , image="mayorResolucion/meta2.png", tipo=2 )
					  		
					]

	const listaPared = [
		/* Muros Visnew MuroVisible(position = game.at(4,7)),
						new MuroVisible(position = game.at(4,3)),
	
		/* Muros Invisibles */
		/* VERTICAL */
						new MuroVisible(position = game.at(2,1) ,image="mayorResolucion/muro.png") ,
						new MuroVisible(position = game.at(2,3) ,image="mayorResolucion/muro.png") ,
	     				new MuroVisible(position = game.at(2,5) ,image="mayorResolucion/muro.png") ,
						new MuroVisible(position = game.at(2,7) ,image="mayorResolucion/muro.png") ,
						new MuroVisible(position = game.at(2,9) ,image="mayorResolucion/muro.png") ,
		
		 				new MuroVisible(position = game.at(22,9),image="mayorResolucion/muro.png" ) ,
		 				new MuroVisible(position = game.at(22,7) ,image="mayorResolucion/muro.png") ,
		 				new MuroVisible(position = game.at(22,5) ,image="mayorResolucion/muro.png") ,
					    new MuroVisible(position = game.at(22,1) ,image="mayorResolucion/muro.png") ,
					    new MuroVisible(position = game.at(22,3) ,image="mayorResolucion/muro.png") ,
		
		/* HORIZONTAL */
	    				new MuroVisible(position = game.at(2,11),image="mayorResolucion/muro.png" ) ,
	   				    new MuroVisible(position = game.at(4,11) ,image="mayorResolucion/muro.png") ,
	   				    new MuroVisible(position = game.at(6,11) ,image="mayorResolucion/muro.png") ,
	    				new MuroVisible(position = game.at(6,11) ,image="mayorResolucion/muro.png") ,
						new MuroVisible(position = game.at(8,11) ,image="mayorResolucion/muro.png") ,
						new MuroVisible(position = game.at(10,13) ,image="mayorResolucion/muro.png") ,
	   				    new MuroVisible(position = game.at(12,13) ,image="mayorResolucion/muro.png") ,
	   				    new MuroVisible(position = game.at(14,13),image="mayorResolucion/muro.png" ) ,
	    				new MuroVisible(position = game.at(16,11) ,image="mayorResolucion/muro.png") ,
	   				    new MuroVisible(position = game.at(18,11) ,image="mayorResolucion/muro.png") ,
	    				new MuroVisible(position = game.at(20,11) ,image="mayorResolucion/muro.png") ,
	    				new MuroVisible(position = game.at(22,11) ,image="mayorResolucion/muro.png") ,
		
						new MuroVisible(position = game.at(2,-1) ,image="mayorResolucion/muro.png") ,
	   				    new MuroVisible(position = game.at(4,-1) ,image="mayorResolucion/muro.png") ,
						new MuroVisible(position = game.at(6,-1) ,image="mayorResolucion/muro.png") ,
	    				new MuroVisible(position = game.at(8,-1) ,image="mayorResolucion/muro.png") ,
	    				new MuroVisible(position = game.at(10,-1),image="mayorResolucion/muro.png" ) ,
	    				new MuroVisible(position = game.at(12,-1) ,image="mayorResolucion/muro.png") ,
	    				new MuroVisible(position = game.at(14,-1),image="mayorResolucion/muro.png" ) ,
						new MuroVisible(position = game.at(16,-1),image="mayorResolucion/muro.png" ) ,
	   				    new MuroVisible(position = game.at(18,-1) ,image="mayorResolucion/muro.png") ,
						new MuroVisible(position = game.at(20,-1) ,image="mayorResolucion/muro.png") ,
	   					new MuroVisible(position = game.at(22,-1) ,image="mayorResolucion/muro.png") ,
	   					
	   					//mitad del mapa
	   					new MuroVisible(position = game.at(4,5) ,image="mayorResolucion/muro.png") ,
	   					new MuroVisible(position = game.at(6,5) ,image="mayorResolucion/muro.png") ,
	   					new MuroVisible(position = game.at(8,5) ,image="mayorResolucion/muro.png") ,
	   					new MuroVisible(position = game.at(10,5) ,image="mayorResolucion/muro.png") ,
	   					
	   					new MuroVisible(position = game.at(14,5),image="mayorResolucion/muro.png" ) ,
	   					new MuroVisible(position = game.at(16,5) ,image="mayorResolucion/muro.png") ,
	   					new MuroVisible(position = game.at(18,5),image="mayorResolucion/muro.png" ) ,
	   					new MuroVisible(position = game.at(20,5) ,image="mayorResolucion/muro.png") 
	   					
	]
	

	method cargarNivel(){
		const duplicador=2	
		
		game.addVisual(self)
		configuraciones.nivelActual(self)	
		configuraciones.configMusic("hogar.mp3")
		self.cargarObjetos(listaMeta)
		self.cargarObjetos(listaObjetos)
		self.cargarObjetos(listaPared)
		
		
		game.addVisual(jugador1)
		
		

		self.configNivel(jugador1,duplicador)
	}

	override method listaObjetos() = listaObjetos
	
	override method listaParedes()= listaPared
	
	override method listaMeta()= listaMeta
	
	method image()   = "nivel1/scene-lv1.png"
	
	method position() = game.origin()
	
	method removerTodosLosObjetos(){ //esto estaba puesto en la clase de nivel ,pero por ahora lo dejo aca
		self.listaObjetos().forEach{ objetos => game.removeVisual(objetos)}
		self.listaParedes().forEach{ objetos => game.removeVisual(objetos)}
		self.listaMeta().forEach{ objetos => game.removeVisual(objetos)}
		//jugador1.enQueNivelEsta(nivel2)
		
		//nivel2.cargarNivel()
		//self.musica().stop()	
		
	}

		method configNivel(personaje1,duplicador){
		
		duplicaDireccion.direccionDuplicador(duplicador)
		configuraciones.configTeclas(personaje1) //Si las configuraciones estan en juego.wpgm no las podemos modificar in game ,por eso las coloco aca
		configuraciones.reiniciador(self.listaObjetos())
		configuraciones.configColisiones(personaje1)
	}

}

