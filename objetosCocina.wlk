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
    return contenido.zise() < 2
  }

  method hayAlMenos1Pizza() {
    return contenido.notEmpty()
  }

  method sacaDelHorno(chef) {
    chef.bandeja(self.primeraPizzaEnHorno())
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
            image == "ovenFuego1.png" 
  }

}

class Tacho {

  const property position = game.center()
  const property image = "" 

  method recibirBasura(chef) {
    chef.image(self.chefBandejaVacia(chef))
    chef.bandeja(bandejaVacia) 
  }

  method chefBandejaVacia(chef) {
    return chef.nombre() + "" + "_bandejaVacia.png" //se necesita esa imagen
  }

}

class Mueble {
  const property position = game.center()
  const property image = ""
  

  method esMuebleDeCocina()

  method esParaProcesar()

  method estaLibre()

}

class Mesada inherits Mueble{
  var property cosasEncima = []

  override method esMuebleDeCocina() {
    return true 
  }

  override method esParaProcesar(){
    return true
  }

  override method estaLibre(){
    return cosasEncima.isEmpty() || self.tieneUnaPiza()
  }

  method cosaEncima() {
    return cosasEncima.head()
  }

  method tieneUnaPiza(){
    return not cosasEncima.isEmpty() and self.cosaEncima().aceptaIngredientesEncima()
  }

  method recibirIngrediente(ingrediente) {
    if(not self.estaLibre() and self.tieneUnaPiza()){
      const objetoAqui = cosasEncima.head()
      objetoAqui.recibirIngrediente(ingrediente)
    } else{
      cosasEncima.add(ingrediente)
    }
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
}

/*
muebles:
-es mueble de cocina = t/f -> si es mueble de cocina es una estacion para procesar, sino es un dispencer. los dicspencer son otra clase que 1 va a ser para postrees otro para bebidas.
-unico lugar donde se pueden "procesar" los ingredientes son las mesadas
*/