import factoryIngredientes.*
import posiciones.*
import mapaObjetos.*

import wollok.game.*

//revisar al final::
object dimension {

    const ancho = 120 //10
    const largo = 60 //10


    method tamanioMapa() {
        game.height(largo)
        game.width(ancho)
        game.cellSize(10)
    }
}

object teclas{

    method movimiento(){

    keyboard.up().onPressDo({remy.mover(arriba)})
    keyboard.down().onPressDo({remy.mover(abajo)})
    keyboard.right().onPressDo({remy.mover(derecha)})
    keyboard.left().onPressDo({remy.mover(izquierda)})
    }

    method accion(){
    keyboard.q().onPressDo({remy.interactuar()})
    keyboard.w().onPressDo({remy.procesar()})
    }
}

object imagenes {

    method restauranteImg(){
        game.boardGround("restaurante.png")
    }

    method ingredientesImg(){ //factories
        game.addVisual(estacionTomate)
        game.addVisual(estacionQueso)
        game.addVisual(estacionMasa)
        game.addVisual(estacionAceituna)
        game.addVisual(estacionAtun)
        game.addVisual(estacionHuevo)
        game.addVisual(estacionHongo)
    }

    method chefImg(){
        game.addVisual(remy)
    }

    method mueblesImg(){
        // self.mesadasImg()
        // self.hornosImg()
    }

    method mesadasImg(){ //mesadas

        // game.addVisual(mesada)
        // game.addVisual(mesada2)
    }

    method hornosImg(){ //hornos
        // game.addVisual(horno)
        // game.addVisual(horno2)
    }

}
    
