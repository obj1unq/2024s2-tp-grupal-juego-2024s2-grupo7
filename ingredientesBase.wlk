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
//REVISAR: anda -> refactor muebles
    method serSostenido(chef) {
        estadoPosition = new Sostenido(queLoSostiene = chef)
    }
//REVISAR: anda -> refactor muebles
    method serDejadoAqui(nuevaPosition){
        estadoPosition = new Apoyado(queLoSostiene = nuevaPosition)
    }
//REVISAR: anda -> refactor muebles
    method position(){
        return estadoPosition.position()
    }

    method serProcesado(){ 
        image = imgProcesadoFinal
        procesado = true
    }

}
//REVISAR: anda -> refactor muebles
class Apoyado {
    const queLoSostiene = null
    
    method position(){
        return queLoSostiene
    }
}
//REVISAR: anda -> refactor muebles
class Sostenido inherits Apoyado{
    override method position() {
        return super().dondeApunta()
    }
}

//agregar el donde apunta al ingrediente solo masa tal vez, para que siga a la masa
/*
method dondeApunta() { 
    return orientacion.dondeMoverse(self.position()) -> esto debería ser masa position 
  }

  override method dondeMoverse(positionPersona){
		return positionPersona.up(1) -> positionMasa (SIN EL UP NI NINGUNA MODIFICACION DEBE SER IGUAL)
	}

*/


