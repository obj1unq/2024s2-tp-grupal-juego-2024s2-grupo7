import comestibles.*
import wollok.game.*


object horno {
  var property position = game.at(4, 4)
  var property image = "ovenTiny_" + estadoComida + ".png"
  var property estadoComida = 0
  var property contenido = #{}

  method cocinar(comida) { 
    game.onTick(2500, self, {self.calentar(comida)})
  } 

  method calentar(comida) {
    comida.serCocinada()
    self.nivelDeHorno(comida)
  }

  method nivelDeHorno(comida){
    estadoComida = comida.coccion()
    image = if (comida.heatLevel() <= 2) (comida.heatLevel() + 1) else self.simularFuego()
  }

  method simularFuego() {
    game.say(self, "la comida se está quemando")
    /*acá la idea es hacer que alterne en 2 imagenes de horno sacando humo pero no se me ocurre como hacerlo todavía*/
  }

  method recibirIngrediente(ingrediente) {
      self.contenido().add(ingrediente)
      image = "oven_1.png"
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
