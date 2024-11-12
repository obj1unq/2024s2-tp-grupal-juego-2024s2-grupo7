import chefs.*
import comestibles.*


import wollok.game.*

/*SE NECESITA UN RETOQUE MAS PROLIJO PARA LOS CLIENTES Y DARLES VERDADERAMETE UN COMPORTAMIENTO DIFERENTE A LOS DIFERENTES TIPOS DE CLIENTES*/

class Cliente inherits Persona(position = game.at(0,7) /*o donde esté la puerta*/, image = ""){
    var property pedidoQueEspero = []
    var property emocion = neutral //las emocines son estados
    var nivelDePaciencia = null //depende del tipo de cliente

    method avanzarAHacerPedido() {
      //podría ser un tipo de animación donde avanza paso por paso hasta llegar a la mesa de recepción para hacer el pedido
      self.generarPedido()
      self.decirPedido()
    }

    method decirPedido(){
      //aca debería aparecer una imagen del pedido que quiere. una imagen aparte arriba del cliente y solo dure x minutos
    }

    method generarPedido() {
      const ingredientePrincipal = self.ingredientePrincipalRandom()

      pedidoQueEspero = [ingredienteTomate, ingredienteQueso] + [ingredientePrincipal]

    }

    method ingredientePrincipalRandom() {
      const ingredientesAElegir = [ingredienteAceituna, ingredienteQueso, ingredienteAtun, ingredienteHongo]
      return ingredientesAElegir.randomized().head()
    }

    method recibirPedido(pedido) {
      self.reaccionarAPedido(pedido)
      emocion.mostrarse(self)
      self.pagarPedido(pedido)
    }

    method reaccionarAPedido(pedido) {
      if(self.esLoQueEsperaba(pedido)){
        emocion = feliz 
      } else{
        nivelDePaciencia = nivelDePaciencia - 20
        emocion = decepcionado
      }
    }

    method esLoQueEsperaba(pedido){  //puede recibir un ingrediente solo pero eso lo va a hacer enojar.
      return self.esUnaPiza(pedido) and self.esLaPizzaQuePedi(pedido)
    }

    method esLaPizzaQuePedi(pedido){
      return pedido.ingredientes().map({ingrediente => ingrediente.sabor()}) == pedidoQueEspero 
    }

    method esUnaPiza(pedido){
        return  pedido.aceptaIngredientesEncima()
    }

    method plataAPagarPorPedido(pedido) {
      return pedido.precio() * nivelDePaciencia / 100 
    }

    method pagarPedido(pedido) {
      //caja.recibir(self.plataAPagarPorPedido(pedido))
      //hacer caja.
    }
}

object neutral {
  method mostrarse(cliente){}
}
object feliz {
  const property image = "imagen emotion feliz"
  method mostrarse(cliente){
    //game.addVisual(cliente.position().up()) //no sé como hacer que dure solo un rato la imagen
  }
}
object decepcionado {
  const property image = "imagen emotion decepcionado/ enojado/ triste"
  method mostrarse(cliente){
    //game.addVisual(cliente.position().up()) //no sé como hacer que dure solo un rato la imagen
  }
}

class ClienteNormal inherits Cliente(nivelDePaciencia = 100, image = "image_clieneNormal.png", nombre = "clienteNormal"){}

class ClienteQuisquilloso inherits Cliente(nivelDePaciencia = 80, image = "image_clieneQuisquilloso.png", nombre = "clienteQuisquilloso"){}

class ClientePaciente inherits Cliente(nivelDePaciencia = 110, image = "image_clienePaciente.png", nombre = "clientePaciente"){}

//HACER UN MEJOR ALGORITMO PARA DAR LAS IMAGENES DE LOS CLIENTES.

const cliente = new ClienteNormal() //lo agrego para probar en la consola al cliente

/*
  la paciencia no debe ser lo unico diferente entre los diferentes tipos de clientes, hay que agregar que tengan un comportamiento/ respuesta diferente a cosas
  por ejemplo el cliente quisquilloso puede enojarse entonces se va sin pagar y te roba plata (de la caja)
*/
