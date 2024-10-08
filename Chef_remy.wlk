import posiciones.*
import objetosCocina.*
import comestibles.*

object remy { //remy es el de Ratatouille -> mejor nombre imposible
    var property position = game.center() 
    const property image = "remy.1.png"
    const property ingredienteReceta = #{}
    var property bandeja = []
    //var direccionALaQueMira

    method puedeMover(nuevaPosicion) {
      return (nuevaPosicion.x() >= 0 and nuevaPosicion.x() < (game.width()) and
            nuevaPosicion.y() >= 0 and nuevaPosicion.y() < (game.height()))
    }

    method mover(direccion) {
      const nuevaPosicion = direccion.siguiente(position)
        if(self.puedeMover(nuevaPosicion)) {
            position = nuevaPosicion }
	}

  method recogerIngrediente(){ //puede agarrar cualquier ingrediente de la cocina
    // game.onCollideDo(self, {algo = algo.serSostenido(self)})
    game.uniqueCollider(self).serSostenido(self)
  }

  method validarIngrediente(insumo){
    /*
    Mi idea es que valide si  no hay nada (no hay ningun ingrediente)
    Pero creo que necesitaria que este el object wollocook para poder saber que ingredientes hay
     en la pizzeria ✔ 
    */ 

    /*
    if(not wollokcook.hayIngrediente()){
        self.error(no hay ningun ingrediente aca.)
      }
  
    */
  }

  /*method validarDepositar(horno) {
      if(not horno.puedeRecibir() and ) -> hay que agregarle al horno para que diga si está vacio o no
  }*/

  method depositarIngrediente() {
      //self.validarDepositar(game.uniqueCollider(self))
      game.uniqueCollider(self).recibirIngrediente(bandeja.head())
  }


}