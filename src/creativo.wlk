import wollok.game.*
import objetos.*
import direcciones.*
import configuraciones.*
import timeline.*
import jugador.*
import niveles.*
import objetosDelModoCreativo.*

class Creativo inherits Nivel{
	
	override method reiniciar(){
		configuraciones.nivelActual().listaCajas().forEach{ objeto => objeto.posicioninicial()}
		configuraciones.elJugador().posicioninicial()
		self.listaCajas().forEach({unaCaja=>unaCaja.estoyEnMeta(false)})
		self.listaCajas().forEach({unaCaja=>unaCaja.reiniciar()})
		self.cajasEnMeta().clear()
	}

	method cajasEnMeta()
}

object nivelCreativo inherits Creativo (siguienteNivel = menu,soyUnNivelPuzzle=false) {

	const jugador1 = new JugadorConstructor (position = game.center() , resolucion="menorResolucion",nombreJugador = "jugador1" ,tipo=66)
	const objetosPorDefecto=[posicionInicialDelConstructor,jugador1,ui,ui2,contadorDeCajas] //Estos objetos no se pueden eliminar adentro del modo creativo
	const listaMeta =[]
	const listaCajas=[]
	const listaMuros=[]
	const cajasEnMeta=[]

	const conjuntoDeListas=[listaMeta,listaCajas,listaMuros]
	
	method esPisable()=true
	
	
	method cajasEnMetaBorrar(objeto){
		cajasEnMeta.removeAll(objeto)
		
	}

	method formatearNivel(){
		conjuntoDeListas.flatten().forEach({unObjeto=>unObjeto.modoCreativoBorrarVisual()})
		conjuntoDeListas.forEach({lista=>lista.clear()})
		cajasEnMeta.clear()
		self.retornarJugador().banderaDeSonido(false)
		self.retornarJugador().banderaDeSonido2(false)
		self.retornarJugador().reiniciar()
		self.retornarJugador().banderaDeSonido(true)
		self.retornarJugador().banderaDeSonido2(true)
		sonidoObjeto.emitirSonido("modoCreativoSonidos/formatear.mp3")
	}
	
	method eliminarTodasLasMetas(){
		listaMeta.forEach({unObjeto=>unObjeto.modoCreativoBorrarVisual()})
		listaMeta.clear()
	}
	
	method eliminarTodasLasCajas(){
		listaCajas.forEach({unObjeto=>unObjeto.modoCreativoBorrarVisual()})
		listaCajas.clear()
	}
	method eliminarTodosLosMuros(){
		listaMuros.forEach({unObjeto=>unObjeto.modoCreativoBorrarVisual()})
		listaMuros.clear()
		
	}

	method retornarJugador()=jugador1

	method borrarObjetos(objeto) = objeto.forEach{ unObjeto => game.removeVisual(unObjeto)}

	method cargarNivel(){
		game.addVisual(self)
		self.cargarObjetos(objetosPorDefecto)
		configuraciones.nivelActual(self)
		self.configNivel(jugador1)
		jugador1.TeclasAdicionales()
		self.ordenarVisuales()
		game.say(jugador1,"presiona ENTER para probar el nivel creado!!")	
	}
 	
	override method verificarMetas() {
		
		const verificador =self.listaCajas().all({ unaCaja => unaCaja.estoyEnMeta()})
		
		if (verificador) {
			sonidoObjeto.emitirSonido("ok.mp3") // es temporal
			game.say(configuraciones.elJugador(), "BIEN!!! Este puzzle se puede RESOLVER! ")
		}		
	}
	override method cajasEnMeta()=cajasEnMeta
	
	
	method cajasEnMeta(unaCaja){
		
		cajasEnMeta.add(unaCaja)
		
	}
	method cajasEnMetaRemover(unaCaja){
		cajasEnMeta.remove(unaCaja)
	}
	
	
	method numeroDeCajasEnLaMeta(){
		return cajasEnMeta.asSet().size()
	}
	method agregarNuevaCajaAlaLista(unaCaja){
		listaCajas.add(unaCaja)
		self.ordenarVisuales()	
	}
	method agregarNuevaMetaAlaLista(unaMeta){
		listaMeta.add(unaMeta)
		
		self.ordenarVisuales()
	}
	method agregarNuevoMuroAlaLista(unMuro){
		listaMuros.add(unMuro)
		self.ordenarVisuales()	
	}
	method ordenarVisuales(){
		self.agregarObjetosAlTablero()
		self.borrarObjetosDelTableroTemporalmente()
		objetosPorDefecto.forEach({unObjeto=>game.removeVisual(unObjeto)})
		self.habilitarLaAdicionDeLosObjetosAlTablero()
		self.agregarObjetosAlTablero()
		objetosPorDefecto.forEach({unObjeto=>game.addVisual(unObjeto)})
		
		}
	method agregarObjetosAlTablero(){
		conjuntoDeListas.flatten().forEach({unObjeto=>unObjeto.modoCreativoAgregarVisual()})
	}
	method borrarObjetosDelTableroTemporalmente(){
		conjuntoDeListas.flatten().forEach({unObjeto=>unObjeto.modoCreativoBorrarVisual()})
	}
	method habilitarLaAdicionDeLosObjetosAlTablero(){
		conjuntoDeListas.flatten().forEach({unObjeto=>unObjeto.quieroAgregarAlTablero(true)})
	}
	method ordenarCajasPorTipo(){
		listaCajas.sortedBy{ a, b => b.tipo() > a.tipo()}
	}
	override method abandonarNivel(){
		conjuntoDeListas.forEach({unaLista=>unaLista.clear()})
		game.schedule(20,{self.volverAlMenu()})
	}
	method volverAlMenu(){
		game.clear()	
		siguienteNivel.cargarNivel()	
		
	}

	method borrarObjetosDeLaLista(listaDeObjetos){
		conjuntoDeListas.forEach({unaLista=>unaLista.removeAll(listaDeObjetos)})
		listaDeObjetos.forEach({unObjeto=>unObjeto.modoCreativoBorrarVisual()})
	}
	
	method image() = "menorResolucion/modoCreativo.png"
	
	method jugarNivelCreado(){
		var numeroDeCajasEnTotal=0
		self.reiniciar()
		numeroDeCajasEnTotal=self.numeroDeCajas()
		nivelCreativoJugar.numeroDeCajasTotales(numeroDeCajasEnTotal)
		self.habilitarLaAdicionDeLosObjetosAlTablero()
		cajasEnMeta.clear()
		game.clear()
		nivelCreativoJugar.preCargar()
	
	}
	method numeroDeCajas()=listaCajas.size()


	method listaMuros()=listaMuros
	

	override method listaCajas() = listaCajas

 	method listaMeta()= listaMeta
 	
 	override method position()=game.at(0,0)
	
	override method hacerAlgo(direccion){
	}
	
	
	override method modoCreativoBorrarVisual(){}
	override method cambiarPosicion(direccion){	
	}
 	
}



object nivelCreativoJugar inherits Creativo (siguienteNivel = nivelCreativo,soyUnNivelPuzzle=false){
	const unContadorDePasos = new ContadorDePasos(position=game.at(1,6))
	const unContadorDeEmpujes = new ContadorDePasos(texto="Pushes : ",position=game.at(1,5))
	const jugador1 = new JugadorDelNivelCreado(position =posicionInicialDelConstructor.position() , resolucion="menorResolucion",nombreJugador = "jugador1")
	
	var listaMeta =[]
	var listaCajas=[]
	var listaMuros=[]
	var property numeroDeCajasTotales=0
	const cajasEnMeta=[]

	
  
	override method verificarMetas() {
		
		const verificador = self.listaCajas().all({ unaCaja => unaCaja.estoyEnMeta()})
		
		
		if (verificador) {
			sonidoObjeto.emitirSonido("nivelPruebaOk.mp3") // es temporal
			game.say(configuraciones.elJugador(), "ganaste!")
			configuraciones.configStopMusic()
			game.schedule(1500,{self.cambiarNivel()})
		}
		
	}
	override method cajasEnMeta()=cajasEnMeta
	
	
	method cajasEnMeta(unaCaja){
		
		cajasEnMeta.add(unaCaja)
		
	}
	method cajasEnMetaRemover(unaCaja){
		cajasEnMeta.remove(unaCaja)
	}
	
	method preCargar(){
		listaMeta=nivelCreativo.listaMeta()
		listaCajas=nivelCreativo.listaCajas()
		listaMuros=nivelCreativo.listaMuros()
		self.cargarNivel()
	}

	method cargarNivel() {
		configuraciones.nivelActual(self)
		configuraciones.configMusic("modoCreativoSonidos/modoCreativo2.mp3")
		configuraciones.elcontadorDePasos(unContadorDePasos)
		configuraciones.contadorDeEmpujes(unContadorDeEmpujes)
		game.addVisual(unContadorDePasos)
		game.addVisual(unContadorDeEmpujes)	
		game.addVisual(self)
		self.cargarObjetos(listaMeta)
		self.cargarObjetos(listaCajas)
		self.cargarObjetos(listaMuros)
		jugador1.position(posicionInicialDelConstructor.position())
		jugador1.posicionInicial(posicionInicialDelConstructor.position())
		game.addVisual(jugador1)
		game.say(jugador1, "Presiona BACKSPACE para volver al modo creativo")
		self.configNivel(jugador1)
		
	}
	


	method image() = "menorResolucion/modoLibre.png"

	override method position() = game.at(0, 0)

	override method listaCajas() = listaCajas

	method listaMeta() = listaMeta

	override method soyUnNivelCreativo() = true

	
	override method hacerAlgo(direccion){
	}
	
	
	override method modoCreativoBorrarVisual(){}
	override method cambiarPosicion(direccion){	
	}
}
