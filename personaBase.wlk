import posiciones.*
import mapaObjetos.*

import wollok.game.*

class Persona {
    var property orientacion = abajo //en donde está mirando, property para los tests
    var property position = game.at(0,0) 
    var property image = "Remy_down.png"  //por default
    const property ubicacion = restaurante1
    const name = "Remy"  //por default

    method mover(direccion) {
      orientacion = direccion
      orientacion.moverse(self)
	}

    method dondeApunta() { 
    return orientacion.dondeMoverse(self.position())
  }

    method name(){
      return name
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