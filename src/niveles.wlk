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
	const listaObjetos=[new Caja(position = game.at(5,2), image="caja_ok.png"),new Caja(position = game.at(7,2) , image="caja.png"),new Caja(position=game.at(3,2)),jugador1]
	
	method posiciones(){
		 return listaObjetos.map({elemento=>elemento.position()})
	}

	method cargarNivel(){
		game.boardGround("prueba.png")
		game.addVisual( new Meta(position = game.at(3,8)  ) )
		game.addVisual( new Meta(position = game.at(5,8) ,image ="metav.png" ) )				
		game.addVisual( new Meta(position = game.at(7,8) ) )
		
		
		self.cargaDeObjetosMovibles()
		
		keyboard.r().onPressDo {listaObjetos.forEach{objeto=>objeto.posicioninicial()}}
		
		/* Para volver al muro anterior borarr comentario de abajo */
		//game.addVisual( new Muro(position = game.at(5,5), image="muro.png" ) )
	
		/* Muros invisibles */
		/* VERTICAL */
		game.addVisual( new Muro(position = game.at(0,11) ) )
		game.addVisual( new Muro(position = game.at(0,10) ) )
		game.addVisual( new Muro(position = game.at(0,9) ) )
		game.addVisual( new Muro(position = game.at(0,8) ) )
		game.addVisual( new Muro(position = game.at(0,7) ) )
		game.addVisual( new Muro(position = game.at(0,6) ) )
		game.addVisual( new Muro(position = game.at(0,5) ) )
		game.addVisual( new Muro(position = game.at(0,4) ) )
		game.addVisual( new Muro(position = game.at(0,3) ) )
		game.addVisual( new Muro(position = game.at(0,2) ) )
		game.addVisual( new Muro(position = game.at(0,1) ) )
		
		game.addVisual( new Muro(position = game.at(10,1) ) )
		game.addVisual( new Muro(position = game.at(10,2) ) )
		game.addVisual( new Muro(position = game.at(10,3) ) )
		game.addVisual( new Muro(position = game.at(10,4) ) )
		game.addVisual( new Muro(position = game.at(10,5) ) )
		game.addVisual( new Muro(position = game.at(10,6) ) )
		game.addVisual( new Muro(position = game.at(10,7) ) )
		game.addVisual( new Muro(position = game.at(10,8) ) )
		game.addVisual( new Muro(position = game.at(10,9) ) )
		
		game.addVisual( new Muro(position = game.at(6,3) ) )
		game.addVisual( new Muro(position = game.at(6,4) ) )
		game.addVisual( new Muro(position = game.at(6,5) ) )
		
		
		game.addVisual( new Muro(position = game.at(4,3) ) )
		game.addVisual( new Muro(position = game.at(4,4) ) )
		game.addVisual( new Muro(position = game.at(4,5) ) )
		
		game.addVisual( new Muro(position = game.at(4,3) ) )
		game.addVisual( new Muro(position = game.at(4,4) ) )
		game.addVisual( new Muro(position = game.at(4,5) ) )
		
		game.addVisual( new Muro(position = game.at(2,2) ) )
		game.addVisual( new Muro(position = game.at(2,3) ) )
		game.addVisual( new Muro(position = game.at(2,4) ) )
		game.addVisual( new Muro(position = game.at(2,5) ) )
		
		
		
		
		
		
		
		
		/* HORIZONTAL */
		game.addVisual( new Muro(position = game.at(0,0) ) )
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
		
		game.addVisual( new Muro(position = game.at(1,9) ) )
		game.addVisual( new Muro(position = game.at(2,9) ) )
		game.addVisual( new Muro(position = game.at(3,9) ) )
		game.addVisual( new Muro(position = game.at(4,9) ) )
		game.addVisual( new Muro(position = game.at(5,9) ) )
		game.addVisual( new Muro(position = game.at(6,9) ) )
		game.addVisual( new Muro(position = game.at(7,9) ) )
		game.addVisual( new Muro(position = game.at(8,9) ) )
		game.addVisual( new Muro(position = game.at(9,9) ) )
		game.addVisual( new Muro(position = game.at(10,9) ) )
		game.addVisual( new Muro(position = game.at(11,9) ) )
		game.addVisual( new Muro(position = game.at(12,9) ) )
		
		
		game.addVisual( new Muro(position = game.at(2,7) ) )
		game.addVisual( new Muro(position = game.at(4,7) ) )
		game.addVisual( new Muro(position = game.at(5,7) ) )
		game.addVisual( new Muro(position = game.at(6,7) ) )
		game.addVisual( new Muro(position = game.at(8,7) ) )
		
		game.addVisual( new Muro(position = game.at(8,5) ) )
		game.addVisual( new Muro(position = game.at(8,4) ) )
		game.addVisual( new Muro(position = game.at(8,3) ) )
		game.addVisual( new Muro(position = game.at(8,2) ) )
		
		
		
		
	}
	
	method listaObjetos(){
		return listaObjetos
	}
	
	method cargaDeObjetosMovibles(){
		return listaObjetos.forEach{ unObjeto => game.addVisual(unObjeto)} 
	}
		
}
