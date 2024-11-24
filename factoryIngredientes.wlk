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

object estacionTomate  inherits PilaIngrediente(image = "tomate_fact.png", position = game.at(6, 63)){

  override method nuevoIngrediente(chef){
    return 
    new Tomate(estadoPosition = new Sostenido(queLoSostiene = chef))
  }

}

object estacionMasa inherits PilaIngrediente(image = "masa_fact.png", position = game.at(22,63)){

    override method nuevoIngrediente(chef){
      return 
      new Masa(estadoPosition = new Sostenido(queLoSostiene = chef))
    }

}

object estacionQueso inherits PilaIngrediente(image = "queso_fact.png", position = game.at(116, 63)) {

  override method nuevoIngrediente(chef){
    return 
    new Queso(estadoPosition = new Sostenido(queLoSostiene = chef))
  }

}

object estacionAceituna inherits PilaIngrediente(image = "aceituna_fact.png", position = game.at(36,44)) {

    override method nuevoIngrediente(chef){
      return 
      new Aceituna(estadoPosition = new Sostenido(queLoSostiene = chef))
    }
  }

object estacionHongo inherits PilaIngrediente(image = "hongos_fact.png", position = game.at(49,44)){

  override method nuevoIngrediente(chef){
    return 
    new Hongo(estadoPosition = new Sostenido(queLoSostiene = chef))
  }

}

object estacionHuevo inherits PilaIngrediente(image = "huevo_fact.png", position = game.at(62,44)){

  override method nuevoIngrediente(chef){
    return 
    new Huevo(estadoPosition = new Sostenido(queLoSostiene = chef))
  }

}

object estacionAtun inherits PilaIngrediente(image = "atun_fact.png", position = game.at(116,44)) {

  override method nuevoIngrediente(chef){
    return 
    new Atun(estadoPosition = new Sostenido(queLoSostiene = chef))
  }

}