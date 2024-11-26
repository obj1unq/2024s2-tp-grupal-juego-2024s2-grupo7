import mueblesBase.*
import mapaObjetos.*
import wollok.game.*
import personaBase.*

object caja { 
  const property image = "caja.png"
  const property position = game.at(76, 25)

  var plata = 0
  method recibir(_plata){
    plata += _plata
  }

  method gastar(_plata){
    plata -= _plata
  }

  method decirPlata(){ 
    return plata
  }

  method recibirTip(tip){
    self.alertarTip()
    self.recibir(tip)
  }
//que aparezca arriba de la caja un cartelito o imagen de "tip!!"
  method alertarTip(){} //aparece cartel de "tip"

}

class MuebleSeparador inherits Mueble(image = "separador_recepcion.png"){
  override method usarse(chef){}
} 

class Mostrador inherits MuebleParaCocinar(image = "mueble_entrega.png") {
  const ubicacion = restaurante1
  

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
    ubicacion.cliente().recibirPedido(contenido)
    contenido = bandejaVacia
  }
}

class MesaDeco inherits Mueble(image = "mesa_deco.png") {}

