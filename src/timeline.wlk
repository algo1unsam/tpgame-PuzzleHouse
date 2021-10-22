import wollok.game.*
import pepita.*
import configuraciones.*
import niveles.*
import direcciones.*

class Imagen {
	var property position = game.at(0,0)
	var property imagen = null
	var property esAtravesable = true
	
	method esEmpujable() = false
	method image() = imagen
}

object map inherits Imagen(	position = game.at(0,0), imagen = "nivel0/map.png"	){}
									
object sombra1 inherits Imagen(	esAtravesable = false, position = game.at(0,0), imagen = "nivel0/sombra1.png"){}

object sombra2 inherits Imagen(	esAtravesable = false, position = game.at(0,0), imagen = "nivel0/sombra2.png"){}

object sombra3 inherits Imagen(	esAtravesable = false, position = game.at(0,0), imagen = "nivel0/sombra3.png"){}

object sombra4 inherits Imagen(	esAtravesable = false, position = game.at(0,0), imagen = "nivel0/sombra4.png"){}

