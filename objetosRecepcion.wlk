import mueblesBase.*

import wollok.game.*

object caja { 
  const property image = "caja.png"
  const property position = game.at(96, 25)

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

class Mostrador inherits Mueble(image = "mueble_entrega.png") {
  
  override method usarse(chef){
    //hacer 
  }

}

class MesaDeco inherits Mueble(image = "mesa_deco.png") {}

