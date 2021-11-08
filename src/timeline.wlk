import wollok.game.*
import configuraciones.*
import niveles.*
import direcciones.*
import objetos.*
import jugador.*


class Imagen {
	var property position = game.at(0,0)
	var property imagen = null
	var property esPisable = true
	

	
	
	method esEmpujable() = false
	method image() = imagen
	method hacerAlgo(direccion){
		
	}
}

class SombraInvisible{
	var property position
	var property esPisable = true
	method esEmpujable() = false
	
	method hacerAlgo(direccion){
		
	}
}

//object map inherits Imagen(	position = game.at(0,0), imagen = "nivel0/map.png"	){}
object mapR inherits Imagen(	position = game.at(0,0), imagen = "nivel0/mapR.png"	){}
									
object sombra1 inherits Imagen(	esPisable = false, position = game.at(0,0), imagen = "nivel0/sombras1.png"){}

object sombra2 inherits Imagen(	esPisable = false, position = game.at(0,0), imagen = "nivel0/sombras2.png"){}

object sombra3 inherits Imagen(	esPisable = false, position = game.at(0,0), imagen = "nivel0/sombras3.png"){}

object sombra4 inherits Imagen(	esPisable = false, position = game.at(0,0), imagen = "nivel0/sombras4.png"){}

object pasadizo0 inherits Imagen ( esPisable = false, position = game.at(0,0), imagen = "nivel0/pasadizo/pasadizo0.png"){}

object pasadizo2 inherits Imagen ( esPisable = false, position = game.at(0,0), imagen = "nivel0/pasadizo/pasadizo2.png"){}

object pasadizo3 inherits Imagen ( esPisable = false, position = game.at(0,0), imagen = "nivel0/pasadizo/pasadizo3.png"){}

object pasadizo4 inherits Imagen ( esPisable = false, position = game.at(0,0), imagen = "nivel0/pasadizo/pasadizo4.png"){}

object pasadizo5 inherits Imagen ( esPisable = false, position = game.at(0,0), imagen = "nivel0/pasadizo/pasadizo5.png"){}

object sombraHab1 inherits Imagen(	esPisable = false, position = game.at(0,0), imagen = "nivel0/habitaciones/sombraHab1.png"){}

object sombraHab2 inherits Imagen(	esPisable = false, position = game.at(0,0), imagen = "nivel0/habitaciones/sombraHab2.png"){}

object sombraInv1 inherits SombraInvisible( position = game.at(6,2)){}

object sombraInv2 inherits SombraInvisible( position = game.at(12,2)){}

object sombraInv3 inherits SombraInvisible( position = game.at(18,2 )){}

object pasadizoInv2 inherits SombraInvisible ( position = game.at(7, 3)){}

object pasadizoInv4 inherits SombraInvisible ( position = game.at(10,3)){}

object sombraHabInv1 inherits SombraInvisible ( position = game.at(7,5)){}

object sombraHabInv2 inherits SombraInvisible ( position = game.at(10,5)){}


class CheckpointDeSombras{

	var property position = game.at(6,2)
	
	var property esPisable = true
	var property seAtraveso=false
	const sombraDeReferencia=sombra1
	
	method hacerAlgo(direccion){
		if(!seAtraveso){
			game.removeVisual(sombraDeReferencia)
			seAtraveso=true
		}
	
	}
	method agregarSombra(){
		game.addVisual(sombraDeReferencia)
	}

}
