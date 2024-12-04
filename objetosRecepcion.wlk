import adminCartel.*
import mueblesBase.*
import mapaObjetos.*
import wollok.game.*
import personaBase.*
import adminDeVictoria.*

object caja { 
  const property image = "caja.png"
  const property position = game.at(76, 25)
  var property objetivo = 3100

  var plata = 0

  method plata() {
    return plata
  }

  method recibir(_plata){
    plata += _plata
    self.considerarVictoria()
  }

  method considerarVictoria() {
    if(plata >= objetivo) {
      adminWinCon.ganar()
    }
  }

  method gastar(_plata){
    plata -= _plata
  }

  method cuantoFalta() {
    return (objetivo - plata).max(0).toString()
  }

  method recibirTip(tip){
    self.recibir(tip)
  }

  method textoCartel() {
      return ""
    }

  method texto() {
      return "Todavia falta 
      recolectar: " + self.cuantoFalta() + "$"
  }

  method posicionCartel() {
      return game.at(76,36)
  }

  method posicionTexto() {
      return game.at(80,38)
  }

  method anunciarCuantoFalta() {
    adminCartel.nuevoCartel(self, 3000, "text_box.png")
    adminCartel.nuevoTexto(self, 3000)
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

