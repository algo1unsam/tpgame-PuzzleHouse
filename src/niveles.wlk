import wollok.game.*
import objetos.*
import direcciones.*
import configuraciones.*
import timeline.*
import jugador.*
import nivel1.*
import nivelB.*
import nivelW.*
import nivelBel.*
import nivelL.*
import creativo.*
import nivelDream.*
import nivelTests.*
import nivelB2.*

class Nivel inherits Posicion{
	var property soyUnNivelPuzzle=true
	var property soyUnNivelHardcoreTime=false
	var property siguienteNivel
	var property pertenescoAlDream=false
	var property permitirAgregarAlAListaDeLnivel0Completado=false
	var property soyUnNivelGranja=false
	var property duplicador=1
	method listaCajas()
	
	method remove(p1){
		game.removeVisual(p1)
	}
	
	method cargarObjetos(objeto) = objeto.forEach{ unObjeto => game.addVisual(unObjeto)}
	
	method dibujarMuros(objeto) = game.addVisual(objeto)

	method bordearVerticalmente(yInicial,yFinal,xCoordenada,stringObjeto){
		const lista=[]
		new Range(start = yInicial, end =yFinal , step = duplicador).forEach({ n => lista.add( new Position( x=xCoordenada, y=n))})
		lista.forEach { p => self.dibujarMuros(new MuroVisible(position = p, image=stringObjeto))}
	}
	
	method bordearHorizontalmente(xInicial,xFinal,yCordenada,stringObjeto){
		const lista=[]
		new Range(start = xInicial, end =xFinal , step = duplicador).forEach({ n => lista.add( new Position( x=n, y=yCordenada))}) 	
		lista.forEach { p => self.dibujarMuros(new MuroVisible(position = p, image=stringObjeto))}	
	}

	method verificarMetas() {
		const verificador = self.listaCajas().all({ unaCaja => unaCaja.estoyEnMeta() })
		if (verificador) {
			sonidoObjeto.emitirSonido("victoriaFem.mp3") // es temporal
			game.say(configuraciones.elJugador(), "ganaste!")
			configuraciones.configStopMusic()
			if(self.soyUnNivelHardcoreTime()){
				self.desactivarCronometro()
			}
			
			
			game.schedule(1200,{self.cambiarNivel()})
		}
	}
	method desactivarCronometro(){
		configuraciones.nivelActual().cronometro().desactivarCronometro() //self.cronometro().desactivarCronometro() funciona pero el ide da aviso de errores.
		
	}
	
	method cambiarNivel(){
		self.reiniciar()
		game.clear()
		if(self.permitirAgregarAlAListaDeLnivel0Completado() and !self.soyUnNivelHardcoreTime()){
			nivel0.agregarNivelCompletado(self)
			if(!self.soyUnNivelGranja()){
				nivel0.agregarNivelHardTimeDesbloqueado(configuraciones.nivelActual().nivelHardCoreTime())
			}
		}
		if (self.pertenescoAlDream() and !self.soyUnNivelHardcoreTime()){
			nivelDream.agregarNivelCompletado(self)
		}
		if(self.soyUnNivelHardcoreTime()){
			nivel0.agregarNivelHardTimeCompletado(self)
		}
		if(self.soyUnNivelGranja()){
			nivel0.agregarNivelCompletado(self)
		}
		
		
		
		siguienteNivel.cargarNivel()
	}
	method abandonarNivel(){
			game.schedule(50,{
			game.clear()
			self.reiniciar()
			configuraciones.configStopMusic()
			siguienteNivel.cargarNivel()	
			})
			
		}
	
	method reiniciar(){
		self.listaCajas().forEach{ objeto => objeto.posicioninicial()}
		self.listaCajas().forEach{ objeto => objeto.estoyEnMeta(false)}
		configuraciones.elJugador().posicioninicial()
		if(self.soyUnNivelPuzzle()){
			configuraciones.elcontadorDePasos().reiniciar()
			configuraciones.contadorDeEmpujes().reiniciar()
		}
		if(self.soyUnNivelHardcoreTime()){
			self.listaCajas().forEach{ objeto => objeto.yaEstubeEnMeta(false)}
			configuraciones.nivelActual().cronometro().reiniciar() //Da error si uso self en vez de configuraciones.nivelActual() . No entiendo el porque. Asumo que es un error del iDe ,sin embargo si ignoramos el error y ejecutamos el juego todo anda normal!
		}
		
		
	}
	
	
	method configNivel(personaje){
		duplicaDireccion.direccionDuplicador(duplicador)
		configuraciones.configTeclas(personaje)
		configuraciones.configColisiones(personaje)
	}
	
	method soyUnNivelCreativo()=false
	
	override method cambiarPosicion(direccion){		
	}
}

object menu inherits Nivel(siguienteNivel = nivel1, duplicador = 2,soyUnNivelPuzzle=false){

	const jugador1 = new Jugador(position = game.at(11, 5) ,resolucion="mayorResolucion",nombreJugador = "jugador1")
	
	method cargarNivel(){
		
		configuraciones.configMusic("menu.mp3")
		pasadizo.vestimenta("jugador1")
		game.addVisual(self)
		game.addVisual(new Checkpoint(position = game.at(9,1), image = "mayorResolucion/invisible.png", siguienteNivel = nivel1))
		game.addVisual(new Checkpoint(position = game.at(11,1), image = "mayorResolucion/invisible.png", siguienteNivel = nivel1))
		game.addVisual(new Checkpoint(position = game.at(13,1), image = "mayorResolucion/invisible.png", siguienteNivel = nivel1))
		game.addVisual(new Checkpoint(position = game.at(3,5), image = "mayorResolucion/invisible.png", siguienteNivel = nivelCreativo))
		game.addVisual(new Checkpoint(position = game.at(5,5), image = "mayorResolucion/invisible.png", siguienteNivel = nivelCreativo))
		
		
		game.addVisual(new CheckpointSalir(position = game.at(17,5), image = "mayorResolucion/invisible.png", siguienteNivel = nivel0))
		game.addVisual(new CheckpointSalir(position = game.at(19,5), image = "mayorResolucion/invisible.png", siguienteNivel = nivel0))
		
		jugador1.position(game.at(11, 5))
		game.addVisual(jugador1)
		configuraciones.nivelActual(self)
		self.configNivel(jugador1)
		self.generarMuros()
	}
	
	method generarMuros(){
		
		const muroInvisible = "menorResolucion/invisible.png"
		
		self.bordearHorizontalmente(-1,25,-1,muroInvisible)
		self.bordearHorizontalmente(-1,25,11,muroInvisible)
		self.bordearVerticalmente(-1,11,-1,muroInvisible)
		self.bordearVerticalmente(-1,11,25,muroInvisible)
	}
	
	override method listaCajas() = []
	
	method image() = "oscuro.png"
	
	override method abandonarNivel(){
			
			game.stop()
			
		}
	
}

object nivel0 inherits Nivel (siguienteNivel = pasadizo,soyUnNivelPuzzle=false){
	var property sonido = "hogar1.mp3"
	var property image = "nivel0/map3.png"
	const jugador1 = new Jugador(position = game.at(3, 1) ,resolucion="menorResolucion",nombreJugador = "jugador1")
	const listaCajas=[]
	const listaMeta =[]
	const listaSombras=[
		new CheckpointDeSombras(position=game.at(7,5),sombraDeReferencia=sombraHab1),
		new CheckpointDeSombras(position=game.at(10,5),sombraDeReferencia=sombraHab2),
		new CheckpointDeSombras(position=game.at(7,3),sombraDeReferencia=pasadizo2),
		new CheckpointDeSombras(position=game.at(10,3),sombraDeReferencia=pasadizo4),

		new CheckpointDeSombras(position=game.at(6,2),sombraDeReferencia=sombra1),
		new CheckpointDeSombras(position=game.at(12,2),sombraDeReferencia=sombra2),
		new CheckpointDeSombras(position=game.at(18,2 ),sombraDeReferencia=sombra3)
	]
	const nivelBel = new NivelBel()
	const nivelL = new NivelL()
	const nivelW= new NivelW ()
	
	const listaDeNivelesCompletados=[]
	const listaDeNivelesHardTimeCompletados=[]
	const listaDeNIvelesHardTimesDesbloqueados=[]
	
	const checkPointHardTimerW=new CheckpointHardTimer(position = game.at(3,11), imagen = "hardTimer/hardTimerW", siguienteNivel = nivelWHardcoreTime, velocidad=50 ,limite=7)
	const checkPointHardTimerBel=new CheckpointHardTimer(position = game.at(13,11), imagen = "hardTimer/hardTimerBel", siguienteNivel = nivelBelHardcoreTime ,velocidad=60 ,limite=12)
	const checkPointHardTimerL=new CheckpointHardTimer(position = game.at(19,4), imagen = "hardTimer/hardTimerL", siguienteNivel = nivelLHardcoreTime ,velocidad=60 ,limite=11)
	
	var property posicionInitial = game.at(3,1)
	
	
		method verificarSiEstaDesbloqueadoElNivel(unNivel)=listaDeNIvelesHardTimesDesbloqueados.contains(unNivel)
		
		
		method agregarCheckPointHardTimer(unNivel,unCheckpoint){
			if(self.verificarSiEstaDesbloqueadoElNivel(unNivel)){
				game.addVisual(unCheckpoint)
				unCheckpoint.animar()
			}
			
			
		}
		method cargarNivel(){	
			if(self.juegoTerminado()){
				self.image("nivel0/map2.png")
				game.addVisual(self)
				
				//zZzZ
				const animacionZz = new Animacion(position = game.at(0,0), imagen="nivel0/zz/zzz", velocidad= 300)
				game.addVisual(animacionZz)
				animacionZz.animar()
				
				self.sonido("fin.mp3")
			}
			else{
				game.addVisual(self)
			}
		
		configuraciones.configMusic(self.sonido())
		
		self.agregarCheckPointHardTimer(nivelWHardcoreTime,checkPointHardTimerW)
		self.agregarCheckPointHardTimer(nivelBelHardcoreTime,checkPointHardTimerBel)
		self.agregarCheckPointHardTimer(nivelLHardcoreTime,checkPointHardTimerL)
		
		/*
		const animacionZz = new Animacion(position = game.at(0,0), imagen="nivel0/zz/zzz", velocidad= 300)
		game.addVisual(animacionZz)
		animacionZz.animar()
		*/
		
		//Chimenea
		const chimenea = new Animacion(position = game.at(0,0), imagen="nivel0/chimenea/flama")
		game.addVisual(chimenea)
		chimenea.animar()

		//Habitación hijo
		const hijo = new Jugador(position = game.at(7, 11) ,resolucion="menorResolucion" ,nombreJugador = "hijo")
		game.addVisual(hijo)
		
		
		//Habitación hija
		const hija = new Jugador(position = game.at(10, 11) ,resolucion="menorResolucion", nombreJugador = "hija")
		game.addVisual(hija)
		
		
		//Esposa
		const jugadora1 = new Jugador(position = game.at(23, 4) ,resolucion="menorResolucion", nombreJugador = "jugadora1")
		game.addVisual(jugadora1)	
		
		//Bonus
		
		//const bonus = new CheckpointBonus( nivelBase = self, bonus=pasadizo)
		const bonus = new CheckpointConRequisito(destino=pasadizo,condicion=!self.nivelPasadizoHabilitado(),mensajeDeError="Debes completar como minimo un Nivel para acceder al pasadizo!!!!")
		game.addVisual(bonus)
		
		self.generarMuros()
		
		//Esposo
		jugador1.nombreJugador(pasadizo.vestimenta())
		jugador1.position(posicionInitial)
		game.addVisual(jugador1)
		self.configNivel(jugador1)
		
		//Dream
		const dream = new CheckpointConRequisito(destino=nivelDream,condicion=!self.nivelDreamHabilitado(),mensajeDeError="Debes completar todos los niveles NORMALES para acceder al Dream !!!!")
		//const dream = new CheckpointBonus( nivelBase = self, bonus=nivelDream)
		
		dream.position( game.at(16,11) )
		game.addVisual(dream)
		
		game.addVisual(new Checkpoint(position = game.at(7,11), image = "menorResolucion/invisible.png", siguienteNivel = self.nivelW()))

		game.addVisual(new Checkpoint(position = game.at(10,11), image = "menorResolucion/invisible.png", siguienteNivel = self.nivelBel()))
		//game.addVisual(new Checkpoint(position = game.at(12,11), image = "menorResolucion/reloj.png", siguienteNivel = nivelBelHardcoreTime))	 el png ese es horrible ,lo puse para probar pero ni asi lo quiero jaja		
		game.addVisual(new Checkpoint(position = game.at(23,4), image = "menorResolucion/invisible.png", siguienteNivel = self.nivelL()))	
		self.cargarObjetos(listaSombras)
		game.addVisual(listasNivelesCompletados2)
		self.listaSombrasNoAtravesadas().forEach({unaSombra=>unaSombra.agregarSombra()})
		nivelDream.posicionInitial(game.at(13, 11)) //por si entramos nuevamente al nivel dream

	}	
		override method configNivel(personaje1){
		duplicaDireccion.direccionDuplicador(duplicador)
		configuraciones.configTeclas(personaje1)
		configuraciones.configColisiones(personaje1)
		configuraciones.nivelActual(self)

	}
	method nivelBel()=nivelBel
	method nivelW()=nivelW
	method nivelL()=nivelL
	method nivelDreamHabilitado()=listaDeNivelesCompletados.asSet().size()>=3
	
	method listaSombras()=listaSombras
	method listaSombrasNoAtravesadas()=self.listaSombras().filter({unaSombra=>!unaSombra.seAtraveso()})
	method agregarNivelCompletado(unNivel){
		listaDeNivelesCompletados.add(unNivel)
	}
	method agregarNivelHardTimeCompletado(unNivel){
		listaDeNivelesHardTimeCompletados.add(unNivel)
	}
	method agregarNivelHardTimeDesbloqueado(unNivel){
		listaDeNIvelesHardTimesDesbloqueados.add(unNivel)
	}
	method listaDeNIvelesHardTimesDesbloqueados()=listaDeNIvelesHardTimesDesbloqueados
	
	method listaDeNIvelesHardTimesCompletados()=listaDeNivelesHardTimeCompletados
	
	method juegoTerminado() = self.listaDeNivelesCompletados().contains(nivel_bonus)
	
	method listaDeNivelesCompletados()=listaDeNivelesCompletados
	method nivelPasadizoHabilitado() = self.listaDeNivelesCompletados().asSet().size()>=1
	method nivelGranjaHabilitado()=self.listaDeNivelesCompletados().asSet().size()>=3
	override method listaCajas() = listaCajas

    method listaMeta()= listaMeta
	
	method generarMuros(){
		
		const muroInvisible = "menorResolucion/invisible.png"
		
		self.bordearHorizontalmente(0,2,0,muroInvisible)
		self.bordearHorizontalmente(4,5,0,muroInvisible)
		self.bordearHorizontalmente(3,3,-1,muroInvisible)
		self.bordearHorizontalmente(13,17,0,muroInvisible)
		self.bordearVerticalmente(0,1,18,muroInvisible)
		self.bordearHorizontalmente(19,24,0,muroInvisible)
		self.bordearVerticalmente(1,5,24,muroInvisible)
		self.bordearVerticalmente(3,4,18,muroInvisible)
		self.bordearHorizontalmente(12,23,5,muroInvisible)
		self.bordearHorizontalmente(14,16,3,muroInvisible)
		self.bordearHorizontalmente(14,15,4,muroInvisible)
		self.bordearHorizontalmente(6,12,1,muroInvisible)
		self.bordearVerticalmente(3,4,12,muroInvisible)
		self.bordearVerticalmente(3,7,11,muroInvisible)
		self.bordearVerticalmente(3,11,9,muroInvisible)
		self.bordearVerticalmente(3,11,8,muroInvisible)
		self.bordearVerticalmente(3,7,6,muroInvisible)
		self.bordearHorizontalmente(0,16,12,muroInvisible)
		self.bordearHorizontalmente(0,5,7,muroInvisible)
		self.bordearHorizontalmente(12,17,7,muroInvisible)
		self.bordearVerticalmente(8,11,17,muroInvisible)
		self.bordearVerticalmente(8,11,0,muroInvisible)
		self.bordearVerticalmente(1,5,0,muroInvisible)
		self.bordearHorizontalmente(1,5,5,muroInvisible)
		self.bordearVerticalmente(1,2,23,muroInvisible)
		self.bordearVerticalmente(8,9,16,muroInvisible)
		self.bordearVerticalmente(8,9,1,muroInvisible)
		self.bordearHorizontalmente(1,1,11,muroInvisible)
		
		//self.bordearHorizontalmente(16,16,11,muroInvisible)	/* Cama */
	}
	method limpiarlistaDeNivelesCompletados(){
		listaDeNivelesCompletados.clear()
	}
	override method abandonarNivel(){
			game.schedule(50,{
			listaSombras.forEach({unaSombra=>unaSombra.seAtraveso(false)})
			self.limpiarlistaDeNivelesCompletados()
			game.clear()
			self.sonido("hogar1.mp3")
			image = "nivel0/map3.png"
			configuraciones.configStopMusic()
			menu.cargarNivel()	
			})
			
		}
	
}
object listasNivelesCompletados2{
	var property position=game.at(7,0)
	
	method text()=nivel0.listaDeNIvelesHardTimesCompletados().asSet().toString()
	
}
 
 