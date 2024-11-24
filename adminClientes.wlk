import posiciones.*
import clientes.*
import mapaObjetos.*

import wollok.game.*


object adminClientes {
    const factories = #{factoryNormal, factoryPaciente, factoryQuisquilloso}
    const hayCliente = false //solo puede haber 1 cliente a la vez
    const ubicacion = restaurante1

    method iniciarClientes() {
        game.onTick(2000, "iniciar", {self.crearCliente()})
    }


    //No haria falta pasarle la posicion ni nada por parametro porque podemos ponerle una position por default a todos
    //los clientes y listo -> ok entonces esa sería la posicion de la puerta por default donde todos deben spawnear

    method crearCliente() {
        if(not hayCliente) {
            const nuevoCliente = self.clienteRandom()
            ubicacion.clientes().add(nuevoCliente)
            game.addVisual(nuevoCliente)
            nuevoCliente.orientacion(izquierda)
            nuevoCliente.hacerPedido()
        }
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
