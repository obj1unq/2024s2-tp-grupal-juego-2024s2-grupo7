import mueblesBase.*
import comestibles.*
import ingredientesBase.*

import wollok.game.*

class PilaIngrediente inherits Mueble{

  override method usarse(chef){
    self.validarUsarse(chef)
    self.darIngrediente(chef)
  }

  method validarUsarse(chef){
    if(not chef.tengoBandejaVacia()){
      chef.error("no puedo agarrar nada con las manos ocupadas")
    }
  }

  method darIngrediente(chef){
    const ingrediente = self.nuevoIngrediente(chef)
    game.addVisual(ingrediente)
    chef.bandeja(ingrediente)
  }

  method nuevoIngrediente(chef)
}


object estacionTomate  inherits PilaIngrediente(image = "tomate_inicial.png", position = game.at(0, 5)){

  override method nuevoIngrediente(chef){
    return 
    new Tomate(estadoPosition = new Sostenido(queLoSostiene = chef))
  }

}

object estacionMasa inherits PilaIngrediente(image = "masa_inicial.png", position = game.at(0,5)){

    override method nuevoIngrediente(chef){
      return 
      new Masa(estadoPosition = new Sostenido(queLoSostiene = chef))
    }

}

object estacionQueso inherits PilaIngrediente(image = "queso_inicial.png", position = game.at(2,2)) {

  override method nuevoIngrediente(chef){
    return 
    new Queso(estadoPosition = new Sostenido(queLoSostiene = chef))
  }

}

object estacionAceituna inherits PilaIngrediente(image = "aceituna_factory.png", position = game.at(1,2)) {

    override method nuevoIngrediente(chef){
      return 
      new Aceituna(estadoPosition = new Sostenido(queLoSostiene = chef))
    }
  }

object estacionHongo inherits PilaIngrediente(image = "hongo_factory.png", position = game.at(3,2)){

  override method nuevoIngrediente(chef){
    return 
    new Hongo(estadoPosition = new Sostenido(queLoSostiene = chef))
  }

}

object estacionHuevo inherits PilaIngrediente(image = "huevos_factory.png", position = game.at(4,2)){

  override method nuevoIngrediente(chef){
    return 
    new Huevo(estadoPosition = new Sostenido(queLoSostiene = chef))
  }

}

object estacionAtun inherits PilaIngrediente(image = "atun_factory.png", position = game.at(7,2)) {

  override method nuevoIngrediente(chef){
    return 
    new Atun(estadoPosition = new Sostenido(queLoSostiene = chef))
  }

}