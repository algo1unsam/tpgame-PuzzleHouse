import wollok.game.*
import objetos.*
import direcciones.*
import configuraciones.*
import timeline.*
import jugador.*
import niveles.*
import nivelB.*
class NivelL inherits Nivel (siguienteNivel = nivel0,permitirAgregarAlAListaDeLnivel0Completado=true){
	const unContadorDePasos = new ContadorDePasos()
	const unContadorDeEmpujes = new ContadorDePasos(texto="Pushes : ",position=game.at(12,4))
	const jugador1 = new Jugador(position = game.at(10, 10 ) , resolucion="menorResolucion",nombreJugador = "jugadora1")
	const meta1 = "menorResolucion/meta1.png"
	const meta2 = "menorResolucion/meta2.png"
	const meta3=  "menorResolucion/meta3.png"
	const meta4=  "menorResolucion/meta4.png"
	const meta5=  "menorResolucion/meta5.png"
	const resolucionCaja = "menorResolucion"
	const caja1 = "caja1.png"
	const caja2 = "caja2.png"
	const caja3 = "caja3.png"
	const caja4 = "caja4.png"
	const caja5 = "caja5.png"
	const cajaMeta1 = "caja_ok.png"
	const cajaMeta2 = "caja_ok2.png"
	const cajaMeta3 = "caja3_ok.png"
	const cajaMeta4 = "caja4_ok.png"
    const cajaMeta5 = "caja5_ok.png"
	const listaMeta =[ 
						 new Meta(position = game.at(17,6), image= meta1),
						 new Meta(position = game.at(21,2),image= meta1)  ,
						 new Meta(position = game.at(22,2), image= meta1),
						 new Meta(position = game.at(17,7), image= meta1),
						 new Meta(position = game.at(4,5), image= meta2,tipo=2),
						 new Meta(position = game.at(4,3), image= meta5,tipo=5),
						 new Meta(position = game.at(4,4), image= meta4,tipo=4),
						 new Meta(position = game.at(4,2), image= meta3,tipo=3),
						 new Meta(position = game.at(4,1), image= meta2,tipo=2)
						
	]
	const listaCajas=[  
						 new Caja(position = game.at(18,6),resolucion=resolucionCaja,stringDeObjeto=caja1,cajaEnMeta=cajaMeta1,tipo=1,hardCoreTimeBonificacion=15,colorDelTextoDeLaCaja=paleta.aqua()) /* , 
						 new Caja(position = game.at(19,5),resolucion=resolucionCaja,stringDeObjeto=caja1,cajaEnMeta=cajaMeta1,tipo=1,hardCoreTimeBonificacion=20,colorDelTextoDeLaCaja=paleta.verde()),
						 new Caja(position = game.at(20,4),resolucion=resolucionCaja,stringDeObjeto=caja1,cajaEnMeta=cajaMeta1,tipo=1,hardCoreTimeBonificacion=15,colorDelTextoDeLaCaja=paleta.amarillo()),
						 new Caja(position = game.at(21,3),resolucion=resolucionCaja,stringDeObjeto=caja1,cajaEnMeta=cajaMeta1,tipo=1,hardCoreTimeBonificacion=30,colorDelTextoDeLaCaja=paleta.rosado()),
						 
						 new Caja(position = game.at(22,8),resolucion=resolucionCaja,stringDeObjeto=caja3,cajaEnMeta=cajaMeta3,tipo=3,hardCoreTimeBonificacion=6,colorDelTextoDeLaCaja=paleta.amarillo()),
						
						 new Caja(position = game.at(21,9),resolucion=resolucionCaja,stringDeObjeto=caja4,cajaEnMeta=cajaMeta4,tipo=4,hardCoreTimeBonificacion=4,colorDelTextoDeLaCaja=paleta.naranja()),
						 new Caja(position = game.at(3,11),resolucion=resolucionCaja,stringDeObjeto=caja2,cajaEnMeta=cajaMeta2,tipo=2,colorDelTextoDeLaCaja=paleta.rojo()),
						 new Caja(position = game.at(7,7),resolucion=resolucionCaja,stringDeObjeto=caja5,cajaEnMeta=cajaMeta5,tipo=5,hardCoreTimeBonificacion=5,colorDelTextoDeLaCaja=paleta.blanco()),
						 new Caja(position = game.at(16,10),resolucion=resolucionCaja,stringDeObjeto=caja2,cajaEnMeta=cajaMeta2,tipo=2,colorDelTextoDeLaCaja=paleta.negro())*/
					
	
	]

	method cargarNivel(){
		unContadorDePasos.reiniciar()
		
		
		configuraciones.configMusic("niveL.mp3")
		configuraciones.elcontadorDePasos(unContadorDePasos)
		configuraciones.contadorDeEmpujes(unContadorDeEmpujes)
		game.addVisual(self)
		game.addVisual(unContadorDePasos)
		game.addVisual(unContadorDeEmpujes)
		self.cargarObjetos(listaMeta)
		self.cargarObjetos(listaCajas)
		self.generarMuros()
		game.addVisual(jugador1)
		configuraciones.nivelActual(self)	
		self.configNivel(jugador1)
		nivel0.posicionInitial(game.at(21,3))
		
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
				
	}
	
	method image() = "menorResolucion/mapaL.png"
	
	
	override method listaCajas() = listaCajas

 	method listaMeta()= listaMeta
 	
 	method nivelHardCoreTime()=nivelLHardcoreTime

}
object nivelLHardcoreTime inherits NivelL(siguienteNivel = nivel0,soyUnNivelHardcoreTime=true){
	const unCronometro=new Cronometro(segundos=6,segundoDeReset=6)
	const readyGo=new ReadyYGO()
	override method cargarNivel(){
	
		configuraciones.configMusic("nivelLHardTimer.mp3")
		jugador1.nombreJugador(pasadizo.vestimenta())
		unCronometro.nivelCompletado(false) //por si un jugador vuelve a entrar al nivel
		readyGo.reiniciar()
		configuraciones.elcontadorDePasos(unContadorDePasos)
		configuraciones.contadorDeEmpujes(unContadorDeEmpujes)
		game.addVisual(self)
		game.addVisual(unContadorDePasos)
		game.addVisual(unContadorDeEmpujes)
		self.cargarObjetos(listaMeta)
		self.cargarObjetos(listaCajas)
		
		
		self.generarMuros()
		
		game.addVisual(jugador1)
		configuraciones.nivelActual(self)

		nivel0.posicionInitial(game.at(21,3))
		game.addVisual(unCronometro)
		
		game.schedule(1800,{readyGo.iniciarReady()})
	
		
	}
	
	
	method Comenzar(){
		
		self.configNivel(jugador1)
		
		unCronometro.activarCronometro()
	}
	
	method cronometro()=unCronometro
	
}
