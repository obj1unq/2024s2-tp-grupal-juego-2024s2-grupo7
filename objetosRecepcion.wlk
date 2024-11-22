import wollok.game.*

object caja { 
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

class Mesa { //de decoración para llenar el espacio vacio en la recepcion :)
}
