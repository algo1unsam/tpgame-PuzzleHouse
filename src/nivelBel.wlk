import wollok.game.*
import objetos.*
import direcciones.*
import configuraciones.*
import timeline.*
import jugador.*
import niveles.*

object nivelBel inherits Nivel(siguienteNivel = nivel0){
	
	const jugador1 = new Jugador(position = game.at(17,10) , resolucion="menorResolucion",nombreJugador = "jugadora2")
	const meta1 = "menorResolucion/meta1.png"
	const meta2=  "menorResolucion/meta2.png"
	const resolucionCaja = "menorResolucion"
	
	const listaMeta =[   new Meta(position = game.at(17,2), image= meta1),
						 new Meta(position = game.at(7,1), image= meta2,tipo=2),
						 new Meta(position = game.at(7,10), image= meta2,tipo=2),
						 new Meta(position = game.at(15,1), image= meta2,tipo=2),
						 new Meta(position = game.at(12,10), image= meta2,tipo=2),
						 new Meta(position = game.at(11,10), image= meta1),
						 new Meta(position = game.at(7,9), image = meta1),
						 new Meta(position = game.at(14,1), image = meta1),
						 new Meta(position = game.at(8,3), image= meta1)
						 ]
						 
	const listaCajas=[   new Caja(position = game.at(8,8),resolucion=resolucionCaja,stringDeObjeto="caja1.png",cajaEnMeta="caja_ok.png",tipo=1),
						 new Caja(position = game.at(16,7),resolucion=resolucionCaja,stringDeObjeto="caja2.png",cajaEnMeta="caja_ok2.png",tipo=2),
						 new Caja(position = game.at(16,6),resolucion=resolucionCaja,stringDeObjeto="caja2.png",cajaEnMeta="caja_ok2.png",tipo=2),
						 new Caja(position = game.at(16,3),resolucion=resolucionCaja,stringDeObjeto="caja2.png",cajaEnMeta="caja_ok2.png",tipo=2),
						 new Caja(position = game.at(13,2),resolucion=resolucionCaja,stringDeObjeto="caja1.png",cajaEnMeta="caja_ok.png",tipo=1),
						 new Caja(position= game.at(11,4),resolucion=resolucionCaja,stringDeObjeto ="caja1.png", cajaEnMeta="caja_ok.png",tipo=1),
						 new Caja(position = game.at(10,2),resolucion=resolucionCaja,stringDeObjeto= "caja1.png", cajaEnMeta = "caja_ok.png",tipo=1),
						 new Caja(position = game.at(11,6),resolucion=resolucionCaja,stringDeObjeto= "caja2.png", cajaEnMeta = "caja_ok2.png",tipo=2),
						 new Caja(position = game.at(14,9),resolucion=resolucionCaja,stringDeObjeto="caja1.png",cajaEnMeta="caja_ok.png",tipo=1)
						 ]

	method cargarNivel(){
		
		configuraciones.configMusic("nivelW-A.mp3")
		game.addVisual(self)
		self.cargarObjetos(listaMeta)
		self.cargarObjetos(listaCajas)
		self.generarMuros()
		game.addVisual(jugador1)
		configuraciones.nivelActual(self)	
		self.configNivel(jugador1)
		nivel0.posicionInitial(game.at(12,11))
		nivel0.agregarNivelCompletado(self)
		
	}
	
	method generarMuros(){
		const muroVisible = "menorResolucion/muro3.png"
		const muroInvisible = "menorResolucion/invisible.png"
			
		/* Muros Horizontales */
		self.bordearHorizontalmente(11,13,9,muroVisible)
		self.bordearHorizontalmente(10,11,5,muroVisible)
		self.bordearHorizontalmente(14,15,2,muroVisible)
		self.bordearHorizontalmente(15,17,9,muroVisible)
		self.bordearHorizontalmente(13,13,10,muroVisible)
		self.bordearHorizontalmente(13,13,8,muroVisible)
		self.bordearHorizontalmente(9,9,7,muroVisible)
		
		/*Muros Verticales */
		self.bordearVerticalmente(9,10,8,muroVisible)
		self.bordearVerticalmente(4,5,8,muroVisible)
		self.bordearVerticalmente(2,2,8,muroVisible)
		self.bordearVerticalmente(2,5,7,muroVisible)
		self.bordearVerticalmente(1,3,11,muroVisible)
		self.bordearVerticalmente(5,6,13,muroVisible)
		
		/*Muros invisibles */
		self.bordearVerticalmente(0,2,16,muroVisible)
		self.bordearVerticalmente(0,11,18,muroVisible)
		self.bordearVerticalmente(0,11,6,muroVisible)
		self.bordearHorizontalmente(6,18,0,muroVisible)
		self.bordearHorizontalmente(6,18,11,muroVisible)
		self.bordearHorizontalmente(17,17,1,muroVisible)
		self.bordearHorizontalmente(15,18,5,muroVisible)
	}
	
	method image() = "menorResolucion/mapBel2.png"
	method position()=game.at(0,0)
	
	override method listaCajas() = listaCajas

 	method listaMeta()= listaMeta
}
