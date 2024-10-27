import posiciones.*
import restaurante.*
import objetosParaTests.*

import wollok.game.*

//falta como hacer que lo que este en bandeja la imagen aparezca en frente del chef, sino lo que se podría hacer que es más trabajo creo era lo de una imagen para cada cosa que puede sostener, eso también haría que ver como implementarlo

class Chef {
    var property position = game.at(0,0) 
    var property image = null
    var property bandeja = bandejaVacia
    var property orientacion = abajo //en donde está mirando
    var property nombre = null

    method mover(direccion) {
      orientacion = direccion
      const nuevaPosition = direccion.moverse(self.position())

      self.validarMoverseHacia(nuevaPosition)
      self.nuevaImagen()
      position = nuevaPosition
	}

  method validarMoverseHacia(_position){
    if(restaurante.hayObjetoSolidoEn(_position)){
      self.error("no me puedo mover ahí")
    }
  }

  method nuevaImagen(){
    image = orientacion.imagen(nombre)
  }

  method dondeEstoyApuntando() {
    return orientacion.moverse(self.position())
  }

  method recogerIngrediente(){
    self.validarRecogerIngrediente()
    const ingredienteAqui = restaurante.ingredienteAqui(self.dondeEstoyApuntando())
    self.recibirIngrediente(ingredienteAqui)
  }

  method recibirIngrediente(ingrediente){
    bandeja = ingrediente
    ingrediente.serSostenido(self)
  }

  method validarRecogerIngrediente(){
    if (not restaurante.hayIngredienteAqui(self.dondeEstoyApuntando())){
      self.error("no hay nada que agarrar")
    } else if(not self.tengoBandejaVacia()){
      self.error("tengo las manos llenas")
    }
  }

  method tengoBandejaVacia() {
    return bandeja.esBandejaVacia()
  }

  method soltarIngrediente() { //"tiras" todo adelante tuyo porque no podes atravesar el mueble.
    const posicionADejar = self.dondeEstoyApuntando()
    self.validarSoltarIngrediente(posicionADejar)   
    self.dejarIngredienteAqui(posicionADejar)
  }

  method dejarIngredienteAqui(posicionADejar) {
    restaurante.seDejaIngredienteAqui(bandeja, posicionADejar)
    bandeja = bandejaVacia
  }

  method validarSoltarIngrediente(posicionADejar){
    if(self.tengoBandejaVacia()){
      self.error("no tengo nada que soltar")
    } else if (not restaurante.hayEspacioLibreAqui(posicionADejar)){
      self.error("no lo puedo soltar aqui")
    }
  }

  method procesarIngrediente(){
    self.validarProcesarIngrediente()
    bandeja.serProcesado()

    //faltraría la "animación" de procesarlo
    //self.animarProcesarIngrediente()
  }

  method validarProcesarIngrediente(){
    if(not restaurante.hayEstacionDeProcesamientoAqui(self.dondeEstoyApuntando())){ 
      self.error("no puedo procesar el ingrediente aqui")
    }
  }

  method meterAlHorno(){
    self.validarMeterAlHorno()
    restaurante.hornoAqui(self.dondeEstoyApuntando()).recibir(bandeja)
    bandeja = bandejaVacia
  }

  method validarMeterAlHorno(){
    if(not self.tengoUnaPreparacion()){
      self.error("no tengo ninguna preparacion para meter al horno")
    } else if(not restaurante.hayHornoAqui(self.dondeEstoyApuntando())){
      self.error("no hay un horno en donde pueda meter la preparacion")
    } else if(not restaurante.hayHornoConEspacioAqui(self.dondeEstoyApuntando())){
      self.error("el horno no tiene espacio")
    }
  }

  method tengoUnaPreparacion() {
    return bandeja.aceptaIngredientesEncima()
  }

  method sacarDelHorno() {
    self.validarSacarDelHorno()
    restaurante.hornoAqui(self.dondeEstoyApuntando()).sacaDelHorno(self)
  }

  method validarSacarDelHorno() {
    if(not restaurante.hayHornoAqui(self.dondeEstoyApuntando())){
      self.error("no hay un horno aquí") 
    } else if(not restaurante.hornoAqui(self.dondeEstoyApuntando()).hayAlMenos1Pizza()){
      self.error("no hay nada en el horno") 
    } else if(not self.tengoBandejaVacia()){
      self.error("no puedo agarrar nada ahora") 
    }
  }

  method tirarALaBasura(){
    self.validarTirarALaBasura()
    restaurante.basuraAqui(self.dondeEstoyApuntando()).recibirBasura(self)
  }

  method validarTirarALaBasura(){
    if(not restaurante.hayBasuraAqui(self.dondeEstoyApuntando())){
      self.error("no hay ningun tacho aqui")
    }
  }
}

object bandejaVacia {
  method esBandejaVacia(){
    return true 
  }
  method aceptaIngredientesEncima(){ //tal vez cambiar el nombre porque no tiene mucho sentido para la bandeja
    return false
  }
}
