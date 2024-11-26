import posiciones.*
import clientes.*
import mapaObjetos.*

import wollok.game.*

//se necesitan comentarios sobre los onTick y Schedules, no los entiendo

object adminCliente {
    const factories = #{factoryNormal, factoryPaciente, factoryQuisquilloso}
    var hayCliente = false 
    const ubicacion = restaurante1


    method crearCliente() {
        const nuevoCliente = self.clienteRandom()
        ubicacion.clientes().add(nuevoCliente)
        game.addVisual(nuevoCliente)
        
        nuevoCliente.hacerPedido()
        
    }

    method retirarCliente(cliente) {
        game.removeTickEvent(cliente)
        cliente.mover(abajo)
        game.schedule(500, {self.eliminar(cliente)})
    }

    method eliminar(cliente) {
        ubicacion.clientes().remove(cliente)
        game.removeVisual(cliente)
        hayCliente = false
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
