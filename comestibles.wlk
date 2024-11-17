import restaurante.*
import chefs.*


import wollok.game.*

class Ingrediente { 
    //corregir
    var property position = game.center() //placeholder de la direccion
    var property image = null 
    const imgProcesadoFinal = null
    var procesado = false
    //tener el estado que conozca al chef que lo sostenga
    //corregir
    const quienLoSostiene = managerSostenerIngrediente

    method precio()

    method tipoIngrediente()

    method esVacio(){
    return false
   }

   method integraIngredintes() { 
     return false
   }

    method fueProcesado() {
        return procesado
    }
//corregir
    method serSostenido(chef) {
        //hacer bien
    }

    method serDejadoAqui(nuevaPosition){
        position = nuevaPosition
       //hacer bien
    }

    method serProcesado(){ 
        image = imgProcesadoFinal
        procesado = true
    }

}
//corregir
object managerSostenerIngrediente{
    var sujetador = null
    var property position = null
//corregir
    method sujeta(chef){
        //no me salió
    }
//corregir
    method serDejadoEn(nuevaPosition){
        //no me salió
    }

}


class Masa inherits Ingrediente( image = "masa_inicial.png", imgProcesadoFinal = "masa_final.png") { //imagen de masa redondita y despues amasada
    const property ingredientes = [] //la masa debe saber sus ingredientes
    var estado = cruda  

    override method integraIngredintes(){ 
      return true
    }

    method recibirIngrediente(ingrediente){
        self.validarRecibirIngrediente(ingrediente)
        ingredientes.add(ingrediente)
        //modificar la img
    }

    override method precio(){
        return 100 + self.totalIngredientes()
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
        self.newImagen(masa)
        self.quemarUnPoquito(masa)
    } 

    method quemarUnPoquito(masa)
    
    method newImagen(masa) { //ponerle otro nombre
      masa.image(imgCoccion)
    }

} 

object cruda inherits Coccion(imgCoccion = ""){ //cruda no hace falta que tenga imagen -> nunca se va a ver
    override method quemarUnPoquito(masa){
        masa.estado(dorada) 
    }
}

object dorada inherits Coccion(imgCoccion = ""){
    override method quemarUnPoquito(masa){
        masa.estado(quemada)    
    }
}

object quemada inherits Coccion(imgCoccion = "") {
    override method quemarUnPoquito(masa){} //no hace nada porque es el último estado
}

class Queso inherits Ingrediente( image = "queso_inicial.png", imgProcesadoFinal = "queso_final.png") {

        override method precio(){
            return 200
        }

        override method tipoIngrediente(){
        return ingredienteQueso
    }
}

class Tomate inherits Ingrediente( image = "tomate_inicial.png", imgProcesadoFinal = "tomate_final.png") { 

    var tipo = ingredienteTomate
    var estadoTomate = entero

    override method precio(){
            return 200
        }

    method estadoTomate(estado){
        estadoTomate = estado
    }

      override method tipoIngrediente(){
        return  tipo
    }

    method tipo(_tipo){
        tipo = _tipo
    }

    override method serProcesado(){
        estadoTomate.serProcesado()
        procesado = true 
    }

    method cambiarTipo(){
        tipo = ingredienteSalsa
    }

}

class EstadosTomate{
    const estadoImg = null

    method serProcesado(tomate){
        self.imgEstado(tomate)
        self.resultadoDeProcesamiento(tomate)
    }

    method imgEstado(tomate){
        return estadoImg
    }

    method resultadoDeProcesamiento(tomate)
}

object entero inherits EstadosTomate(estadoImg = "") { //no necesita imagen realmente 
    override method resultadoDeProcesamiento(tomate){
        tomate.estadoTomate(cortado)
    }
}

object cortado inherits EstadosTomate(estadoImg = "")  {
    override method resultadoDeProcesamiento(tomate){
        tomate.estadoTomate(salsa)
    }
}

object salsa inherits EstadosTomate(estadoImg = "") {
    override method resultadoDeProcesamiento(tomate){
        tomate.tipo(ingredienteSalsa)
    }
}


class Aceituna inherits Ingrediente( image = "aceituna_factory.png", imgProcesadoFinal = "aceituna_final.png") {

    override method precio(){
            return 200
        }
    
    override method tipoIngrediente(){
        return ingredienteAceituna
    }
}

class Huevo inherits Ingrediente( image = "huevo_inicial.png", imgProcesadoFinal = "huevo_final.png") {

    override method precio(){
            return 200
        }
    
    override method tipoIngrediente(){
        return ingredienteHuevo
    }
}

class Atun inherits Ingrediente( image = "atun_factory.png", imgProcesadoFinal = "atun_final.png") {

    override method precio(){
            return 200
        }
    
    override method tipoIngrediente(){
        return ingredienteAtun
    }
}

class Hongo inherits Ingrediente( image = "hongo_inicial.png", imgProcesadoFinal = "hongo_final.png") {

    override method precio(){
            return 200
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