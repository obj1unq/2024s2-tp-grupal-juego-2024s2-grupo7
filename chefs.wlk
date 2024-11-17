import posiciones.*
import restaurante.*
import objetosParaTests.*

import wollok.game.*

/*
NOTA:
  *falta como hacer que lo que este en bandeja la imagen aparezca en frente del chef, sino lo que se podría hacer que es más trabajo creo era lo de una imagen para cada cosa que puede sostener, eso también haría que ver como implementarlo
*/


class Persona {
    var property orientacion = abajo //en donde está mirando
    var property position = game.at(0,0) //la posicion es placeholder por ahora -> cambiar para el juego
    var property image = "" 
    //const property ubicacion = restaurante -> preguntar si conviene más guardarlo en variable o tener referencia global
    const nombre = null //para los clientes sería tipo cliente, para el chef tenemos nombre jaja

    method mover(direccion) {
      orientacion = direccion //es importante que primero cambie a donde mira y su imagen de mirar, después se mueva o no
      self.nuevaImagen()

      const nuevaPosition = direccion.moverse(self.position())

      self.validarMoverseHacia(nuevaPosition)
      position = nuevaPosition
	}

  method validarMoverseHacia(_position){
    if(restaurante.hayMuebleAqui(_position)){
      self.error("no me puedo mover ahí")
    }
  }

  method nuevaImagen(){
    image = orientacion.imagen(nombre)
  }

    method dondeApunta() { 
    return orientacion.moverse(self.position())
  }

  method nombre(){
    return nombre
  }


}

class Chef inherits Persona {
    var property bandeja = bandejaVacia

     method tengoBandejaVacia() {
    return bandeja.esVacio()
  }

   method interactuar() {
        self.validarMueble() 
        const mueble = restaurante.muebleAqui(self.dondeApunta())
      
        mueble.usarse(self)
    }

    method validarMueble(){
      if(not restaurante.hayMuebleAqui(remy.dondeApunta())){
        self.error("no hay ningun mueble aqui para hacer lo que quiero hacer")
      }
    }

    method soltar(){
      bandeja = bandejaVacia //la bandeja representa el no tener nada
    }

    method recibir(ingrediente) {
      bandeja = ingrediente
    }

    method procesar(){
     self.validarMueble()
     const mueble = restaurante.muebleAqui(self.dondeApunta())

     mueble.procesarIngredientes()
    }

   

//probar: -> se necesitan los clientes
  method preguntarPedido() {
    self.validarPreguntarPedido()
    restaurante.clienteAqui(self.dondeApunta()).decirPedido()
  }

  method validarPreguntarPedido(){
    if(not restaurante.hayClienteAqui(self.dondeApunta())){ 
      self.error("no hay ningun cliente aqui")
    }
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
