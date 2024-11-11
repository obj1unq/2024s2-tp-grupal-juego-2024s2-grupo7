import comestibles.*
import objetosCocina.*
import objetosParaTests.*

//HACER UNA CLASE POSICION DE OBJETO?
//juntar horno con mueble -> el horno ahora va a ser un mueble

object restaurante {

    const property muebles = [tacho3, mesada1, mesada2] //los muebles saben su clasificacion 
    //entonces poner la pila de ingredientes como un mueble y en ingredientes se manejan todos los ingredientes sueltos que esta moviendo el chef
    const property ingredientes = [tomate, queso, masa] //cambiar nombre a ingredientes sueltos -> porque acá guarda solo los ingredientes sueltos. NO TODOS 
    const property hornos = [horno] //excusa : después compras más hornos y los agregas y es el unico mueble que agregas
    const property filasDeClientes = []
//  
    method hayObjetoDeListaAqui(lista, position){
      return lista.any({objeto => objeto.position() == position})
    }

    method objetoDeListaAqui(lista, position) {
      return lista.filter({objeto => objeto.position() == position}).head() //esto es un find
    }

//
    method hayIngredienteAqui(position){
        return self.hayObjetoDeListaAqui(ingredientes, position) || self.hayPilaDeIngredientesAqui(position)
    }

    method ingredienteAqui(position) {
        return self.objetoDeListaAqui(ingredientes, position)
    }

    method hayPilaDeIngredientesAqui(position){
      return muebles.any({mueble => mueble.esPilaDeIngredientes()})
    }

    method hayMuebleAqui(position) { //falta una abstracion entre mueble y horno para no preguntar directamente a la cosa concreta
        return self.hayObjetoDeListaAqui(muebles, position)
    }

    method muebleAqui(position) {
      return self.objetoDeListaAqui(muebles, position)
    }

    method hayHornoAqui(position) {
        return self.hayObjetoDeListaAqui(hornos, position)
    }

    method hornoAqui(position) { //priorizar el polimorfismo y dejar los parentecis vacios
      return self.objetoDeListaAqui(hornos, position)
    }

    method hayObjetoSolidoEn(position){
        return self.hayMuebleAqui(position) or self.hayHornoAqui(position)
    }

    method hayEspacioLibreAqui(position) {
      return self.hayMuebleAqui(position) and self.muebleAqui(position).estaLibre() //LOS MUEBLES PUEDEN TENER SOLO UN INGREDINTE ENCIMA.
    }

    method seDejaIngredienteAqui(ingrediente, position){
      ingredientes.add(ingrediente)
      self.muebleAqui(position).recibirIngrediente(ingrediente)
    }

    method estacionDeProcesamientoAqui(position) {
      return muebles.filter({mueble => mueble.position() == position}).head()
    }

    method basuraAqui(position) {
      return muebles.filter({mueble => mueble.esTacho()}).head()
    }

    method masaAqui(position) {
      return ingredientes.filter({ingrediente => ingrediente.aceptaIngredientesEncima()}).head()
    }

    method hayEstacionDeProcesamientoAqui(position) {
      return self.hayMuebleAqui(position) and self.muebleAqui(position).esParaProcesar()
    }

    method hayHornoConEspacioAqui(position){
        return self.hornoAqui(position).hayEspacioEnHorno() //self.hayHornoAqui(position) and 
    }

    method hayBasuraAqui(position) {
      return not muebles.filter({mueble => mueble.esTacho() and mueble.position() == position}).isEmpty()
    }

    method hayMasaAqui(position) {
      return not ingredientes.filter({ingrediente => ingrediente.aceptaIngredientesEncima()}).isEmpty()
    }
//probar:
    method hayClienteAqui(position) {
      return self.hayObjetoDeListaAqui(filasDeClientes, position)
      //la factory de clientes tiene que agregar los clientes a la fila del restaurante
    }
    
    method clienteAqui(position) {
      return self.objetoDeListaAqui(filasDeClientes, position)
    }
    
}

