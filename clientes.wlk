import adminNiveles.*
import personaBase.*
import comestibles.*
import objetosRecepcion.*
import adminClientes.* 

import wollok.game.*


class Cliente inherits Persona(position = game.at(86,15)){ 
    var pedidoQueEspero = []
    var emocion = neutral 
    var nivelDePaciencia = null 
    var manos = bandejaVacia

    method hacerPedido() {
      self.generarPedido()
      self.anunciarPedido()
      self.esperarPedido()
    }

    method generarPedido() {
      pedidoQueEspero = [ingredienteSalsa] + [self.ingredienteRandom()] + 
                        [self.ingredienteRandom()] + [self.ingredienteRandom()] 
    }

    method anunciarPedido() {
      game.say(self, self.pedidoAString())
      game.onTick(5000, self, {game.say(self, self.pedidoAString())})
    }

    method pedidoAString() { 
      return "Quiero una pizza con " + self.pedidoQueEspero().join(", ") + ", por favor!"
    }

    method pedidoQueEspero() {
      return pedidoQueEspero
    }

    method esperarPedido() {
      game.schedule(nivelDePaciencia, {self.irseSinNada()})

    }

    method irseSinNada() {
      self.reaccionMala()
      game.removeTickEvent(self)
    }

    method recibirPedido(pizza){
      manos = pizza
      game.removeVisual(manos)
      game.schedule(1000, {self.reaccionarAPedido()})
    }

    method ingredienteRandom() {
      return [ingredienteAceituna, ingredienteQueso, ingredienteAtun, ingredienteHongo].anyOne()
    }

    method reaccionarAPedido() {
      if(self.esLoQueEsperaba()){
        self.reaccionBuena()
      } else{
        self.reaccionMala()        
      }
    
    }
   

    method esLoQueEsperaba(){  
      return self.esUnaPizza() and self.esLaPizzaQuePedi()
    }

    method esLaPizzaQuePedi(){
      return manos.ingredientes().map({ingrediente => ingrediente.tipoIngrediente()}) == pedidoQueEspero 
    }

    method esUnaPizza(){
        return manos.integraIngredintes() 
    }

    method reaccionBuena() {
      self.pagarPedido()
      game.schedule(1000, {adminCliente.retirarCliente(self)})
    }

    method reaccionMala()

    method plataAPagarPorPedido() {
      return manos.precio() * nivelDePaciencia / 100 
    }

    method pagarPedido() {
      caja.recibir(self.plataAPagarPorPedido())
    }



}

class ClienteNormal inherits Cliente(nivelDePaciencia = 40000, image = "cliente_normal.png", name = "clienteNormal"){
  const disponibilidadParaTip = 50
  
  override method reaccionBuena(){ //cliente_normal.png
    emocion = feliz
    self.celebrar()
    super()
    
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

  override method irseSinNada() {
    super()
    game.schedule(1000, {adminCliente.retirarCliente(self)})
  }
}

class ClientePaciente inherits ClienteNormal(nivelDePaciencia = 45000, image = "cliente_paciente.png", name = "clientePaciente", disponibilidadParaTip = 100){
  
  override method reaccionMala(){ //cliente_paciente.png
    emocion = neutral
  }
}

class Emotion {
  const property image = ""

  method mostrarse(cliente){
    //game.addVisual(cliente.position().up()) //no sé como hacer que dure solo un rato la imagen -> ayuda con esto por favor
  }
}

class ClienteQuisquilloso inherits Cliente(nivelDePaciencia = 30000, image = "cliente_quisquilloso.png", name = "clienteQuisquilloso"){
  
  override method reaccionBuena(){ //cliente_quisquilloso.png
    emocion = neutral
    super()
  }
  
  override method reaccionMala(){
    emocion = enojado
    self.robar()
    game.schedule(1000, {adminCliente.retirarCliente(self)})
  }

  method robar(){
    caja.gastar(100) //siempre roba 100 pesos cunado el pedido no es el que quería 
  }
}



object neutral inherits Emotion( image = "") {}

object feliz inherits Emotion( image = "") {}

object decepcionado inherits Emotion( image = "") {}

object enojado inherits Emotion( image = "") {}
