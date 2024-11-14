import restaurante.*
import chefs.*


import wollok.game.*

/* NOTAS:
    *hay cierto parecido en el procesar ingrediente con las imagenes -> después entender ese algoritmo y simplificarlo tal vez con un objeto estado que solo cambie la palabra, no se me ocurre como por ahora
    *hay que cambiar que la masa misma sepa cual es su siguiente estado de coccion y que la masa mista te actualice la imagen por ejemplo cruda sabe que al ser cocinada va a pasar a dorada
*/

class Ingrediente { 
    var property position = game.center()    
    var property image = null 
    var property precio = null
    var sostenido = false
    var procesado = false

    method tipoIngrediente()

    method imagenIngredienteInicial() 

    method imagenIngredienteFinal()

    //method recibirIngrediente(ingrediente){} //esto debería estar solo en la masa

    method sostenido(){
        return sostenido
    }

   method esVacio(){
    return false
   }

   method integraIngredintes() { 
     return false
   }

    method serSostenido(chef) {
        //game.removeVisual(self) -> aca depende de como se manejen las visuals del chef al agarrar ingrediente
        sostenido = true
    }

    method serDejadoAqui(nuevaPosition){
        position = nuevaPosition
       // game.addVisual(self) -> solo se puede ver la visual sobre un mueble si este no es un horno o la basura, delegar al mueble si hace el add visual?
        sostenido = false
    }

    method serProcesado(){
        image = self.imagenIngredienteFinal()
        procesado = true
    }

    method fueProcesado() {
        return procesado
    }

    method puedeIntegrarse(){
        return true
    }
}


class Masa inherits Ingrediente( image = "masa_inicial.png", precio = 100 ) {
    const property ingredientes = [] //la masa debe saber sus ingredientes
    var property estado = cruda //pasar a siguiente lo entiende cada estado -> polimorfismo el cruda sabe que debe pasar a dorada

    override method integraIngredintes(){ 
      return true
    }

    override method puedeIntegrarse(){
        return false
    }

    method recibirIngrediente(ingrediente){ //override
        ingredientes.add(ingrediente)
        precio = precio + ingrediente.precio()
    }

    method tieneIngredientes() {
      return not ingredientes.isEmpty()
    }

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

    method actualizarEstado() { //esto debería hacerlo el estado en sí
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
        return 
        if(self.fueProcesado()) ingredienteSalsa else ingredienteTomate
    }

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
object ingredienteSalsa{}
object ingredienteAceituna {}
object ingredienteHuevo {}
object ingredienteAtun {}
object ingredienteHongo {}


//esto es solo si nos sobra el tiempo:

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