import posiciones.*

object chefcito {
    var property position = game.center() 
    const property image = "chef.1.png"

    method mover(direccion){
		position =  direccion.siguiente(self.position())
	}

    
}