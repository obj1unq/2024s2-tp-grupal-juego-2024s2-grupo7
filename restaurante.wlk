import comestibles.*
import objetosCocina.*
import objetosParaTests.*

//HACER UNA CLASE POSICION DE OBJETO?
object restaurante {

    const property muebles = [tacho3, mesada1, mesada2] //los muebles saben su clasicicacion de que tipo son, incluye la basura
    const property ingredientes = [tomate, queso, masa] //acá en realidad se pondrían las estaciones donde estan los ingredientes y después se registra todo ingrediente que se deje en alguna mesada
    const property hornos = [horno]
//
    method hayIngredienteAqui(position){
        return ingredientes.any({ingrediente => ingrediente.position() == position})
    }

    method ingredienteAqui(position) {
        return ingredientes.filter({ingrediente => ingrediente.position() == position}).head()
    }
//
    method hayMuebleAqui(position) {
        return muebles.any({mueble => mueble.position() == position})
    }

    method muebleAqui(position) {
      return muebles.filter({mueble => mueble.position() == position}).head()
    }
//
    method hayHornoAqui(position) {
        return hornos.any({horno => horno.position() == position})
    }

        method hornoAqui(position) {
      return hornos.filter({horno => horno.position() == position}).head()
    }

    method hayObjetoSolidoEn(position){
        return self.hayMuebleAqui(position) or self.hayHornoAqui(position)
    }

    method hayEspacioLibreAqui(position) {
      return self.hayMuebleAqui(position) and self.muebleAqui(position).estaLibre() //LOS MUEBLES PUEDEN TENER SOLO UN INGREDINTE ENCIMA.
    }

    method seDejaIngredienteAqui(ingrediente, position){
      ingredientes.add(ingrediente)
//      ingrediente.serDejadoAqui(position)
      self.muebleAqui(position).recibirIngrediente(ingrediente)
    }

    method seSacaIngredienteAqui(position) {
      self.muebleAqui(position).entregarIngredienteEncima()
      ingredientes.remove(self.ingredienteAqui(position))
    }

//VER SI SACAR:

    method estacionDeProcesamientoAqui(position) {
      return muebles.filter({mueble => mueble.position() == position}).head()
    }

    method basuraAqui(position) {
      return muebles.filter({mueble => mueble.esTacho()}).head()
    }

    method masaAqui(position) {
      return ingredientes.filter({ingrediente => ingrediente.aceptaIngredientesEncima()}).head()
    }

//VER SI DELEGAR AL CHEF:?

    method hayEstacionDeProcesamientoAqui(position) {
      return self.hayMuebleAqui(position) and self.muebleAqui(position).esParaProcesar()
    }

    method hayHornoVacioAqui(position){
        return self.hayHornoAqui(position) and self.hornoAqui(position).hayEspacioEnHorno()
    }

    method hayBasuraAqui(position) {
      return not muebles.filter({mueble => mueble.esTacho()}).isEmpty()
    }

    method hayMasaAqui(position) {
      return not ingredientes.filter({ingrediente => ingrediente.aceptaIngredientesEncima()}).isEmpty()
    }
    
}

