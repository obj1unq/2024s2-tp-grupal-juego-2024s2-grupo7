import mueblesBase.*
import personaBase.*
import comestibles.*
import ingredientesBase.*

import wollok.game.*

class Mesada inherits MuebleParaCocinar{

  override method cumpleCondicionRecibir(){ //o esta vacio o tiene una pizza
    return super() || self.tengoPiza()
  }

  override method recibir(chef){
    if(self.tengoPiza()){
      contenido.recibirIngrediente(chef.bandeja())
    } else {
      super(chef)
    }
  }

  override method procesar(){
    self.validarProcesar()
    contenido.serProcesado()
  }

  method validarProcesar(){
    if(not self.tieneIngrediente()){
      self.error("no hay ingrediente que procesar")
    }
  }

  method tieneIngrediente(){
    return self.tengoAlgo() and not self.tengoPiza() //si tiene algo y no es una pizza es un ingrediente
  }
}

class Horno inherits MuebleParaCocinar{
  override method accionDeRecibir(){
    self.cocinar()
  }
}

// class Mesada inherits Mueble(image ="mesada_ph.png") {
//   var contenido = bandejaVacia 

//   method contenido() {
//     return contenido
//   }

//   override method usarse(chef){ 
//     if(chef.llevoAlgo()){ 
//       self.validarRecibir(chef)
//       self.accionRecibir(chef)
//     } else {
//       self.validarDar(chef)
//       self.accionDar(chef)
//     }
//   }

//   method validarRecibir(chef){
//     if(not self.puedeRecibir(chef.bandeja())){ 
//       chef.error("No hay espacio para dejar algo aqui") 
//     }
//   }

//   method puedeRecibir(cosa){
//     return contenido.esVacio() or contenido.integraIngredientes()
//   }

//   method accionRecibir(chef){
//     const ingrediente = chef.bandeja()
//     if(self.tengoPizza()){
//       contenido.recibirIngrediente(ingrediente)
//       game.removeVisual(ingrediente)
//       chef.soltar()
//     } else { 
//       contenido = chef.bandeja()
//       chef.soltar()
//       contenido.serApoyado(position)
  
//     }  
//   }

//   method tengoPizza(){
//     return contenido.integraIngredientes()
//   }

//   method validarDar(chef){ 
//     if(not self.tengoAlgo()){ 
//       chef.error("No hay nada para recoger aqui")
//     }
//   }

//   method tengoAlgo() {
//      return not contenido.esVacio()  
//   }

//   method accionDar(chef) {
//     chef.recibir(contenido) 
//     contenido.serSostenido(chef)
//     self.eliminarLoDado()
//   }

//   method eliminarLoDado(){
//     contenido = bandejaVacia
//   }

// }

// class Horno inherits Mesada(image = "oven_0.png") {
//   var property temperatura = 0
  
//   override method accionRecibir(chef){
//     contenido = chef.bandeja()
//     game.removeVisual(contenido)
//     chef.soltar()
//     self.cocinar()
//   }

//   override method accionDar(chef) {
//     game.removeTickEvent(self)
//     game.addVisual(contenido)
//     chef.recibir(contenido) 
//     contenido.serSostenido(chef)
//     self.eliminarLoDado()  
//   }

//   override  method puedeRecibir(chef){ 
//     return not self.tengoAlgo() and chef.bandeja().integraIngredientes()
//   }

//   override method validarRecibir(chef) {
//     if(not self.puedeRecibir(chef)) {
//       chef.error("No puedo meter esto al horno")
//     }
    
//   }

//   method cocinar() { 
//     game.onTick(2500, self, {contenido.serCocinada(self)})
//     //game.onTick(2500, "subirle temperatura", {self.subirNivelDeHorno()})
//   } 

// }

class Tacho inherits Mueble(image = "pepita.png"){


  override method usarse(chef){
    self.validarUsarse(chef)
    game.removeVisual(chef.bandeja())
    chef.soltar()
  }

  method validarUsarse(chef) {
    if(not chef.llevoAlgo()) {
      chef.error("No tengo nada para tirar")
    }
  }

}

class PilaIngrediente inherits Tacho {


  override method usarse(chef){
    self.validarUsarse(chef)
    const ingrediente = self.nuevoIngrediente(chef)
    game.addVisual(ingrediente)
    chef.recibir(ingrediente)
    ingrediente.serSostenido(chef)
  }

  override method validarUsarse(chef) {
    if(chef.llevoAlgo()) {
      chef.error("Ya tengo algo en las manos")
    }
  }

   method nuevoIngrediente(chef)

 
}

class MesaDeProcesado inherits Tacho(image ="mesada_ph.png") {

  override method usarse(chef) {
    //self.validarUsarse(chef)
    chef.procesarIngrediente()
  }

}

object estacionTomate  inherits PilaIngrediente(image = "tomate_inicial.png", position = game.at(0, 5)){

  override method nuevoIngrediente(chef){
    return new Tomate(estadoPosition = new Sostenido(queLoSostiene = chef)) 
  }


}

object estacionMasa inherits PilaIngrediente(image = "masa_inicial.png", position = game.at(1,5)){

    override method nuevoIngrediente(chef){
      return new Masa(estadoPosition = new Sostenido(queLoSostiene = chef))
    }

}

object estacionQueso inherits PilaIngrediente(image = "queso_inicial.png", position = game.at(2,2)) {

  override method nuevoIngrediente(chef){
    return new Queso(estadoPosition = new Sostenido(queLoSostiene = chef))
  }

}

object estacionAceituna inherits PilaIngrediente(image = "aceituna_factory.png", position = game.at(1,2)) {

    override method nuevoIngrediente(chef){
      return new Aceituna(estadoPosition = new Sostenido(queLoSostiene = chef))
    }
  }

object estacionHongo inherits PilaIngrediente(image = "hongo_factory.png", position = game.at(3,2)){

  override method nuevoIngrediente(chef){
    return new Hongo(estadoPosition = new Sostenido(queLoSostiene = chef))
  }

}

object estacionHuevo inherits PilaIngrediente(image = "huevos_factory.png", position = game.at(4,2)){

  override method nuevoIngrediente(chef){
    return new Huevo(estadoPosition = new Sostenido(queLoSostiene = chef))
  }

}

object estacionAtun inherits PilaIngrediente(image = "atun_factory.png", position = game.at(7,2)) {

  override method nuevoIngrediente(chef){
    return new Atun(estadoPosition = new Sostenido(queLoSostiene = chef))
  }

}



// class Horno inherits Mueble(image = "oven_0.png") {
//   var property temperatura = 0

//   override method procesarIngredientes(){} //el horno no procesa ingredientes, solo cocina pero no pasa nada
  
//   override method accionRecibir(chef){
//     super(chef)
//     self.cocinar()
//   }

//   override  method puedeRecibir(cosa){ //para poder recibir el horno solo tiene que estar completamente vacio y solo acepta pizzas
//     return not self.tieneAlgo() and self.esPizza(cosa)
//   }

//   method cocinar() { 
//     game.onTick(2500, "cocinarContenido", {contenido.serCocinada()})
//     game.onTick(2500, "subirle temperatura", {self.subirNivelDeHorno()})
//   } 

//   method subirNivelDeHorno(){
//     temperatura = (temperatura + 1).min(3)
//     self.actualizarEstadoHorno()
//   }

//   method actualizarEstadoHorno() {
//     if (temperatura == 3) self.simularFuego()
//   }

//   method simularFuego() {
//     //esto sería mejor que hagamos que aparezca dibujos de humo arriba del horno y ya está
//   }

// }

// class Mesada inherits Mueble(image ="mesada_ph.png") {

//   override method accionRecibir(chef){
//     const ingrediente = chef.bandeja()
//     if(self.tienePiza()){ //si la mesada tiene una pizza entonces el ingrediente se agrega a la lista de la masa
//       contenido.recibirIngrediente(ingrediente)
//     } else { 
//       super(chef) //sino, el ingrediente se agrega arriba del mueble y listo, se tiene que ver ahí la imagen
//     }  
//   }

// }

// class Tacho inherits Mueble(image = ""){

//   override method procesarIngredientes(){} //el tacho no procesa ingredientes

//   override method accionRecibir(chef){
//     chef.bandeja(bandejaVacia) 
//     //remove visual acá? -> deja de existir, se elimina lo dado
//   }

//   //el tacho nunca le da nada al chef pq siempre va a aparecer como que no puede dar nada ya que su contenido siempre va a dar vacio porque nunca recibe algo

// }

