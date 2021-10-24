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
									
object sombra1 inherits Imagen(	esAtravesable = false, position = game.at(0,0), imagen = "nivel0/sombras1.png"){}

object sombra2 inherits Imagen(	esAtravesable = false, position = game.at(0,0), imagen = "nivel0/sombras2.png"){}

object sombra3 inherits Imagen(	esAtravesable = false, position = game.at(0,0), imagen = "nivel0/sombras3.png"){}

object sombra4 inherits Imagen(	esAtravesable = false, position = game.at(0,0), imagen = "nivel0/sombras4.png"){}

object pasadizo0 inherits Imagen ( esAtravesable = false, position = game.at(0,0), imagen = "nivel0/pasadizo/pasadizo0.png"){}

object pasadizo2 inherits Imagen ( esAtravesable = false, position = game.at(0,0), imagen = "nivel0/pasadizo/pasadizo2.png"){}

object pasadizo3 inherits Imagen ( esAtravesable = false, position = game.at(0,0), imagen = "nivel0/pasadizo/pasadizo3.png"){}

object pasadizo4 inherits Imagen ( esAtravesable = false, position = game.at(0,0), imagen = "nivel0/pasadizo/pasadizo4.png"){}

object pasadizo5 inherits Imagen ( esAtravesable = false, position = game.at(0,0), imagen = "nivel0/pasadizo/pasadizo5.png"){}

object sombra5 inherits Imagen(	esAtravesable = false, position = game.at(0,0), imagen = "nivel0/habitaciones/sombras5.png"){}

object sombraHab1 inherits Imagen(	esAtravesable = false, position = game.at(0,0), imagen = "nivel0/habitaciones/sombraHab1.png"){}

object sombraHab2 inherits Imagen(	esAtravesable = false, position = game.at(0,0), imagen = "nivel0/habitaciones/sombraHab2.png"){}

object hab1 inherits Imagen(	esAtravesable = false, position = game.at(0,0), imagen = "nivel0/habitaciones/Hab1.png"){}

object hab2 inherits Imagen(	esAtravesable = false, position = game.at(0,0), imagen = "nivel0/habitaciones/Hab2.png"){}
