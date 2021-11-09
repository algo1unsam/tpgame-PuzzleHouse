import wollok.game.*
import objetos.*
import direcciones.*
import configuraciones.*
import timeline.*
import jugador.*
import niveles.*

object nivelW inherits Nivel (siguienteNivel = nivel0){
	
	const jugador1 = new Jugador(position = game.at(19, 0) , resolucion="menorResolucion",nombreJugador = "jugador1")
	const meta1 = "menorResolucion/meta1.png"
	const meta2 = "menorResolucion/meta2.png"
	const resolucionCaja = "menorResolucion"
	const caja1 = "caja1.png"
	const caja2 = "caja2.png"
	const cajaMeta1 = "caja_ok.png"
	const cajaMeta2 = "caja_ok2.png"

	const listaMeta =[   new Meta(position = game.at(9,5),image= meta1)/*,
						 new Meta(position = game.at(8,5), image= meta2,tipo=2),
						 new Meta(position = game.at(10,5), image= meta1),
						 
						 new Meta(position = game.at(14,5), image= meta1),
						 new Meta(position = game.at(15,5), image= meta2,tipo=2),
						 new Meta(position = game.at(16,5), image= meta1),
						 
						 new Meta(position = game.at(5,2), image= meta1),
						 new Meta(position = game.at(6,2), image= meta2, tipo=2)*/
					
		
	]
	const listaCajas=[   new Caja(position = game.at(7,7),resolucion=resolucionCaja,stringDeObjeto=caja1,cajaEnMeta=cajaMeta1,tipo=1)/*,
						 new Caja(position = game.at(6,9) ,resolucion=resolucionCaja,stringDeObjeto=caja1,cajaEnMeta=cajaMeta1,tipo=1),
						 new Caja(position = game.at(9,9) ,resolucion=resolucionCaja,stringDeObjeto=caja2,cajaEnMeta=cajaMeta2,tipo=2),
						 
						 new Caja(position = game.at(17,7),resolucion=resolucionCaja,stringDeObjeto=caja1,cajaEnMeta=cajaMeta1,tipo=1),
						 new Caja(position = game.at(18,9),resolucion=resolucionCaja,stringDeObjeto=caja1,cajaEnMeta=cajaMeta1,tipo=1),
						 new Caja(position = game.at(15,9),resolucion=resolucionCaja,stringDeObjeto=caja2,cajaEnMeta=cajaMeta2,tipo=2),
						 
						 new Caja(position = game.at(6,2),resolucion=resolucionCaja,stringDeObjeto=caja1,cajaEnMeta=cajaMeta1,tipo=1),
						 new Caja(position = game.at(8,2),resolucion=resolucionCaja,stringDeObjeto=caja2,cajaEnMeta=cajaMeta2,tipo=2)*/	  
	]

	method cargarNivel(){
		
		configuraciones.configMusic("nivelW-B.mp3")
		game.addVisual(self)
		self.cargarObjetos(listaMeta)
		self.cargarObjetos(listaCajas)
		self.generarMuros()
		game.addVisual(jugador1)
		configuraciones.nivelActual(self)	
		self.configNivel(jugador1)
		nivel0.posicionInitial(game.at(5,10))
	}
	
	method generarMuros(){
		const muro2 = "menorResolucion/muro3.png"
		
		/* Bordes */
		self.bordearHorizontalmente(4,17,1,muro2)
		self.bordearHorizontalmente(4,20,11,muro2)
		self.bordearVerticalmente(2,4,4,muro2)
		self.bordearVerticalmente(7,10,4,muro2)
		self.bordearVerticalmente(0,4,20,muro2)
		self.bordearVerticalmente(7,10,20,muro2)
		self.bordearVerticalmente(0,0,17,muro2)
	
		self.bordearHorizontalmente(5,11,4,muro2)
		self.bordearHorizontalmente(13,19,4,muro2)
		self.bordearVerticalmente(5,6,5,muro2)
		self.bordearVerticalmente(5,6,11,muro2)
		self.bordearVerticalmente(5,6,13,muro2)
		self.bordearVerticalmente(5,6,19,muro2)
		self.bordearHorizontalmente(9,10,6,muro2)
		self.bordearHorizontalmente(14,15,6,muro2)
		self.bordearHorizontalmente(5,6,7,muro2)
		self.bordearHorizontalmente(18,19,7,muro2)
		self.bordearVerticalmente(8,10,8,muro2)
		self.bordearVerticalmente(8,10,16,muro2)
		
		self.bordearHorizontalmente(12,12,10,muro2)
		self.bordearHorizontalmente(10,10,9,muro2)
		self.bordearHorizontalmente(14,14,9,muro2)
		
	}
	
	method image() = "menorResolucion/mapW.png"
	method position()=game.at(0,0)
	
	override method listaCajas() = listaCajas

 	method listaMeta()= listaMeta

}