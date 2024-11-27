import comestibles.*
import objetosCocina.*
import factoryIngredientes.*
import objetosParaTests.*
import clientes.*

import wollok.game.*


class Restaurante {

    var property muebles = [] //lo pongo en var para tests
    const property clientes = []
  
    method hayObjetoDeListaAqui(lista, position){
      return lista.any({objeto => objeto.position() == position})
    }

    method objetoDeListaAqui(lista, position) {
      return lista.find({objeto => objeto.position() == position}) 
    }


    method muebleAqui(position) {
          return self.objetoDeListaAqui(muebles, position)
        }

    method hayMuebleAqui(position){
      return self.hayObjetoDeListaAqui(muebles, position)
    }


    method clienteActual() {
      return clientes.head()
    }

    method llegoCliente() {
      return not clientes.isEmpty()
    }

    method mostrador() {
      return game.at(88,20)
    }

    method personaFrenteAMostrador() {
      return game.getObjectsIn(self.mostrador())
    }

    method addCliente(cliente) {
      clientes.add(cliente)
    }

    method quitarCliente(cliente) {
      clientes.remove(cliente)
    }
  
}

