object arriba {
	method siguiente(position) {
		return position.up(1)
	}

	method esValida(position) {
		return position.y() + 1 < game.height()
	}
}

object abajo {
	method siguiente(position) {
		return position.down(1)
	}	

	method esValida(position) {
		return (position.y() - 1) >= 0
	}
}

object izquierda {
	method siguiente(position) {
		return position.left(1)
	}

	method esValida(position) {
		return (position.x() - 1) >= 0
	}
}


object derecha {
	method siguiente(position) {
		return position.right(1)
	}


	method esValida(position) {
		return position.x() + 1 < game.width()
	}

}
/*
  creo que el profe había dicho algo de hacer que las posiciones sean classes y que de eso depensan las imagenes para que todo se mueva de a cuerdo a donde esta moviendose Remy
*/