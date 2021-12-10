import wollok.game.*
import direcciones.*
import configuraciones.*
import niveles.*
import jugador.*
import sonido.*
import nivelB.*
import objetos.*
import creativo.*


class CajaFullPerfomance inherits  Caja(resolucion="MCMenorResolucion"){  

	
	var property imagen = resolucion + "/" + stringDeObjeto // con pre calculo seria asi  : if (self.llegoMeta()) {resolucion + "/" + cajaEnMeta} else {	resolucion + "/" + stringDeObjeto}
															// pero relentiza demasiado al modo creativo 
	override method image() =imagen
	
	override method text() =""
	
	method reiniciar(){
		imagen=resolucion + "/" + stringDeObjeto
	}

	override method activarVerificador(){
		
		if(self.llegoMeta()){
				estoyEnMeta=true
				imagen= resolucion + "/" + cajaEnMeta // Tranquilamente podriamos hacer esto en el method image = method image()=if (self.llegoMeta()) {resolucion + "/" + cajaEnMeta} else {	resolucion + "/" + stringDeObjeto} pero el rendimiento del juego empeora!! El precalculo causa perdida de cuadros por segundos
				configuraciones.nivelActual().verificarMetas()
				configuraciones.nivelActual().cajasEnMeta(self)
			}
			else{
				configuraciones.nivelActual().cajasEnMetaRemover(self)
				estoyEnMeta=false
				imagen=resolucion + "/" + stringDeObjeto // Tranquilamente podriamos hacer esto en el method image = method image()=if (self.llegoMeta()) {resolucion + "/" + cajaEnMeta} else {	resolucion + "/" + stringDeObjeto} pero el rendimiento del juego empeora!! El precalculo causa perdida de cuadros por segundos
			}	
	}
	override method contador(){	
	}


}

object ui2 inherits Pisable(position=game.at(6,12)) {
	
	
	override method image()="MCMenorResolucion/hud.png"

	override method modoCreativoBorrarVisual(){}
}


object ui inherits Pisable(position=game.at(9,0)) {
	
	override method image()="MCMenorResolucion/hud"+nivelCreativo.retornarJugador().numeroSelector().toString()+".png"

	override method modoCreativoBorrarVisual(){}
}
object contadorDeCajas inherits Pisable(position=game.at(0,12)){
	method text ()= nivelCreativo.listaCajas().size().toString() +"/" + nivelCreativo.numeroDeCajasEnLaMeta().toString()
	method textColor() = paleta.verde()
	override method modoCreativoBorrarVisual(){}
}

object numero inherits Pisable(position=game.at(10,12)){
	method text ()= configuraciones.elJugador().numeroSelector().toString()
	method textColor() = paleta.verde()
	override method modoCreativoBorrarVisual(){}
}


object posicionInicialDelConstructor inherits Posicion(modoCreativo_soyUnPuntoDeReinicio=true,position=game.center()){
	
	
	method image()="menorResolucion/pos00.png"
	override method hacerAlgo(direccion) {
		
	}	
	override method cambiarPosicion(nuevaPosicion){
		var guardarPosicion
		self.position(nuevaPosicion)
		guardarPosicion=self.position()
		self.position(game.center())
		self.position(guardarPosicion)
	}
	method esPisable()=true

	override method modoCreativoBorrarVisual(){		
	}
}

class JugadorDelNivelCreado inherits Jugador{

	override method text() =""
}

class JugadorConstructor inherits Jugador{
	var  pasos="pasosf.mp3"
	var property  elJugadorNoPudoAvanzar=false
	var property banderaDeSonido=true // tambien podriamos haber usado variables o constante en los metodos correspondiente y nos ahorrariamos estos atributos  ,pero por falta de tiempo lo hago asi para no tener que modificar logica y hacer que los metodos existentes  reciban ahora parametros... 
	var property banderaDeSonido2=true //

   
    var property numeroSelector = 0
   
    
    override method cambiarPosicion(direccion) {
	 	ultimaDireccion=direccion
		self.position(direccion.moverse(self))
		sonidoObjeto.emitirSonido(pasos)
	}
	method sumar2() {
		
		
		if (numeroSelector < 4) {
			numeroSelector = numeroSelector + 2
		} else {
			numeroSelector = 0
		}
		sonidoObjeto.emitirSonido("modoCreativoSonidos/cambiarColores.mp3")
	}

	method posicionActual()=self.position()

	method TeclasAdicionales(){

	//Se podria usar Self.position, osea la posicion del jugador pero por razones que desconosco da un rendimiento MUY POBRE!! Los frames bajan mucho!
		keyboard.e().onPressDo{self.sumar2()}
		keyboard.x().onPressDo{self.reiniciar()}
		keyboard.f().onPressDo{nivelCreativo.formatearNivel()}
		keyboard.c().onPressDo{nivelCreativo.eliminarTodasLasCajas()}
		keyboard.v().onPressDo{nivelCreativo.eliminarTodasLasMetas()}
		keyboard.b().onPressDo{nivelCreativo.eliminarTodosLosMuros()}
		keyboard.num1().onPressDo{self.generarUnaCaja(new CajaFullPerfomance(position =game.at(self.coordenadaX(),self.coordenadaY()),stringDeObjeto="caja"+(1+numeroSelector).toString()+".png",cajaEnMeta="caja_ok"+(1+numeroSelector).toString()+".png",tipo=1+numeroSelector))}
		keyboard.num2().onPressDo{self.generarUnaCaja(new CajaFullPerfomance(position =game.at(self.coordenadaX(),self.coordenadaY()),stringDeObjeto="caja"+(2+numeroSelector).toString()+".png",cajaEnMeta="caja_ok"+(2+numeroSelector).toString()+".png",tipo=2+numeroSelector))}
		keyboard.num3().onPressDo{self.generarUnaMeta( new Meta(position =game.at(self.coordenadaX(),self.coordenadaY()),image="MCMenorResolucion/meta"+(1+numeroSelector).toString()+".png",tipo=1+numeroSelector,modoCreativo_soyMeta=true))}
		keyboard.num4().onPressDo{self.generarUnaMeta( new Meta(position =game.at(self.coordenadaX(),self.coordenadaY()),image="MCMenorResolucion/meta"+(2+numeroSelector).toString()+".png",tipo=2+numeroSelector,modoCreativo_soyMeta=true))}
	    keyboard.space().onPressDo{self.generarUnMuro( new MuroVisible(position =game.at(self.coordenadaX(),self.coordenadaY()),image="menorResolucion/muro3.png",modoCreativo_soyUnMuro=true,tipo=10))}
	    keyboard.alt().onPressDo{self.generarUnMuro( new MuroVisible(position =game.at(self.coordenadaX(),self.coordenadaY()),image="menorResolucion/muro2.png",modoCreativo_soyUnMuro=true,tipo=11))}
	   
	    keyboard.shift().onPressDo{self.eliminarObjeto()}
		keyboard.control().onPressDo{self.generarPuntoDeReinicio()}
		keyboard.enter().onPressDo{nivelCreativo.jugarNivelCreado()}
		keyboard.z().onPressDo{self.cambiarAssetsEnElModolibre()}
	}
	
	
	
	
	method cambiarAssetsEnElModolibre(){
		if(configuraciones.libreMoviento()){
			sonidoObjeto.emitirSonido("modoCreativoSonidos/builderMode.mp3")
			self.resolucion("MCMenorResolucion")
			self.nombreJugador("libre")
			pasos="modoCreativoSonidos/pasos.mp3"
		}
		else{
			sonidoObjeto.emitirSonido("modoCreativoSonidos/builderModeOFF.mp3")
			self.resolucion("menorResolucion")
			self.nombreJugador("jugador1")
			pasos="pasosf.mp3"
		}

	}

	method validadLibreMovimiento(){
		if(!configuraciones.libreMoviento()){
			self.errorSonido()
			self.error("Presiona la Z primero")
		}
	}
	method generarUnaCaja(unObjeto){
		self.validadLibreMovimiento()
		self.validarObjetoPisable("No puedes generar una caja aqui")
		self.validacionPuntoDeReinicio()
		
		
		nivelCreativo.agregarNuevaCajaAlaLista(unObjeto)
		sonidoObjeto.emitirSonido("modoCreativoSonidos/caja"+unObjeto.tipo().toString()+".mp3")	
	}
	method generarUnaMeta(unObjeto){
		self.validadLibreMovimiento()
		self.validacionDeMetas()
		nivelCreativo.agregarNuevaMetaAlaLista(unObjeto)
		sonidoObjeto.emitirSonido("modoCreativoSonidos/meta"+unObjeto.tipo().toString()+".mp3")	
	}
	method generarUnMuro(unObjeto){
		self.validacionPuntoDeReinicio()
		self.validadLibreMovimiento()
		self.validarObjetoPisable("No puedes generar un muro aqui")
		self.validacionDeMetas()
		nivelCreativo.agregarNuevoMuroAlaLista(unObjeto)
		sonidoObjeto.emitirSonido("modoCreativoSonidos/muro"+unObjeto.tipo().toString()+".mp3")	
	}
	method generarPuntoDeReinicio(){
		
		self.validarObjetoPisable("No puedes generar un punto de reinicio del jugador  aqui")
		
		posicionInicialDelConstructor.cambiarPosicion(self.position())
		sonidoObjeto.emitirSonido("modoCreativoSonidos/puntoDeReinicio.mp3")
	}
	method eliminarObjeto(){
		if(self.verificarQueExisteUnObjeto() and self.banderaDeSonido()){
			sonidoObjeto.emitirSonido("modoCreativoSonidos/remove.mp3")
			
		}
		nivelCreativo.cajasEnMetaBorrar(self.objetosConElQueElConstructorEstaColisionando()) //agregado el 29/11/2021 luego de que se descubrio un bug que aparece cuando borramos  una caja y una meta a la vez
		nivelCreativo.borrarObjetosDeLaLista(self.objetosConElQueElConstructorEstaColisionando())

	}

	method objetosConElQueElConstructorEstaColisionando(){
		return game.colliders(self)
	}

	method verificarQueExisteUnObjeto(){
		return game.colliders(self).size()>0
	}
	
	
	method validarObjetoPisable(unMensaje){
		if(self.verificarQueExisteUnObjeto()){
			self.elObjetoSeraPisable(unMensaje)
		}
	}
	method elObjetoSeraPisable(unMensaje){
		if(!self.verificarQueTodosLosObjetosSeanPisables()){
			
			self.errorSonido()
			self.error(unMensaje)
		}	
	}
	method errorSonido(){
		sonidoObjeto.emitirSonido("modoCreativoSonidos/errorMensaje.mp3")
		
	}
	
	method  validacionDeMetas(){
		if( self.ValidacionMetaExistente()){
			self.errorSonido()
			self.error("Ya existe una meta en esta posicion!!")
		}	
		if(self.validacionMetaYmuro()){
			self.errorSonido()
			self.error("No tiene sentido agregar una meta aqui!")
		}
	}
	method validacionPuntoDeReinicio(){
		if(self.verificarPuntoDeReinicioExistente()){
			self.errorSonido()
			self.error("no puedes agregar este objeto aqui si existe un punto de reinicio del personaje")
		}
	
	}

	method validacionMetaYmuro()=self.objetosConElQueElConstructorEstaColisionando().any({unObjeto=>unObjeto.modoCreativo_soyUnMuro()})
	
	method verificarQueTodosLosObjetosSeanPisables()=self.objetosConElQueElConstructorEstaColisionando().all({unObjeto=>unObjeto.esPisable()})
	
	method ValidacionMetaExistente()=self.objetosConElQueElConstructorEstaColisionando().any({unObjeto=>unObjeto.modoCreativo_soyMeta()})
	
	override method posicioninicial() {
		sonidoObjeto.emitirSonido("reinicio.mp3")
		self.position(posicionInicialDelConstructor.position())
	}
	method verificarPuntoDeReinicioExistente()=self.objetosConElQueElConstructorEstaColisionando().any({unObjeto=>unObjeto.modoCreativo_soyUnPuntoDeReinicio()})
	
	
	
	method reiniciar(){
		self.position(game.center())
		posicionInicialDelConstructor.position(game.center())
		if(self.banderaDeSonido2()){

		sonidoObjeto.emitirSonido("modoCreativoSonidos/x.mp3")
		}
		self.banderaDeSonido(false)
		self.eliminarObjeto()
		self.banderaDeSonido(true)
	}
	method coordenadaX()=position.x()
	method coordenadaY()=position.y()
}

