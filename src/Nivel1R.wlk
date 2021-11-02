import wollok.game.*
import objetos.*
import direcciones.*
import configuraciones.*
import timeline.*
import jugador.*
import niveles.*

object nivel1R inherits Niveles (siguienteNivel = nivel0){
	const jugador1 = new Jugador(position = game.at(14, 1) ,resolucion="mayorResolucion" ,nombreJugador = "jugadora1")
	
	const listaObjetos=[new Caja(position = game.at(16,7),resolucion="mayorResolucion",caja="caja2.png",cajaEnMeta="caja_ok2.png",tipo=2), 
						new Caja(position = game.at(16,3),resolucion="mayorResolucion",caja="caja1.png",cajaEnMeta="caja_ok1.png",tipo=1),
						new Caja(position = game.at(12,5),resolucion="mayorResolucion",caja="caja1.png",cajaEnMeta="caja_ok1.png",tipo=1)]
	
	const listaMeta= [  new Meta(position = game.at(8,7) ,	image="mayorResolucion/meta1.png"  ),
						new Meta(position = game.at(8,1) ,	image="mayorResolucion/meta1.png"  ),
					    new Meta(position = game.at(16,1),  image="mayorResolucion/meta2.png", tipo=2 )]

	const listaPared = []
	
	const listaObjetosYjugador=[]

	
	method cargarNivel(){
		const duplicador=2	
		configuraciones.configMusic("hogar.mp3")
		
		game.addVisual(self)
		
		
		self.cargarObjetos(listaMeta)
		self.cargarObjetos(listaObjetos)
		
		
		//self.cargarObjetos(listaPared)
			
		self.generarMuros(listaPared)
		
		game.addVisual(jugador1)
		configuraciones.nivelActual(self)
		self.configNivel(jugador1,duplicador)
	}

	override method listaObjetos() = listaObjetos
	
	override method listaParedes()= listaPared
	
	method generarMuros(lista){
		const ancho = game.width() - 1
		const largo = game.height() - 1
		
		/* Bordes */
		(4 .. ancho-4).forEach({ n => lista.add( new Position( x=n, y=-1))}) // BOTTOM
		(4 .. 8).forEach{ n => lista.add(new Position(x=n, y=largo-1))} // TOP 
		(4 .. 10).forEach{ n => lista.add(new Position(x=n, y=largo-7))} // MID		
		(0 .. largo).forEach({ n => lista.add( new Position( x=2, y=n))}) // LEFT
		(0 .. largo).forEach({ n => lista.add( new Position( x=ancho-2, y=n))}) // RIGHT
		
		/* Custom */
		lista.addAll([ new Position(x=14, y=5), new Position(x=16,y=5) , new Position(x=18,y=5)  , new Position(x=20,y=5),
							new Position(x=16,y=11), new Position(x=18,y=11), new Position(x=20,y=11) ,
							new Position(x=10,y=13), new Position(x=12,y=13), new Position(x=14, y=13)])
							
		lista.forEach { p => self.dibujar(new MuroVisible(position = p, image="mayorResolucion/muro.png"))}
	}
	
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

