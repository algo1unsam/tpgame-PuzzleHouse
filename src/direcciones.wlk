import wollok.game.*
import pepita.*
//import configuraciones.*
//import niveles.*

object izquierda{
	/* Se agrego el mismo metodo, pero pasandole el nivel 
	 * por parametro en el que se encuentra al jugador para saber cuanto tiene avanzar el personaje */
	 
	method moverse(unObjeto, nivel) = if( nivel == 1 ) unObjeto.position().left(2) else unObjeto.position().left(1) 
	method dirOpuesto(unObjeto, nivel) = if ( nivel == 1 ) unObjeto.position().right(2) else unObjeto.position().right(1)
	
	method moverse(unObjeto) = unObjeto.position().left(2)
	method dirOpuesto(unObjeto) = unObjeto.position().right(2)
}
object derecha{
	method moverse(unObjeto, nivel) = if( nivel == 1 ) unObjeto.position().right(2) else unObjeto.position().right(1)
	method dirOpuesto(unObjeto, nivel) = if ( nivel == 1) unObjeto.position().left(2) else unObjeto.position().left(1)
	
	method moverse(unObjeto) = unObjeto.position().right(2)
	method dirOpuesto(unObjeto) = unObjeto.position().left(2)
}
object abajo{
	method moverse(unObjeto, nivel) = if (nivel == 1 ) unObjeto.position().down(2) else unObjeto.position().down(1)
	method dirOpuesto(unObjeto, nivel) = if ( nivel == 1 ) unObjeto.position().up(2) else unObjeto.position().up(1) 
	
	method moverse(unObjeto) = unObjeto.position().down(2)
	method dirOpuesto(unObjeto) = unObjeto.position().up(2)
}
object arriba{	
	method moverse(unObjeto, nivel) = if ( nivel == 1 ) unObjeto.position().up(2) else unObjeto.position().up(1)
	method dirOpuesto(unObjeto, nivel) = if ( nivel == 1) unObjeto.position().down(2) else unObjeto.position().down(1) 
	
	method moverse(unObjeto) = unObjeto.position().up(2)	
	method dirOpuesto(unObjeto) = unObjeto.position().down(2)	
}