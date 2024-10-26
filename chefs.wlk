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
    return bandeja.esBandejaVacia() //TODAS LAS COSAS QUE LOS CHEFS PUEDAN LEVANTAR DEBEN RESPONDER FALSE.
  }

  method soltarIngrediente() { //se deja todo uno más de donde estás porque no podes atravesar el mueble.
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
    self.soltarIngrediente()
    restaurante.ingredienteAqui(self.dondeEstoyApuntando()).serProcesado()
    self.recogerIngrediente()
    restaurante.seSacaIngredienteAqui(self.dondeEstoyApuntando())
  }

  method validarProcesarIngrediente(){
    if(not restaurante.hayEstacionDeProcesamientoAqui(self.dondeEstoyApuntando()) and not restaurante.hayEspacioLibreAqui(self.dondeEstoyApuntando())){
      self.error("no puedo procesar el ingrediente aqui")
    }
  }

  method meterAlHorno(){
    self.validarMeterAlHorno()
    restaurante.hornoAqui(self.dondeEstoyApuntando()).recibir(bandeja)
    bandeja = bandejaVacia
  }

  method validarMeterAlHorno(){
    if(self.tengoUnaPreparacion() and restaurante.hayHornoVacioAqui(self.dondeEstoyApuntando())){
      self.error("no hay ningun horno vacio aquí o no tengo nada para poner en el horno")
    }
  }

  method tengoUnaPreparacion() {
    return bandeja.aceptaIngredientesEncima() //ahora todos los objetos deben entender si aceptan ingredientes encima -> solo las cosas que se van a cocinar van a aceptar ingredintes encima
  }

  method sacarDelHorno() {
    self.validarSacarDelHorno()
    restaurante.hornoAqui(self.position()).sacaDelHorno(self)
  }

  method validarSacarDelHorno() {
    if(not restaurante.hayHornoAqui(self.dondeEstoyApuntando())){
      self.error("no hay un horno aquí") 
    } else if(not restaurante.hornoAqui(self.dondeEstoyApuntando()).hayAlMenos1Pizza()){
      self.error("no hay un horno no tengo nada que sacar") 
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
}
