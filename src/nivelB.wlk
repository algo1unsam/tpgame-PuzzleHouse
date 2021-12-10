import wollok.game.*
import objetos.*
import direcciones.*
import configuraciones.*
import timeline.*
import jugador.*
import niveles.*



object pasadizo inherits Nivel(siguienteNivel = nivel0, duplicador = 2,soyUnNivelPuzzle=false){
	
	var property vestimenta = "jugador1"
	const jugador1 = new Jugador(position = game.at(2, 3) ,resolucion="mayorResolucion",nombreJugador = self.vestimenta())
	const listaDeSkins=[skin1,skin2,skin3,skin4,skin5,skin6]
	
	method cargarNivel(){

		game.addVisual(new Checkpoint(position = game.at(0,3), image = "menorResolucion/invisible.png", siguienteNivel = nivel0))
		configuraciones.configMusic("pasadizo.mp3")
		game.addVisual(self)
		jugador1.position(game.at(2, 3) )//denuevo para evitar un bug
	
		configuraciones.nivelActual(self)
		
		listaDeSkins.forEach({unSkin=>game.addVisual(unSkin)})
		//game.addVisual(skin6)
		const bonus = new CheckpointConRequisito(position=game.at(24,3),destino=nivel_bonus,condicion=!nivel0.nivelGranjaHabilitado(),mensajeDeError="Debes completar Los 3 Puzzles de la casa para acceder a la GRANJA!!!!")
		game.addVisual(bonus)
		nivel0.posicionInitial(game.at(17,3))
		self.generarMuros()	
		game.addVisual(jugador1)
		self.configNivel(jugador1)
		
	}
	
	override method listaCajas() = []
	
	method generarMuros(){
		
		const muroInvisible = "menorResolucion/invisible.png"
		self.duplicador(4)
		self.bordearHorizontalmente(0,22,5,muroInvisible)
		self.duplicador(2)
		self.bordearHorizontalmente(0,22,1,muroInvisible)
		self.bordearHorizontalmente(0,22,7,muroInvisible)
		self.bordearHorizontalmente(0,22,7,muroInvisible)
		
	}
	
	method image() = "nivelBonus/pasadizo-map.png"
	
	override method abandonarNivel(){
		game.say(configuraciones.elJugador(),"Sube las escaleras para volver!")
	}
	method listaDeSkins()=listaDeSkins

	
}

object nivel_bonus inherits Nivel (siguienteNivel = nivel0 , soyUnNivelGranja=true){
	const unContadorDePasos = new ContadorDePasos(position=game.at(4,6))
	const unContadorDeEmpujes = new ContadorDePasos(texto="Pushes : ",position=game.at(4,5))
	const jugador1 = new Jugador(position = game.at(15, 3) , resolucion="menorResolucion",nombreJugador = pasadizo.vestimenta())
	const meta1 = "menorResolucion/meta_bonus11.png"
	const meta2 = "menorResolucion/meta_bonus22.png"
	const meta3 = "menorResolucion/meta_bonus33.png"
	const meta4 = "menorResolucion/meta_bonus44.png"
	const resolucionCaja = "menorResolucion"
	const caja1 = "oveja"
	const caja2 = "oveja2"
	const caballo2="caballo2"
	const caballo1="caballo"
	const sonidoOveja="oveja1a.mp3"
	const sonidoOveja2="oveja2a.mp3"
	

	const listaMeta =[  
						 new Meta(position = game.at(8,3), image= meta1)/* ,
						 new Meta(position = game.at(7,1), image= meta1) ,
						 new Meta(position = game.at(10,1),image= meta2,tipo=2),
						 new Meta(position = game.at(7,2), image= meta2,tipo=2),
						 new Meta(position = game.at(7,3), image= meta1),
						 new Meta(position = game.at(7,4), image= meta1),
						 new Meta(position = game.at(7,5), image= meta2,tipo=2),
						
						 new Meta(position = game.at(8,4), image= meta1),
						 new Meta(position = game.at(8,5), image= meta1),
						
						 new Meta(position = game.at(17,3), image= meta4,tipo=4),	
						 new Meta(position = game.at(17,2), image= meta3,tipo=3)*/				
		
	]
	const listaCajas=[   
						 new Oveja(position = game.at(13,3),resolucion=resolucionCaja,stringDeObjeto=caja1,tipo=1,sonido=sonidoOveja,ultimaDireccion=arriba)/*,
						 new Oveja(position = game.at(12,9),resolucion=resolucionCaja,stringDeObjeto=caja1,tipo=1,sonido=sonidoOveja,ultimaDireccion=abajo),
						 new Oveja(position = game.at(10,5),resolucion=resolucionCaja,stringDeObjeto=caja1,tipo=1,sonido=sonidoOveja,ultimaDireccion=izquierda),
						 new Oveja(position = game.at(11,2),resolucion=resolucionCaja,stringDeObjeto=caja1,tipo=1,sonido=sonidoOveja,ultimaDireccion=derecha),
						 new Oveja(position = game.at(13,6),resolucion=resolucionCaja,stringDeObjeto=caja1,tipo=1,sonido=sonidoOveja,ultimaDireccion=derecha),
						 new Oveja(position = game.at(11,7),resolucion=resolucionCaja,stringDeObjeto=caja1,tipo=1,sonido=sonidoOveja,ultimaDireccion=izquierda),
					
						 new Oveja(position = game.at(13,9),resolucion=resolucionCaja,stringDeObjeto=caja2,tipo=2,sonido=sonidoOveja2,ultimaDireccion=abajo),
						 new Oveja(position = game.at(9,9),resolucion=resolucionCaja,stringDeObjeto=caja2,tipo=2,sonido=sonidoOveja2,ultimaDireccion=derecha),
						
						 new Caballo(position = game.at(8,4),resolucion=resolucionCaja,stringDeObjeto=caballo1,tipo=4,sonido="caballo1.mp3",ultimaDireccion=abajo),
					   
						 new Caballo(position = game.at(11,9),resolucion=resolucionCaja,stringDeObjeto=caballo2,tipo=3,sonido="caballo2.mp3",ultimaDireccion=arriba),
						 new Oveja(position = game.at(13,1),resolucion=resolucionCaja,stringDeObjeto=caja2,tipo=2,sonido=sonidoOveja2,ultimaDireccion=arriba)	 */    
	]

	method cargarNivel(){
		
		configuraciones.configMusic("nivelBonusb.mp3")
		game.addVisual(self)
		configuraciones.elcontadorDePasos(unContadorDePasos)
		configuraciones.contadorDeEmpujes(unContadorDeEmpujes)
		game.addVisual(unContadorDePasos)
		game.addVisual(unContadorDeEmpujes)	
		self.cargarObjetos(listaMeta)
		//self.cargarObjetos(listaCajas)
		self.generarMuros()
		self.cargarObjetos(listaCajas)
		jugador1.nombreJugador(pasadizo.vestimenta())
		game.addVisual(jugador1)
		configuraciones.nivelActual(self)	
		self.configNivel(jugador1)
		nivel0.posicionInitial(game.at(17,3))
		
		
	}
	
	method generarMuros(){
		const vallaH = "menorResolucion/vallaH1.png"
		const vallaV = "menorResolucion/vallaV1.png"
		const arbusto = "menorResolucion/arbusto2.png"
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
		
		/* Vallas Verticales */
		self.bordearVerticalmente(1,5,6,vallaV)
		self.bordearVerticalmente(6,6,15,vallaV)
		self.bordearVerticalmente(8,10,14,vallaV)
		self.bordearVerticalmente(2,4,18,vallaV)
		self.bordearVerticalmente(7,7,9,vallaV)
		self.bordearVerticalmente(9,10,6,vallaV)
		
		/* Muros invisibles */
		self.bordearVerticalmente(1,2,16,muroInvisible)
		self.bordearVerticalmente(7,7,14,muroInvisible)
		self.bordearVerticalmente(5,5,15,muroInvisible)
		self.bordearVerticalmente(6,6,9,muroInvisible)
		self.bordearVerticalmente(8,8,9,muroInvisible)
		
	}
	
	method image() = "nivelBonus/map_bonus2.png"
	
	
	override method listaCajas() = listaCajas

 	method listaMeta()= listaMeta
 	
 	
	override method abandonarNivel(){
			
			game.schedule(50,{
			game.clear()
			self.reiniciar()
			configuraciones.configStopMusic()
			nivel0.sonido("hogar1.mp3")
			nivel0.image("nivel0/map3.png")
			nivel0.cargarNivel()	
			
			})
			
		}
}