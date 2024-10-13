import wollok.game.*
import objetosCocina.*
import remy.*

class Pizza {

    var property position = null // va dependiendo donde este ubicado el horno
    var property nivelCoccion = 0
    const property ingredientes = #{} // se deberian agregar  la maza, el temate y queso ?  cuando sea crea el new Pizza
    // creo que se hace desde el chef  con su coleccion de ingrediente  sacarndo de el y agregando aca
    const property valor = 4500 //  a modificar 


    method image(){

        return "pizaa_" + nivelCoccion + ".png"
    }

    method serCocinada(){
        if (nivelCoccion < 2) nivelCoccion+1 else self.pizzaQuemada() // con los ontick del horno va cambiando solo, aca deberia  haber una imagen de pizza quemada  si se llega a 2 (o mas si decidimos tenes otros casos)

    } //  creo que si lo  hacemos desde el horno aca no hace falta  que manejemos  las imagenes  sino que campartan el mismo numero de imagen el horno y la pizza 
    // lo dejo por las dias

    method pizzaQuemada(){
        game.say(self,"me olvidaste en el horno :()")
    }

    method coccion(){

        return nivelCoccion
    }
}

class Ingrediente {
    var property position = null
    var property image = null // Depende del ingrediente

    method serSostenido(chef) {

        // Aca hay que decidir que queremos que pase cuando intentamos agarrar un ingrediente
        // cuando ya esta sosteniendo algo, si simplemente lo pisa o tira un texto de error
        self.validarSostener(chef.listaDeLoQueSostieneElChef())

        chef.bandeja().add(self) //Quizas el chef deberia tener una bandeja donde se muestra la imagen
        // de lo que sea que tenga en las manos asi es mas claro que es lo que tiene, La bandeja 
        // probablemente tenga que ser otro objeto
    }
    /* Aca deberia haber un keyboard.onPressDo(chef.ingedienteDelante().SerSostenido()) */

    method validarSostener(lista) {
         if(not lista.isEmpty()){ 
            self.error("Ya esta sosteniendo algo")
        }
    } 


    method validarIngrediente(lista) {
        if(lista.any({cosa => cosa.image() == self.image()})){ //Esto nose si esta bien asi
            self.error("Ya tiene este ingrediente")
        }
    }
     
    method sumarseAPizza(pizzaDelante) { //Aca el chef probablemente necesite un metodo que devuelva
 //       self.validarIngrediente(pizza.ingredientes())// la pizza que tenga delante si es que la tiene
   //     pizza.ingredientes().add(self)
    } // con el mismo boton que se agarran los ingredientes deberian poder ser colocados en la pizza
}

class Tomate {

    var property position = null
    

    method serSostenido(remy){
        remy.recogerIngrediente(self)
    }

    method image(){

        return "tomate.png"
    }

}


class Muzzarella {

    var  property position = null 
    

    method serSostenido(remy){

        remy.recogerIngrediente(self)
    }

    method image(){

        return "muzzarella.png"
    }
}

class Masa {

    var property position = null
    

    method serSostenido(remy){

        remy.recogerIngrediente(self)
    }

    method image(){

        return "masa.png"
    }
}

class PureTomate {

    var property position = null
    var property image = "pureTomte.png"

    method serSotenido(remy){

        remy.recogerIngrediente(new PureTomate(position= remy.position())) // por refactorizar
    }
}

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

            return new Masa (position = position)
        }
}

object muzzarellaFactory {

    const position = game.at(5,7) // aca vamos a llenar con la posicion donde va a estar la heladera con  el queso

    method construir(){

        return new Muzzarella (position = position)
    }
}
