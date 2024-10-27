import restaurante.*
import Chefs.*


import wollok.game.*


class Ingrediente { 
    var property position = game.center()    
    var property image = null 
    const property precio = null

   method esBandejaVacia(){
    return false
   }

   method aceptaIngredientesEncima() {
     return false
   }

    method serSostenido(chef) {
        game.removeVisual(self)
        position = chef.position()
    }

    method serDejadoAqui(nuevaPosition){
        //game.addVisual(nuevaPosition)
        position = nuevaPosition
    }

    method imagenIngredienteInicial()

    method imagenIngredienteFinal()

    method serProcesado(){
        if(self.image() == self.imagenIngredienteInicial()){
            image = self.imagenIngredienteFinal()
        }
    }
}


class Masa inherits Ingrediente( image = "", precio = 100 ) {
    const property ingredientes = #{} //aunque lo haga el chef la masa tiene que saber que tiene dentro.
    var property estado = cruda

    //override method serProcesado(){} 

    override method imagenIngredienteInicial(){
        return "" //imagen de masa redondita
    }

    override method imagenIngredienteFinal(){
        return "" //imagen de masa amazada
    }


    override method aceptaIngredientesEncima(){
      return true
    }

    method serCocinada(){
        self.actualizarEstado()
        estado.actualizarImagen(self)
    }

    method actualizarEstado() {
        if (self.estado().esCrudo()) {
             estado = dorada
    } else {
            estado = quemada
        }
    }

    method recibirIngrediente(ingrediente){
        ingredientes.add(ingrediente)
    }

    method tieneIngredientes() {
      return not ingredientes.isEmpty()
    }
}

object cruda {
    method actualizarImagen(pizza){
        pizza.image("")
    }
    method esCrudo() {
      return true
    }
}

object dorada {
    method actualizarImagen(pizza){
        pizza.image("")
    }
    method esCrudo() {
      return false
    }
}

object quemada {
    method actualizarImagen(pizza){
        pizza.image("")
    }
    method esCrudo() {
      return false
    }
}

//no entiendo que es eso de proceso y por qué lo hacen en otro objeto

class Queso inherits Ingrediente( image = "muzzarella_inicial.png", precio = 200) {

        override method imagenIngredienteInicial(){
            return "muzzarella_inicial.png"
        }

        override method imagenIngredienteFinal(){
            return "muzzarella_final.png"
        }
}

class Tomate inherits Ingrediente( image = "tomate_inicial.png", precio = 200) {
  
      override method imagenIngredienteInicial(){

        return "tomate_inicial.png"
      }

      override method imagenIngredienteFinal(){

        return "tomate_inicial.png"
      }
}

class Aceituna inherits Ingrediente( image = "", precio = 200) {}

class Huevo inherits Ingrediente( image = "", precio = 200) {}

class Atun inherits Ingrediente( image = "", precio = 200) {}

class Hongo inherits Ingrediente( image = "", precio = 200) {}


/*
    bebidas y postres: -> NO SON CLASE INGREDIENTE
    tiene que tener posición e imagen
    tiene que saber su precio
    tiene que saber que opción de bebida son 
        -> coca, sprite, fanta
        -> helado, torta, etc?
*/
class Bebida {}

class Postre {}