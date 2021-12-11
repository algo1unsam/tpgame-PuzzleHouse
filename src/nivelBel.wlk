import wollok.game.*
import objetos.*
import direcciones.*
import configuraciones.*
import timeline.*
import jugador.*
import niveles.*

import wollok.game.*
import objetos.*
import direcciones.*
import configuraciones.*
import timeline.*
import jugador.*
import niveles.*
import nivelB.*

class NivelBel inherits Nivel(siguienteNivel = nivel0,permitirAgregarAlAListaDeLnivel0Completado=true){
	const unContadorDePasos = new ContadorDePasos(position=game.at(3,6))
	const unContadorDeEmpujes = new ContadorDePasos(texto="Pushes : ",position=game.at(3,5))
	const jugador1 = new Jugador(position = game.at(17,10) , resolucion="menorResolucion",nombreJugador = "jugadora2")
	const meta1B = "menorResolucion/caja1Bmeta.png"
	const meta2B=  "menorResolucion/caja2Bmeta.png"
	const resolucionCajaB = "menorResolucion"
	
	const listaMeta =[   new Meta(position = game.at(17,2), image= meta1B)  ,
						 new Meta(position = game.at(7,1), image= meta2B,tipo=2),
						 new Meta(position = game.at(7,10), image= meta2B,tipo=2),
						 new Meta(position = game.at(15,1), image= meta2B,tipo=2),
						 new Meta(position = game.at(12,10), image= meta2B,tipo=2),
						 new Meta(position = game.at(11,10), image= meta1B),
						 new Meta(position = game.at(7,9), image = meta1B),
						 new Meta(position = game.at(14,1), image = meta1B),
						 new Meta(position = game.at(8,3), image= meta1B)
						 ]
						 
	const listaCajas=[   
						 new Caja(position = game.at(14,9),resolucion=resolucionCajaB,stringDeObjeto="caja1B.png",cajaEnMeta="caja1B_ok.png",tipo=1,colorDelTextoDeLaCaja=paleta.rosado())  ,
						 new Caja(position = game.at(8,8),resolucion=resolucionCajaB,stringDeObjeto="caja1B.png",cajaEnMeta="caja1B_ok.png",tipo=1,colorDelTextoDeLaCaja=paleta.lima()) ,
						 new Caja(position = game.at(16,7),resolucion=resolucionCajaB,stringDeObjeto="caja2B.png",cajaEnMeta="caja2B_ok.png",tipo=2,colorDelTextoDeLaCaja=paleta.verde()),
						 new Caja(position = game.at(16,6),resolucion=resolucionCajaB,stringDeObjeto="caja2B.png",cajaEnMeta="caja2B_ok.png",tipo=2,colorDelTextoDeLaCaja=paleta.negro()),
						 new Caja(position = game.at(16,3),resolucion=resolucionCajaB,stringDeObjeto="caja2B.png",cajaEnMeta="caja2B_ok.png",tipo=2,colorDelTextoDeLaCaja=paleta.rojo()),
						 new Caja(position = game.at(13,2),resolucion=resolucionCajaB,stringDeObjeto="caja1B.png",cajaEnMeta="caja1B_ok.png",tipo=1),
						 new Caja(position= game.at(11,4),resolucion=resolucionCajaB,stringDeObjeto ="caja1B.png", cajaEnMeta="caja1B_ok.png",tipo=1,colorDelTextoDeLaCaja=paleta.amarillo()),
						 new Caja(position = game.at(10,2),resolucion=resolucionCajaB,stringDeObjeto= "caja1B.png", cajaEnMeta = "caja1B_ok.png",tipo=1,colorDelTextoDeLaCaja=paleta.naranja()),
						 new Caja(position = game.at(11,6),resolucion=resolucionCajaB,stringDeObjeto= "caja2B.png", cajaEnMeta = "caja2B_ok.png",tipo=2,colorDelTextoDeLaCaja=paleta.azul())
						 ]

	method cargarNivel(){
	
		configuraciones.configMusic("nivelW-A.mp3")
		
		game.addVisual(self)
		configuraciones.elcontadorDePasos(unContadorDePasos)
		configuraciones.contadorDeEmpujes(unContadorDeEmpujes)
		game.addVisual(unContadorDePasos)
		game.addVisual(unContadorDeEmpujes)	
		self.cargarObjetos(listaMeta)
		self.cargarObjetos(listaCajas)
		self.generarMuros()
		game.addVisual(jugador1)
		configuraciones.nivelActual(self)	
		self.configNivel(jugador1)
		nivel0.posicionInitial(game.at(12,10))
		
		
	}
	
	method generarMuros(){
		const muroVisible = "menorResolucion/muro3.png"
			
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
	
	
	override method listaCajas() = listaCajas

 	method listaMeta()= listaMeta
 	
 	method nivelHardCoreTime()=nivelBelHardcoreTime
}


object nivelBelHardcoreTime inherits NivelBel(siguienteNivel = nivel0,soyUnNivelHardcoreTime=true){
	
	const unCronometro=new Cronometro()
	const readyGo=new ReadyYGO()
	

	const meta1 = "menorResolucion/meta1.png"
	const meta2=  "menorResolucion/meta2.png"
	const resolucionCaja = "menorResolucion"
	
	const listaMeta2 =[   new Meta(position = game.at(17,2), image= meta1)  ,
						 new Meta(position = game.at(7,1), image= meta2,tipo=2),
						 new Meta(position = game.at(7,10), image= meta2,tipo=2),
						 new Meta(position = game.at(15,1), image= meta2,tipo=2),
						 new Meta(position = game.at(12,10), image= meta2,tipo=2),
						 new Meta(position = game.at(11,10), image= meta1),
						 new Meta(position = game.at(7,9), image = meta1),
						 new Meta(position = game.at(14,1), image = meta1),
						 new Meta(position = game.at(8,3), image= meta1)
						 ]
						 
	const listaCajas2 =[   
						 new Caja(position = game.at(14,9),resolucion=resolucionCaja,stringDeObjeto="caja1.png",cajaEnMeta="caja_ok.png",tipo=1,hardCoreTimeBonificacion=6,colorDelTextoDeLaCaja=paleta.rosado())  ,
						 new Caja(position = game.at(8,8),resolucion=resolucionCaja,stringDeObjeto="caja1.png",cajaEnMeta="caja_ok.png",tipo=1,hardCoreTimeBonificacion=5,colorDelTextoDeLaCaja=paleta.lima()) ,
						 new Caja(position = game.at(16,7),resolucion=resolucionCaja,stringDeObjeto="caja2.png",cajaEnMeta="caja_ok2.png",tipo=2,hardCoreTimeBonificacion=9,colorDelTextoDeLaCaja=paleta.verde()),
						 new Caja(position = game.at(16,6),resolucion=resolucionCaja,stringDeObjeto="caja2.png",cajaEnMeta="caja_ok2.png",tipo=2,hardCoreTimeBonificacion=13,colorDelTextoDeLaCaja=paleta.negro()),
						 new Caja(position = game.at(16,3),resolucion=resolucionCaja,stringDeObjeto="caja2.png",cajaEnMeta="caja_ok2.png",tipo=2,hardCoreTimeBonificacion=6,colorDelTextoDeLaCaja=paleta.rojo()),
						 new Caja(position = game.at(13,2),resolucion=resolucionCaja,stringDeObjeto="caja1.png",cajaEnMeta="caja_ok.png",tipo=1),
						 new Caja(position= game.at(11,4),resolucion=resolucionCaja,stringDeObjeto ="caja1.png", cajaEnMeta="caja_ok.png",tipo=1,hardCoreTimeBonificacion=12,colorDelTextoDeLaCaja=paleta.amarillo()),
						 new Caja(position = game.at(10,2),resolucion=resolucionCaja,stringDeObjeto= "caja1.png", cajaEnMeta = "caja_ok.png",tipo=1,hardCoreTimeBonificacion=4,colorDelTextoDeLaCaja=paleta.naranja()),
						 new Caja(position = game.at(11,6),resolucion=resolucionCaja,stringDeObjeto= "caja2.png", cajaEnMeta = "caja_ok2.png",tipo=2,hardCoreTimeBonificacion=8,colorDelTextoDeLaCaja=paleta.azul())
						 ]
						 
	

	override method cargarNivel(){
		configuraciones.configMusic("hardTimerBelRemix.mp3")
		unContadorDePasos.reiniciar()
		readyGo.reiniciar()
		jugador1.nombreJugador(pasadizo.vestimenta())
		configuraciones.elcontadorDePasos(unContadorDePasos)
		configuraciones.contadorDeEmpujes(unContadorDeEmpujes)
		game.addVisual(self)
		game.addVisual(unContadorDePasos)
		game.addVisual(unContadorDeEmpujes)
		self.cargarObjetos(listaMeta2)
		self.cargarObjetos(listaCajas2)
		unCronometro.nivelCompletado(false) //por si un jugador vuelve a entrar al nivel
		
		self.generarMuros()
		
		game.addVisual(jugador1)
		configuraciones.nivelActual(self)

		nivel0.posicionInitial(game.at(13,9))
		
		game.addVisual(unCronometro)
		
		game.schedule(1800,{readyGo.iniciarReady()})
		
	}
	
	override method listaCajas() = listaCajas2

 	override method listaMeta()= listaMeta2
	
	
	method Comenzar(){
		
		self.configNivel(jugador1)
		unCronometro.activarCronometro()
	}
 	method cronometro()=unCronometro
}


