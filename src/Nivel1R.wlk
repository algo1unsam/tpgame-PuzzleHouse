import wollok.game.*
import objetos.*
import direcciones.*
import configuraciones.*
import timeline.*
import jugador.*
import niveles.*

object nivel1R inherits Nivel (siguienteNivel = nivel0 ,duplicador=2){
	const jugador1 = new Jugador(position = game.at(14, 1) ,resolucion="mayorResolucion" ,nombreJugador = "jugadora1")
	
	const listaCajas=[new Caja(position = game.at(16,7),resolucion="mayorResolucion",caja="caja2.png",cajaEnMeta="caja_ok2.png",tipo=2), 
						new Caja(position = game.at(16,3),resolucion="mayorResolucion",caja="caja1.png",cajaEnMeta="caja_ok1.png",tipo=1),
						new Caja(position = game.at(12,5),resolucion="mayorResolucion",caja="caja1.png",cajaEnMeta="caja_ok1.png",tipo=1)]
	
	const listaMeta= [  new Meta(position = game.at(8,7) ,	image="mayorResolucion/meta1.png"  ),
						new Meta(position = game.at(8,1) ,	image="mayorResolucion/meta1.png"  ),
					    new Meta(position = game.at(16,1),  image="mayorResolucion/meta2.png", tipo=2 )]

	method cargarNivel(){
		
		configuraciones.configMusic("hogar.mp3")
		
		game.addVisual(self)
		
		
		self.cargarObjetos(listaMeta)
		self.cargarObjetos(listaCajas)
		
		
		//self.cargarObjetos(listaPared)
			
		self.generarMuros()
		
		game.addVisual(jugador1)
		configuraciones.nivelActual(self)
		self.configNivel(jugador1,duplicador)
	}

	override method listaCajas() = listaCajas

	method generarMuros(){
		const muro = "mayorResolucion/muro3.png"
		self.bordearVerticalmente(1,11,0,muro)
		self.bordearHorizontalmente(2,8,11,muro)
		self.bordearHorizontalmente(16,24,11,muro)
		self.bordearVerticalmente(-1,1,24,muro)
		self.bordearVerticalmente(5,9,24,muro)
		self.bordearHorizontalmente(0,22,-1,muro)
		self.bordearHorizontalmente(14,22,5,muro)
		self.bordearHorizontalmente(2,10,5,muro)
		self.bordearHorizontalmente(10,14,13,muro)
		
	}
	
	 method listaMeta()= listaMeta
	
	method image()   = "nivel1/nivel1R-map.png"
	
	method position() = game.origin()
	

		method configNivel(personaje1,duplicador){
		
		duplicaDireccion.direccionDuplicador(duplicador)
		configuraciones.configTeclas(personaje1) //Si las configuraciones estan en juego.wpgm no las podemos modificar in game ,por eso las coloco aca
	
		configuraciones.configColisiones(personaje1)
	}

}




