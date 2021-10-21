import wollok.game.*
import pepita.*
import direcciones.*
import configuraciones.*

class Niveles {
//const listaNiveles=[nivel1] //[nivel1,nivel2,nivel3 etc]
//method elementosPorNivel() = listaNiveles.flatMap({elementos=>elementos.listaObjetos()}) 
//method reiniciarNivel() = self.elementosPorNivel().forEach{elemn=>elemn.posicioninicial() }
	
	method configuracionDeNivel(){
		configuraciones.configTeclas() //Si las configuraciones estan en juego.wpgm no las podemos modificar in game ,por eso las coloco aca
		configuraciones.reiniciador(self.listaObjetos())
		configuraciones.configColisiones()	
	}
	method listaObjetos()
}		

object nivel1 inherits Niveles {
	const listaObjetos=[
						new Caja(position = game.at(6,3), image="caja_ok.png"),
						new Caja(position = game.at(6,2) , image="caja.png"),
						new Caja(position=game.at(5,3)),
						new Caja(position=game.at(6,4)),
						new Caja(position=game.at(7,3)),
						new Caja(position = game.at(9,2), image="caja_ok.png"),
						jugador1
	]
	const listaMeta= [  new Meta(position = game.at(1,5)   ),
						new Meta(position = game.at(1,1)  ),
						new Meta(position = game.at(12,5) ),
						new Meta(position = game.at(12,1) ),
					    new Meta(position = game.at(9,3) , image="metav.png" ),
					    new Meta(position = game.at(10,3) , image="metav.png" )			
					]

	method posiciones() =  listaObjetos.map({elemento=>elemento.position()})
	
	method cargarNivel(){


		configuraciones.configMusic("nivel2MoiraA.mp3")
		jugador1.position(game.at(3,3))
		jugador1.posicionInicial(game.at(3,3))
		
		
		game.boardGround("prueba.png")
		
		
		self.cargaDeObjetosMeta()
		self.cargaDeObjetosMovibles()

		
		/* Para volver al muro anterior borarr comentario de abajo */
		//game.addVisual( new Muro(position = game.at(5,5), image="muro.png" ) )
		game.addVisual( new MuroVisible(position = game.at(2,4) ) )
		game.addVisual( new MuroVisible(position = game.at(2,2) ) )
	
	
		/* Muros invisibles */
		/* VERTICAL */
		game.addVisual( new Muro(position = game.at(0,5) ) )
		game.addVisual( new Muro(position = game.at(0,4) ) )
		game.addVisual( new Muro(position = game.at(0,3) ) )
		game.addVisual( new Muro(position = game.at(0,2) ) )
		game.addVisual( new Muro(position = game.at(0,1) ) )
		
		game.addVisual( new Muro(position = game.at(13,1) ) )
		game.addVisual( new Muro(position = game.at(13,4) ) )
		game.addVisual( new Muro(position = game.at(13,5) ) )	
		
		/* HORIZONTAL */
		game.addVisual( new Muro(position = game.at(1,0) ) )
		game.addVisual( new Muro(position = game.at(2,0) ) )
		game.addVisual( new Muro(position = game.at(3,0) ) )
		game.addVisual( new Muro(position = game.at(4,0) ) )
		game.addVisual( new Muro(position = game.at(5,0) ) )
		game.addVisual( new Muro(position = game.at(6,0) ) )
		game.addVisual( new Muro(position = game.at(7,0) ) )
		game.addVisual( new Muro(position = game.at(8,0) ) )
		game.addVisual( new Muro(position = game.at(9,0) ) )
		game.addVisual( new Muro(position = game.at(10,0) ) )
		game.addVisual( new Muro(position = game.at(11,0) ) )
		game.addVisual( new Muro(position = game.at(12,0) ) )
		
		game.addVisual( new Muro(position = game.at(1,6) ) )
		game.addVisual( new Muro(position = game.at(2,6) ) )
		game.addVisual( new Muro(position = game.at(3,6) ) )
		game.addVisual( new Muro(position = game.at(4,6) ) )
		game.addVisual( new Muro(position = game.at(5,6) ) )
		game.addVisual( new Muro(position = game.at(6,6) ) )
		game.addVisual( new Muro(position = game.at(7,6) ) )
		game.addVisual( new Muro(position = game.at(8,6) ) )
		game.addVisual( new Muro(position = game.at(9,6) ) )
		game.addVisual( new Muro(position = game.at(10,6) ) )
		game.addVisual( new Muro(position = game.at(11,6) ) )
		game.addVisual( new Muro(position = game.at(12,6) ) )
		
		self.configuracionDeNivel()
	
	}

	method cargaDeObjetosMovibles() = listaObjetos.forEach{ unObjeto => game.addVisual(unObjeto)} 

	method cargaDeObjetosMeta() = listaMeta.forEach{ unaMeta => game.addVisual( unaMeta )}
	
	override method listaObjetos() = listaObjetos
	
	method listaMeta() = listaMeta
}

