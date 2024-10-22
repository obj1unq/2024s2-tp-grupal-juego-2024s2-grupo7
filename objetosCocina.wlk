import comestibles.*
import wollok.game.*


object horno {
  var property position = game.at(4, 4)
  var property temperatura = 0
  var property contenido = []

  method image() {
    return "oven_" + temperatura + ".png" 
  }

  // Aca saque la variable imagen y la deje solo en un metodo, ya que al depender del valor de otra variable,
  // (grados/temperatura) para hacer el calculo de que imagen mostrar creo que queda medio como un precalculo.
  
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
    comida.serCocinada(temperatura)
    self.actualizarEstado()
  }

  method subirNivelDeHorno(){
    temperatura = (temperatura + 1).min(3)
  }

  method actualizarEstado() {
    if (temperatura == 3) self.simularFuego()
  }

  method simularFuego() {
    game.say(self, "la comida se está quemando")
    /*acá la idea es hacer que alterne en 2 imagenes de horno sacando humo pero no se me ocurre como hacerlo todavía*/
    /* Quiza algo asi?
        method actualizarEstado() {
          game.say("La comida se esta quemando")
          game.onTick(500, self, {self.simularFuego()})
        }
        
        
        method simularFuego() {
          if(image == "ovenFuego1.png") {
            image = "ovenFuego2.png"
          } else 
            image == "ovenFuego1.png"
        }*/
  }

}

object basura {
  const desechos = []

  // Probablemente aca sea mejor que tenga un metodo polimorfico, que tengan otros objetos que tambien reciban un objeto
  // y que lo use para lo que lo necesite.

  method recibirDesecho(desecho) {
    desechos.add(desecho)
  }

  /* Aca podriamos agregar un detallito de que tenga otro metodo polimorfico para entregar algo, que tengan otros
  objetos, y que te devuelva una pizza toda podrida o algo asi.
  method entregarObjeto() {
    return "pizzaPodrida.png"
  }
  */
}

class Mesada {
/*
  unico lugar donde se pueden "procesar" los ingredientes
*/  
}
