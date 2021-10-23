import wollok.game.*
import pepita.*
import direcciones.*
import configuraciones.*
import timeline.*

class Niveles {
//const listaNiveles=[nivel1] //[nivel1,nivel2,nivel3 etc]
//method elementosPorNivel() = listaNiveles.flatMap({elementos=>elementos.listaObjetos()}) 
//method reiniciarNivel() = self.elementosPorNivel().forEach{elemn=>elemn.posicioninicial() }
	method configNivel0(personaje1){
		configuraciones.configTeclas(personaje1)
		configuraciones.configColisiones(personaje1)
	}
	
	method configNivel1(personaje1){
		configuraciones.configTeclas(personaje1) //Si las configuraciones estan en juego.wpgm no las podemos modificar in game ,por eso las coloco aca
		configuraciones.reiniciador(self.listaObjetos())
		configuraciones.configColisiones(personaje1)	
	}
	method listaObjetos()
}

object nivel0 inherits Niveles {
	const jugador1 = new Jugador(position = game.at(22, 1) , nombreJugador = "jugador1", nivel= 0)
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
		self.configNivel0(jugador1)
		jugador1.posicionInicial(game.at(22,1))
		
		/* ESPOSA */
		const jugadora1 = new Jugador(position = game.at(23, 4) , nombreJugador = "jugadora1", nivel= 0)
		game.addVisual(jugadora1)
		
	}
	
	method cargaDeObjetosMovibles() = listaObjetos.forEach{ unObjeto => game.addVisual(unObjeto)} 
	
}
		

object nivel1 inherits Niveles {
	const jugador1 = new Jugador(position = game.at(2, 1) , nombreJugador = "jugador1", nivel= 1)
	
	const listaCajas=[
						new Caja(position = game.at(16,5), image="nivel1/caja2.png" , image_success="nivel1/caja_ok2.png", tipo = 2),
						new Caja(position = game.at(12,7)),
						new Caja(position = game.at(10,5)),
						new Caja(position = game.at(12,3)),
						new Caja(position = game.at(14,5)),
						new Caja(position = game.at(18,5) , image="nivel1/caja2.png", image_success="nivel1/caja_ok2.png", tipo = 2)
	]
	
	const listaMeta= [  new Meta(position = game.at(2,9)  ),
						new Meta(position = game.at(2,1)  ),
						new Meta(position = game.at(22,9) ),
						new Meta(position = game.at(22,1) ),
					    new Meta(position = game.at(16,3)  , image="nivel1/meta2.png", tipo=2 ),
					    new Meta(position = game.at(18,3) , image="nivel1/meta2.png", tipo=2 )			
					]

	method posiciones() =  listaCajas.map({elemento=>elemento.position()})
	
	method cargarNivel(){
		configuraciones.configMusic("nivel2MoiraA.mp3")
				
		game.boardGround("nivel1/scene-lv1.png")
			
		self.cargaDeObjetosMeta()
		
		/* JUGADOR 1 */
		jugador1.posicionInicial(game.at(2,1))
		game.addVisual(jugador1)
		
		self.cargaDeObjetosMovibles()

		/* Muros Visibles */
		game.addVisual( new MuroVisible(position = game.at(4,7) ) )
		game.addVisual( new MuroVisible(position = game.at(4,3) ) )
	
		/* Muros Invisibles */
		/* VERTICAL */
		game.addVisual( new Muro(position = game.at(0,1) ) )
		game.addVisual( new Muro(position = game.at(0,3) ) )
		game.addVisual( new Muro(position = game.at(0,5) ) )
		game.addVisual( new Muro(position = game.at(0,7) ) )
		game.addVisual( new Muro(position = game.at(0,9) ) )
		
		game.addVisual( new Muro(position = game.at(24,9) ) )
		game.addVisual( new Muro(position = game.at(24,7) ) )
		game.addVisual( new Muro(position = game.at(24,5) ) )
		game.addVisual( new Muro(position = game.at(24,1) ) )
		
		/* HORIZONTAL */
		game.addVisual( new Muro(position = game.at(2,11) ) )
		game.addVisual( new Muro(position = game.at(4,11) ) )
		game.addVisual( new Muro(position = game.at(6,11) ) )
		game.addVisual( new Muro(position = game.at(8,11) ) )
		game.addVisual( new Muro(position = game.at(10,11) ) )
		game.addVisual( new Muro(position = game.at(12,11) ) )
		game.addVisual( new Muro(position = game.at(14,11) ) )
		game.addVisual( new Muro(position = game.at(16,11) ) )
		game.addVisual( new Muro(position = game.at(18,11) ) )
		game.addVisual( new Muro(position = game.at(20,11) ) )
		game.addVisual( new Muro(position = game.at(22,11) ) )
		
		game.addVisual( new Muro(position = game.at(2,-1) ) )
		game.addVisual( new Muro(position = game.at(4,-1) ) )
		game.addVisual( new Muro(position = game.at(6,-1) ) )
		game.addVisual( new Muro(position = game.at(8,-1) ) )
		game.addVisual( new Muro(position = game.at(10,-1) ) )
		game.addVisual( new Muro(position = game.at(12,-1) ) )
		game.addVisual( new Muro(position = game.at(14,-1) ) )
		game.addVisual( new Muro(position = game.at(16,-1) ) )
		game.addVisual( new Muro(position = game.at(18,-1) ) )
		game.addVisual( new Muro(position = game.at(20,-1) ) )
		game.addVisual( new Muro(position = game.at(22,-1) ) )

		
		self.configNivel1(jugador1)
	}
	
	/* Elimine a jugador1 de la listaObjetos, pienso que ahora sera mas facil usar all u otro metodo
	 * para el tema de saber si completo el puzzle
	 */
	method cargaDeObjetosMovibles() = listaCajas.forEach{ unObjeto => game.addVisual(unObjeto)} 

	method cargaDeObjetosMeta() = listaMeta.forEach{ unaMeta => game.addVisual( unaMeta )}
	
	override method listaObjetos() = listaCajas
	
	method listaMeta() = listaMeta
}

