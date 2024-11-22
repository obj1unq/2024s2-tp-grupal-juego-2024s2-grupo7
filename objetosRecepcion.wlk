object caja { 
  var plata = 0
/*
    tiene que tener posición e imagen
    tiene que saber y tener su plata/ ganancias de chefs

*/  
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

/* NOTA:
  *esto es solo si nos alcanza el tiempo, son extras
*/

object dispenserBebidas {
/*
    tiene que tener posición e imagen
    tiene que entender servir bebida y entender opción elegida

*/  
}

object vidrioPostres { //es el coso del dibujo del mapa del drive, si saben como se llama eso cambienle el nombre
  //tiene que ser como el dispenser y se tiene que poder elegir entre 3 postres distintos que quiera el cliente
}

class Mesa { //de decoración para llenar el espacio vacio en la recepcion :)
}
