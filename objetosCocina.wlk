import mueblesBase.*
import personaBase.*
import comestibles.*
import ingredientesBase.*

import wollok.game.*

class Mesada inherits MuebleParaCocinar{

  override method cumpleCondicionRecibir(){ //o esta vacio o tiene una pizza
    return super() || self.tengoPiza()
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

class Horno inherits MuebleParaCocinar{
  var temperatura = 0

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

class Tacho inherits Mueble{

  override method usarse(chef){
     game.removeVisual(chef.bandeja())
     chef.soltar()
  }
}



// class PilaIngrediente inherits Tacho {


//   override method usarse(chef){
//     self.validarUsarse(chef)
//     const ingrediente = self.nuevoIngrediente(chef)
//     game.addVisual(ingrediente)
//     chef.recibir(ingrediente)
//     ingrediente.serSostenido(chef)
//   }

//   override method validarUsarse(chef) {
//     if(chef.llevoAlgo()) {
//       chef.error("Ya tengo algo en las manos")
//     }
//   }

//    method nuevoIngrediente(chef)

 
// }

// class MesaDeProcesado inherits Tacho(image ="mesada_ph.png") {

//   override method usarse(chef) {
//     //self.validarUsarse(chef)
//     chef.procesarIngrediente()
//   }

// }

// object estacionTomate  inherits PilaIngrediente(image = "tomate_inicial.png", position = game.at(0, 5)){

//   override method nuevoIngrediente(chef){
//     return new Tomate(estadoPosition = new Sostenido(queLoSostiene = chef)) 
//   }


// }

// object estacionMasa inherits PilaIngrediente(image = "masa_inicial.png", position = game.at(1,5)){

//     override method nuevoIngrediente(chef){
//       return new Masa(estadoPosition = new Sostenido(queLoSostiene = chef))
//     }

// }

// object estacionQueso inherits PilaIngrediente(image = "queso_inicial.png", position = game.at(2,2)) {

//   override method nuevoIngrediente(chef){
//     return new Queso(estadoPosition = new Sostenido(queLoSostiene = chef))
//   }

// }

// object estacionAceituna inherits PilaIngrediente(image = "aceituna_factory.png", position = game.at(1,2)) {

//     override method nuevoIngrediente(chef){
//       return new Aceituna(estadoPosition = new Sostenido(queLoSostiene = chef))
//     }
//   }

// object estacionHongo inherits PilaIngrediente(image = "hongo_factory.png", position = game.at(3,2)){

//   override method nuevoIngrediente(chef){
//     return new Hongo(estadoPosition = new Sostenido(queLoSostiene = chef))
//   }

// }

// object estacionHuevo inherits PilaIngrediente(image = "huevos_factory.png", position = game.at(4,2)){

//   override method nuevoIngrediente(chef){
//     return new Huevo(estadoPosition = new Sostenido(queLoSostiene = chef))
//   }

// }

// object estacionAtun inherits PilaIngrediente(image = "atun_factory.png", position = game.at(7,2)) {

//   override method nuevoIngrediente(chef){
//     return new Atun(estadoPosition = new Sostenido(queLoSostiene = chef))
//   }

// }


