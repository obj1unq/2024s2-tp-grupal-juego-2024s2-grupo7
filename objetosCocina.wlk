import mapa.*
import comestibles.*
import restaurante.*
import chefs.*


import wollok.game.*

class Mueble {
  const property position = game.center() 
  const property image = "" 
  var contenido = bandejaVacia //es un objeto que representa el no tener nada
  //var property maxCapacidad = 1

  method usarse(chef){ //para que con 1 solo boton "interactuar" sea algo general y el mueble ve como se arregla en la interaccion
    if(not chef.tengoBandejaVacia()){ //si el chef tiene algo en su bandeja asume que tiene que recibir algo
      self.validarRecibir(chef)
      self.accionRecibir(chef)
    } else { //sino, cuando el chef no tiene nada en la bandeja asume que el chef intenta agarrar algo 
      self.validarDar(chef)
      self.accionDar(chef)
    }
  }

  method validarRecibir(chef){
    if(not self.estaLibre()){ //template method ya que en todos los muebles se le puede agregar ingredientes a la pizza menos en el horno, en el horno ya no se puede interactuar más con la piza por lo que lo unicop que acepta recibir es una pizza
      self.error("no hay espacio para dejar algo aqui")  //esta bien o mejor que lo diga el mueble?
      //chef
    }
  }

  method estaLibre(){ //para poder recibir es que no tiene nada encima o si tiene una pizza ya que estas aceptan ingredientes encima
    return not self.tieneAlgo() || self.tienePiza()
  }

  method tieneAlgo() { //que tiene algo significa que tiene cualquier cosa
     return not contenido.esVacio()  //esto es que no tiene nada = falso
  }

  method validarDar(chef){ //que el chef tenga espacio ya se cumple en la rama del if de usarse
    if(not self.tieneAlgo()){ //aca se fija si hay algo para dar
      self.error("no puedo agarrar algo si tengo las manos llenas o si no hay nada que agarrar")
      //chef
    }
  }

  method accionRecibir(chef){
    contenido = chef.bandeja()
    chef.soltar() //esto en el chef hace que tenga una bandeja vacia otra vez
  }

  method accionDar(chef){
    chef.recibir(self.objetoADar(chef))
    self.eliminarLoDado() //que ahora el mueble tiene de nuevo una bandeja vacia = nada
  }

  method objetoADar(chef){ //es diferente para las factories
    return contenido
  }

   method eliminarLoDado(){ //template method para las factories -> no hace nada eso ya que no tiene "contenido"
    contenido = bandejaVacia
   }

  method contenido(){
    return contenido
  }

    method tienePiza(){
    return contenido.aceptaIngredientesEncima()
  }

}

class Horno inherits Mueble{
  var property temperatura = 0

  override method accionRecibir(chef){
    super(chef)
    self.cocinar()
  }

  override method estaLibre(){ //para poder recibir el horno solo tiene que estar completamente vacio
    return not self.tieneAlgo()
  }

  method cocinar() { 
    game.onTick(2500, self, {contenido.serCocinada()})
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
    //esto sería mejor que hagamos que aparezca dibujos de humo arriba del horno y ya está
  }

}

class Mesada inherits Mueble{

  override method accionRecibir(chef){
    const ingrediente = chef.bandeja()
    if(self.tienePiza()){ //si la mesada tiene una pizza entonces el ingrediente se agrega a la lista de la masa
      contenido.recibirIngrediente(ingrediente)
    } else { 
      super(chef) //sino, el ingrediente se agrega arriba del mueble y listo, se tiene que ver ahí la imagen
    }  
    ingrediente.serDejadoAqui(self.position()) //REVISAR SI ESTO SIRVE DE ALGO
  }

}

class Tacho inherits Mueble{

  override method accionRecibir(chef){
    //mandarle un mensaje al chef de que si tiro la basura entonces cambie su imagen?
    chef.bandeja(bandejaVacia) 
    //remove visual acá? -> deja de existir, se elimina lo dado
  }

}

class PilaIngrediente inherits Mueble {

  override method usarse(chef){
    self.accionDar(chef)
  }

  override method eliminarLoDado(){}

  override method objetoADar(chef){
    return self.nuevoIngrediente(chef)
  }

  override method tieneAlgo() {
    return false
  }

  method nuevoIngrediente(chef)

}

object estacionTomate  inherits PilaIngrediente(image = "tomate_inicial.png", position = game.at(2, 2)){

  override method nuevoIngrediente(chef){
    return new Tomate(position= chef.position()) //debería aparecer dentro de la bandeja del chef
  }

}

object estacionMasa inherits PilaIngrediente(image = "masa_inicial.png", position = game.at(4,2)){

    override method nuevoIngrediente(chef){
      return new Masa(position= chef.position())
    }

}

object estacionQueso inherits PilaIngrediente(image = "queso_inicial.png", position = game.at(6,2)) {

  override method nuevoIngrediente(chef){
    return new Queso(position = chef.position())
  }

}

object estacionAceituna inherits PilaIngrediente(image = "aceituna_factory.png", position = game.at(9,5)) {

    override method nuevoIngrediente(chef){
      return new Aceituna(position = chef.position())
    }
  }

object estacionHongo inherits PilaIngrediente(image = "hongo_factory.png", position = game.at(9,7)){

  override method nuevoIngrediente(chef){
    return new Hongo(position=chef.position())
  }

}

object estacionHuevo inherits PilaIngrediente(image = "huevos_factory.png", position = game.at(9,3)){

  override method nuevoIngrediente(chef){
    return new Huevo(position=chef.position())
  }

}

object estacionAtun inherits PilaIngrediente(image = "atun_factory.png", position = game.at(9,1)) {

  override method nuevoIngrediente(chef){
    return new Atun(position = chef.position())
  }

}

class Dispencer inherits Mueble{} //hacer => opcional, para el final