import mueblesBase.*
import personaBase.*
import comestibles.*
import ingredientesBase.*

import wollok.game.*

class Mesada inherits MuebleParaCocinar(image ="mesada_ph.png") {

  override method cumpleCondicionRecibir(chef){ //o esta vacio o tiene una pizza
    return super(chef) || self.tengoPiza()
  }

  override method recibir(chef){
    if(self.tengoPiza()){
      contenido.recibirIngrediente(chef.bandeja())
    } else {
      super(chef)
    }
  }

  override method procesar(){
    self.validarProcesar()
    contenido.serProcesado()
  }

  method validarProcesar(){
    if(not self.tieneIngrediente()){
      self.error("no hay ingrediente que procesar")
    }
  }

  method tieneIngrediente(){
    return self.tengoAlgo() and not self.tengoPiza() //si tiene algo y no es una pizza es un ingrediente
  }
}

class Horno inherits MuebleParaCocinar(image = "oven_0.png") {
  var property temperatura = 0

  override method cumpleCondicionRecibir(chef){
    return super(chef) and self.esPiza(chef.bandeja()) //así solo acepta recibir pizzas
  }

  override method accionDeRecibir(){
    self.cocinar()
  }

  override method dar(chef){
    super(chef)
    temperatura = 0
  }

   method cocinar() { 
    game.onTick(2500, "cocinarContenido", {contenido.serCocinada()})
    game.onTick(2500, "subirle temperatura", {self.subirNivelDeHorno()})
  } 

  method subirNivelDeHorno(){
    temperatura = (temperatura + 1).min(3)
    self.actualizarEstadoHorno()
  }

  method actualizarEstadoHorno() {
    if (temperatura == 3) self.simularFuego()
  }

  method simularFuego() {
    //esto sería mejor que hagamos que aparezca dibujos de humo arriba del horno y ya está
  }
}

class Tacho inherits Mueble(image = "") {

  override method usarse(chef){
     game.removeVisual(chef.bandeja())
     chef.soltar()
  }
}



