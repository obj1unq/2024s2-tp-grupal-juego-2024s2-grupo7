import wollok.game.*
import objetosCocina.*

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
        self.validarIngrediente(pizza.ingredientes())// la pizza que tenga delante si es que la tiene
        pizza.ingredientes().add(self)
    } // con el mismo boton que se agarran los ingredientes deberian poder ser colocados en la pizza
}
