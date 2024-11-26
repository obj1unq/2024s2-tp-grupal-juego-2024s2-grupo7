import personaBase.*

import wollok.game.*

class Mueble {
  const property position = null
  const property image = null 
  
  method usarse(chef){}

  method procesarIngredientes(){} //solo la mesada procesa
  
}

class MuebleParaCocinar inherits Mueble{ //horno y mesada, la mesada procesa
  var property contenido = bandejaVacia

  override method usarse(chef){
    if(chef.tengoBandejaVacia()){
      self.validarDar(chef)
      self.dar(chef)
    } else {
      self.validarRecibir(chef)
      self.recibir(chef)
    }
  }
//validaciones:
  method validarDar(chef){
    if(self.estoyLibre()){
      self.error("no hay nada para dar")
    }
  }
  
  method validarRecibir(chef){
    if(not self.cumpleCondicionRecibir(chef)){
      self.error(self.mensajeErrorRecibir())
    }
  }

  method mensajeErrorRecibir(){
    return "no hay espacio para recibir eso"
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
    chef.recibir(contenido)
    contenido.serSostenido(chef) 
    contenido = bandejaVacia
  }

//condiciones:
  method cumpleCondicionRecibir(chef){
    return self.estoyLibre()
  }

  method estoyLibre(){
    return contenido.esVacio()
  }

  method tengoPiza(){
    return self.esPiza(contenido)
  }

  method esPiza(content){
    return content.integraIngredintes()
  }
}
