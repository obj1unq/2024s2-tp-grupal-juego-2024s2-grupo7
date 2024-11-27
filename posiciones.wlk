import personaBase.*
import chefs.*
import clientes.*

class Direccion{

	method imageOrientacion(name)

	method dondeMoverse(positionPersona, distancia)

	method moverse(persona, distancia){
		self.newImagen(persona)
		self.validarMoverse(persona, distancia)
		self.mover(persona, distancia)
	}

	method validarMoverse(persona, distancia){
		if(persona.ubicacion().hayMuebleAqui(self.dondeMoverse(persona.position(), distancia))){
			self.error("no se puede mover ahí")	
		}
	}

	method mover(persona, distancia){
		persona.position(self.dondeMoverse(persona.position(), distancia))
	}

	method newImagen(persona){
		persona.image(self.imageOrientacion(persona.name()))
	}

}

object arriba inherits Direccion {

	override method imageOrientacion(name){
		return "" + name + "_up.png" 
	}

	override method dondeMoverse(positionPersona, distancia){
		return positionPersona.up(distancia)
	}
  
}


object abajo inherits Direccion {

	override method imageOrientacion(name) {
		return "" + name + "_down.png" 
	}
	
	override method dondeMoverse(positionPersona, distancia) {
	 return positionPersona.down(distancia)
	}
}

object izquierda inherits Direccion {

	override method imageOrientacion(name) {
		return "" + name + "_left.png" 
	}

	override method dondeMoverse(positionPersona, distancia) {
	 return positionPersona.left(distancia)
	}
}

object derecha inherits Direccion {

	override method imageOrientacion(name) {
		return "" + name + "_right.png"
	}

	override method dondeMoverse(positionPersona, distancia) {
	 return positionPersona.right(distancia)
	}
}
