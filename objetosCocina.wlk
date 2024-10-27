import comestibles.*
import restaurante.*
import Chefs.*


import wollok.game.*


class Horno {
  const property position = game.at(4, 4)
  var image = "" //ponerle una imagen base normal
  var property temperatura = 0
  var property contenido = [] 
  
  method recibir(pizza) {
      self.validarRecibirPizza()
      self.contenido().add(pizza)      
  }

  method validarRecibirPizza() {
    if(not self.hayEspacioEnHorno()){ //podría cambiarse la capacidad del horno si es por nivel o puntos y ahí se le pone en variable.
      self.error("ya hay cosas calentandose")
    }
  }

  method hayEspacioEnHorno(){
    return contenido.isEmpty() || contenido.size() < 2
  }

  method hayAlMenos1Pizza() {
    return not contenido.isEmpty()
  }

  method sacaDelHorno(chef) {
    chef.recibirIngrediente(self.primeraPizzaEnHorno())
    contenido.remove(self.primeraPizzaEnHorno())
  }

  method primeraPizzaEnHorno() {
    return contenido.head()
  }

  method cocinar() { 
    game.onTick(2500, self, {
                                contenido.forEach({pizza => pizza.serCocinada()})  
                            })
    game.onTick(2500, self, {self.subirNivelDeHorno()})
  } 

  method subirNivelDeHorno(){
    temperatura = (temperatura + 1).min(3)
    self.actualizarEstadoHorno()
  }

  method actualizarEstadoHorno() {
    if (temperatura == 3) self.simularFuego()
  }

  method simularFuego() {
    if(image == "ovenFuego1.png") {
            image = "ovenFuego2.png"
          } else 
            image = "ovenFuego1.png" 
  }

}

class Mueble {
  const property position = game.center()
  const property image = ""
  

  method esMuebleDeCocina(){
    return false
  }

  method esParaProcesar(){
    return false
  }

  method estaLibre(){
    return false
  }

  method esPilaDeIngredientes(){
    return false
  }

  method esTacho() {
    return false
  }

}

class Mesada inherits Mueble{
  var property cosasEncima = bandejaVacia

  override method esMuebleDeCocina() {
    return true 
  }

  override method esParaProcesar(){
    return true
  }

  override method estaLibre(){
    return cosasEncima.esBandejaVacia() || self.tieneUnaPiza()
  }

  method tieneUnaPiza(){
    return cosasEncima.aceptaIngredientesEncima()
  }
  method recibirIngrediente(ingrediente) {
    if(self.tieneUnaPiza()){
      cosasEncima.recibirIngrediente(ingrediente)
      ingrediente.serDejadoAqui(cosasEncima.position())
    } else{
      cosasEncima = ingrediente
      ingrediente.serDejadoAqui(self.position())
    }
  }

  method entregarIngredienteEncima(){
    //cosasEncima.remove(self.cosaEncima())
    cosasEncima = bandejaVacia
  }
}

class Tacho inherits Mueble{

  override method esTacho() {
    return true
  }
  method recibirBasura(chef) {
    //o mandarle un mensaje al chef de que si tiro la basura entonces cambie su imagen
    chef.image(self.chefBandejaVacia(chef))
    chef.bandeja(bandejaVacia) 
  }

  method chefBandejaVacia(chef) {
    return chef.nombre() + "_bandejaVacia.png" //se necesita esa imagen
  }

}

class Dispencer inherits Mueble{
  override method esMuebleDeCocina(){
    return false
  }

  override method esParaProcesar(){
    return false
  }

  override method estaLibre() {
    return false
  }

  override method esPilaDeIngredientes(){
    return false
  }
}

/*
las pilas de ingredientes deberian ir en muebles e instanciar un nuevo ingrediente cada vez que se precion x en frente de ellas.
*/