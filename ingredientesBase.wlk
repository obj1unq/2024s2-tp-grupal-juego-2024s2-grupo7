import personaBase.*

import wollok.game.*

class Ingrediente { 

    //var property position = 
    var property image = null 
    const imgProcesadoFinal = null
    var procesado = false
    var estadoPosition = game.center()
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
    method serSostenido(chef) {
        estadoPosition = new Sostenido(queLoSostiene = chef)
    }
//todo:
    method serDejadoAqui(nuevaPosition){
        estadoPosition = new Apoyado(queLoSostiene = nuevaPosition)
    }

    method position(){
        return estadoPosition.position()
    }

    method serProcesado(){ 
        image = imgProcesadoFinal
        procesado = true
    }

}

class EstadoPositionIngrediente {
    const queLoSostiene = null
    
    method position(){
        return queLoSostiene
    }
}

class Sostenido inherits EstadoPositionIngrediente{
    override method position() {
        //return super().dondeApunta()
        return queLoSostiene.adelante()
    }
}

class Apoyado inherits EstadoPositionIngrediente{
    // override method position() {
    //     return queLoSostiene
    // }
}


