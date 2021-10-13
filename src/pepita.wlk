import wollok.game.*

class Direccion{
	var property nombre
	method posicion(posicion)
	method orientacion(personaje, posicion){
		personaje.orientacion(self)
	}
}

class Imagen{
	var property position = game.at(0,0)
	var property imagen = null
	method image() = imagen
}

class Individuo inherits Imagen{
	var property orientacion = abajo
	
	method moverse(direccion){		
		const nuevaPosicion = direccion.posicion(self.position())
		self.orientacion(direccion)
		self.position(nuevaPosicion)
	}
	
		method alPresionarUp(){
		self.moverse(arriba)
	}
	
	method alPresionarDown(){
		self.moverse(abajo)
	}
	
	method alPresionarRight(){
		self.moverse(derecha)
	}
	
	method alPresionarLeft(){
		self.moverse(izquierda)
	}
}

object arriba inherits Direccion(nombre = "arriba"){
	override method posicion(posicion) = posicion.up(1)
}

object abajo inherits Direccion(nombre= "abajo"){
	override method posicion(posicion) = posicion.down(1)
}

object derecha inherits Direccion(nombre = "derecha"){
	override method posicion(posicion) = posicion.right(1)
}

object izquierda inherits Direccion(nombre = "izquierda"){
	override method posicion(posicion) = posicion.left(1)
}


object jugador inherits Individuo( position = game.at(3,3)){
	
	method image(){
		return "de" + orientacion.nombre() +  ".png"
	}
	
}


object caja{
	 var property position= game.center()
	 var property image= "caja.png"
	
	 method subir(){
	 	position=position.down(1)
	 }
	
}