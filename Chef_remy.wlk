import posiciones.*
import objetosCocina.*
import comestibles.*

object remy { //remy es el de Ratatouille -> mejor nombre imposible
    var property position = game.center() 
    const property image = "chefPrueba.png"
    var property ingredienteEnMano = #{}
   // const property ingredientes = #{}
    const limiteEnMano = 2  // después va a ser mucho lio el que elija cuál de los 10 ingredientes que tiene va a poner en l apizza, opino que solo tenga 1 en la bandeja por simplicidad
    //var direccionALaQueMira  -> para los sprites

    method puedeMover(nuevaPosicion) {
      return (nuevaPosicion.x() >= 0 and nuevaPosicion.x() < (game.width()) and
            nuevaPosicion.y() >= 0 and nuevaPosicion.y() < (game.height()))
    }

    method mover(direccion){
		position =  direccion.siguiente(self.position())
	}

 // method recogerIngrediente(){ //puede agarrar cualquier ingrediente de la cocina
    // game.onCollideDo(self, {algo = algo.serSostenido(self)})
    //game.uniqueCollider(self).serSostenido(self)

    //creo que no estaba bueno usar eso, sería mejor deribarle a la cosina si puedo agarrar algún ingrediente en esa posicion??
    //self.validarRecogerIngrediente()
    //pizzeria.agarrarIngredienteAqui(self.position)
  //}

  method validarRecogerIngrediente(){
    //si la bandeja no está vacia no podría, sino ya es problema de la cocina las demás cosas a validar
  }

 method recogerIngrediente(ingrediente){
    // habria tambien que tener un objetio pedido, que sepa los ingredientes necesarios para esa pizza.
    //self.validarIngrediente(pedido.ingrediente()
    //ingredienteReceta.add(pedido.ingrediente()

    self.validarEspacioEnMano() 
    //self.validarIngrediente(ingrediente)
    
    self.agregarIngrediente(ingrediente)
    administradorIngredientes.remover(ingrediente)
  }




 method agregarIngrediente(ingrediente){
    ingredienteEnMano.add(ingrediente)
  }



/*method validarIngrediente(ingrediente){
    if(not pizzeria.hayIngrediente()){
        self.error(no hay ningun ingrediente aca.)
      }
  
  if ( self.tengoIngrediente(ingrediente)){
      self.error("ya tengo Este ingrediente en la bandeja")
    }
}

/*
  method tengoIngrediente(ingrediente){

    return ingredientes.contains(ingrediente) // aca no deberia  de dar verdadero ya que cada una de la instacias  creadas por las clases es diferene
    // habia 2 opciones dejar que pueda tener 2  muzzarellas  o bien poner un "codigo" a cada ingrediente y comprarlo y ahi no habria problemas con esta validacion
  }
*/


  method validarEspacioEnMano(){

    if (not self.hayEspacio()){
      self.error("solo puedo agarrar una cosa")
    }
  }



   method hayEspacio(){

    return  limiteEnMano < 2
  }



  method depositarIngrediente() {
      //self.validarDepositar(game.uniqueCollider(self))
      //game.uniqueCollider(self).recibirIngrediente(bandeja.head())

      //que la cocina te valide si estas en el horno ya que solo allí podés poner la comida
      //pizeria.hornoAqui().recibirPizza(bandeja.head())
  }

  method procesarIngrediente(){
    //ingredientes.forEach({ingrediente => ingrediente.serProcesado()})

    ingredienteEnMano.head().serProcesado()
  }

}