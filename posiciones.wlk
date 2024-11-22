object arriba {

	method imagen(name) {
		return "" + name +"_up.png" 
	}

	method moverse(namePosition) {
	  return namePosition.up(1)
	}
}

object abajo {

	method imagen(name) {
		return "" + name + "_down.png" 
	}
	
	method moverse(namePosition) {
	  return namePosition.down(1)
	}
}

object izquierda {

	method imagen(name) {
		return "" + name + "_left.png" 
	}

	method moverse(namePosition) {
	  return namePosition.left(1)
	}
}

object derecha {

	method imagen(name) {
		return "" + name + "_right.png"
	}

	method moverse(namePosition) {
	  return namePosition.right(1)
	}
}