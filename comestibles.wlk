import ingredientesBase.*
import personaBase.*


import wollok.game.*


class Masa inherits Ingrediente( image = "masa_inicial.png", imgProcesadoFinal = "masa_final.png") { //imagen de masa redondita y despues amasada
    const property ingredientes = [] //la masa debe saber sus ingredientes
    var property estado = cruda  

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
    
    method newImagen(masa) {
      masa.image(imgCoccion)
    }

} 

object cruda inherits Coccion(imgCoccion = ""){ //cruda no hace falta que tenga imagen -> nunca se va a ver CREO
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
        estadoTomate.serProcesado(self)
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

object entero inherits EstadosTomate(estadoImg = "") { //no necesita imagen CREO
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
            return 150
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
            return 120
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
