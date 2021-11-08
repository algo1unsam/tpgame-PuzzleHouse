import wollok.game.*
import objetos.*
import direcciones.*
import configuraciones.*
import timeline.*
import jugador.*
import niveles.*

object nivelL inherits Nivel (siguienteNivel = nivel0){
	
	const jugador1 = new Jugador(position = game.at(19, 0) , resolucion="menorResolucion",nombreJugador = "jugador1")
	const meta1 = "menorResolucion/meta1.png"
	const meta2 = "menorResolucion/meta2.png"
	const resolucionCaja = "menorResolucion"
	const caja1 = "caja1.png"
	const caja2 = "caja2.png"
	const cajaMeta1 = "caja_ok.png"
	const cajaMeta2 = "caja_ok2.png"

	const listaMeta =[ 
					
		
	]
	const listaCajas=[     
	]

	method cargarNivel(){
		
		configuraciones.configMusic("macariaDespierta.mp3")
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
		
		
		
	}
	
	method image() = "oscuro2.png"
	method position()=game.at(0,0)
	
	override method listaCajas() = listaCajas

 method listaMeta()= listaMeta

}