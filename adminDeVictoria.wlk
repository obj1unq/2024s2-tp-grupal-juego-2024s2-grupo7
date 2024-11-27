import mapaObjetos.*
import wollok.game.*
import objetosRecepcion.*


object adminWinCon {
    const cajaFondos = caja

    method ganar() {
        game.addVisual(youWin)
        game.schedule(3000, {game.stop()})
    }

    method perder() {
        if(cajaFondos.plata() <= cajaFondos.objetivo()) {
            game.addVisual(youLose)
            game.schedule(3000, {game.stop()})
        }
        
    }
}