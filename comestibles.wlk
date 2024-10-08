import objetosCocina.*
import wollok.game.*

class Pizza { //no deberíamos renombrarlo a masa o prepisa¿

    var property position = null // va dependiendo donde este ubicado el horno y además el cheff la puede mover
    var property nivelCoccion = 0
    const property ingredientes = #{} // se deberian agregar el tomate y queso ?  cuando sea crea el new Pizza -> cuando se va armando la pizza por partes creo :]
    // creo que se hace desde el chef  con su coleccion de ingrediente  sacarndo de el y agregando aca -> también pienso que quedaría bien eso
    const property precio = 4500 //  a modificar -> puede ser que cada ingrediente tenga un precio diferente que se le sume a la pizza?


    method image(){
        return "pizza_1.png"
    }

    method serCocinada(){
        if (nivelCoccion < 2) nivelCoccion+1 else self.pizzaQuemada() // con los ontick del horno va cambiando solo, aca deberia  haber una imagen de pizza quemada  si se llega a 2 (o mas si decidimos tenes otros casos)

    } //  creo que si lo  hacemos desde el horno aca no hace falta  que manejemos  las imagenes  sino que campartan el mismo numero de imagen el horno y la pizza -> me gusta la idea
    // lo dejo por las dias

    method pizzaQuemada(){
        game.say(self,"me olvidaste en el horno :()")
    }

    method serSostenido(chef) {
        self.validarSostener(chef.bandeja())
        chef.bandeja().add(self)
        game.removeVisual(self)
    }

    method validarSostener(lista) {
         if(not lista.isEmpty()){ 
            self.error("Ya esta sosteniendo algo")
        }
    } 

    method coccion(){

        return nivelCoccion
    }
}

class Ingrediente { //la clase ingrediente con herencias de todos los que serían los ingredientes¿
    var property position = null
    var property image = null // Depende del ingrediente

    method serSostenido(chef) {

        // Aca hay que decidir que queremos que pase cuando intentamos agarrar un ingrediente
        // cuando ya esta sosteniendo algo, si simplemente lo pisa o tira un texto de error -> me gusta la validacion de que ya tiene algo en la mano
        self.validarSostener(chef.listaDeLoQueSostieneElChef())

        chef.bandeja().add(self) //Quizas el chef deberia tener una bandeja donde se muestra la imagen 
        // de lo que sea que tenga en las manos asi es mas claro que es lo que tiene, La bandeja 
        // probablemente tenga que ser otro objeto -> suena bien pero no creo que tenga que ser un objeto, puede solo aparecer en el dibujo siempre -> vacio o con cosa(que agarre)
    }
    /* Aca deberia haber un keyboard.onPressDo(chef.ingedienteDelante().SerSostenido()) */ //-> creo que es mejor darle la responsabilidad al cheff del on press sostiene el ingrediente y la validacion también debería estar en el cheff creo

    method validarSostener(lista) {
         if(not lista.isEmpty()){ 
            self.error("Ya esta sosteniendo algo")
        }
    } 


    method validarIngrediente(lista) { // ->creo que este método es responsabilidad de la pizza responder? no estoy segura
        if(lista.any({cosa => cosa.image() == self.image()})){ //Esto nose si esta bien asi -> creo que está bien porque todos los ingredientes creados de la misma clase son diferentes asi no se otra forma de compararlos que no sea la clase que creo que estaría mal asi que la imagen es una buena opcion creo
            self.error("Ya tiene este ingrediente")
        }
    }
     
    method sumarseAPizza(pizzaDelante) { //Aca el chef probablemente necesite un metodo que devuelva
        self.validarIngrediente(pizzaDelante.ingredientes())// la pizza que tenga delante si es que la tiene
        pizzaDelante.ingredientes().add(self)
    } // con el mismo boton que se agarran los ingredientes deberian poder ser colocados en la pizza 
}

/*
para los ingredientes:
    tiene que tener posición e imagen ✔
    tiene que entender incorporarse a la pizza ✔
    tienen que entender el que puedan ser movidos (por chefs)
    importa el orden de los ingredientes? 
    tiene que entender ser procesado -> ejemplo 
        tomate.serProcesado() lo corta, si está cortado lo hace salsa
        el huevo, las aceitunas, los hongos y el atun solo son cortado 1 vez y no pasa nada
        el queso puede ser queso comun cortado 1 vez y quedo rallado cortado 2 veces -> eso se considera queso extra y es más caro que pones solo queso común¿

*/

class Queso{

}

class Tomate {
  
}

class Aceituna {
 
}

class Huevo {
  
}

class Atun {
  
}

class Hongo { 
  
}
/*
    bebidas y postres:
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