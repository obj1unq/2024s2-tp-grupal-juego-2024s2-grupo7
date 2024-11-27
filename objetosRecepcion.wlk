import mueblesBase.*
import mapaObjetos.*
import wollok.game.*
import personaBase.*

object caja { 
  const property image = "caja.png"
  const property position = game.at(76, 25)
  var property objetivo = 5000

  var plata = 0

  method plata() {
    return plata
  }

  method recibir(_plata){
    plata += _plata
    self.decirPlata()
  }

  method gastar(_plata){
    plata -= _plata
    self.decirPlata()
  }

  method decirPlata(){ 
    game.say(self, plata)
  }

  method recibirTip(tip){
    self.recibir(tip)
    self.decirPlata()
  }

}

class MuebleSeparador inherits Mueble(image = "separador_recepcion.png"){
  override method usarse(chef){}
} 

class Mostrador inherits MuebleParaCocinar(image = "mueble_entrega.png") {
  var ubicacion = restaurante1
  
  method ubicacion(_ubicacion) {
    ubicacion = _ubicacion
  }

  override method accionDeRecibir() {
    self.validarAccionRecibir()
    super()
    self.avisarACliente()
  }

  method validarAccionRecibir() {
    if(not ubicacion.llegoCliente()) {
      self.error("Aun no llego un cliente")
    }
  }

  method avisarACliente() {
    ubicacion.clienteActual().recibirPedido(contenido)
    contenido = bandejaVacia
  }
}

class MesaDeco inherits Mueble(image = "mesa_deco.png") {}

