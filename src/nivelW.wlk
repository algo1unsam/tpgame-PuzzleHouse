import wollok.game.*
import objetos.*
import direcciones.*
import configuraciones.*
import timeline.*
import jugador.*
import niveles.*
import nivelB.*

class NivelW inherits Nivel (siguienteNivel = nivel0,permitirAgregarAlAListaDeLnivel0Completado=true){
	const unContadorDePasos = new ContadorDePasos(position=game.at(1,6))
	const unContadorDeEmpujes = new ContadorDePasos(texto="Pushes : ",position=game.at(1,5))
	const jugador1 = new Jugador(position = game.at(19, 0) , resolucion="menorResolucion",nombreJugador = "jugador2")
	
	const meta1W = "menorResolucion/caja1Wmeta.png"
	const meta2W = "menorResolucion/caja2Wmeta.png"
	const resolucionCajaW = "menorResolucion"
	const caja1W = "caja1W.png"
	const caja2W = "caja2W.png"
	const cajaMeta1W = "caja1W_ok.png"
	const cajaMeta2W = "caja2W_ok.png"

	const listaMeta =[   
						 new Meta(position = game.at(5,2), image= meta1W) ,
						 new Meta(position = game.at(9,5),image= meta1W),
						 new Meta(position = game.at(8,5), image= meta2W,tipo=2),
						 new Meta(position = game.at(10,5), image= meta1W),
						 
						 new Meta(position = game.at(14,5), image= meta1W),
						 new Meta(position = game.at(15,5), image= meta2W,tipo=2),
						 new Meta(position = game.at(16,5), image= meta1W),
						 
						 
						 new Meta(position = game.at(6,2), image= meta2W, tipo=2),
						 new Meta(position = game.at(5,3), image= meta2W, tipo=2)
	]
	const listaCajas=[  new Caja(position = game.at(6,2),resolucion=resolucionCajaW,stringDeObjeto=caja1W,cajaEnMeta=cajaMeta1W,tipo=1,colorDelTextoDeLaCaja=paleta.rosado())/*  ,
						 new Caja(position = game.at(7,7),resolucion=resolucionCajaW,stringDeObjeto=caja1W,cajaEnMeta=cajaMeta1W,tipo=1) ,
						 new Caja(position = game.at(6,9) ,resolucion=resolucionCajaW,stringDeObjeto=caja1W,cajaEnMeta=cajaMeta1W,tipo=1,colorDelTextoDeLaCaja=paleta.blanco()),
						 new Caja(position = game.at(9,9) ,resolucion=resolucionCajaW,stringDeObjeto=caja2W,cajaEnMeta=cajaMeta2W,tipo=2,colorDelTextoDeLaCaja=paleta.violeta()),
						 
						 new Caja(position = game.at(17,7),resolucion=resolucionCajaW,stringDeObjeto=caja1W,cajaEnMeta=cajaMeta1W,tipo=1,colorDelTextoDeLaCaja=paleta.amarillo()),
						 new Caja(position = game.at(18,9),resolucion=resolucionCajaW,stringDeObjeto=caja1W,cajaEnMeta=cajaMeta1W,tipo=1,colorDelTextoDeLaCaja=paleta.verdeClaro()),
						 new Caja(position = game.at(15,9),resolucion=resolucionCajaW,stringDeObjeto=caja2W,cajaEnMeta=cajaMeta2W,tipo=2,colorDelTextoDeLaCaja=paleta.azul()),
						 
						
						 new Caja(position = game.at(8,2),resolucion=resolucionCajaW,stringDeObjeto=caja2W,cajaEnMeta=cajaMeta2W,tipo=2,colorDelTextoDeLaCaja=paleta.negro()),
						 new Caja(position = game.at(12,8),resolucion=resolucionCajaW,stringDeObjeto=caja2W,cajaEnMeta=cajaMeta2W,tipo=2,colorDelTextoDeLaCaja=paleta.rojo())*/ 
	]

	method cargarNivel(){
		configuraciones.elcontadorDePasos(unContadorDePasos)
		configuraciones.contadorDeEmpujes(unContadorDeEmpujes)
		configuraciones.configMusic("nivelW-D.mp3")
		game.addVisual(self)
		game.addVisual(unContadorDePasos)
		game.addVisual(unContadorDeEmpujes)		
		
		
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
		
		self.bordearHorizontalmente(18,19,-1,muro2)
	}
	
	method image() = "menorResolucion/mapW.png"
	
	
	override method listaCajas() = listaCajas

 	method listaMeta()= listaMeta
 	
 	method nivelHardCoreTime()=nivelWHardcoreTime

}
object nivelWHardcoreTime inherits  NivelW(siguienteNivel = nivel0,soyUnNivelHardcoreTime=true){
	const unCronometro=new Cronometro(segundos=5,segundoDeReset=5)
	const readyGo=new ReadyYGO(delay1=2700)
	
	const meta1 = "menorResolucion/meta1.png"
	const meta2 = "menorResolucion/meta2.png"
	const resolucionCaja = "menorResolucion"
	const caja1 = "caja1.png"
	const caja2 = "caja2.png"
	const cajaMeta1 = "caja_ok.png"
	const cajaMeta2 = "caja_ok2.png"

	const listaMeta2 =[   
						 new Meta(position = game.at(5,2), image= meta1) ,
						 new Meta(position = game.at(9,5),image= meta1),
						 new Meta(position = game.at(8,5), image= meta2,tipo=2),
						 new Meta(position = game.at(10,5), image= meta1),
						 
						 new Meta(position = game.at(14,5), image= meta1),
						 new Meta(position = game.at(15,5), image= meta2,tipo=2),
						 new Meta(position = game.at(16,5), image= meta1),
						 
						 
						 new Meta(position = game.at(6,2), image= meta2, tipo=2),
						 new Meta(position = game.at(5,3), image= meta2, tipo=2)
	]
	const listaCajas2 =[  new Caja(position = game.at(6,2),resolucion=resolucionCaja,stringDeObjeto=caja1,cajaEnMeta=cajaMeta1,tipo=1,hardCoreTimeBonificacion=4,colorDelTextoDeLaCaja=paleta.rosado())/* ,
						 new Caja(position = game.at(7,7),resolucion=resolucionCaja,stringDeObjeto=caja1,cajaEnMeta=cajaMeta1,tipo=1,hardCoreTimeBonificacion=3) ,
						 new Caja(position = game.at(6,9) ,resolucion=resolucionCaja,stringDeObjeto=caja1,cajaEnMeta=cajaMeta1,tipo=1,hardCoreTimeBonificacion=2,colorDelTextoDeLaCaja=paleta.blanco()),
						 new Caja(position = game.at(9,9) ,resolucion=resolucionCaja,stringDeObjeto=caja2,cajaEnMeta=cajaMeta2,tipo=2,colorDelTextoDeLaCaja=paleta.violeta()),
						 
						 new Caja(position = game.at(17,7),resolucion=resolucionCaja,stringDeObjeto=caja1,cajaEnMeta=cajaMeta1,tipo=1,hardCoreTimeBonificacion=3,colorDelTextoDeLaCaja=paleta.amarillo()),
						 new Caja(position = game.at(18,9),resolucion=resolucionCaja,stringDeObjeto=caja1,cajaEnMeta=cajaMeta1,tipo=1,colorDelTextoDeLaCaja=paleta.verdeClaro()),
						 new Caja(position = game.at(15,9),resolucion=resolucionCaja,stringDeObjeto=caja2,cajaEnMeta=cajaMeta2,tipo=2,colorDelTextoDeLaCaja=paleta.azul()),
						 
						
						 new Caja(position = game.at(8,2),resolucion=resolucionCaja,stringDeObjeto=caja2,cajaEnMeta=cajaMeta2,tipo=2,hardCoreTimeBonificacion=2,colorDelTextoDeLaCaja=paleta.negro()),
						 new Caja(position = game.at(12,8),resolucion=resolucionCaja,stringDeObjeto=caja2,cajaEnMeta=cajaMeta2,tipo=2,colorDelTextoDeLaCaja=paleta.rojo())*/
	]
	
	override method cargarNivel(){
		configuraciones.configMusic("hardTimerW.mp3")
		unCronometro.nivelCompletado(false) //por si un jugador vuelve a entrar al nivel
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
		
		self.generarMuros()
		
		game.addVisual(jugador1)
		configuraciones.nivelActual(self)

		nivel0.posicionInitial(game.at(5,9))
		
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