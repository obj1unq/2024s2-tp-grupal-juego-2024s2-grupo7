import personaBase.*

import wollok.game.*

class Mueble {
  const property position = null
  const property image = null 
  
  method usarse(chef)

  method procesar(){} //solo la mesada procesa
  
}

class MuebleParaCocinar inherits Mueble{ //horno y mesada, la mesada procesa
  var contenido = bandejaVacia

  override method usarse(chef){
    if(not chef.tengoBandejaVacia()){
      self.validarRecibir(chef)
      self.recibir(chef)
    } else {
      self.validarDar(chef)
      self.dar(chef)
    }
  }
//validaciones:
  method validarRecibir(chef){
    if(self.cumpleCondicionRecibir(chef)){
      self.error("ya hay algo en la mesada")
    }
  }

  method validarDar(chef){
    if(not self.tengoAlgo()){
      self.error("no hay nada para dar en la mesada")
    }
  }

//acciones:
  method recibir(chef){
    contenido = chef.bandeja()
    chef.soltar()
    self.accionDeRecibir()
  }

  method accionDeRecibir(){
    contenido.serDejadoAqui(self.position())
  }

  method dar(chef){
    chef.bandeja(contenido)
    contenido = bandejaVacia
  }

//condiciones:
  method cumpleCondicionRecibir(chef){
    return not self.tengoAlgo()
  }

  method tengoAlgo(){
    return not contenido.esVacio()
  }

  method tengoPiza(){
    return self.esPiza(contenido)
  }

  method esPiza(content){
    return content.integraIngredintes()
  }
}
