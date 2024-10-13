
import objetosCocina.*
import comestibles.*

object remy { //remy es el de Ratatouille
    var property position = game.center() 
    const property image = "chefPrueba.png"
    const property ingredientes = #{}
    const limiteDeIngredientes = 10

    method mover(direccion){
		position =  direccion.siguiente(self.position())
	}

  method procesarIngrediente(){

    ingredientes.forEach({ingrediente => ingrediente.serProcesado()})
  }

  method recogerIngrediente(ingrediente){
    // habria tambien que tener un objetio pedido, que sepa los ingredientes necesarios para esa pizza.
    //self.validarIngrediente(pedido.ingrediente())
    //ingredienteReceta.add(pedido.ingrediente())
    self.validarEspacioEnBandeja()
    self.validarIngrediente(ingrediente)
    
    self.agregarIngrediente(ingrediente)
    administradorIngredientes.remover(ingrediente)

  }

  method agregarIngrediente(ingrediente){

    ingredientes.add(ingrediente)
  }

  method validarIngrediente(ingrediente){
    /*
    Mi idea es que valide si  no hay nada (no hay ningun ingrediente)
    Pero creo que necesitaria que este el object wollocook para poder saber que ingredientes hay
     en la pizzeria
    */ 

    /*
    if(not wollokcook.hayIngrediente()){
        self.error(no hay ningun ingrediente aca.)
      }
  
    */

    if ( self.tengoIngrediente(ingrediente)){
      self.error("ya tengo Este ingrediente en la bandeja")
    }
  }

  method tengoIngrediente(ingrediente){

    return ingredientes.contains(ingrediente) // aca no deberia  de dar verdadero ya que cada una de la instacias  creadas por las clases es diferene
    // habia 2 opciones dejar que pueda tener 2  muzzarellas  o bien poner un "codigo" a cada ingrediente y comprarlo y ahi no habria problemas con esta validacion
  }

  method validarEspacioEnBandeja(){

    if (not self.hayEspacio()){
      self.error("no tengo mas espacio en la bandeja")
    }
  }

  method hayEspacio(){

    return ingredientes.size() < limiteDeIngredientes
  }
}