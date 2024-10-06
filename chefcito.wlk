import posiciones.*


object remy { //remy es el de Ratatouille
    var property position = game.center() 
    const property image = "remy.1.png"

    method mover(direccion){
		position =  direccion.siguiente(self.position())
	}


}