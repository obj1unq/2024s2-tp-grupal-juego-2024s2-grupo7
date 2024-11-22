import personaBase.*

import wollok.game.*

class Ingrediente { 
    var property image = null 
    const imgProcesadoFinal = null
    var procesado = false
    var estadoPosition = null //game.center()

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
//REVISAR:
    method serSostenido(chef) {
        estadoPosition = new Sostenido(queLoSostiene = chef)
    }
//REVISAR:
    method serDejadoAqui(nuevaPosition){
        estadoPosition = new Apoyado(queLoSostiene = nuevaPosition)
    }
//REVISAR:
    method position(){
        return estadoPosition.position()
    }

    method serProcesado(){ 
        image = imgProcesadoFinal
        procesado = true
    }

}
//REVISAR:
class Apoyado {
    const queLoSostiene = null
    
    method position(){
        return queLoSostiene
    }
}
//REVISAR:
class Sostenido inherits Apoyado{
    override method position() {
        return super().dondeApunta()
        //return queLoSostiene.dondeApunta()
    }
}


