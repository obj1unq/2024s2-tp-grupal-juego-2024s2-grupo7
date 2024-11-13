import restaurante.*
import chefs.*
import comestibles.*
import objetosCocina.*
import posiciones.*
import objetosParaTests.*
import wollok.game.*


object dimension {

    const ancho = 10
    const largo = 10


    method tamanioMapa() {
    game.height(largo)
    game.width(ancho)
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
    }
}

object imagenes {

    method ingredientesImg(){
        game.addVisual(estacionTomate)
        game.addVisual(estacionQueso)
        game.addVisual(estacionMasa)
        game.addVisual(estacionAceituna)
        game.addVisual(estacionAtun)
        game.addVisual(estacionHuevo)
        game.addVisual(estacionHongo)
    }

    method hornoImg(){
        game.addVisual(horno)
        game.addVisual(horno2)
    }

    method chefImg(){
        game.addVisual(remy)
    }

    method mesadaImg(){

        game.addVisual(mesada)
        game.addVisual(mesada2)
    }
}
    
