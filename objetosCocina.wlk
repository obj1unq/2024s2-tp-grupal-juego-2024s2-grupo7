object horno {
  var property position = game.at(x, y)
  var property image = "oven_" + heatLevel + ".png"
  var heatLevel = 0

  method cocinar(comida) { 
    //heatLevel =+ 1
    game.onTick(2500, self, {self.calentar(comida)})
  } 

  method calentar(comida) {
    comida.serCocinada()
    self.nivelDeHorno()
  }

  method nivelDeHorno(){
    heatLevel = if (heatLevel <= 2) (heatLevel + 1) else self.simularFuego()
  }

  method simularFuego() {
    
  }
}

