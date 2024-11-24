import comestibles.*
import objetosCocina.*
import factoryIngredientes.*
import objetosParaTests.*
import clientes.*


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
  
//probar:
    method hayClienteAqui(position) { //cambiarlo por "hayFila()" tal vez
      return 
      self.hayObjetoDeListaAqui(clientes, position) //creo que debería ser position + 1 porque esta el mueble (en donde esta mirando remi) y después el cliente- o ver otra forma
      //la factory de clientes tiene que agregar los clientes a la fila del restaurante
    }
    
    method clienteAqui(position) { //igual que hayClienteAqui(p)
      return self.objetoDeListaAqui(clientes, position)
    }
    
}

