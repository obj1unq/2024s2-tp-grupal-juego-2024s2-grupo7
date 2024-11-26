import mueblesBase.*
import personaBase.*
import comestibles.*
import ingredientesBase.*

import wollok.game.*

class Mesada inherits MuebleParaCocinar(image ="mesada_a.png") {

  override method cumpleCondicionRecibir(chef){ //o esta vacio o tiene una pizza
    return super(chef) || self.tengoPiza()
  }

  override method recibir(chef){
    if(self.tengoPiza()){
      contenido.recibirIngrediente(chef.bandeja())
      chef.soltar()
    } else {
      super(chef)
    }
  }

  override method procesarIngredientes(){
    self.validarProcesar()
    contenido.serProcesado()
  }

  method validarProcesar(){
    if(not self.tieneIngrediente()){
      self.error("no hay ingrediente que procesar")
    }
  }

  method tieneIngrediente(){
    return not self.estoyLibre() and not self.tengoPiza() //si tiene algo y no es una pizza es un ingrediente
  }
}

class Horno inherits MuebleParaCocinar(image = "hornoParaPizza.png") {

  override method cumpleCondicionRecibir(chef){
    return super(chef) and self.esPiza(chef.bandeja()) //así solo acepta recibir pizzas
  }

  override method mensajeErrorRecibir(){
    return "no puedo recibir algo que no sea una pizza y el horno tiene que estar vacio para recibir"
  }

  override method accionDeRecibir(){
    game.removeVisual(contenido)
    self.cocinar()
  }

  override method dar(chef){
    game.removeTickEvent("cocinarContenido")
    game.addVisual(contenido)
    super(chef)
  }

   method cocinar() { 
    game.onTick(2500, "cocinarContenido", {contenido.serCocinada()})
  } 
  
 }

class Tacho inherits Mueble(image = "tacho.png") {

  override method usarse(chef){
     game.removeVisual(chef.bandeja())
     chef.bandeja().eliminarConIngredientes()
     chef.soltar()
  }
}