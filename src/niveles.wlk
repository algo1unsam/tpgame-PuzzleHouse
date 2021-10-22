import wollok.game.*
import pepita.*
import direcciones.*
import configuraciones.*
import timeline.*

class Niveles {
//const listaNiveles=[nivel1] //[nivel1,nivel2,nivel3 etc]
//method elementosPorNivel() = listaNiveles.flatMap({elementos=>elementos.listaObjetos()}) 
//method reiniciarNivel() = self.elementosPorNivel().forEach{elemn=>elemn.posicioninicial() }
	method configNivel0(){
		configuraciones.configTeclas()
		configuraciones.configColisiones()
	}
	
	method configuracionDeNivel(){
		configuraciones.configTeclas() //Si las configuraciones estan en juego.wpgm no las podemos modificar in game ,por eso las coloco aca
		configuraciones.reiniciador(self.listaObjetos())
		configuraciones.configColisiones()	
	}
	method listaObjetos()
}

object nivel0 inherits Niveles {
	
	const listaObjetos = [ jugador1 ]
	override method listaObjetos() = listaObjetos
	
	method cargarNivel(){
		configuraciones.configMusic("nivel2MoiraA.mp3")
		
		
		game.addVisual(map)
		//game.addVisual(sombra4)
		//game.addVisual(sombra3)
		//game.addVisual(sombra2)
		//game.addVisual(sombra1)
		
		
		/* Muros Invisibles */
		/* VERTICAL */
		game.addVisual( new Muro(position = game.at(0,1) ) )
		game.addVisual( new Muro(position = game.at(0,2) ) )
		game.addVisual( new Muro(position = game.at(0,3) ) )
		game.addVisual( new Muro(position = game.at(0,4) ) )
		game.addVisual( new Muro(position = game.at(6,4) ) )
		game.addVisual( new Muro(position = game.at(10,4) ) )
		game.addVisual( new Muro(position = game.at(11,3) ) )
		game.addVisual( new Muro(position = game.at(12,3) ) )
		game.addVisual( new Muro(position = game.at(13,0) ) )
		game.addVisual( new Muro(position = game.at(14,0) ) )
		game.addVisual( new Muro(position = game.at(15,0) ) )
		game.addVisual( new Muro(position = game.at(16,0) ) )
		game.addVisual( new Muro(position = game.at(17,0) ) )
		game.addVisual( new Muro(position = game.at(13,5) ) )
		game.addVisual( new Muro(position = game.at(14,5) ) )
		game.addVisual( new Muro(position = game.at(15,5) ) )
		game.addVisual( new Muro(position = game.at(16,5) ) )
		game.addVisual( new Muro(position = game.at(17,5) ) )
		game.addVisual( new Muro(position = game.at(19,5) ) )
		game.addVisual( new Muro(position = game.at(20,5) ) )
		game.addVisual( new Muro(position = game.at(21,5) ) )
		game.addVisual( new Muro(position = game.at(22,5) ) )
		game.addVisual( new Muro(position = game.at(23,5) ) )
		game.addVisual( new Muro(position = game.at(19,0) ) )
		game.addVisual( new Muro(position = game.at(20,0) ) )
		game.addVisual( new Muro(position = game.at(21,0) ) )
		game.addVisual( new Muro(position = game.at(22,0) ) )
		game.addVisual( new Muro(position = game.at(23,0) ) )
		
		/* HORIZONTAL */
		game.addVisual( new Muro(position = game.at(1,0) ) )
		game.addVisual( new Muro(position = game.at(2,0) ) )
		game.addVisual( new Muro(position = game.at(3,0) ) )
		game.addVisual( new Muro(position = game.at(4,0) ) )
		game.addVisual( new Muro(position = game.at(5,0) ) )
		game.addVisual( new Muro(position = game.at(6,1) ) )
		game.addVisual( new Muro(position = game.at(7,1) ) )
		game.addVisual( new Muro(position = game.at(8,1) ) )
		game.addVisual( new Muro(position = game.at(9,1) ) )
		game.addVisual( new Muro(position = game.at(10,1) ) )
		game.addVisual( new Muro(position = game.at(11,1) ) )
		game.addVisual( new Muro(position = game.at(12,1) ) )
		game.addVisual( new Muro(position = game.at(6,3) ) )
		game.addVisual( new Muro(position = game.at(7,4) ) )
		game.addVisual( new Muro(position = game.at(8,3) ) )
		game.addVisual( new Muro(position = game.at(9,3) ) )
		game.addVisual( new Muro(position = game.at(1,5) ) )
		game.addVisual( new Muro(position = game.at(2,5) ) )
		game.addVisual( new Muro(position = game.at(3,5) ) )
		game.addVisual( new Muro(position = game.at(4,5) ) )
		game.addVisual( new Muro(position = game.at(5,5) ) )
		game.addVisual( new Muro(position = game.at(12,4) ) )
		game.addVisual( new Muro(position = game.at(18,4) ) )
		game.addVisual( new Muro(position = game.at(18,3) ) )
		game.addVisual( new Muro(position = game.at(18,1) ) )
		game.addVisual( new Muro(position = game.at(24,4) ) )
		game.addVisual( new Muro(position = game.at(24,3) ) )
		game.addVisual( new Muro(position = game.at(24,2) ) )
		game.addVisual( new Muro(position = game.at(24,1) ) )
		
		/* Escaleras */
		game.addVisual( new Muro(position = game.at(16,4) ) )
		game.addVisual( new Muro(position = game.at(15,4) ) )
		game.addVisual( new Muro(position = game.at(14,4) ) )
		game.addVisual( new Muro(position = game.at(14,3) ) )
		game.addVisual( new Muro(position = game.at(15,3) ) )
		game.addVisual( new Muro(position = game.at(16,3) ) )
		
		self.cargaDeObjetosMovibles()
		jugador1.position(game.at(23,3))
		jugador1.posicionInicial(game.at(23,3))
				
		self.configNivel0()
		
	}
	
	method cargaDeObjetosMovibles() = listaObjetos.forEach{ unObjeto => game.addVisual(unObjeto)} 
	
}
		

object nivel1 inherits Niveles {
	const listaObjetos=[
						new Caja(position = game.at(6,3), image="caja3.png" , image_success="caja_ok2.png", tipo = 2),
						new Caja(position = game.at(6,2)),
						new Caja(position = game.at(5,3)),
						new Caja(position = game.at(6,4)),
						new Caja(position = game.at(7,3)),
						new Caja(position = game.at(9,2) , image="caja3.png", image_success="caja_ok2.png", tipo = 2),
						jugador1
	]
	
	const listaMeta= [  new Meta(position = game.at(1,5)  ),
						new Meta(position = game.at(1,1)  ),
						new Meta(position = game.at(12,5) ),
						new Meta(position = game.at(12,1) ),
					    new Meta(position = game.at(9,3)  , image="meta2.png", tipo=2 ),
					    new Meta(position = game.at(10,3) , image="meta2.png", tipo=2 )			
					]

	method posiciones() =  listaObjetos.map({elemento=>elemento.position()})
	
	method cargarNivel(){
		configuraciones.configMusic("nivel2MoiraA.mp3")
		jugador1.position(game.at(3,3))
		jugador1.posicionInicial(game.at(3,3))
				
		game.boardGround("prueba2.png")
			
		self.cargaDeObjetosMeta()
		self.cargaDeObjetosMovibles()

		/* Muros Visibles */
		game.addVisual( new MuroVisible(position = game.at(2,4) ) )
		game.addVisual( new MuroVisible(position = game.at(2,2) ) )
	
		/* Muros Invisibles */
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

