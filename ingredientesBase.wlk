import personaBase.*

import wollok.game.*

class Ingrediente { 

    var property position = game.center()
    var property image = null 
    const imgProcesadoFinal = null
    var procesado = false
//todo:
    //tener el estado que conozca al chef que lo sostenga
    // var quienLoSostiene = managerSostenerIngrediente

    method precio()

    method tipoIngrediente()

    method esVacio(){
    return false
   }

   method integraIngredintes() { 
     return false
   }
//todo:
    method fueProcesado() {
        return procesado
    }
//todo:
    method serSostenido(chef) {}
//todo:
    method serDejadoAqui(nuevaPosition){}

    method serProcesado(){ 
        image = imgProcesadoFinal
        procesado = true
    }

}


