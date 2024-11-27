import posiciones.*
import clientes.*
import mapaObjetos.*

import wollok.game.*

object adminCliente {
    const factories = #{factoryNormal, factoryPaciente, factoryQuisquilloso}
    var ubicacion = restaurante1

    method ubicacion(_ubicacion) {
        ubicacion = _ubicacion
    }

    method crearCliente() {
       
        const nuevoCliente = self.clienteRandom()
        
        ubicacion.addCliente(nuevoCliente)
        game.addVisual(nuevoCliente)
        nuevoCliente.hacerPedido()
        
        
    }

    method retirarCliente(cliente) {
        game.removeTickEvent(cliente)
        game.schedule(500, {self.eliminar(cliente)})
    }

    method eliminar(cliente) {
        ubicacion.quitarCliente(cliente)
        game.removeVisual(cliente)
        game.schedule(1500, {self.crearCliente()})
    }
    
    method clienteRandom() {
        return factories.anyOne().crearCliente()
    }

}

object factoryNormal {

    method crearCliente() {
        return new ClienteNormal()
    }
}

object factoryPaciente {

    method crearCliente() {
        return new ClientePaciente()
    }
}

object factoryQuisquilloso {

    method crearCliente() {
        return new ClienteQuisquilloso()
    }
}
