import posiciones.*

import wollok.game.*

class Persona {
    var property orientacion = abajo //en donde está mirando, property para los tests
    var property position = game.at(0,0) 
    var property image = "" 
    const ubicacion = null
    const nombre = null 

    method mover(direccion) {
      orientacion = direccion
      self.nuevaImagen()

      const nuevaPosition = direccion.moverse(self.position())

      self.validarMoverseHacia(nuevaPosition)
      position = nuevaPosition
	}

  method validarMoverseHacia(_position){
    if(ubicacion.hayMuebleAqui(_position)){
      self.error("no me puedo mover ahí")
    }
  }

  method nuevaImagen(){
    image = orientacion.imagen(nombre)
  }

    method dondeApunta() { 
    return orientacion.moverse(self.position())
  }

}

object bandejaVacia {
  
  method esVacio(){
    return true
  }
  method integraIngredintes(){ 
    return false
  }
}