import chefs.*
import comestibles.*
import objetosRecepcion.*


import wollok.game.*

/* NOTA:
  *SE NECESITA UN RETOQUE MAS PROLIJO PARA LOS CLIENTES Y DARLES VERDADERAMETE UN COMPORTAMIENTO DIFERENTE A LOS DIFERENTES TIPOS DE CLIENTES
  *hacer el objeto caja
  *HACER UN MEJOR ALGORITMO PARA DAR LAS IMAGENES DE LOS CLIENTES.
  *la paciencia no debe ser lo unico diferente entre los diferentes tipos de clientes, hay que agregar que tengan un comportamiento/ respuesta diferente a cosas
  -> por ejemplo el cliente quisquilloso puede enojarse entonces se va sin pagar y te roba plata (de la caja)
*/

class Cliente inherits Persona(position = game.at(0,0) , image = ""){ //la position esa es un placeholder -> la posicion en la que se inician debería ser en donde estaría la "puerta" -> para el gestor de clientes
    var property pedidoQueEspero = []
    var emocion = neutral //las emocines son estados
    var nivelDePaciencia = null //depende del tipo de cliente

    method avanzarAHacerPedido() {
      //podría ser un tipo de animación donde avanza paso por paso hasta llegar a la mesa de recepción para hacer el pedido -> como persona hereda el poder moverse
      self.generarPedido()
      self.decirPedido()
    }

    method decirPedido(){ //el chef debería poder preguntarle el pdedido al cliente al interactuar las veces que quiera.
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

    // method reaccionBuena(){ //-> o sino que esto se defina por cliente -> por ejemplo el impaciente no se pone feliz sino que no sigue impaciente
    //   emocion = feliz 
    // }
 
    // method reaccionMala(){ //-> o sino que esto se defina por cliente -> ejemplo el impaciente se enoajo y es otra emocion
    //   emocion = decepcionado
    // } 

    method plataAPagarPorPedido(pedido) {
      return pedido.precio() * nivelDePaciencia / 100 
    }

    method pagarPedido(pedido) {
      caja.recibir(self.plataAPagarPorPedido(pedido))
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


class ClienteNormal inherits Cliente(nivelDePaciencia = 100, image = "image_clieneNormal.png", nombre = "clienteNormal"){
  //el cliente normal podría no hacer nada
  override method reaccionBuena(){
    emocion = feliz
    self.celebrar()
  }

  method celebrar(){
    //animacion de que aparezcan estrellitas ?
    //que aparezca arriba de la caja un cartelito o imagen de "tip!!"
    caja.recibir(self.valorTip())

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
    emocion = feliz
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
  //el cliente paciente te puede ragalar plata y dejar flores en las mesas
  override method reaccionBuena(){
    emocion = feliz
    //también deja tip
  }
  
  override method reaccionMala(){
    emocion = neutral
  }
}

const cliente = new ClienteNormal() //lo agrego para probar en la consola al cliente

