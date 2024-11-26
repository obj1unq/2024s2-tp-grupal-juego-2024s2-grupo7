import factoryIngredientes.*
import objetosRecepcion.*
import posiciones.*
import mapaObjetos.*

import wollok.game.*

object dimension {

    const ancho = 135 
    const largo = 75 


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

    //LAS INTERACCIONES SI ANDAN SOLO QUE UNICO DETALLITO QUE SE PODRÍA CAMBIAR DESPUÉS SI PUEDO ES QUE EL MUEBLE SE TRABAJE CON UN AREA MÁS QUE CON UNA POSICION ESPECIICA PORQUE TENES QUE DARLE CLICK EN UN LUGAR MEDIO ESPECIFICO A LOS OBJETOS PARA INTERACTUAR

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

    method mueblesRes(){
        game.addVisual(caja)
        game.addVisual(sep1)
        game.addVisual(mostrador)
        game.addVisual(sep2)
        game.addVisual(sep3)
        game.addVisual(sep4)
        game.addVisual(sep5)
        game.addVisual(sep6)
        game.addVisual(sep7)
        game.addVisual(sep8)
        game.addVisual(sep9)
        game.addVisual(sep10)
        game.addVisual(deco1)
        game.addVisual(deco2)
    }

}

object acciones{} //para los on tick que en esta versión fallan
    
//para pasar todos los bloques que se van a ejecutar en lo onticks y schedulers
object bloque{
    method apply(_bloque){
        try{
            _bloque.apply()
        } catch e : Exception{
            game.say(remy, "error :" + e )
        }
    }
}

//ej:
//game.schedule(1000, {bloque.apply({adminCliente.crearCliente()})}) //pasa por el objeto que atrapa las excepciones