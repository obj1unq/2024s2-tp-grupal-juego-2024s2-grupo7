import objetosCocina.*
import Chef_remy.*

import wollok.game.*

class Ingrediente { 
    var property position = null
    var property image = null // Depende del ingrediente
    const property precio = null //cada ingrediente tenga un precio diferente que se le sume a la pizza?

    method serSostenido(chef) {
        //self.validarSerSostenido(chef.tieneLasManosOcupadas())
        //creo que la validacion debería estar en el cheff ya que no le debería importar eso al ingrediente
        chef.bandeja().add(self) 
        game.removeVisual(self)
    }

    method serProcesado() //depende de cada ingrediente

/*
    method validarSerSostenido(lista) {
         if(not lista.isEmpty()){ 
            self.error("Ya esta sosteniendo algo")
        }
    } 
*/
}

object cruda {
    method estarCruda(pizza) {
      return "" + pizza.ingreDientePrincipal() + ".cruda.png" 
    }
}

object dorada {
    method dorarse(pizza) {
      return "" + pizza.ingreDientePrincipal() + ".dorada.png" 
    }
}

object quemada {

    method estarQuemada(pizza) {
      self.quemarse(pizza)
      self.advertir()
    }

    method quemarse(pizza) {
      return "" + pizza.ingreDientePrincipal() + ".quemada.png" //ej: atun.quemada.png
    }

    method advertir(){
        game.say(self,"me olvidaste en el horno :()")
    }
}

class Masa inherits Ingrediente( position = game.at(0,0), image = "masa.png", precio = 4000 ) {
    const property ingredientes = #{} //se hace desde el chef y eso modifica el precio de la piza tmb
    //var property estado = cruda

    method serCocinada(gradosHorno){
        self.actualizarEstadoMasa(gradosHorno)
    }
    method actualizarEstadoMasa(gradosHorno) {
       //image = 
       //if (gradosHorno < 2) gradosHorno+1 else quemada.quemarse(self) -> faltaría cruda y quemada
    }
    method ingreDientePrincipal() {
      //
    }
}


class Queso inherits Ingrediente( position = game.at(0,0), image = ".png", precio = 100 ){
    override method serProcesado() {
      
    }
}

class Tomate inherits Ingrediente ( position = game.at(0,0), image = ".png", precio = 100 ){
  override method serProcesado() {
      
    }
}

class Aceituna inherits Ingrediente ( position = game.at(0,0), image = ".png", precio = 100 ) {
 override method serProcesado() {
      
    }
}

class Huevo inherits Ingrediente ( position = game.at(0,0), image = ".png", precio = 100 ){
  override method serProcesado() {
      
    }
}

class Atun inherits Ingrediente ( position = game.at(0,0), image = ".png", precio = 100 ) {
  override method serProcesado() {
      
    }
}

class Hongo inherits Ingrediente ( position = game.at(0,0), image = ".png", precio = 100 ) { 
  override method serProcesado() {
      
    }
}
/*
    bebidas y postres: -> NO SON CLASE INGREDIENTE
    tiene que tener posición e imagen
    tiene que saber su precio
    tiene que saber que opción de bebida son 
        -> coca, sprite, fanta
        -> helado, torta, etc?
*/
class Bebida {
  
}

class Postre {
  
}

//creo que el puré de tomate sigue siendo un tomate solo que fue procesado y lo unico que hace es cambiar la imagen
//en la lista dentro de la pizza (masa) podría contar como un tomate pero uno procesado?
class PureTomate {

    var property position = null
    var property image = "pureTomte.png"

    method serSotenido(remy){

        remy.recogerIngrediente(new PureTomate(position= remy.position())) // por refactorizar
    }
}


//no creo que se deba hacer con factories, estaría bueno que simplemente puedas hagarrar los ingredientes infinitamente cuando quieras y que la dificultad del tiempo esté en los clientes y la de los ingredientes sea la gestion tal vez
object administradorIngredientes{
     const creados = #{}
     const factories = [tomateFactory,masaFactory,muzzarellaFactory]


     method nuevoIngrediente(){

        if(self.hayEspacio()){
            const ingrediente = self.construirIngrediente()
                game.addVisual(ingrediente)
                creados.add(ingrediente)
        }
     }

     method hayEspacio(){

        return creados.size() < 5
     }

     method construirIngrediente(){


        return factories.anyOne().construir()
     }

     method remover(ingrediente){

        game.removeVisual(ingrediente)
        creados.remove(ingrediente)
     }
}

object tomateFactory {
    const position = game.at(5,5) // aca hay que llenar con la posicion donde va a estar la canaste de tomates o como lo llamemos

        method construir(){

            return new Tomate (position = position)
        }

}

object masaFactory {
    
    const position = game.at(5,6)// aca vamos a llenar con la posicion donde va a estar  el lugar donde supuestamente agarremos la masa

        method construir(){

            //return new Masa (position = position)
        }
}

object muzzarellaFactory {

    const position = game.at(5,7) // aca vamos a llenar con la posicion donde va a estar la heladera con  el queso

    method construir(){

        return new Queso (position = position)
    }
}
