import mueblesBase.*
import comestibles.*
import ingredientesBase.*

import wollok.game.*

class PilaIngrediente inherits Mueble {


  override method usarse(chef){
    self.accionDar(chef)
  }

  override method eliminarLoDado(){} //no se usa porque tiene infinitos elementos encima la pila, no solo 1 contenido

  override method objetoADar(chef){
    return self.nuevoIngrediente(chef)
  }

  override method puedeRecibir(cosa) { //no recive nada a diferencia de otros muebles, solo da
    return false
  }

  method nuevoIngrediente(chef) //depende de la pila de ingredientes

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