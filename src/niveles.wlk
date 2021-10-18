import wollok.game.*
import pepita.*
import direcciones.*
import configuraciones.*



object niveles {
	const listaNiveles=[nivel1] //[nivel1,nivel2,nivel3 etc]
	
	method elementosPorNivel(){
		return  listaNiveles.flatMap({elementos=>elementos.listaObjetos()}) 
	}
	
	method reiniciarNivel(){
		return self.elementosPorNivel().forEach{elemn=>elemn.posicioninicial() }
	}


}																										                                   
object nivel1 {
	const listaObjetos=[new Caja(position = game.at(6,3), image="caja_ok.png"),new Caja(position = game.at(6,2) , image="caja.png"),new Caja(position=game.at(5,3)),new Caja(position=game.at(6,4)),new Caja(position=game.at(7,3)),jugador1]
	
	method posiciones(){
		 return listaObjetos.map({elemento=>elemento.position()})
	}

	method cargarNivel(){
		game.boardGround("prueba.png")
		game.addVisual( new Meta(position = game.at(1,5)  ) )
		game.addVisual( new Meta(position = game.at(1,1)  ) )				
		game.addVisual( new Meta(position = game.at(12,5) ) )
		game.addVisual( new Meta(position = game.at(12,1) ) )
		
		self.cargaDeObjetosMovibles()
		
		//keyboard.r().onPressDo {listaObjetos.forEach{objeto=>objeto.posicioninicial()}}
		
		/* Para volver al muro anterior borarr comentario de abajo */
		//game.addVisual( new Muro(position = game.at(5,5), image="muro.png" ) )
	
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
		
		
	}
	
	method listaObjetos(){
		return listaObjetos
	}
	
	method cargaDeObjetosMovibles(){
		return listaObjetos.forEach{ unObjeto => game.addVisual(unObjeto)} 
	}
		
}