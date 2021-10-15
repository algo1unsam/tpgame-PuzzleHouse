import wollok.game.*
import pepita.*
import configuraciones.*
import niveles.*

object izquierda{
	method moverse(unObjeto)=unObjeto.position(unObjeto.position().left(1))	
	method dirOpuesta(unObjeto)=unObjeto.position(unObjeto.position().right(1))
		
}
object derecha{
	
	method moverse(unObjeto)=unObjeto.position(unObjeto.position().right(1))   
	method dirOpuesta(unObjeto)=unObjeto.position(unObjeto.position().left(1))
}
object abajo{
	
	method moverse(unObjeto)= unObjeto.position(unObjeto.position().down(1))  					
	method dirOpuesta(unObjeto)=unObjeto.position(unObjeto.position().up(1))
}
object arriba{
	
	method moverse(unObjeto)=unObjeto.position(unObjeto.position().up(1))   						
	method dirOpuesta(unObjeto)=unObjeto.position(unObjeto.position().down(1))
}