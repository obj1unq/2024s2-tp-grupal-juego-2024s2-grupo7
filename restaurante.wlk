import comestibles.*
import objetosCocina.*
import objetosParaTests.*


object restaurante {

    const property muebles = [tacho1, mesada1, mesada2] //los muebles saben su clasicicacion de que tipo son, incluye la basura
    const property ingredientes = [tomate1, queso1, masa1] //acá en realidad se pondrían las estaciones donde estan los ingredientes nadamas
    const property hornos = [horno] //la preparacion es un ingrediente más especial.

    method hayIngredienteAqui(position){
        return ingredientes.any({ingrediente => ingrediente.position() == position})
    }

    method ingredienteAqui(position) {
        return ingredientes.filter({ingrediente => ingrediente.position() == position}).head()
    }

    method hayMuebleAqui(position) {
        return muebles.any({mueble => mueble.position() == position})
    }

    method muebleAqui(position) {
      return muebles.filter({mueble => mueble.position() == position}).head()
    }

    method hayHornoAqui(position) {
        return hornos.any({horno => horno.position() == position})
    }

    method hayObjetoSolidoEn(position){
        return self.hayMuebleAqui(position) or self.hayHornoAqui(position)
    }

    method hayEspacioLibreAqui(position) {
      return self.hayMuebleAqui(position) and (self.muebleAqui(position).estaLibre() || self.muebleAqui(position).tieneUnaPiza()) //LOS MUEBLES PUEDEN TENER SOLO UN INGREDINTE ENCIMA.
    }

    method hayEstacionDeProcesamientoAqui(position) {
      return self.hayMuebleAqui(position) and self.muebleAqui(position).esParaProcesar()
    }

    method estacionDeProcesamientoAqui(position) {
      return muebles.filter({mueble => mueble.position() == position}).head()
    }

    method hayHornoVacioAqui(position){
        return self.hayHornoAqui(position) and self.hornoAqui(position).hayEspacioEnHorno()
    }

    method hornoAqui(position) {
      return hornos.filter({horno => horno.position() == position}).head()
    } 

    method hayBasuraAqui(position) {
      return not muebles.filter({mueble => mueble.esTacho()}).isEmpty()
    }

    method basuraAqui(position) {
      return muebles.filter({mueble => mueble.esTacho()}).head()
    }

    method hayMasaAqui(position) {
      return not ingredientes.filter({ingrediente => ingrediente.aceptaIngredientesEncima()}).isEmpty()
    }

    method masaAqui(position) {
      return ingredientes.filter({ingrediente => ingrediente.aceptaIngredientesEncima()}).head()
    }

    method seDejaIngredienteAqui(ingrediente, position){
      self.muebleAqui(position).recibirIngrediente(ingrediente)
    }
}