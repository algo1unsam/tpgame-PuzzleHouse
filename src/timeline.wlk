import wollok.game.*
import configuraciones.*
import niveles.*
import direcciones.*
import objetos.*
import jugador.*


class Imagen inherits Estatico {
	
	var property imagen = null
	var property esPisable = true
	
	method esEmpujable() = false
	method image() = imagen
	
}

class SombraInvisible inherits Estatico{

	var property esPisable = true
	method esEmpujable() = false
	
}
									
object sombra1 inherits Imagen(	esPisable = false, position = game.at(0,0), imagen = "nivel0/sombras1.png"){}

object sombra2 inherits Imagen(	esPisable = false, position = game.at(0,0), imagen = "nivel0/sombras2.png"){}

object sombra3 inherits Imagen(	esPisable = false, position = game.at(0,0), imagen = "nivel0/sombras3.png"){}

object sombra4 inherits Imagen(	esPisable = false, position = game.at(0,0), imagen = "nivel0/sombras4.png"){}

object pasadizo2 inherits Imagen ( esPisable = false, position = game.at(0,0), imagen = "nivel0/habitaciones/pasadizo2.png"){}

object pasadizo4 inherits Imagen ( esPisable = false, position = game.at(0,0), imagen = "nivel0/habitaciones/pasadizo4.png"){}

object sombraHab1 inherits Imagen(	esPisable = false, position = game.at(0,0), imagen = "nivel0/habitaciones/sombraHab1.png"){}

object sombraHab2 inherits Imagen(	esPisable = false, position = game.at(0,0), imagen = "nivel0/habitaciones/sombraHab2.png"){}

object gameover inherits Imagen( esPisable = false, position = game.at(0,0), imagen = "nivel0/gameover.png"){}

object pasadizo1Dream inherits Imagen ( esPisable = false, position = game.at(0,0), imagen = "nivel0/habitaciones/pasadizo1Dream.png"){}
object sombraHab1Dream inherits Imagen(	esPisable = false, position = game.at(0,0), imagen = "nivel0/habitaciones/sombraHab1Dream.png"){}

object pasadizo2Dream inherits Imagen ( esPisable = false, position = game.at(0,0), imagen = "nivel0/habitaciones/pasadizo2Dream.png"){}
object sombraHab2Dream inherits Imagen(	esPisable = false, position = game.at(0,0), imagen = "nivel0/habitaciones/sombraHab2Dream.png"){}

object pasadizo3Dream inherits Imagen ( esPisable = false, position = game.at(0,0), imagen = "nivel0/habitaciones/pasadizo3Dream.png"){}
object sombraHab3Dream inherits Imagen(	esPisable = false, position = game.at(0,0), imagen = "nivel0/habitaciones/sombraHab3Dream.png"){}

class CheckpointDeSombras inherits Estatico{

	var property esPisable = true
	var property seAtraveso=false
	const sombraDeReferencia=sombra1
	override method hacerAlgo(direccion){
		if(!seAtraveso){
			game.removeVisual(sombraDeReferencia)
			seAtraveso=true
		}
	}
	method agregarSombra(){
		game.addVisual(sombraDeReferencia)
	}

}


