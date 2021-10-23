import wollok.game.*
import pepita.*
import direcciones.*
import configuraciones.*
import timeline.*

class Niveles {
//const listaNiveles=[nivel1] //[nivel1,nivel2,nivel3 etc]
//method elementosPorNivel() = listaNiveles.flatMap({elementos=>elementos.listaObjetos()}) 
//method reiniciarNivel() = self.elementosPorNivel().forEach{elemn=>elemn.posicioninicial() }
	method configNivel0(personaje1){
		configuraciones.configTeclas(personaje1)
		configuraciones.configColisiones(personaje1)
	}
	
	method configNivel1(personaje1){
		configuraciones.configTeclas(personaje1) //Si las configuraciones estan en juego.wpgm no las podemos modificar in game ,por eso las coloco aca
		configuraciones.reiniciador(self.listaObjetos())
		configuraciones.configColisiones(personaje1)	
	}
	method listaObjetos()
	
	method listaParedes()
	
	method listaMeta()

	method cargarObjetos(objeto) = objeto.forEach{ unObjeto => game.addVisual(unObjeto)}
}

object nivel0 inherits Niveles {
	const jugador1 = new Jugador(position = game.at(22, 1) , nombreJugador = "jugador1", nivel= 0)
	const listaObjetos = [ jugador1 ]
	
	const listaMeta =[]
	
	
	const listaPared =[
		
						new Muro(position = game.at(0,1) ) ,	
						new Muro(position = game.at(0,2) ) ,
						new Muro(position = game.at(0,3) ) ,
					    new Muro(position = game.at(0,4) ) ,
					    new Muro(position = game.at(6,4) ) ,
						new Muro(position = game.at(10,4)) ,
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
						new Muro(position = game.at(7,4)),
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
					  	 new Muro(position = game.at(16,3))
	
	]
	

	method cargarNivel(){
		configuraciones.configMusic("nivel1cc.mp3")
		game.addVisual(map)
		game.addVisual(sombra4)
		game.addVisual(sombra3)
		game.addVisual(sombra2)
		game.addVisual(sombra1)
		
		self.cargarObjetos(listaPared)
		
		game.addVisual(jugador1)
		self.configNivel0(jugador1)
		
		/* ESPOSA */
		const jugadora1 = new Jugador(position = game.at(23, 4) , nombreJugador = "jugadora1", nivel= 0)
		game.addVisual(jugadora1)
			
	}
	

	override method listaObjetos() = listaObjetos
	
	override method listaParedes()= listaPared
	
	override method listaMeta()= listaMeta
}
	


object nivel1 inherits Niveles {
	const jugador1 = new Jugador(position = game.at(2, 1) , nombreJugador = "jugador1", nivel= 1)
	
	const listaObjetos=[
						new Caja(position = game.at(16,5), image="nivel1/caja2.png" , image_success="nivel1/caja_ok2.png", tipo = 2),
						new Caja(position = game.at(12,7)),
						new Caja(position = game.at(10,5)),
						new Caja(position = game.at(12,3)),
						new Caja(position = game.at(14,5)),
						new Caja(position = game.at(18,5) , image="nivel1/caja2.png", image_success="nivel1/caja_ok2.png", tipo = 2)
	]
	
	const listaMeta= [  new Meta(position = game.at(2,9)  ),
						new Meta(position = game.at(2,1)  ),
						new Meta(position = game.at(22,9) ),
						new Meta(position = game.at(16,7) ),
					    new Meta(position = game.at(16,3)  , image="nivel1/meta2.png", tipo=2 ),
					    new Meta(position = game.at(18,3) , image="nivel1/meta2.png", tipo=2 )			
					]

	const listaPared = [
		
					/* Muros Visibles */
						new MuroVisible(position = game.at(4,7)),
						new MuroVisible(position = game.at(4,3)),
	
		/* Muros Invisibles */
		/* VERTICAL */
						new Muro(position = game.at(0,1) ) ,
						new Muro(position = game.at(0,3) ) ,
	     				new Muro(position = game.at(0,5) ) ,
						new Muro(position = game.at(0,7) ) ,
						new Muro(position = game.at(0,9) ) ,
		
		 				new Muro(position = game.at(24,9) ) ,
		 				new Muro(position = game.at(24,7) ) ,
		 				new Muro(position = game.at(24,5) ) ,
					    new Muro(position = game.at(24,1) ) ,
		
		/* HORIZONTAL */
	    				new Muro(position = game.at(2,11) ) ,
	   				    new Muro(position = game.at(4,11) ) ,
	   				    new Muro(position = game.at(6,11) ) ,
	    				new Muro(position = game.at(6,11) ) ,
						new Muro(position = game.at(8,11) ) ,
						new Muro(position = game.at(10,11) ) ,
	   				    new Muro(position = game.at(12,11) ) ,
	   				    new Muro(position = game.at(14,11) ) ,
	    				new Muro(position = game.at(16,11) ) ,
	   				    new Muro(position = game.at(18,11) ) ,
	    				new Muro(position = game.at(20,11) ) ,
	    				new Muro(position = game.at(22,11) ) ,
		
						new Muro(position = game.at(2,-1) ) ,
	   				    new Muro(position = game.at(4,-1) ) ,
						new Muro(position = game.at(6,-1) ) ,
	    				new Muro(position = game.at(8,-1) ) ,
	    				new Muro(position = game.at(10,-1) ) ,
	    				new Muro(position = game.at(12,-1) ) ,
	    				new Muro(position = game.at(14,-1) ) ,
						new Muro(position = game.at(16,-1) ) ,
	   				    new Muro(position = game.at(18,-1) ) ,
						new Muro(position = game.at(20,-1) ) ,
	   					new Muro(position = game.at(22,-1) ) 
	]

	
	
	method cargarNivel(){
		configuraciones.configMusic("macariaDespierta.mp3")
				
		game.addVisual(self)

		/* JUGADOR 1 */
		jugador1.posicionInicial(game.at(2,1))

		
		self.cargarObjetos(listaMeta)
		
		self.cargarObjetos(listaPared)
		game.addVisual(jugador1)
		self.cargarObjetos(listaObjetos)
		
		
		
		

		self.configNivel1(jugador1)
	}
	
	/* Elimine a jugador1 de la listaObjetos, pienso que ahora sera mas facil usar all u otro metodo
	 * para el tema de saber si completo el puzzle
	 */

	
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
	
	method verificarMetas(){
			return listaObjetos.all({unaCaja=>unaCaja.llegoMeta()})
		
	}
	
}

