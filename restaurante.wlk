import comestibles.*
import objetosCocina.*
import factoryIngredientes.*
import objetosParaTests.*
import clientes.*


object restaurante {

    const property muebles = [mesada, tacho, mesada2, horno, mesada3, horno2, mesada4, mesada5, mesada6, estacionTomate, estacionQueso, estacionMasa, estacionHuevo, estacionAtun, estacionAceituna,estacionHongo] 
    const property ingredientesSueltos = [tomate, queso, masa] //acá guarda solo los ingredientes sueltos. NO TODOS -> los que tiene en la mano no los guarda, las factories no son ingredientes son muebles 
    const property filasDeClientes = []
  
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
      self.hayObjetoDeListaAqui(filasDeClientes, position) //creo que debería ser position + 1 porque esta el mueble (en donde esta mirando remi) y después el cliente- o ver otra forma
      //la factory de clientes tiene que agregar los clientes a la fila del restaurante
    }
    
    method clienteAqui(position) { //igual que hayClienteAqui(p)
      return self.objetoDeListaAqui(filasDeClientes, position)
    }
    
}

