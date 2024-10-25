import comestibles.*
import restaurante.*

import wollok.game.*


object horno {
  var property position = game.at(4, 4)
  var image = "" //ponerle una imagen base normal
  var property temperatura = 0
  var property contenido = [] 
  
  method recibir(pizza) {
      self.validarRecibirPizza()
      self.contenido().add(pizza)      
  }

  method validarRecibirPizza() {
    if(not self.hayEspacioEnHorno()){ //podría cambiarse la capacidad del horno si es por nivel o puntos y ahí se le pone en variable.
      self.error("ya hay cosas calentandose")
    }
  }

  method hayEspacioEnHorno(){
    return contenido.zise() < 2
  }

  method hayAlMenos1Pizza() {
    return contenido.zise() == 1
  }

  method cocinar() { 
    game.onTick(2500, self, {
                                contenido.forEach({pizza => self.calentar(pizza)})  
                            })
    game.onTick(2500, self, {self.subirNivelDeHorno()})
  } 

  method calentar(comida) {
    comida.serCocinada(temperatura)
  }

  method subirNivelDeHorno(){
    temperatura = (temperatura + 1).min(3)
    self.actualizarEstado()
  }

  method actualizarEstado() {
    if (temperatura == 3) self.simularFuego()
  }

  method simularFuego() {
    if(image == "ovenFuego1.png") {
            image = "ovenFuego2.png"
          } else 
            image == "ovenFuego1.png" 
  }

}

object basura {

  method recibirBasura(chef) {
    chef.image(self.chefBandejaVacia(chef))
    chef.bandeja(null) 
  }

  method chefBandejaVacia(chef) {
    return chef.nombre() + "" + "_bandejaVacia.png"
  }

}

class Mesada {
/*
  unico lugar donde se pueden "procesar" los ingredientes
*/  
}

