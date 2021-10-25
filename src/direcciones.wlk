import wollok.game.*
import pepita.*
//import configuraciones.*
//import niveles.*

object izquierda{
	method moverse(unObjeto, nivel) = unObjeto.position().left(nivel.velocidadDefecto())
	method dirOpuesto(unObjeto, nivel) = unObjeto.position().right(nivel.velocidadDefecto())
}
object derecha{
	method moverse(unObjeto, nivel) = unObjeto.position().right(nivel.velocidadDefecto())
	method dirOpuesto(unObjeto, nivel) = unObjeto.position().left(nivel.velocidadDefecto())
}
object abajo{
	method moverse(unObjeto, nivel) = unObjeto.position().down(nivel.velocidadDefecto())
	method dirOpuesto(unObjeto, nivel) = unObjeto.position().up(nivel.velocidadDefecto())
}
object arriba{	
	method moverse(unObjeto, nivel) = unObjeto.position().up(nivel.velocidadDefecto())
	method dirOpuesto(unObjeto, nivel) = unObjeto.position().down(nivel.velocidadDefecto())
}