import personaBase.*
import posiciones.*

import wollok.game.*

class Chef inherits Persona {
    var property bandeja = bandejaVacia

  method tengoBandejaVacia() {
    return bandeja.esVacio()
  }

  method llevoAlgo(){
    return not self.tengoBandejaVacia()
  }

   method interactuar() {
        self.validarMueble() 
        const mueble = ubicacion.muebleAqui(self.dondeApunta())
      
        mueble.usarse(self)
    }

    method validarMueble(){
      if(not ubicacion.hayMuebleAqui(self.dondeApunta())){
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
     const mueble = ubicacion.muebleAqui(self.dondeApunta())

     mueble.procesarIngredientes()
    }
//PROBAR: -> esto se podría cambiar para preguntarle al admin de clientes
    method preguntarPedido() {
    self.validarPreguntarPedido()
    ubicacion.clienteAqui(self.dondeApunta()).decirPedido()
  }

  method validarPreguntarPedido(){
    if(not ubicacion.hayClienteAqui(self.dondeApunta())){ 
      self.error("no hay ningun cliente aqui")
    }
  }
}
