import wollok.game.*
import objetos.*
import direcciones.*
import configuraciones.*
import timeline.*
import jugador.*
import niveles.*

object nivelL inherits Nivel (siguienteNivel = nivel0){
	
	const jugador1 = new Jugador(position = game.at(10, 10 ) , resolucion="menorResolucion",nombreJugador = "jugadora1")
	const meta1 = "menorResolucion/meta1.png"
	const meta2 = "menorResolucion/meta2.png"
	const meta3=  "menorResolucion/meta3.png"
	const meta4=  "menorResolucion/meta4.png"
	const resolucionCaja = "menorResolucion"
	const caja1 = "caja1.png"
	const caja2 = "caja2.png"
	const caja3 = "caja3.png"
	const caja4 = "caja4.png"
	const cajaMeta1 = "caja_ok.png"
	const cajaMeta2 = "caja_ok2.png"
	const cajaMeta3 = "caja3_ok.png"
	const cajaMeta4 = "caja4_ok.png"

	const listaMeta =[ 
						
						
						 
						 new Meta(position = game.at(21,2),image= meta1),
						
						 
						 new Meta(position = game.at(22,2), image= meta1),
						
						 new Meta(position = game.at(17,7), image= meta1),
						 
						  new Meta(position = game.at(4,4), image= meta2,tipo=2),
						  
						  new Meta(position = game.at(4,3), image= meta4,tipo=4),
						  
						  new Meta(position = game.at(4,2), image= meta3,tipo=3),
						  
						   new Meta(position = game.at(4,1), image= meta2,tipo=2),
						   
						 
						 new Meta(position = game.at(17,6), image= meta1)
						 
						
		
	]
	const listaCajas=[  
						 new Caja(position = game.at(18,6),resolucion=resolucionCaja,stringDeObjeto=caja1,cajaEnMeta=cajaMeta1,tipo=1), 
						 new Caja(position = game.at(19,5),resolucion=resolucionCaja,stringDeObjeto=caja1,cajaEnMeta=cajaMeta1,tipo=1),
						 new Caja(position = game.at(20,4),resolucion=resolucionCaja,stringDeObjeto=caja1,cajaEnMeta=cajaMeta1,tipo=1),
						 new Caja(position = game.at(21,3),resolucion=resolucionCaja,stringDeObjeto=caja1,cajaEnMeta=cajaMeta1,tipo=1),
						 
						 new Caja(position = game.at(22,8),resolucion=resolucionCaja,stringDeObjeto=caja3,cajaEnMeta=cajaMeta3,tipo=3),
						
						 new Caja(position = game.at(21,9),resolucion=resolucionCaja,stringDeObjeto=caja4,cajaEnMeta=cajaMeta4,tipo=4),
						  new Caja(position = game.at(3,11),resolucion=resolucionCaja,stringDeObjeto=caja2,cajaEnMeta=cajaMeta2,tipo=2),
						 new Caja(position = game.at(16,10),resolucion=resolucionCaja,stringDeObjeto=caja2,cajaEnMeta=cajaMeta2,tipo=2)
	
	]

	method cargarNivel(){
		
		configuraciones.configMusic("nivelL-B.mp3")
		game.addVisual(self)
		self.cargarObjetos(listaMeta)
		self.cargarObjetos(listaCajas)
		self.generarMuros()
		game.addVisual(jugador1)
		configuraciones.nivelActual(self)	
		self.configNivel(jugador1)
		nivel0.posicionInitial(game.at(21,3))
		nivel0.agregarNivelCompletado(self)
	}
	
	method generarMuros(){
		const muro = "menorResolucion/muro3.png"
		
		
		
		
		self.bordearHorizontalmente(0,4,0,muro)
		self.bordearHorizontalmente(5,9,0,muro)
		self.bordearVerticalmente(1,3,0,muro)
		self.bordearVerticalmente(3,10,1,muro)
		self.bordearVerticalmente(10,13,0,muro)
		self.bordearHorizontalmente(1,4,13,muro)
		self.bordearHorizontalmente(4,11,12,muro)
		self.bordearVerticalmente(2,10,3,muro)
		self.bordearVerticalmente(0,4,5,muro)
		self.bordearHorizontalmente(4,8,10,muro)
	
		self.bordearHorizontalmente(5,5,6,muro)
		self.bordearHorizontalmente(5,6,8,muro)
		self.bordearHorizontalmente(8,8,9,muro)
		
		self.bordearHorizontalmente(8,8,4,muro)
		self.bordearHorizontalmente(7,7,2,muro)
		self.bordearVerticalmente(0,6,9,muro)
		
		self.bordearHorizontalmente(10,10,9,muro)
	
	
	    self.bordearVerticalmente(0,6,9,muro)
	  
	
		
	
	  //inclinacion izquierda 2
		self.bordearVerticalmente(4,5,22,muro)
		self.bordearVerticalmente(5,6,21,muro)
		self.bordearVerticalmente(6,7,20,muro)
		self.bordearVerticalmente(7,8,19,muro)
		self.bordearVerticalmente(8,9,18,muro)
	 //inclinacion derecha
	 	
	 
		
		
		
		self.bordearHorizontalmente(22,24,6,muro)
		self.bordearVerticalmente(7,9,24,muro)
		self.bordearVerticalmente(9,10,23,muro)
		
		self.bordearVerticalmente(10,11,22,muro)
		self.bordearVerticalmente(11,12,21,muro)
		
		self.bordearHorizontalmente(17,20,11,muro)
		
		self.bordearHorizontalmente(14,15,11,muro)
		self.bordearVerticalmente(9,12,12,muro)
		self.bordearHorizontalmente(8,14,7,muro)
		
		
		
		
		self.bordearHorizontalmente(19,23,0,muro)
		self.bordearVerticalmente(1,4,23,muro)
		self.bordearVerticalmente(1,2,19,muro)
		self.bordearVerticalmente(2,3,18,muro)
		self.bordearVerticalmente(3,4,17,muro)
		self.bordearHorizontalmente(15,16,4,muro)
		self.bordearHorizontalmente(17,17,8,muro)
		self.bordearVerticalmente(5,7,15,muro)
		self.bordearHorizontalmente(15,17,9,muro)
		self.bordearHorizontalmente(13,20,13,muro)
		
	//	self.bordearHorizontalmente(15,17,9,muro3)
		
	}
	
	//method image() = "oscuro2.png"
	method image() = "menorResolucion/mapaL.png"
	method position()=game.at(0,0)
	
	override method listaCajas() = listaCajas

 method listaMeta()= listaMeta

}