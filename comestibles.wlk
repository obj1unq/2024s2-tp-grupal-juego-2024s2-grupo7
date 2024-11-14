import restaurante.*
import chefs.*


import wollok.game.*
 /*TAMBIEN NECESITA UN RETOQUE*/

 //hay cierto parecido en el procesar ingrediente con las imagenes -> después entender ese algoritmo y simplificarlo tal vez con un objeto estado que solo cambie la palabra, no se me ocurre como por ahora

class Ingrediente { 
    var property position = game.center()    
    var property image = null 
    var property precio = null
    var sostenido = false

    method tipoIngrediente()

    method sostenido(){
        return sostenido
    }

   method esVacio(){
    return false
   }

   method aceptaIngredientesEncima() {
     return false
   }

   method recibirIngrediente(ingrediente){}

   method tieneIngredientes(){
    return false
   }

    method serSostenido(chef) {
        //game.removeVisual(self)
        sostenido = true
    }

    method serDejadoAqui(nuevaPosition){
        position = nuevaPosition
       // game.addVisual(self) 
        sostenido = false
    }

    method imagenIngredienteInicial() 

    method imagenIngredienteFinal()

    method serProcesado(){
        image = self.imagenIngredienteFinal()
    }
}


class Masa inherits Ingrediente( image = "masa_inicial.png", precio = 100 ) {
    const property ingredientes = [] //aunque lo haga el chef la masa tiene que saber que tiene dentro.
    var property estado = cruda //pasar a siguiente lo entiende cada estado -> polimorfismo

    override method aceptaIngredientesEncima(){
      return true
    }

    override method recibirIngrediente(ingrediente){
        ingredientes.add(ingrediente)
        precio = precio + ingrediente.precio()
    }

    override method tieneIngredientes() {
      return not ingredientes.isEmpty()
    }

    //override method serProcesado(){} 

    override method imagenIngredienteInicial(){
        return "masa_inicial.png" //imagen de masa redondita
    }

    override method imagenIngredienteFinal(){
        return "masa_final.png" //imagen de masa amazada
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

    override method tipoIngrediente(){
        return ingredienteMasa
    }

}
 /*hay que cambiar que la masa misma sepa cual es su siguiente estado de coccion y que la masa mista te actualice la imagen por ejemplo cruda sabe que al ser cocinada va a pasar a dorada*/

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

class Queso inherits Ingrediente( image = "queso_inicial.png", precio = 200) {

        override method imagenIngredienteInicial(){
            return "queso_inicial.png"
        }

        override method imagenIngredienteFinal(){
            return "queso_final.png"
        }

        override method tipoIngrediente(){
        return ingredienteQueso
    }
}

class Tomate inherits Ingrediente( image = "tomate_inicial.png", precio = 200) {
  
      override method imagenIngredienteInicial(){

        return "tomate_inicial.png"
      }

      override method imagenIngredienteFinal(){

        return "tomate_final.png"
      }

      override method tipoIngrediente(){
        return ingredienteTomate
    }

    // override method serProcesado(){
    //     super()
    //     tipoIngrediente = ingredienteSalsa
    // }
}

class Aceituna inherits Ingrediente( image = "aceituna_factory.png", precio = 200) {

    override method imagenIngredienteInicial(){
            return "aceituna_factory.png"
        }

        override method imagenIngredienteFinal(){
            return "aceituna_final.png"
        }

    override method tipoIngrediente(){
        return ingredienteAceituna
    }
}

class Huevo inherits Ingrediente( image = "huevo_inicial.png", precio = 200) {

    override method imagenIngredienteInicial(){
            return "huevo_inicial.png"
        }

        override method imagenIngredienteFinal(){
            return "huevo_final.png"
        }

    override method tipoIngrediente(){
        return ingredienteHuevo
    }
}

class Atun inherits Ingrediente( image = "atun_factory.png", precio = 200) {

    override method imagenIngredienteInicial(){
            return "atun_factory.png"
        }

        override method imagenIngredienteFinal(){
            return "atun_final.png"
        }

    override method tipoIngrediente(){
        return ingredienteAtun
    }
}

class Hongo inherits Ingrediente( image = "hongo_inicial.png", precio = 200) {

    override method imagenIngredienteInicial(){
            return "hongo_inicial.png"
        }

        override method imagenIngredienteFinal(){
            return "hongo_final.png"
        }

    override method tipoIngrediente(){
        return ingredienteHongo
    }
}

object ingredienteMasa {}
object ingredienteQueso {}
object ingredienteTomate {}
object ingredienteAceituna {}
object ingredienteHuevo {}
object ingredienteAtun {}
object ingredienteHongo {}



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