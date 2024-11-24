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

    method serSostenido(chef) {
        estadoPosition = new Sostenido(queLoSostiene = chef)
    }

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

    method serSostendioPorMasa(masa){
        estadoPosition = new SostenidoPorMasa(queLoSostiene = masa)
    }

    // method dondeApunta() { 
    //     return self.dondeMoverse(self.position())
    // }

    // method dondeMoverse(positionmasa){
	// 	return self.position()
	// }

}

class Apoyado {
    const queLoSostiene = null
    
    method position(){
        return queLoSostiene
    }
}

class Sostenido inherits Apoyado{
    override method position() {
        return super().dondeApunta()
    }
}

class SostenidoPorMasa inherits Apoyado{
    override method position() {
        return super().position()
    }
}



