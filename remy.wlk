import posiciones.*
import objetosCocina.*
import comestibles.*

object remy { //remy es el de Ratatouille
    var property position = game.center() 
    const property image = "remy.1.png"
    const property ingredienteReceta = #{}

    method mover(direccion){
		position =  direccion.siguiente(self.position())
	}

  method recogerIngrediente(){
    // habria tambien que tener un objetio pedido, que sepa los ingredientes necesarios para esa pizza.
    //self.validarIngrediente(pedido.ingrediente())
    //ingredienteReceta.add(pedido.ingrediente())

  }

  method validarIngrediente(insumo){
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



  }


}