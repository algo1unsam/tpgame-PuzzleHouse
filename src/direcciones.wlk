import wollok.game.*
import jugador.*
import objetos.*
import objetosDelModoCreativo.*

object izquierda{
	
	method moverse(unObjeto) = unObjeto.position().left(duplicaDireccion.direccionDuplicador()) //
	method dirOpuesto(unObjeto) = unObjeto.position().right(duplicaDireccion.direccionDuplicador())

}
object derecha{
	
	method moverse(unObjeto) = unObjeto.position().right(duplicaDireccion.direccionDuplicador())
	method dirOpuesto(unObjeto) = unObjeto.position().left(duplicaDireccion.direccionDuplicador())
	
}
object abajo{
	
	method moverse(unObjeto) = unObjeto.position().down(duplicaDireccion.direccionDuplicador())
	method dirOpuesto(unObjeto) = unObjeto.position().up(duplicaDireccion.direccionDuplicador())

}
object arriba{	
	
	method moverse(unObjeto) = unObjeto.position().up(duplicaDireccion.direccionDuplicador())
	method dirOpuesto(unObjeto) = unObjeto.position().down(duplicaDireccion.direccionDuplicador())
	
} 

object duplicaDireccion{
	var property direccionDuplicador = 1 

}

