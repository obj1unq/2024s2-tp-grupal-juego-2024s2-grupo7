import personaBase.*

import wollok.game.*

class Mueble {
  const property position = game.center() 
  const property image = "" 
  var contenido = bandejaVacia //es un objeto que representa el no tener nada

  method usarse(chef){ //para que con 1 solo boton "interactuar" sea algo general y el mueble ve como se arregla en la interaccion
    if(not chef.tengoBandejaVacia()){ //si el chef tiene algo en su bandeja asume que tiene que recibir algo
      self.validarRecibir(chef)
      self.accionRecibir(chef)
    } else { //sino, cuando el chef no tiene nada en la bandeja asume que el chef intenta agarrar algo 
      self.validarDar(chef)
      self.accionDar(chef)
    }
  }

  method validarRecibir(chef){
    if(not self.puedeRecibir(chef.bandeja())){ //template method ya que no todos aceptan todo
      self.error("no hay espacio para dejar algo aqui") 
    }
  }

  method puedeRecibir(cosa){
    return self.estaLibre()
  }

  method estaLibre(){ //para poder recibir es que no tiene nada encima o si tiene una pizza ya que estas aceptan ingredientes encima
    return not self.tieneIngrediente() || self.tienePiza()
  }

  method tienePiza(){
    return self.esPizza(contenido) 
  }

  method esPizza(cosa){
    return cosa.integraIngredintes() 
  }

  method tieneIngrediente(){
    return not contenido.integraIngredintes() and not contenido.esVacio() //si no es vacio y no integraIngredientes es un ingrediente en sí
  }

  method validarDar(chef){ //que el chef tenga espacio ya se cumple en la rama del if de usarse
    if(not self.tieneAlgo()){ //aca se fija si hay algo para dar
      self.error("no puedo agarrar algo si tengo las manos llenas o si no hay nada que agarrar")
    }
  }

  method tieneAlgo() { //que tiene algo significa que tiene cualquier cosa -> podría ser un tiene ingrediente
     return not contenido.esVacio()  //esto es que no tiene nada 
  }

  method accionRecibir(chef){
    contenido = chef.bandeja()
    chef.soltar() //esto en el chef hace que tenga una bandeja vacia otra vez
    contenido.serDejadoAqui(position) //esto en el horno debería cambiar y no verse el ingediente encima del horno, tampoco en el tacho de basura
  }

  method comoRecibir(content, lugar){
    //este podría ser el template method para cómo se muestra el recibir -> el horno no se ve y en el tacho tampoco, en los demás si
    //es para las imagenes basicamente
  }

  method accionDar(chef){
    const ingrediente = self.objetoADar(chef)
    chef.recibir(ingrediente) //tal vez se podría delegar al chef que le diga al ingrediente que debe ser sostenido por el ?
    ingrediente.serSostenido(chef)
    self.eliminarLoDado() //que ahora el mueble tiene de nuevo una bandeja vacia = nada
  }

  method objetoADar(chef){ //es diferente para las factories por eso tenerlo como template
    return contenido
  }

   method eliminarLoDado(){ //también para las factories -> no hace nada eso ya que no tiene "contenido"
    contenido = bandejaVacia
   }

  method contenido(){
    return contenido
  }

   method procesarIngredientes(){
    self.validarProcesarIngrediente()
    contenido.serProcesado()
   }

   method validarProcesarIngrediente(){
    if(not self.tieneIngrediente()){
      self.error("no hay ingrediente que procesar")
    }
   }

}