import posiciones.*
import restaurante.*

import wollok.game.*

//falta como hacer que lo que este en bandeja la imagen aparezca en frente del chef, sino lo que se podría hacer que es más trabajo creo era lo de una imagen para cada cosa que puede sostener, eso también haría que ver como implementarlo

class Chef {
    var property position = game.center() 
    var property image = null
    var property bandeja = bandejaVacia
    var property orientacion = abajo //en donde está mirando
    var property nombre = null

    method mover(direccion) {
      const nuevaPosition = direccion.moverse(self.position())

      self.validarMoverseHacia(nuevaPosition)
      orientacion = direccion
      self.nuevaImagen()
      position = nuevaPosition
	}

  method validarMoverseHacia(_position){
    if(restaurante.hayObjetoSolidoEn(position)){
      self.error("no me puedo mover más")
    }
  }

  method nuevaImagen(){
    image = orientacion.imagen(nombre)
  }

  method recogerIngrediente(){
    self.validarRecogerIngrediente()
    bandeja = restaurante.ingredienteAqui(position)
  }

  method validarRecogerIngrediente(){
    if(self.tengoBandejaVacia() and restaurante.hayIngredienteAqui(self.position())){
      self.error("no hay nada que agarrar o tengo las manos llenas")
    }
  }

  method tengoBandejaVacia() {
    return bandeja.esVandejaVacia() //TODAS LAS COSAS QUE LOS CHEFS PUEDAN LEVANTAR DEBEN RESPONDER FALSE.
  }

  method soltarIngrediente() {
    self.validarSoltarIngrediente()    
    bandeja = bandejaVacia
  }

  method validarSoltarIngrediente(){
    if(not self.tengoBandejaVacia() and restaurante.hayEspacioLibreAqui(self.position())){
      self.error("no tengo nada que soltar o no lo puedo soltar aqui")
    }
  }

  method procesarIngrediente(){
    self.soltarIngrediente()
    restaurante.ingredienteAqui(position).serProcesado()
    self.recogerIngrediente()
  }

  method validarProcesarIngrediente(){
    if(not restaurante.hayEstacionDeProcesamientoAqui(self.position())){
      self.error("no puedo procesar el ingrediente aqui")
    }
  }

  method meterAlHorno(){
    self.ValidarMeterAlHorno()
    restaurante.hornoVacioAqui(self.position()).recibir(bandeja)
  }

  method ValidarMeterAlHorno(){
    if(self.tengoUnaPreparacion() and restaurante.hayHornoVacioAqui(self.position())){
      self.error("no hay ningun horno vacio aquí o no tengo nada para poner en el horno")
    }
  }

  method tengoUnaPreparacion() {
    return bandeja.aceptaIngredientesEncima() //ahora todos los objetos deben entender si aceptan ingredientes encima -> solo las cosas que se van a cocinar van a aceptar ingredintes encima
  }

  method sacarDelHorno() {
    self.validarSacarDelHorno()
    bandeja = restaurante.hornoAqui(self.position()).contenido()
  }

  method validarSacarDelHorno() {
    if(self.tengoBandejaVacia() and restaurante.hayHornoAqui(self.position()) and not restaurante.hornoAqui(self.position()).hayAlMenos1Pizza()){
      self.error("...")
    }
  }

  method tirarALaBasura(){
    self.validarTirarALaBasura()
    restaurante.basuraAqui(self.position()).recibirBasura(self)
  }

  method validarTirarALaBasura(){
    if(not restaurante.hayBasuraAqui(self.position())){
      self.error("no tirar la basura aqui")
    }
  }
}

object bandejaVacia {
  method esVandejaVacia(){
    return true 
  }
}

const remy = new Chef( position = game.center(), image = "chefPrueba.png", nombre = remy )
const ramsay = new Chef( position = game.center(), image = "chefPrueba.png", nombre = ramsay )