import ingredientesBase.*
import personaBase.*


import wollok.game.*


class Masa inherits Ingrediente( image = "maasa_inicial.png", imgProcesadoFinal = "piza_cruda.png") { 

    const property ingredientes = [] 
    var property estado = cruda  

    override method integraIngredintes(){ 
      return procesado //-> asi la masa no recibe ingredientes hasta ser procesados
    }

    override method serSostenido(chef) {
        super(chef)
        self.llevarseIngredientesConsigo(chef)
    }

    method recibirIngrediente(ingrediente){
        self.validarRecibirIngrediente(ingrediente)
        ingredientes.add(ingrediente)
        ingrediente.serDejadoAqui(self.position()) 
    }

    method llevarseIngredientesConsigo(chef){
         ingredientes.forEach({i => i.serSostenido(chef)})
    }

    override method serDejadoAqui(nuevaPosition){
        super(nuevaPosition)
        self.dejarIngredientesConsigo(nuevaPosition)
    }

    method dejarIngredientesConsigo(nuevaPosition){
        ingredientes.forEach({i => i.serDejadoAqui(nuevaPosition)})
    }

    override method eliminarConIngredientes(){
        ingredientes.forEach({i => game.removeVisual(i)})
        ingredientes.clear()
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
        game.say(self, estado)
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

object cruda inherits Coccion(imgCoccion = "piza_cruda.png"){ 
    override method quemarUnPoquito(masa){
        masa.estado(dorada) 
    }
}

object dorada inherits Coccion(imgCoccion = "piza_dorada.png"){
    override method quemarUnPoquito(masa){
        masa.estado(quemada)    
    }
}

object quemada inherits Coccion(imgCoccion = "piza_quemada.png") {
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
        return tomate.image(estadoImg)
    }

    method resultadoDeProcesamiento(tomate)
}

object entero inherits EstadosTomate(estadoImg = "tomate_inicial.png") { 
    override method resultadoDeProcesamiento(tomate){
        tomate.estadoTomate(cortado)
    }
}

object cortado inherits EstadosTomate(estadoImg = "tomate_cortado.png")  {
    override method resultadoDeProcesamiento(tomate){
        tomate.estadoTomate(salsa)
    }
}

object salsa inherits EstadosTomate(estadoImg = "tomate_final.png") {
    override method resultadoDeProcesamiento(tomate){
        tomate.tipo(ingredienteSalsa)
    }
}


class Aceituna inherits Ingrediente( image = "aceituna_inicial.png", imgProcesadoFinal = "aceituna_final.png") {

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

class Atun inherits Ingrediente( image = "atun_inicial.png", imgProcesadoFinal = "atun_final.png") {

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

class IngredienteMenu{
    const nombreEnMenu = null

     override method toString() {
        return nombreEnMenu
     }
}

object ingredienteMasa inherits IngredienteMenu(nombreEnMenu = "Masa") {}
object ingredienteQueso inherits IngredienteMenu(nombreEnMenu = "Queso") {}
object ingredienteTomate inherits IngredienteMenu(nombreEnMenu = "Tomate") {} 
object ingredienteSalsa inherits IngredienteMenu(nombreEnMenu = "Salsa") {}
object ingredienteAceituna inherits IngredienteMenu(nombreEnMenu = "Aceituna") {}
object ingredienteHuevo inherits IngredienteMenu(nombreEnMenu = "Huevo") {}
object ingredienteAtun inherits IngredienteMenu(nombreEnMenu = "Atun") {}
object ingredienteHongo inherits IngredienteMenu(nombreEnMenu = "Hongo") {}
