import wollok.game.*
import pepita.*
//import configuraciones.*
//import niveles.*

object izquierda{
	method moverse(unObjeto)=unObjeto.position().left(2)
	method dirOpuesto(unObjeto)=unObjeto.position().right(2)
}
object derecha{
	method moverse(unObjeto)=unObjeto.position().right(2) 
	method dirOpuesto(unObjeto)=unObjeto.position().left(2)
}
object abajo{
	method moverse(unObjeto)=unObjeto.position().down(2)
	method dirOpuesto(unObjeto)=unObjeto.position().up(2) 					
}
object arriba{	
	method moverse(unObjeto)=unObjeto.position().up(2) 
	method dirOpuesto(unObjeto)=unObjeto.position().down(2) 					
	
}