import posiciones.*
import mapaObjetos.*

import wollok.game.*

class Persona {
    var property orientacion = abajo //en donde está mirando, property para los tests
    var property position = game.at(0,0) 
    var property image = "Remy_down.png"  //por default
    var ubicacion = restaurante1
    const name = "Remy"  //por default
    var velocidad = 1 

    method ubicacion() {
      return ubicacion
    }

    method mover(direccion) {
      orientacion = direccion
      orientacion.moverse(self, velocidad)
	  }

    method dondeApunta() { 
    return orientacion.dondeMoverse(self.position(), velocidad)
    }

    method name(){
      return name
    }

    method cambiarModo(){ //corre -> camina / camina -> corre
      velocidad =
      if(velocidad == 1) self.velocidadMaxima() else 1
    }
    
    method velocidadMaxima() {
      return 5
    }

}

object bandejaVacia {
  
  method esVacio(){
    return true
  }
  method integraIngredintes(){ 
    return false
  }

  method precio(){ return 0 }
}
