import mueblesBase.*
import comestibles.*

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

  /*entonces las pilas deberían ya instanciar el estado de ser agarrado -> en clase 2 p/ obje 1 p
    -como para 1 chef basta con tener 1 objeto de estado , si fuesen 2 no

    -> ver la version de pepita y silvestre con los estados
  */

}

object estacionTomate  inherits PilaIngrediente(image = "tomate_inicial.png", position = game.at(0, 5)){

  override method nuevoIngrediente(chef){
    return new Tomate(position= chef.position()) //debería aparecer dentro de la bandeja del chef -> esta bien pasarle la position asi?
  }

}

object estacionMasa inherits PilaIngrediente(image = "masa_inicial.png", position = game.at(0,5)){

    override method nuevoIngrediente(chef){
      return new Masa(position= chef.position())
    }

}

object estacionQueso inherits PilaIngrediente(image = "queso_inicial.png", position = game.at(2,2)) {

  override method nuevoIngrediente(chef){
    return new Queso(position = chef.position())
  }

}

object estacionAceituna inherits PilaIngrediente(image = "aceituna_factory.png", position = game.at(1,2)) {

    override method nuevoIngrediente(chef){
      return new Aceituna(position = chef.position())
    }
  }

object estacionHongo inherits PilaIngrediente(image = "hongo_factory.png", position = game.at(3,2)){

  override method nuevoIngrediente(chef){
    return new Hongo(position=chef.position())
  }

}

object estacionHuevo inherits PilaIngrediente(image = "huevos_factory.png", position = game.at(4,2)){

  override method nuevoIngrediente(chef){
    return new Huevo(position=chef.position())
  }

}

object estacionAtun inherits PilaIngrediente(image = "atun_factory.png", position = game.at(7,2)) {

  override method nuevoIngrediente(chef){
    return new Atun(position = chef.position())
  }

}