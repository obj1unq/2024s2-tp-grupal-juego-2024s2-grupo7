import mapaObjetos.*
import wollok.game.*


object adminCartel {

    method nuevoCartel(cosa, tiempo, imagen) {
        const nuevoCartel = new Cartel(position = cosa.posicionCartel(), objeto = cosa, image = imagen)
        game.addVisual(nuevoCartel)
        game.schedule(tiempo, {self.quitarCartel(nuevoCartel)})
    }

    method quitarCartel(cartel) {
        game.removeVisual(cartel)
    }

    method nuevoTexto(cliente, tiempo) {
        const nuevoTexto = new Texto(position = cliente.posicionTexto(), objeto = cliente)
        game.addVisual(nuevoTexto)
        game.schedule(tiempo, {self.quitarTexto(nuevoTexto)})
    }

    method quitarTexto(texto) {
        game.removeVisual(texto)
    }
}

class Cartel {
  const property image = null
  const property position = null
  const property objeto = null

  method text() {
    return objeto.textoCartel()
  }

  method textColor() {
    return "000000FF"
  }
}

class Texto {
    const property position = null
    const property objeto = null

    method text() {
        return objeto.texto()
    }

    method textColor() {
        return "000000FF"
    }

}