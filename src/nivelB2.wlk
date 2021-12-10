import wollok.game.*
import objetos.*
import direcciones.*
import configuraciones.*
import timeline.*
import jugador.*
import niveles.*
import nivelDream.*

object pasadizoDream inherits Nivel(siguienteNivel = nivelDream, duplicador = 2,soyUnNivelPuzzle=false){
	
	var property vestimenta = "chara3"

	method cargarNivel(){
		const jugador1 = new Jugador(position = game.at(2, 3) ,resolucion="mayorResolucion",nombreJugador = "chara3")
		//configuraciones.configMusic("pasadizo.mp3")
		game.addVisual(self)
		game.addVisual(jugador1)
		configuraciones.nivelActual(self)
		self.configNivel(jugador1)
		game.addVisual(new DreamCambiarSkin(position=game.at(6,5),vestimenta="chara2") )
		game.addVisual(new DreamCambiarSkin(position=game.at(16,5),vestimenta="chara3") )
		game.addVisual(new Checkpoint(position = game.at(24,3), image = "mayorResolucion/invisible.png", siguienteNivel = nivelBonusDream))
		
		self.generarMuros()	
		
	}
	
	override method listaCajas() = []
	
	method generarMuros(){
		
		const muroInvisible = "menorResolucion/invisible.png"
		
		self.bordearHorizontalmente(-2,0,3,muroInvisible)
		
		
		self.bordearHorizontalmente(0,4,5,muroInvisible)
		self.bordearHorizontalmente(8,14,5,muroInvisible)
		self.bordearHorizontalmente(18,24,5,muroInvisible)
		self.bordearHorizontalmente(0,22,1,muroInvisible)
	}
	
	method image() = "nivelBonus/pasadizoDream.png"
	

	override method abandonarNivel(){
		game.say(configuraciones.elJugador(),"NO HAY VUELTA ATRAS!")
	}
	
}

object nivelBonusDream inherits Dream (siguienteNivel = nivel0,pertenescoAlDream=true){
	const unContadorDePasos = new ContadorDePasos(position=game.at(4,8))
	const unContadorDeEmpujes = new ContadorDePasos(texto="Pushes : ",position=game.at(4,7))
	//const jugador1 = new Jugador(position = game.at(15, 3) , resolucion="menorResolucion",nombreJugador = pasadizoDream.vestimenta())
	const jugador1 = new Jugador(position = game.at(0, 4) ,resolucion="menorResolucion",nombreJugador = "chara3")
	
	const meta1 = "menorResolucion/vagoneta1.png"
	const meta2 = "menorResolucion/vagoneta2.png"
	
	const caja1 = "diamante.png"
	const caja2 = "rubi.png"
	
	const cajaMeta1 = "vagoneta_ok1.png"
	const cajaMeta2 = "vagoneta_ok2.png"
	
	const resolucionCaja = "menorResolucion"

	//const sonidoOveja="oveja1a.mp3"
	//const sonidoOveja2="oveja2a.mp3"
	

	const listaMeta =[  
						 new Meta(position = game.at(6,4), image= meta2,tipo=2)/* ,
						 new Meta(position = game.at(15,8), image= meta1),
						 new Meta(position = game.at(18,8), image= meta1),
						 new Meta(position = game.at(15,2), image= meta1),
						 new Meta(position = game.at(16,2), image= meta1),
		
						 new Meta(position = game.at(6,4), image= meta2,tipo=2),
						 new Meta(position = game.at(16,8), image= meta2,tipo=2),
						 new Meta(position = game.at(17,8), image= meta2,tipo=2),
						 new Meta(position = game.at(17,2), image= meta2,tipo=2),
						 new Meta(position = game.at(14,2), image= meta2,tipo=2)	*/
					]
					
	const listaCajas=[	
						new Caja(position = game.at(8,4),resolucion=resolucionCaja,stringDeObjeto=caja2,cajaEnMeta=cajaMeta2,tipo=2)/*,
						new Caja(position = game.at(8,6),resolucion=resolucionCaja,stringDeObjeto=caja1,cajaEnMeta=cajaMeta1,tipo=1),
						new Caja(position = game.at(9,6),resolucion=resolucionCaja,stringDeObjeto=caja1,cajaEnMeta=cajaMeta1,tipo=1),
						new Caja(position = game.at(10,6),resolucion=resolucionCaja,stringDeObjeto=caja1,cajaEnMeta=cajaMeta1,tipo=1),
						new Caja(position = game.at(9,8),resolucion=resolucionCaja,stringDeObjeto=caja1,cajaEnMeta=cajaMeta1,tipo=1),
						
						
						new Caja(position = game.at(9,4),resolucion=resolucionCaja,stringDeObjeto=caja2,cajaEnMeta=cajaMeta2,tipo=2),
						new Caja(position = game.at(10,2),resolucion=resolucionCaja,stringDeObjeto=caja2,cajaEnMeta=cajaMeta2,tipo=2),
						new Caja(position = game.at(18,7),resolucion=resolucionCaja,stringDeObjeto=caja2,cajaEnMeta=cajaMeta2,tipo=2),
						new Caja(position = game.at(12,6),resolucion=resolucionCaja,stringDeObjeto=caja2,cajaEnMeta=cajaMeta2,tipo=2)*/
					]

	method cargarNivel(){
		
		configuraciones.configMusic("musicaOpcionales/dreamOp2.mp3")
		game.addVisual(self)
		configuraciones.elcontadorDePasos(unContadorDePasos)
		configuraciones.contadorDeEmpujes(unContadorDeEmpujes)
		game.addVisual(unContadorDePasos)
		game.addVisual(unContadorDeEmpujes)	
		self.cargarObjetos(listaMeta)
		//self.cargarObjetos(listaCajas)
		self.generarMuros()
		self.cargarObjetos(listaCajas)
		game.addVisual(jugador1)
		configuraciones.nivelActual(self)	
		self.configNivel(jugador1)
		nivel0.posicionInitial(game.at(14,11))
		nivelDream.posicionInitial(game.at(17,3))
		
	}
	
	method generarMuros(){
		const vallaH = "menorResolucion/muroH.png"
		const vallaV = "menorResolucion/muroV.png"
		
		const vallaH2 = "menorResolucion/muroH2.png"
		const vallaV2 = "menorResolucion/muroV2.png"
		
		const muroInvisible = "menorResolucion/invisible.png"
		

		/* Muros Horizontales */
		self.bordearHorizontalmente(0,5,3,vallaH)
		self.bordearHorizontalmente(0,5,5,vallaH)
		self.bordearHorizontalmente(7,10,10,vallaH)
		self.bordearHorizontalmente(12,20,12,vallaH)
		self.bordearHorizontalmente(7,19,0,vallaH)
		
		
		/* Muros Verticales */
		self.bordearVerticalmente(0,2,6,vallaV)
		self.bordearVerticalmente(6,9,6,vallaV)
		self.bordearVerticalmente(11,11,11,vallaV)
		self.bordearVerticalmente(2,11,21,vallaV)
		
		/*Personalizado */
		self.bordearHorizontalmente(7,7,2,vallaH2)
		self.bordearHorizontalmente(7,7,8,vallaH2)
		self.bordearHorizontalmente(9,15,3,vallaH2)
		self.bordearHorizontalmente(17,17,3,vallaH2)
		self.bordearHorizontalmente(15,16,4,vallaH2)
		self.bordearHorizontalmente(15,16,6,vallaH2)
		self.bordearHorizontalmente(19,20,6,vallaH2)
		self.bordearHorizontalmente(19,20,7,vallaH2)
		self.bordearHorizontalmente(17,17,7,vallaH2)
		self.bordearHorizontalmente(13,15,7,vallaH2)
		self.bordearHorizontalmente(13,13,9,vallaH2)
		self.bordearHorizontalmente(15,15,9,vallaH2)
		self.bordearHorizontalmente(17,17,9,vallaH2)
		//self.bordearHorizontalmente(11,11,1,vallaH2)
		self.bordearHorizontalmente(14,14,1,vallaH2)
		//zself.bordearHorizontalmente(16,16,1,vallaH2)
		self.bordearHorizontalmente(20,20,1,vallaV)
		
		self.bordearVerticalmente(9,9,11,vallaH)
		self.bordearVerticalmente(6,7,11,vallaV2)
		self.bordearVerticalmente(4,4,11,vallaV2)
		
		/* Muros invisibles */
		self.bordearVerticalmente(5,5,6,muroInvisible)
		self.bordearVerticalmente(3,3,6,muroInvisible)
		
		self.bordearHorizontalmente(12,20,11,muroInvisible)
		self.bordearHorizontalmente(12,20,10,muroInvisible)
		
		self.bordearHorizontalmente(19,20,5,muroInvisible)
		self.bordearHorizontalmente(19,20,4,muroInvisible)
		self.bordearHorizontalmente(19,20,3,muroInvisible)
		
		
	}
	
	method image() = "nivelBonus/map_dream.png"
	
	
	override method listaCajas() = listaCajas

 	method listaMeta()= listaMeta
 	
 	override method abandonarNivel(){
			
			game.schedule(50,{
			game.clear()
			self.reiniciar()
			configuraciones.configStopMusic()
			nivelDream.cargarNivel()	
			})
			
		}
	
}