import adminCartel.*
import personaBase.*
import comestibles.*
import objetosRecepcion.*
import adminClientes.* 

import wollok.game.*


class Cliente inherits Persona(position = game.at(88,20)){ 
    var pedidoQueEspero = []
    var emocion = neutral 
    var nivelDePaciencia = null
    var property manos = bandejaVacia

    method emocion() {
      return emocion
    }

    method pedidoQueEspero(_pedidoQueEspero) {
      pedidoQueEspero = _pedidoQueEspero
    }

    method ubicacion(_ubicacion) {
      ubicacion = _ubicacion
    }

    method hacerPedido() {
      self.generarPedido()
      self.anunciarPedido()
      self.esperarPedido()
    }

    method generarPedido() {
      pedidoQueEspero = [ingredienteSalsa] + [self.ingredienteRandom()] + 
                        [self.ingredienteRandom()] + [self.ingredienteRandom()] 
    }

    method textoCartel() {
      return ""
    }

    method texto() {
      return self.pedidoAString()
    }

    method posicionCartel() {
      return game.at(96,36)
    }

    method posicionTexto() {
      return game.at(107,41)
    }

    method anunciarPedido() { 
      adminCartel.nuevoCartel(self, 5000, "text_box_big.png")
      adminCartel.nuevoTexto(self, 5000)
    }
    
    method pedidoAString() { 
      return "Quiero una pizza con ".concat(self.ingredienteAString(0)).concat(",
       ").concat(self.ingredienteAString(1)).concat(", ").concat(self.ingredienteAString(2)).concat(", 
       ").concat(self.ingredienteAString(3) ).concat(", por favor!")
    }

    method ingredienteAString(indice) {
      return (pedidoQueEspero.get(indice).toString())
    }

    method pedidoQueEspero() {
      return pedidoQueEspero
    }

    method esperarPedido() {
      game.schedule(nivelDePaciencia, {self.irseSinNada()})
      //El nivel de paciencia es el tiempo que espera el cliente antes de irse sin nada, este schedule
      // se encarga de ejecutar irseSinNada una vez que se le termina la paciencia al cliente
    }

    method irseSinNada() {
      self.reaccionMala()

    }

    method recibirPedido(pizza){
  
      manos = pizza
      game.removeVisual(manos)
      self.ocultarIngredientesDisponibles()
      game.schedule(1000, {self.reaccionarAPedido()})
      //Espera un segundo antes de hacer al cliente que reaccione al pedido,
      // para que la reaccion no sea tan instantanea y se vea mejor
    }

    method ocultarIngredientesDisponibles() {
      if(self.esUnaPizza()) {
        manos.ocultarIngredientes()
      }
    }

    method ingredienteRandom() {
      return [ingredienteAceituna, ingredienteQueso, ingredienteAtun, ingredienteHongo,
              ingredienteHuevo, ingredienteTomate].anyOne()
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

      self.pagarPedido()
      game.schedule(1000, {adminCliente.retirarCliente(self)})
      //Schedule para que no ocurra de manera tan instantanea y el cliente reaccione y un segundo despues se vaya
    }

    method reaccionMala()

    method plataAPagarPorPedido() {
      return manos.precio()
    }

    method pagarPedido() {
      caja.recibir(self.plataAPagarPorPedido())
    }



}

class ClienteNormal inherits Cliente(nivelDePaciencia = 90000, image = "cliente_normal.png", name = "cliente_normal"){
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
    return 5.randomUpTo(disponibilidadParaTip)
  }
  
  override method reaccionMala(){
    emocion = decepcionado
    self.pagarPedido()
  }

  override method irseSinNada() {
    super()
    game.schedule(1000, {adminCliente.retirarCliente(self)})
    //Para darle tiepo al cliente a reaccionar
  }
}

class ClientePaciente inherits ClienteNormal(nivelDePaciencia = 120000, image = "cliente_paciente.png", name = "cliente_paciente", disponibilidadParaTip = 20){
  
  override method reaccionMala(){ 
    emocion = neutral
  }
}

class ClienteQuisquilloso inherits Cliente(nivelDePaciencia = 90000, image = "cliente_quisquilloso.png", name = "cliente_quisquilloso"){
  
  override method reaccionBuena(){ 
    emocion = neutral
    super()
  }
  
  override method reaccionMala(){
    emocion = enojado
    self.robar() 
    game.schedule(1000, {adminCliente.retirarCliente(self)})
    //Para darle tiepo al cliente a reaccionar
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
