import personaBase.*
import comestibles.*
import objetosRecepcion.*
import adminClientes.* 

import wollok.game.*


class Cliente inherits Persona(position = game.at(8,4)){ //la position esa es un placeholder -> la posicion en la que se inician debería ser en donde estaría la "puerta" -> para el gestor de clientes
    var pedidoQueEspero = []
    var emocion = neutral 
    var nivelDePaciencia = null //depende del tipo de cliente
    const manos = bandejaVacia

    method hacerPedido() {
      //animacion avanzar a pedido -> lo maneja el gestor?
      self.generarPedido()
      self.decirPedido()
      self.esperarPedido()
    }

    method generarPedido() {
      pedidoQueEspero = [ingredienteSalsa, ingredienteQueso] + [self.ingredienteRandom()] + [self.ingredienteRandom()] //puede repetirse como puede no repetirse, hay pizzas de 3 o de 4 ingredientes entonces
    }
//el chef debería poder preguntarle el pedido al cliente al interactuar las veces que quiera.
    method decirPedido(){ 
      //imagenes o strings uno por uno de los ingredientes del pedido. -> el que sea más facil
      self.anunciarPedido()
      //self.mostrarPedido()
    }

    // method mostrarPedido(){
    //   //con un forheach cada ingrediente del pedido se muestra la imagen inicial del ingrediente y que dure un ratito cada imagen?
    // }

    method anunciarPedido() {
      game.say(self, self.pedidoAString())
    }

    method pedidoAString() { //FALLA POR LA SALSA -> YA ES UN TIPO
      return "Quiero una pizza con_" //+ pedidoQueEspero.sum({i => i.tipoIngrediente().toString()}) 
      //-> la suma de strings así es valida??
    }
    //Los ingredientes podrian tener un metodo que sea nombre o algo asi y que simplemente devuelva un string con
    //el nombre del ingrediente como queremos que aparezca en el cartelito del pedido

    method esperarPedido() {
      //game.onTick(10000, "anunciar", {self.anunciarPedido()})
      //game.onTick(1000, "recoger", {self.recogerPedido()})
      game.schedule(nivelDePaciencia, {self.reaccionarAServicio()}) //no se como funciona pero me imagino que es una cuenta regresiva para que se quede sin paciencia?

      //{self.irseSinNada()}
      //podría ser un {self.reaccionarAServicio()}
    }

    //cuando se le entrega la pizza tambien se reaccion al servicio -> al pedido y se cancela el schedule?

    method reaccionarAServicio(){ //hay que cortar ese schedule en algun momento?
      if(manos.esVacio()) {
        self.reaccionMala()    //-> incluye el irse
      } else {
        self.reaccionarAPedido()
      }
    }

    // method dejarDePedir() {
    //   game.removeTickEvent("anunciar")
    //   game.removeTickEvent("recoger")
    // }

    method recibirPedido(pedido){
      self.reaccionarAServicio()
    }


    method ingredienteRandom() {
      //gestor.ingredietesDisponibles().anyOne()
      return [ingredienteAceituna, ingredienteQueso, ingredienteAtun, ingredienteHongo].anyOne()
    }

    /*method recibirPedido(pedido) {
      self.reaccionarAPedido(pedido)
      emocion.mostrarse(self) 
      self.pagarPedido(pedido)
    }*/

    method reaccionarAPedido() {
      if(self.esLoQueEsperaba()){
        self.reaccionBuena()
      } else{
        //nivelDePaciencia = nivelDePaciencia - 20
        self.reaccionMala()        
      }
      self.irse()
    }
    // Para mi lo de restar paciencia, pagar, irse, etc deberia estar todo dentro de las reacciones -> no entiendo esto 

    method esLoQueEsperaba(){  //puede recibir un ingrediente solo pero eso lo va a hacer enojar.
      return self.esUnaPizza() and self.esLaPizzaQuePedi()
    }

    method esLaPizzaQuePedi(){
      return manos.ingredientes().map({ingrediente => ingrediente.tipoIngrediente()}) == pedidoQueEspero 
    }

    method esUnaPizza(){
        return manos.integraIngredintes() 
    }

    method reaccionBuena()

    method reaccionMala()

    method irse(){ //hacer -> 
    //animacion dramatica que algo pase??? o solo
    game.removeVisual(self)
    } 

    method plataAPagarPorPedido(pedido) {
      return pedido.precio() * nivelDePaciencia / 100 
    }

    method pagarPedido(pedido) {
      caja.recibir(self.plataAPagarPorPedido(pedido))
    }



}

class ClienteNormal inherits Cliente(nivelDePaciencia = 100, image = "image_clieneNormal.png", name = "clienteNormal"){
  const disponibilidadParaTip = 50
  
  override method reaccionBuena(){
    emocion = feliz
    self.celebrar()
  }

  method celebrar(){
    //animacion de que aparezcan estrellitas ? -> como los estados
    caja.recibirTip(self.valorTip())
  }

    method valorTip(){
    return 0.randomUpTo(disponibilidadParaTip)
  }
  
  override method reaccionMala(){
    emocion = decepcionado
  }
}

class ClientePaciente inherits ClienteNormal(nivelDePaciencia = 110, image = "image_clienePaciente.png", name = "clientePaciente", disponibilidadParaTip = 100){
  
  override method reaccionMala(){
    emocion = neutral
  }
}

class Emotion {
  const property image = ""

  method mostrarse(cliente){
    //game.addVisual(cliente.position().up()) //no sé como hacer que dure solo un rato la imagen -> ayuda con esto por favor
  }
}

class ClienteQuisquilloso inherits Cliente(nivelDePaciencia = 80, image = "image_clieneQuisquilloso.png", name = "clienteQuisquilloso"){
  
  override method reaccionBuena(){
    emocion = neutral
    //el quisquilloso NO da tips ni nada
  }
  
  override method reaccionMala(){
    emocion = enojado
    self.robar()
  }

  method robar(){
    caja.gastar(100) //siempre roba 100 pesos cunado el pedido no es el que quería 
    //hace que se vaya el cliente de atras enojado también
    //clienteAtras.reaccionMala() //se necesita algun metodo tal vez con el gestor de clientes que te de al cliente de atras y conozca también el de adelante -> tal vez con una lista
  }
}



object neutral inherits Emotion( image = "") {}

object feliz inherits Emotion( image = "") {}

object decepcionado inherits Emotion( image = "") {}

object enojado inherits Emotion( image = "") {}
