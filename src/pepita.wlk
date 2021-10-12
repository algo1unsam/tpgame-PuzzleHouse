import wollok.game.*

object jugador {
	var property position = game.at(3,3)
	var property image = "deFrente.png"
	
	
/* 
	method haciaArriba(){
		position=position.up(1)
		image="deEspalda.png"
		
		
	}
	method haciaAbajo(){
		position=position.down(1)
		image="deFrente.png"
		
	}
	method haciaIzquierda(){
		position=position.left(1)
		image="izquierda.png"
		
		
	}
	
	method haciaDerecha(){ //
		position=position.right(1)
		image="derecha.png"
		
	}
	* */
	
	
	method irHacia(direccion){
										//guardar la direccion
	direccion.mover(self)
	//pensar en la imagen
	
		
	}
	

}
object caja{
	 var property position= game.center()
	 var property image= "caja.png"
	
	 method subir(){
	 	position=position.down(1)
	 }
	
}