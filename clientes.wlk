import personaBase.*
import comestibles.*
import objetosRecepcion.*
import adminClientes.* 

import wollok.game.*

//se necesitan comentarios sobre los onTick y Schedules, no los entiendo


class Cliente inherits Persona(position = game.at(88,20)){ 
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
    }
    
    method text(){
      return self.pedidoAString()
    }

    method textColor(){
      return "#000000"
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
      game.removeTickEvent(self)  
      manos = pizza
      game.removeVisual(manos)
      manos.ocultarIngredientes()
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
      self.mostrarReaccion()
    }

    method mostrarReaccion(){ 
      emocion.mostrarse(self)
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
      game.removeTickEvent(self)
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

class ClienteNormal inherits Cliente(nivelDePaciencia = 75000, image = "cliente_normal.png", name = "cliente_normal"){
  const disponibilidadParaTip = 50
  
  override method reaccionBuena(){ 
    emocion = feliz
    self.celebrar()
    super()
  }

  method celebrar(){
    caja.recibirTip(self.valorTip())
  }

    method valorTip(){
    return 0.randomUpTo(disponibilidadParaTip)
  }
  
  override method reaccionMala(){
    emocion = decepcionado
    self.pagarPedido()
  }

  override method irseSinNada() {
    super()
    game.schedule(1000, {adminCliente.retirarCliente(self)})
  }
}

class ClientePaciente inherits ClienteNormal(nivelDePaciencia = 120000, image = "cliente_paciente.png", name = "cliente_paciente", disponibilidadParaTip = 20){
  
  override method reaccionMala(){ 
    emocion = neutral
  }
}

class ClienteQuisquilloso inherits Cliente(nivelDePaciencia = 50000, image = "cliente_quisquilloso.png", name = "cliente_quisquilloso"){
  
  override method reaccionBuena(){ 
    emocion = neutral
    super()
  }
  
  override method reaccionMala(){
    game.removeTickEvent(self)
    emocion = enojado
    self.robar() 
    game.schedule(1000, {adminCliente.retirarCliente(self)})
  }

  method robar(){
    caja.gastar(100) //siempre roba 100 pesos cunado el pedido no es el que quería 
  } 
}


class Emotion {
  const nombreEmocion = null

  method mostrarse(cliente){
    cliente.image(""+ cliente.name() + "_" + nombreEmocion + ".png")
  }
}

object neutral inherits Emotion( nombreEmocion = "neutral") {}

object feliz inherits Emotion( nombreEmocion = "feliz") {}

object decepcionado inherits Emotion( nombreEmocion = "decepcionado") {}

object enojado inherits Emotion( nombreEmocion = "enojado") {}
