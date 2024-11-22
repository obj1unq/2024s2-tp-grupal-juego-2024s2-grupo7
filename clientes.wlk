import chefs.*
import comestibles.*
import objetosRecepcion.*


import wollok.game.*


class Cliente inherits Persona(position = game.at(0,0) , image = ""){ //la position esa es un placeholder -> la posicion en la que se inician debería ser en donde estaría la "puerta" -> para el gestor de clientes
    var pedidoQueEspero = []
    var emocion = neutral 
    var nivelDePaciencia = null //depende del tipo de cliente

    method avanzarAHacerPedido() {
      //podría ser un tipo de animación donde avanza paso por paso hasta llegar a la mesa de recepción para hacer el pedido -> como persona hereda el poder moverse
      self.generarPedido()
      self.decirPedido()
    }

    method decirPedido(){ //el chef debería poder preguntarle el pedido al cliente al interactuar las veces que quiera.
      //decir pedido puede mostrar una por una las imagenes de los ingredientes que quiere en la pizza 
    }

    method generarPedido() {
      pedidoQueEspero = [ingredienteSalsa, ingredienteQueso] + [self.ingredientePrincipalRandom()] 
    }
/*
CUANDO SE HAGA EL GESTIOR DE DESBLOQUEO TIENE QUE CAMBIAR LA LISTA DE INGREDIENTES DISPONIBLES 
*/
    method ingredientePrincipalRandom() {
      //gestor.ingredietesDisponibles().anyOne()
      return [ingredienteAceituna, ingredienteQueso, ingredienteAtun, ingredienteHongo].anyOne()
    }

    method recibirPedido(pedido) {
      self.reaccionarAPedido(pedido)
      emocion.mostrarse(self) 
      self.pagarPedido(pedido)
    }

    method reaccionarAPedido(pedido) {
      if(self.esLoQueEsperaba(pedido)){
        self.reaccionBuena()
      } else{
        nivelDePaciencia = nivelDePaciencia - 20
        self.reaccionMala()
      }
    }

    method esLoQueEsperaba(pedido){  //puede recibir un ingrediente solo pero eso lo va a hacer enojar.
      return self.esUnaPiza(pedido) and self.esLaPizzaQuePedi(pedido)
    }

    method esLaPizzaQuePedi(pedido){
      return pedido.ingredientes().map({ingrediente => ingrediente.sabor()}) == pedidoQueEspero 
    }

    method esUnaPiza(pedido){
        return  pedido.integraIngredintes() 
    }

    method reaccionBuena()

    method reaccionMala()
    method plataAPagarPorPedido(pedido) {
      return pedido.precio() * nivelDePaciencia / 100 
    }

    method pagarPedido(pedido) {
      caja.recibir(self.plataAPagarPorPedido(pedido))
    }

}

class ClienteNormal inherits Cliente(nivelDePaciencia = 100, image = "image_clieneNormal.png", nombre = "clienteNormal"){
  //el cliente normal podría no hacer nada
  override method reaccionBuena(){
    emocion = feliz
    self.celebrar()
  }

  method celebrar(){
    //animacion de que aparezcan estrellitas ?
    caja.recibirTip(self.valorTip())
  }

  method valorTip(){
    return 0.randomUpTo(100)
  }
  
  override method reaccionMala(){
    emocion = decepcionado
  }
}

class ClienteQuisquilloso inherits Cliente(nivelDePaciencia = 80, image = "image_clieneQuisquilloso.png", nombre = "clienteQuisquilloso"){
  
  override method reaccionBuena(){
    emocion = neutral
    //el quisquilloso NO da tips ni nada
  }
  
  override method reaccionMala(){
    emocion = enojado
    self.robarYMolestar()
  }

  method robarYMolestar(){
    caja.gastar(100) //siempre roba 100 pesos cunado el pedido no es el que quería 
    //hace que se vaya el cliente de atras enojado también
    //clienteAtras.reaccionMala() //se necesita algun metodo tal vez con el gestor de clientes que te de al cliente de atras y conozca también el de adelante -> tal vez con una lista
  }
}

class ClientePaciente inherits Cliente(nivelDePaciencia = 110, image = "image_clienePaciente.png", nombre = "clientePaciente"){
  override method reaccionBuena(){
    emocion = feliz
    //también deja tip
  }
  
  override method reaccionMala(){
    emocion = neutral
  }
}

class Emotion {
  const property image = ""

  method mostrarse(cliente){
    //game.addVisual(cliente.position().up()) //no sé como hacer que dure solo un rato la imagen
  }
}


object neutral inherits Emotion( image = "") {}

object feliz inherits Emotion( image = "") {}

object decepcionado inherits Emotion( image = "") {}

object enojado inherits Emotion( image = "") {}


