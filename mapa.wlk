import restaurante.*
import chefs.*
import comestibles.*
import objetosCocina.*
import posiciones.*
import objetosParaTests.*

object dimension {

    const ancho = 10
    const largo = 10


    method tamanioMapa() {
    game.height(ancho)
    game.width(largo)
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
    keyboard.e().onPressDo({remy.recogerIngrediente()})
    keyboard.q().onPressDo({remy.soltarIngrediente()})
    }
}

object imagen {

    method ingredientes(){
        game.addVisual(estacionTomate)
        game.addVisual(new Mesada())
        game.addVisual(estacionMasa)
        game.addVisual(estacionQueso)
        game.addVisual(estacionAceituna)
        game.addVisual(estacionHongo)
        game.addVisual(estacionHuevo)
        game.addVisual(estacionAtun)
    }

    method horno(){
        game.addVisual(new Horno())
       // game.addVisual(new Horno())
    }

    method chef(){
        game.addVisual(remy)
    }
}
    
