import clientes.*
import wollok.game.*
import restaurante.*

object adminClientes {
    const factories = #{factoryNormal, factoryPaciente, factoryQuisquilloso}
    const hayCliente = false
    const ubicacion = restaurante

    method iniciarClientes() {
        game.onTick(2000, "iniciar", {self.crearCliente()})
    }


    //No haria falta pasarle la posicion ni nada por parametro porque podemos ponerle una position por default a todos
    //los clientes y listo

    method crearCliente() {
        if(not hayCliente) {
            const nuevoCliente = self.clienteRandom()
            ubicacion.clientes().add(nuevoCliente)
            game.addVisual(nuevoCliente)
            nuevoCliente.generarPedido()
            nuevoCliente.esperarPedido()
            
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