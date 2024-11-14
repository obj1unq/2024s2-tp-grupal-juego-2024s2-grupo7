import mapa.*
import comestibles.*
import restaurante.*
import chefs.*


import wollok.game.*

class Mueble {
  const property position = game.center() 
  const property image = "" 
  var contenido = bandejaVacia //es un objeto que representa el no tener nada

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
    if(not self.puedeRecibir()){ //template method ya que en todos los muebles se le puede agregar ingredientes a la pizza menos en el horno, en el horno ya no se puede interactuar más con la piza por lo que lo unicop que acepta recibir es una pizza
      self.error("no hay espacio para dejar algo aqui")  //esta bien o mejor que lo diga el mueble?
      //chef
    }
  }

  method puedeRecibir(){
    return self.estaLibre()
  }

  method estaLibre(){ //para poder recibir es que no tiene nada encima o si tiene una pizza ya que estas aceptan ingredientes encima
    return not self.tieneIngrediente() || self.tienePiza()
  }

  method tieneAlgo() { //que tiene algo significa que tiene cualquier cosa -> podría ser un tiene ingrediente
     return not contenido.esVacio()  //esto es que no tiene nada 
  }

  method tienePiza(){
    return contenido.integraIngredintes() 
  }

  method tieneIngrediente(){
    return contenido.puedeIntegrarse()
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
    contenido.serDejadoAqui(position) //esto en el horno debería cambiar y no verse el ingediente encima del horno, tampoco en el tacho de basura
  }

  method accionDar(chef){
    const ingrediente = self.objetoADar(chef)
    chef.recibir(ingrediente) //tal vez se podría delegar al chef que le diga al ingrediente que debe ser sostenido por el
    ingrediente.serSostenido(chef)
    self.eliminarLoDado() //que ahora el mueble tiene de nuevo una bandeja vacia = nada
  }

  method objetoADar(chef){ //es diferente para las factories por eso tenerlo como template
    return contenido
  }

   method eliminarLoDado(){ //también para las factories -> no hace nada eso ya que no tiene "contenido"
    contenido = bandejaVacia
   }

  method contenido(){
    return contenido
  }

   method procesarIngredientes(){
    self.validarProcesarIngrediente()
    contenido.serProcesado()
   }

   method validarProcesarIngrediente(){
    if(not self.tieneIngrediente()){
      self.error("no hay ingrediente que procesar")
      //chef
    }
   }

}

class Horno inherits Mueble{ //ahora el horno recibe todo tipo de cosas que le quieras meter -> habrá que hacer una imagen para los ingrediente de "quemado" que puede ser la misma para todos o cambiar que el horno solo reciba pizzas
  var property temperatura = 0

  override method accionRecibir(chef){
    super(chef)
    self.cocinar()
  }
  override  method puedeRecibir(){ //para poder recibir el horno solo tiene que estar completamente vacio
    return not self.tieneAlgo()
  }

  method cocinar() { 
    game.onTick(2500, "cocinarContenido", {contenido.serCocinada()})
    game.onTick(2500, "subirle temperatura", {self.subirNivelDeHorno()})
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

  override method image() {
    return "oven_0.png"
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
  }

  override method image() {
    return  "mesada_ph.png"
    }

}

class Tacho inherits Mueble{

  override method accionRecibir(chef){
    chef.bandeja(bandejaVacia) 
    //remove visual acá? -> deja de existir, se elimina lo dado
  }

}

class PilaIngrediente inherits Mueble {

  override method usarse(chef){
    self.accionDar(chef)
  }

  override method eliminarLoDado(){} //no se usa porque tiene infinitos elementos encima la pila, no solo 1 contenido

  override method objetoADar(chef){
    return self.nuevoIngrediente(chef)
  }

  override method puedeRecibir() { //no recive nada a diferencia de otros muebles, solo da
    return false
  }

  method nuevoIngrediente(chef) //depende de la pila de ingredientes

}

object estacionTomate  inherits PilaIngrediente(image = "tomate_inicial.png", position = game.at(0, 5)){

  override method nuevoIngrediente(chef){
    return new Tomate(position= chef.position()) //debería aparecer dentro de la bandeja del chef
  }


}

object estacionMasa inherits PilaIngrediente(image = "masa_inicial.png", position = game.at(0,5)){

    override method nuevoIngrediente(chef){
      return new Masa(position= chef.position())
    }

}

object estacionQueso inherits PilaIngrediente(image = "queso_inicial.png", position = game.at(2,2)) {

  override method nuevoIngrediente(chef){
    return new Queso(position = chef.position())
  }

}

object estacionAceituna inherits PilaIngrediente(image = "aceituna_factory.png", position = game.at(1,2)) {

    override method nuevoIngrediente(chef){
      return new Aceituna(position = chef.position())
    }
  }

object estacionHongo inherits PilaIngrediente(image = "hongo_factory.png", position = game.at(3,2)){

  override method nuevoIngrediente(chef){
    return new Hongo(position=chef.position())
  }

}

object estacionHuevo inherits PilaIngrediente(image = "huevos_factory.png", position = game.at(4,2)){

  override method nuevoIngrediente(chef){
    return new Huevo(position=chef.position())
  }

}

object estacionAtun inherits PilaIngrediente(image = "atun_factory.png", position = game.at(7,2)) {

  override method nuevoIngrediente(chef){
    return new Atun(position = chef.position())
  }

}


//solo si alcanza el tiempo: 

class Dispencer inherits Mueble{} //hacer => opcional, para el final -> estos implican seleccionar un numero también