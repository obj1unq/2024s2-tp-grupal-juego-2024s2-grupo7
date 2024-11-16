import restaurante.*
import chefs.*


import wollok.game.*

/* NOTAS:
    *hay cierto parecido en el procesar ingrediente con las imagenes -> PREGUNTAS AL PROFE
*/

class Ingrediente { 
    var property position = game.center()    
    var property image = null 
    const imgProcesadoFinal = null
    const property precio = null //preguntas dejarla var o cons
    var sostenido = false
    var procesado = false

    method tipoIngrediente()

    method esVacio(){
    return false
   }

   method integraIngredintes() { 
     return false
   }

    method sostenido(){
        return sostenido
    }

    method fueProcesado() {
        return procesado
    }

    method precio(){
        return precio
    }

    method serSostenido(chef) {
        //game.removeVisual(self) -> aca depende de como se manejen las visuals del chef al agarrar ingrediente
        //podría hacerse que aparezca siempre en frente del chef (en su vadeja) pero entonces acá el chef le tendría que mandar constantemente su ubicación para que sepa estar 1 paso en frente del chef siempre
        sostenido = true
    }

    method serDejadoAqui(nuevaPosition){
        position = nuevaPosition
       // game.addVisual(self) -> solo se puede ver la visual sobre un mueble si este no es un horno o la basura, delegar al mueble si hace el add visual?
        sostenido = false
    }

    method serProcesado(){ //el ser procesado podría ser hecho por un objeto? -> PREGUNTAR A UN PROFE
        image = imgProcesadoFinal
        procesado = true
    }

}


class Masa inherits Ingrediente( image = "masa_inicial.png", imgProcesadoFinal = "masa_final.png", precio = 100 ) { //imagen de masa redondita y despues amasada
    const property ingredientes = [] //la masa debe saber sus ingredientes
    var estado = cruda 

    override method integraIngredintes(){ 
      return true
    }

    method estado(){
        return estado
    }

    method recibirIngrediente(ingrediente){
        self.validarRecibirIngrediente(ingrediente)
        ingredientes.add(ingrediente)
    }

    override method precio(){
        return precio + self.totalIngredientes()
    }

    method totalIngredientes(){
        return ingredientes.sum({i => i.precio()})
    }

    method validarRecibirIngrediente(ingrediente){ //para poder recibir un ingrediente la masa tuvo que haber sido amasada (procesada) y el ingrediente también tuvo que haber sido cortado (procesado)
        self.validarRecibirProcesado(ingrediente)
        self.validarPoderRecibir()
    }

    method validarRecibirProcesado(ingrediente){
        if(not ingrediente.fueProcesado()){
            self.error("no se puede agregar a la masa un ingrediente sin procesar")
        }
    }
    
    method validarPoderRecibir(){
        if(not procesado){
            self.error("no puedo recibir ingredientes si no fui amazada")
        }
    }

    method tieneIngredientes() {
      return not ingredientes.isEmpty()
    }

    method serCocinada(){
        estado.cocinarseMas(self)
        estado.actualizarImagen(self)
    }

    override method tipoIngrediente(){
        return ingredienteMasa
    }

}

class Coccion{
    const imgCoccion = null

    method cocinarseMas(masa){
        self.actualizarImagen(masa)
        self.pasarDeEstado(masa)
    } 

    method pasarDeEstado(masa)
    
    method actualizarImagen(masa) {
      masa.image(imgCoccion)
    }

} 

object cruda inherits Coccion(imgCoccion = ""){ //cruda no hace falta que tenga imagen -> nunca se va a ver
    override method pasarDeEstado(masa){
        masa.estado(dorada) 
    }
}

object dorada inherits Coccion(imgCoccion = ""){
    override method pasarDeEstado(masa){
        masa.estado(quemada)    
    }
}

object quemada inherits Coccion(imgCoccion = "") {
    override method pasarDeEstado(masa){} //no hace nada porque es el último estado
}

class Queso inherits Ingrediente( image = "queso_inicial.png", imgProcesadoFinal = "queso_final.png", precio = 200) {

        override method tipoIngrediente(){
        return ingredienteQueso
    }
}

class Tomate inherits Ingrediente( image = "tomate_inicial.png", imgProcesadoFinal = "tomate_final.png", precio = 200) { 

    var tipo = ingredienteTomate

      method imagenIngredienteIntermedio(){
        return "" //imagen de salsa de tomate
      }

      override method tipoIngrediente(){
        return  tipo
        //if(self.fueProcesado()) ingredienteSalsa else ingredienteTomate
    }

    override method serProcesado(){ //preguntar si este proccesado para el tomate esta bien
        if(not procesado){
            procesado = true //siento que acá hay codigo repetido
            image = self.imagenIngredienteIntermedio()
        } else {
            super()
            self.cambiarTipo()
        }
    }

    method cambiarTipo(){
        tipo = ingredienteSalsa
    }

}

class Aceituna inherits Ingrediente( image = "aceituna_factory.png", imgProcesadoFinal = "aceituna_final.png", precio = 200) {

    override method tipoIngrediente(){
        return ingredienteAceituna
    }
}

class Huevo inherits Ingrediente( image = "huevo_inicial.png", imgProcesadoFinal = "huevo_final.png", precio = 200) {

    override method tipoIngrediente(){
        return ingredienteHuevo
    }
}

class Atun inherits Ingrediente( image = "atun_factory.png", imgProcesadoFinal = "atun_final.png", precio = 200) {

    override method tipoIngrediente(){
        return ingredienteAtun
    }
}

class Hongo inherits Ingrediente( image = "hongo_inicial.png", imgProcesadoFinal = "hongo_final.png", precio = 200) {

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