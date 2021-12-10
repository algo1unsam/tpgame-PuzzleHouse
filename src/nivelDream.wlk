import wollok.game.*
import objetos.*
import direcciones.*
import configuraciones.*
import timeline.*
import jugador.*
import niveles.*
import ghost.*
import nivelB2.*
class Dream inherits Nivel(pertenescoAlDream=true){
	
	override method abandonarNivel(){
				game.schedule(50,{
				game.clear()
				self.reiniciar()
				configuraciones.configStopMusic()
				siguienteNivel.cargarNivel()	
				})
	}
}
object nivelDream inherits Dream (siguienteNivel = nivel0,soyUnNivelPuzzle=false){
	var property sonido = "Dreams/dreams.mp3"
	var property image = "nivel0/dream.png"
	const jugador1 = new Jugador(position = game.at(13, 11) ,resolucion="menorResolucion",nombreJugador = "chara")
	const listaCajas=[]
	const listaMeta =[]
	const listaSombras=[
		new CheckpointDeSombras(position=game.at(1,7),sombraDeReferencia=sombraHab1Dream),
		new CheckpointDeSombras(position=game.at(1,5),sombraDeReferencia=pasadizo1Dream),
		
		new CheckpointDeSombras(position=game.at(5,2),sombraDeReferencia=sombraHab2Dream),
		//new CheckpointDeSombras(position=game.at(9,3),sombraDeReferencia=pasadizo2Dream),
		
		new CheckpointDeSombras(position=game.at(22,7),sombraDeReferencia=sombraHab3Dream),
		new CheckpointDeSombras(position=game.at(22,5),sombraDeReferencia=pasadizo3Dream),
		
		new CheckpointDeSombras(position=game.at(9,6),sombraDeReferencia=sombra1),
		new CheckpointDeSombras(position=game.at(12,2),sombraDeReferencia=sombra2),
		new CheckpointDeSombras(position=game.at(18,2 ),sombraDeReferencia=sombra3)
	]
	
	const listaDeNivelesCompletados=[]
	
	var property posicionInitial = game.at(13,11)
		method cargarNivel(){		
		
		configuraciones.configMusic(self.sonido())
		game.addVisual(self)
		
		//Chimenea
		const chimenea = new Animacion(position = game.at(0,0), imagen="Dreams/chimenea/flama")
		game.addVisual(chimenea)
		chimenea.animar()
		
		//Bonus
		const bonus = new CheckpointConRequisito(destino=pasadizoDream,condicion=!self.nivelBonusHabilitado(),mensajeDeError="Debes completar todos los niveles  del Dream para acceder!!!")
		game.addVisual(bonus)
		
		self.generarMuros()
		
		//Esposo
		jugador1.position(posicionInitial)
		game.addVisual(jugador1)
		self.configNivel(jugador1)
		
		//Ghost level 1
		const ghost1 = new Ghost(position = game.at(18, 11) ,resolucion="menorResolucion", nombreJugador = "ghost1", siguienteNivel=nivelG1)
		game.addVisual(ghost1)
		
		//Ghost level 2
		const ghost2 = new Ghost(position = game.at(5, 10) ,resolucion="menorResolucion", nombreJugador = "ghost2", siguienteNivel=nivelG2, ms1='Querés un verdadero reto?', ms2='Estas seguro?', ms3='Bueno, bueno, tu lo decidiste.')
		game.addVisual(ghost2)
		
		//Despertar
		nivel0.posicionInitial(game.at(15,10))
		game.addVisual(new Checkpoint(position = game.at(14,11), image = "menorResolucion/invisible.png", siguienteNivel = nivel0))
		
			
		self.cargarObjetos(listaSombras)
		game.addVisual(listasNivelesCompletados)
		self.listaSombrasNoAtravesadas().forEach({unaSombra=>unaSombra.agregarSombra()})
	}	
		override method configNivel(personaje1){
		duplicaDireccion.direccionDuplicador(duplicador)
		configuraciones.configTeclas(personaje1)
		configuraciones.configColisiones(personaje1)
		configuraciones.nivelActual(self)
	}
	
	method listaSombras()=listaSombras
	method listaSombrasNoAtravesadas()=self.listaSombras().filter({unaSombra=>!unaSombra.seAtraveso()})
	method agregarNivelCompletado(unNivel){
		listaDeNivelesCompletados.add(unNivel)
	}
	method listaDeNivelesCompletados()=listaDeNivelesCompletados
	method nivelBonusHabilitado() =self.listaDeNivelesCompletados().asSet().size()>=2
	
	override method listaCajas() = listaCajas

    method listaMeta()= listaMeta
	
	method generarMuros(){
		
		const muroInvisible = "menorResolucion/invisible.png"
		
		self.bordearHorizontalmente(20,22,3,muroInvisible)
		self.bordearHorizontalmente(20,22,2,muroInvisible)
		
		self.bordearHorizontalmente(0,5,0,muroInvisible)
		self.bordearHorizontalmente(2,5,5,muroInvisible)
		self.bordearHorizontalmente(6,12,1,muroInvisible)
		self.bordearHorizontalmente(6,8,3,muroInvisible)
		self.bordearHorizontalmente(10,12,3,muroInvisible)
		self.bordearHorizontalmente(13,17,5,muroInvisible)
		self.bordearHorizontalmente(13,17,0,muroInvisible)
		self.bordearHorizontalmente(19,23,0,muroInvisible)
		self.bordearHorizontalmente(19,21,5,muroInvisible)
		self.bordearHorizontalmente(23,23,5,muroInvisible)
		self.bordearHorizontalmente(2,5,7,muroInvisible)
		self.bordearHorizontalmente(1,5,11,muroInvisible)
		self.bordearHorizontalmente(11,14,7,muroInvisible)
		self.bordearHorizontalmente(17,20,7,muroInvisible)
		self.bordearHorizontalmente(17,22,12,muroInvisible)
		self.bordearHorizontalmente(9,14,12,muroInvisible)
		self.bordearHorizontalmente(14,16,3,muroInvisible)
		self.bordearHorizontalmente(14,15,4,muroInvisible)
		
		self.bordearVerticalmente(1,11,0,muroInvisible)
		self.bordearVerticalmente(6,6,2,muroInvisible)
		self.bordearVerticalmente(4,4,6,muroInvisible)
		self.bordearVerticalmente(6,11,6,muroInvisible)
		self.bordearVerticalmente(4,4,12,muroInvisible)
		self.bordearVerticalmente(1,1,18,muroInvisible)
		self.bordearVerticalmente(3,4,18,muroInvisible)
		self.bordearVerticalmente(1,4,24,muroInvisible)
		self.bordearVerticalmente(6,7,21,muroInvisible)
		self.bordearVerticalmente(6,11,23,muroInvisible)
		self.bordearVerticalmente(8,11,16,muroInvisible)
		self.bordearVerticalmente(4,11,8,muroInvisible)
		self.bordearVerticalmente(4,7,10,muroInvisible)
		self.bordearVerticalmente(8,11,15,muroInvisible)
	}
	
	override method abandonarNivel(){
				game.say(configuraciones.elJugador(),"Vuelve a la cama para volver!")
	}	
}


object nivelG1 inherits Dream (siguienteNivel = nivelDream,pertenescoAlDream=true){
	const unContadorDePasos = new ContadorDePasos(position=game.at(3,7))
	const unContadorDeEmpujes = new ContadorDePasos(texto="Pushes : ",position=game.at(3,6))
	
	const jugador1 = new Jugador(position = game.at(7, 5) , resolucion="menorResolucion",nombreJugador = "chara")
	const meta1 = "menorResolucion/meta_dream1.png"
	const meta2 = "menorResolucion/meta_dream2.png"
	const resolucionCaja = "menorResolucion"
	const caja1 = "ataud1.png"
	const caja2 = "ataud2.png"
	const cajaMeta1 = "ataud_ok1.png"
	const cajaMeta2 = "ataud_ok2.png"

	const listaMeta =[   
						  new Meta(position = game.at(7,9), image= meta1, tipo=1) ,
						 new Meta(position = game.at(8,11), image= meta1, tipo=1),
						 new Meta(position = game.at(10,11), image= meta1, tipo=1),
						
						 new Meta(position = game.at(7,10), image= meta1, tipo=1),
						 new Meta(position = game.at(9,10), image= meta2, tipo=2),
						 new Meta(position = game.at(7,11), image= meta2, tipo=2),
						 new Meta(position = game.at(9,11), image= meta2, tipo=2),
						 new Meta(position = game.at(11,11), image= meta2, tipo=2),
						 new Meta(position = game.at(10,9), image= meta1, tipo=1)
	]
	
	const listaCajas=[  new Caja(position = game.at(7,6),resolucion=resolucionCaja,stringDeObjeto=caja1,cajaEnMeta=cajaMeta1,tipo=1)/* ,
						new Caja(position = game.at(14,7),resolucion=resolucionCaja,stringDeObjeto=caja1,cajaEnMeta=cajaMeta1,tipo=1),
						new Caja(position = game.at(9,5),resolucion=resolucionCaja,stringDeObjeto=caja1,cajaEnMeta=cajaMeta1,tipo=1),
						new Caja(position = game.at(11,3),resolucion=resolucionCaja,stringDeObjeto=caja1,cajaEnMeta=cajaMeta1,tipo=1),
						new Caja(position = game.at(8,9),resolucion=resolucionCaja,stringDeObjeto=caja1,cajaEnMeta=cajaMeta1,tipo=1),
						
						new Caja(position = game.at(9,6),resolucion=resolucionCaja,stringDeObjeto=caja2,cajaEnMeta=cajaMeta2,tipo=2),
						new Caja(position = game.at(12,7),resolucion=resolucionCaja,stringDeObjeto=caja2,cajaEnMeta=cajaMeta2,tipo=2),
						new Caja(position = game.at(12,10),resolucion=resolucionCaja,stringDeObjeto=caja2,cajaEnMeta=cajaMeta2,tipo=2),
						new Caja(position = game.at(13,11),resolucion=resolucionCaja,stringDeObjeto=caja2,cajaEnMeta=cajaMeta2,tipo=2)*/
						
	]

	method cargarNivel(){
		configuraciones.configMusic("nivelg2.mp3") //me equivoque con el nombre
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
		nivelDream.posicionInitial(game.at(19,10))
		
		
	}
	
	method generarMuros(){
		const muro2 = "menorResolucion/muro2.png"
		
		self.bordearHorizontalmente(6,15,12,muro2)
		self.bordearHorizontalmente(5,5,9,muro2)
		self.bordearHorizontalmente(5,6,10,muro2)
		self.bordearHorizontalmente(5,6,7,muro2)
		self.bordearHorizontalmente(6,8,3,muro2)
		self.bordearHorizontalmente(8,11,1,muro2)
		self.bordearHorizontalmente(11,16,2,muro2)
		self.bordearHorizontalmente(16,19,3,muro2)
		self.bordearHorizontalmente(15,16,11,muro2)
		self.bordearHorizontalmente(16,17,10,muro2)
		self.bordearHorizontalmente(17,18,9,muro2)
		self.bordearHorizontalmente(18,19,8,muro2)
		
		self.bordearVerticalmente(11,11,6,muro2)
		self.bordearVerticalmente(8,8,5,muro2)
		self.bordearVerticalmente(4,6,6,muro2)
		self.bordearVerticalmente(2,2,8,muro2)
		self.bordearVerticalmente(4,7,19,muro2)
		
		self.bordearHorizontalmente(8,8,10,muro2)
		self.bordearHorizontalmente(10,10,10,muro2)
		self.bordearHorizontalmente(13,13,9,muro2)
		self.bordearHorizontalmente(15,16,6,muro2)
		self.bordearHorizontalmente(14,17,5,muro2)
		self.bordearHorizontalmente(8,8,5,muro2)
		self.bordearHorizontalmente(8,10,7,muro2)
		self.bordearHorizontalmente(12,12,5,muro2)
		self.bordearHorizontalmente(14,15,8,muro2)
		self.bordearHorizontalmente(14,14,4,muro2)
		self.bordearVerticalmente(8,9,11,muro2)
		self.bordearVerticalmente(4,6,11,muro2)
	}
	
	method image() = "menorResolucion/mapG1.png"
	
	override method listaCajas() = listaCajas
	
 	method listaMeta()= listaMeta
}

object nivelG2 inherits Dream (siguienteNivel = nivelDream,pertenescoAlDream=true){
	const unContadorDePasos = new ContadorDePasos(position=game.at(3,7))
	const unContadorDeEmpujes = new ContadorDePasos(texto="Pushes : ",position=game.at(3,6))
	const jugador1 = new Jugador(position = game.at(9, 9) , resolucion="menorResolucion",nombreJugador = "chara")
	const meta1 = "menorResolucion/meta_dream1.png"
	const meta2 = "menorResolucion/meta_dream2.png"
	const resolucionCaja = "menorResolucion"
	const caja1 = "ataud1.png"
	const caja2 = "ataud2.png"
	const cajaMeta1 = "ataud_ok1.png"
	const cajaMeta2 = "ataud_ok2.png"

	const listaMeta =[   
		
						 new Meta(position = game.at(13,5), image= meta2, tipo=2),
						 new Meta(position = game.at(15,6), image= meta1, tipo=1),
						 new Meta(position = game.at(15,4), image= meta1, tipo=1),
						 new Meta(position = game.at(15,3), image= meta1, tipo=1),
						 new Meta(position = game.at(14,3), image= meta1, tipo=1),
						 new Meta(position = game.at(13,3), image= meta1, tipo=1),
						 
						 new Meta(position = game.at(13,4), image= meta2, tipo=2),
						 new Meta(position = game.at(14,4), image= meta2, tipo=2),
						
						 new Meta(position = game.at(14,5), image= meta2, tipo=2),
						 new Meta(position = game.at(15,5), image= meta2, tipo=2)
	]
	
	const listaCajas=[  
						new Caja(position = game.at(9,5),resolucion=resolucionCaja,stringDeObjeto=caja2,cajaEnMeta=cajaMeta2,tipo=2) /* ,
		                new Caja(position = game.at(8,8),resolucion=resolucionCaja,stringDeObjeto=caja1,cajaEnMeta=cajaMeta1,tipo=1),
						new Caja(position = game.at(15,10),resolucion=resolucionCaja,stringDeObjeto=caja1,cajaEnMeta=cajaMeta1,tipo=1),
						new Caja(position = game.at(10,9),resolucion=resolucionCaja,stringDeObjeto=caja1,cajaEnMeta=cajaMeta1,tipo=1),
						new Caja(position = game.at(14,7),resolucion=resolucionCaja,stringDeObjeto=caja1,cajaEnMeta=cajaMeta1,tipo=1),
						new Caja(position = game.at(14,10),resolucion=resolucionCaja,stringDeObjeto=caja1,cajaEnMeta=cajaMeta1,tipo=1),
						
						new Caja(position = game.at(7,6),resolucion=resolucionCaja,stringDeObjeto=caja2,cajaEnMeta=cajaMeta2,tipo=2),
						new Caja(position = game.at(7,5),resolucion=resolucionCaja,stringDeObjeto=caja2,cajaEnMeta=cajaMeta2,tipo=2),
						
						new Caja(position = game.at(7,3),resolucion=resolucionCaja,stringDeObjeto=caja2,cajaEnMeta=cajaMeta2,tipo=2),
						new Caja(position = game.at(8,3),resolucion=resolucionCaja,stringDeObjeto=caja2,cajaEnMeta=cajaMeta2,tipo=2) */
	]

	method cargarNivel(){
		
		configuraciones.configMusic("nivelG2V.mp3")
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
		nivelDream.posicionInitial(game.at(4,10))
		
	}
	
	method generarMuros(){
		const muro2 = "menorResolucion/muro2.png"
		
		/* Bordes */
		self.bordearHorizontalmente(5,8,1,muro2)
		self.bordearHorizontalmente(8,10,2,muro2)
		self.bordearHorizontalmente(10,12,4,muro2)
		self.bordearHorizontalmente(12,16,2,muro2)
		self.bordearHorizontalmente(15,17,7,muro2)
		self.bordearHorizontalmente(16,17,11,muro2)
		self.bordearHorizontalmente(12,16,12,muro2)
		self.bordearHorizontalmente(11,12,10,muro2)
		self.bordearHorizontalmente(7,12,11,muro2)
		self.bordearHorizontalmente(5,6,10,muro2)
		self.bordearHorizontalmente(6,7,7,muro2)
		
		self.bordearHorizontalmente(9,13,7,muro2)
		self.bordearHorizontalmente(11,13,8,muro2)
		self.bordearHorizontalmente(10,12,6,muro2)
		
		self.bordearVerticalmente(2,9,5,muro2)
		self.bordearVerticalmente(10,11,6,muro2)
		self.bordearVerticalmente(8,10,17,muro2)
		self.bordearVerticalmente(3,6,16,muro2)
		self.bordearVerticalmente(3,3,10,muro2)
		self.bordearVerticalmente(3,3,12,muro2)
		self.bordearVerticalmente(10,10,8,muro2)
	}
	
	method image() = "menorResolucion/mapG2.png"
	
	override method listaCajas() = listaCajas
	
 	method listaMeta()= listaMeta
 	
}
object listasNivelesCompletados{
	var property position=game.at(7,0)
	
	method text()=nivelDream.listaDeNivelesCompletados().asSet().toString()
	
}
