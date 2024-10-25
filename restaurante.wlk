import comestibles.*
import objetosCocina.*

object restaurante {

    const property muebles = #{} //los muebles saben su clasicicacion de que tipo son
    const property ingredientes = #{} //acá en realidad se pondrían las estaciones donde estan los ingredientes nadamas
    const property hornos = #{} //la preparacion es un ingrediente más especial.

    method hayIngredienteAqui(direccion){
        return ingredientes.any({ingrediente => ingrediente.position() == direccion})
    }

    method ingredienteAqui(direccion) {
        return ingredientes.filter({ingrediente => ingrediente.position() == direccion}).head()
    }

    method hayMuebleAqui(direccion) {
        return muebles.any({mueble => mueble.position() == direccion})
    }

    method hayHornoAqui(direccion) {
        return hornos.any({horno => horno.position() == direccion})
    }

    method hayObjetoSolidoEn(position){
        return //hacer
    }

    method hayEspacioLibreAqui(position) {
      return //
    }

    method hayEstacionDeProcesamientoAqui(position) {
      return //
    }

    method hayHornoVacioAqui(position){
        return //
    } 

    method hornoVacioAqui(position) {
      return //
    }

    method hayBasuraAqui(position) {
      return //
    }

    method basuraAqui(position) {
      return //
    }

    method hornoAqui(position) {
      return //
    }
}