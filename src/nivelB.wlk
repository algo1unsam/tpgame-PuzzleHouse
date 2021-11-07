import wollok.game.*
import objetos.*
import direcciones.*
import configuraciones.*
import timeline.*
import jugador.*
import niveles.*


object pasadizo inherits Nivel(siguienteNivel = nivel0, duplicador = 2){
	const jugador1 = new Jugador(position = game.at(2, 3) ,resolucion="mayorResolucion",nombreJugador = "jugador1")
	
	method cargarNivel(){
		//configuraciones.configMusic("menu.mp3")
		game.addVisual(self)
		game.addVisual(jugador1)
		configuraciones.nivelActual(self)
		self.configNivel(jugador1)
		
		game.addVisual(new Checkpoint(position = game.at(24,3), image = "mayorResolucion/invisible.png", siguienteNivel = nivel_bonus))
		
		self.generarMuros()
		
		
	}
	override method listaCajas() = []
	
	method generarMuros(){
		
		const muroInvisible = "menorResolucion/invisible.png"
		
		self.bordearHorizontalmente(-2,0,3,muroInvisible)
		self.bordearHorizontalmente(0,22,5,muroInvisible)
		self.bordearHorizontalmente(0,22,1,muroInvisible)
	}
	
	method image() = "nivelBonus/pasadizo-map.png"
	method position()=game.at(0,0)

}

object nivel_bonus inherits Nivel (siguienteNivel = pasadizo){
	
	const jugador1 = new Jugador(position = game.at(15, 3) , resolucion="menorResolucion",nombreJugador = "jugador1")
	const meta1 = "menorResolucion/meta_bonus1.png"
	const meta2 = "menorResolucion/meta_bonus2.png"
	const resolucionCaja = "menorResolucion"
	const caja1 = "oveja"
	const caja2 = "oveja2"
	const sonidoOveja="oveja1a.mp3"
	const sonidoOveja2="oveja2a.mp3"
	

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
	const listaCajas=[   new Oveja(position = game.at(13,3),resolucion=resolucionCaja,stringDeObjeto=caja1,tipo=1,sonido=sonidoOveja,ultimaDireccion=arriba),
						 new Oveja(position = game.at(11,4),resolucion=resolucionCaja,stringDeObjeto=caja1,tipo=1,sonido=sonidoOveja,ultimaDireccion=abajo),
						 new Oveja(position = game.at(10,5),resolucion=resolucionCaja,stringDeObjeto=caja1,tipo=1,sonido=sonidoOveja,ultimaDireccion=izquierda),
						 new Oveja(position = game.at(11,2),resolucion=resolucionCaja,stringDeObjeto=caja1,tipo=1,sonido=sonidoOveja,ultimaDireccion=derecha),
						 new Oveja(position = game.at(13,6),resolucion=resolucionCaja,stringDeObjeto=caja1,tipo=1,sonido=sonidoOveja,ultimaDireccion=derecha),
						 new Oveja(position = game.at(11,7),resolucion=resolucionCaja,stringDeObjeto=caja1,tipo=1,sonido=sonidoOveja,ultimaDireccion=izquierda),
						 new Oveja(position = game.at(13,9),resolucion=resolucionCaja,stringDeObjeto=caja2,tipo=2,sonido=sonidoOveja2,ultimaDireccion=abajo),
						 new Oveja(position = game.at(9,9),resolucion=resolucionCaja,stringDeObjeto=caja2,tipo=2,sonido=sonidoOveja2,ultimaDireccion=derecha),
						 new Oveja(position = game.at(13,1),resolucion=resolucionCaja,stringDeObjeto=caja2,tipo=2,sonido=sonidoOveja2,ultimaDireccion=arriba)	  
	]

	method cargarNivel(){
		
		configuraciones.configMusic("nivelBonusb.mp3")
		game.addVisual(self)
		self.cargarObjetos(listaMeta)
		self.cargarObjetos(listaCajas)
		self.generarMuros()
		game.addVisual(jugador1)
		configuraciones.nivelActual(self)	
		self.configNivel(jugador1)
	}
	
	method generarMuros(){
		const vallaH = "menorResolucion/vallaH.png"
		const vallaV = "menorResolucion/vallaV.png"
		const arbusto = "menorResolucion/arbusto.png"
		const muroInvisible = "menorResolucion/invisible.png"
		
		/* Arbustos */
		self.bordearHorizontalmente(8,9,1,arbusto)
		self.bordearHorizontalmente(8,9,2,arbusto)
		self.bordearHorizontalmente(12,13,4,arbusto)
		self.bordearHorizontalmente(12,13,5,arbusto)
		
		/* Vallas Horizontales */
		self.bordearHorizontalmente(7,15,0,vallaH)
		self.bordearHorizontalmente(10,10,2,vallaH)
		self.bordearHorizontalmente(12,14,2,vallaH)
		self.bordearHorizontalmente(7,13,11,vallaH)
		self.bordearHorizontalmente(17,17,1,vallaH)
		self.bordearHorizontalmente(16,17,5,vallaH)
		self.bordearHorizontalmente(7,8,6,vallaH)
		self.bordearHorizontalmente(7,8,8,vallaH)
		
		/*Vallas Verticales */
		self.bordearVerticalmente(1,5,6,vallaV)
		self.bordearVerticalmente(6,6,15,vallaV)
		self.bordearVerticalmente(8,10,14,vallaV)
		self.bordearVerticalmente(2,4,18,vallaV)
		self.bordearVerticalmente(7,7,9,vallaV)
		self.bordearVerticalmente(9,10,6,vallaV)
		
		/*Muros invisibles */
		self.bordearVerticalmente(1,2,16,muroInvisible)
		self.bordearVerticalmente(7,7,14,muroInvisible)
		self.bordearVerticalmente(5,5,15,muroInvisible)
		self.bordearVerticalmente(6,6,9,muroInvisible)
		self.bordearVerticalmente(8,8,9,muroInvisible)
		

	}
	
	method image() = "nivelBonus/map_bonus.png"
	method position()=game.at(0,0)
	
	override method listaCajas() = listaCajas

 method listaMeta()= listaMeta
	//override method  configNivel

}