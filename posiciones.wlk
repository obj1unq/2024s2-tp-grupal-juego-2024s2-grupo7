object arriba {
  
  method siguiente(position) = position.up(1)
}

object abajo {
  
  method siguiente(position) = position.down(1) 
}

object derecha {
  
  method siguiente(position) = position.right(1)
}

object izquierda {
  
  method siguiente(position) = position.left(1)
}

/*
  creo que el profe había dicho algo de hacer que las posiciones sean classes y que de eso depensan las imagenes para que todo se mueva de a cuerdo a donde esta moviendose Remy
*/