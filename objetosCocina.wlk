import mueblesBase.*
import personaBase.*
import comestibles.*

import wollok.game.*


class Horno inherits Mueble(image = "oven_0.png") {
  var property temperatura = 0

  override method procesarIngredientes(){} //el horno no procesa ingredientes, solo cocina pero no pasa nada
  
  override method accionRecibir(chef){
    super(chef)
    self.cocinar()
  }

  override  method puedeRecibir(cosa){ //para poder recibir el horno solo tiene que estar completamente vacio y solo acepta pizzas
    return not self.tieneAlgo() and self.esPizza(cosa)
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

class Mesada inherits Mueble(image ="mesada_ph.png") {

  override method accionRecibir(chef){
    const ingrediente = chef.bandeja()
    if(self.tienePiza()){ //si la mesada tiene una pizza entonces el ingrediente se agrega a la lista de la masa
      contenido.recibirIngrediente(ingrediente)
    } else { 
      super(chef) //sino, el ingrediente se agrega arriba del mueble y listo, se tiene que ver ahí la imagen
    }  
  }

}

class Tacho inherits Mueble(image = ""){

  override method procesarIngredientes(){} //el tacho no procesa ingredientes

  override method accionRecibir(chef){
    chef.bandeja(bandejaVacia) 
    //remove visual acá? -> deja de existir, se elimina lo dado
  }

  //el tacho nunca le da nada al chef pq siempre va a aparecer como que no puede dar nada ya que su contenido siempre va a dar vacio porque nunca recibe algo

}

