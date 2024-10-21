import comestibles.*

object inicial{
    method procesado(ingrediente) {
        ingrediente.serProcesado(final)
    }

    method imagen(ingrediente) {

        return ingrediente.imagenIngredienteInicial()
    }
}

object final {

    method procesado(ingrediente) {} //  para que no haga  otro proceso

    method imagen(ingrediente) {}

        
}