import wollok.game.*
import objetos.*
import direcciones.*
import configuraciones.*
import timeline.*
import jugador.*
import niveles.*

object nivelW inherits Nivel (siguienteNivel = nivel0){
	
	const jugador1 = new Jugador(position = game.at(15, 3) , resolucion="menorResolucion",nombreJugador = "jugador1")
	const meta1 = "menorResolucion/meta_bonus1.png"
	const meta2 = "menorResolucion/meta_bonus2.png"
	const resolucionCaja = "menorResolucion"
	const caja1 = "caja1.png"
	const caja2 = "caja2.png"
	const cajaMeta1 = "caja_ok1.png"
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
		
		configuraciones.configMusic("nivelBonus.mp3")
		game.addVisual(self)
		self.cargarObjetos(listaMeta)
		self.cargarObjetos(listaCajas)
		self.generarMuros()
		game.addVisual(jugador1)
		configuraciones.nivelActual(self)	
		self.configNivel(jugador1)
	}
	
	method generarMuros(){
		const arbusto = "menorResolucion/arbusto.png"
		
		/* Arbustos */
		self.bordearHorizontalmente(8,9,1,arbusto)
		self.bordearHorizontalmente(8,9,2,arbusto)
		self.bordearHorizontalmente(12,13,4,arbusto)
		self.bordearHorizontalmente(12,13,5,arbusto)
		

	}
	
	method image() = "nivelBonus/map_bonus.png"
	method position()=game.at(0,0)
	
	override method listaCajas() = listaCajas

 method listaMeta()= listaMeta
	//override method  configNivel

}