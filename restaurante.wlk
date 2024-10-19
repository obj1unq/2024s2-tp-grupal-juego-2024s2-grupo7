import comestibles.*
/*
    -la pizzería sabe todo lo que tiene, para consultar posiciones y cosas y validaciones como en la granja. 
    -puede tener una lista con todas las cosas de la cocina y  todas las cosas de la recepcion -> como la granja de Hector
*/    
const masa = new Masa( position = game.at(1,1) )
const tomate = new Tomate ( position = game.at(0,0) )
const queso = new Queso ( position = game.at(0,0) )

object restaurante {

    const property muebles = #{}
    const property ingredientes = #{tomate, queso} //acá en realidad se pondrían las estaciones donde estan los ingredientes
    const property hornos = #{}
    const property preparacion = #{masa} //para las pizzas solo, la masa
    const property tachos ={}
    const caja = 0 // aca se podría el objeto único de la caja
    const postres = 0 // aca se pondría el objeto único de la caja de postres
    const bebidas = 0 // aca se pondría el objeto único de la maquina expendedora

    method hayIngredienteAqui(direccion){
        return ingredientes.any({ingrediente => ingrediente.position() == direccion})
    }

    method ingredienteAqui(direccion) {
        return ingredientes.filter({ingrediente => ingrediente.position() == direccion}).head()
    }

    method hayMuebleAqui(direccion) {
        return muebles.any({mueble => mueble.position() == direccion})
    }

    method hayHornoAqui(direccion) {
        return hornos.any({horno => horno.position() == direccion})
    }

    method hayTachosAqui(direccion) {
        return tachos.any({tacho => tacho.position() == direccion})
    }

    method estaLaPreparacionAqui(direccion) {
        return preparacion.any({masa => masa.position() == direccion})
    }

    method hayCajaAqui(direccion) {
        return caja.direccion() == direccion
    }

    method hayPostresAqui(direccion){
        return postres.direccion() == direccion
    }

    method hayBebidasAqui(direccion){
        return bebidas.direccion() == direccion
    }

}

class Cliente{
/*
    tiene que tener posición e imagen -> sería facil que solo se mueva derecho para entrar y salir
    tienen saber pedir un pedido -> imagen
    tiene que saber que pedido quería -> para despues comprarlo con el que le dan
    tiene que devolver una opinión (la opinión afecta el pago?) -> emojis
    tienen que tener la plata para pagar su pedido 
*/
}