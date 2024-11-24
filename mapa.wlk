import factoryIngredientes.*
import posiciones.*
import mapaObjetos.*

import wollok.game.*

//revisar al final::
object dimension {

    const ancho = 135 //10
    const largo = 75 //10 


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

    method chefImg(){
        game.addVisual(remy)
    }

    //separar mejor en mubles parte arriba y muebles parte abajo por el tema de sobreposicion de imagenes con el chef

    method mueblesArribaImg(){
        game.addVisual(estacionTomate)
        game.addVisual(estacionMasa)
        game.addVisual(mesada1)
        game.addVisual(mesada2)
        game.addVisual(tacho)
        game.addVisual(horno1)
        game.addVisual(mesada3)
        game.addVisual(horno2)
        game.addVisual(estacionQueso)
    }

    method mueblesAbajoImg(){
        game.addVisual(mesada4)
        game.addVisual(mesada5)
        game.addVisual(estacionAceituna)
        game.addVisual(estacionHuevo)
        game.addVisual(estacionHongo)
        game.addVisual(mesada6)
        game.addVisual(estacionAtun)
    }

}

object acciones{} //para los on tick de la factory de clientes?
    
