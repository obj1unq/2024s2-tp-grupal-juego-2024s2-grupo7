import comestibles.*
import wollok.game.*


object horno {
  var property position = game.at(4, 4)
  var property image = "oven" + grados + ".png"
  var property grados = 0
  var property contenido = []

  
  method recibirPizza(pizza) {
      self.validarRecibirPizza()
      self.contenido().add(pizza)      
  }

  method validarRecibirPizza() {
    if(not contenido.isEmpty()){
      self.error("ya hay algo calentandose")
    }
  }

  method cocinar() { 
    game.onTick(2500, self, {self.calentar(contenido.head())})
  } 

  method calentar(comida) {
    self.subirNivelDeHorno()
    comida.serCocinada(grados)
    self.actualizarEstado()
  }

  method subirNivelDeHorno(){
    grados = (grados + 1).min(3)
  }

  method actualizarEstado() {
    if (grados == 3) self.simularFuego()
  }

  method simularFuego() {
    game.say(self, "la comida se está quemando")
    /*acá la idea es hacer que alterne en 2 imagenes de horno sacando humo pero no se me ocurre como hacerlo todavía*/
  }
}

object basura {
/*
  tiene que entender eliminar objeto : para cuando se arruine la comida, se queme o así 

*/  
}

class Mesada {
/*
  unico lugar donde se pueden "procesar" los ingredientes
*/  
}
