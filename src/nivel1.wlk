import wollok.game.*
import objetos.*
import direcciones.*
import configuraciones.*
import timeline.*
import jugador.*
import niveles.*

object nivel1 inherits Nivel (siguienteNivel = nivel0 ,duplicador=2){

	const unContadorDePasos = new ContadorDePasos(position=game.at(10,12))
	const unContadorDeEmpujes = new ContadorDePasos(texto="Pushes : ",position=game.at(14,12))
	const jugador1 = new Jugador(position = game.at(14, 1) ,resolucion="mayorResolucion" ,nombreJugador = "jugador1")
	
	const listaCajas=[new Caja(position = game.at(8,3),resolucion="mayorResolucion",stringDeObjeto="caja2.png",cajaEnMeta="caja_ok2.png",tipo=2), 
						new Caja(position = game.at(8,7),resolucion="mayorResolucion",stringDeObjeto="caja1.png",cajaEnMeta="caja_ok1.png",tipo=1),
						new Caja(position = game.at(12,5),resolucion="mayorResolucion",stringDeObjeto="caja1.png",cajaEnMeta="caja_ok1.png",tipo=1)]
	
	const listaMeta= [  new Meta(position = game.at(16,3) ,	image="mayorResolucion/meta1.png"  ),
						new Meta(position = game.at(16,9) ,	image="mayorResolucion/meta1.png"  ),
					    new Meta(position = game.at(8,9),  image="mayorResolucion/meta2.png", tipo=2 )]

	method cargarNivel(){
		
		configuraciones.configMusic("hogar.mp3")
		configuraciones.elcontadorDePasos(unContadorDePasos)
		configuraciones.contadorDeEmpujes(unContadorDeEmpujes)
		nivel0.limpiarlistaDeNivelesCompletados()
		game.addVisual(self)
		game.addVisual(unContadorDePasos)
		game.addVisual(unContadorDeEmpujes)	
		self.cargarObjetos(listaMeta)
		self.cargarObjetos(listaCajas)
			
		self.generarMuros()
		
		game.addVisual(jugador1)
		configuraciones.nivelActual(self)
		self.configNivel(jugador1)
		nivel0.posicionInitial(game.at(3,1))
	}

	override method listaCajas() = listaCajas

	method generarMuros(){
		
		const muroinvisible = "mayorResolucion/invisible.png"
		const muroVisible="mayorResolucion/muro3.png"
		self.bordearVerticalmente(1,11,0,muroinvisible)
		self.bordearHorizontalmente(0,8,-1,muroinvisible)
		self.bordearHorizontalmente(16,24,-1,muroinvisible)
		self.bordearVerticalmente(-1,1,24,muroinvisible)
		self.bordearVerticalmente(5,9,24,muroinvisible)
		self.bordearHorizontalmente(0,24,11,muroinvisible)
		self.bordearHorizontalmente(14,22,5,muroVisible)
		self.bordearHorizontalmente(2,10,5,muroVisible)
		self.bordearHorizontalmente(10,14,-3,muroinvisible)
	}
	
	method listaMeta()= listaMeta
	
	method image()   = "nivel1/nivel1RA-map.png"
	
	override method abandonarNivel(){
			
			game.schedule(50,{
			game.clear()
			self.reiniciar()
			configuraciones.configStopMusic()
			menu.cargarNivel()	
			})
			
		}

}




