object arriba {

	method imagen(chef) {
		return chef + "" + ".arriba.png"
	}

	method moverse(chefPosition) {
	  return chefPosition.up(1)
	}
}

object abajo {

	method imagen(chef) {
		return chef + "" + ".abajo.png"
	}
	
	method moverse(chefPosition) {
	  return chefPosition.down(1)
	}
}

object izquierda {

	method imagen(chef) {
		return chef + "" + ".izquierda.png"
	}

	method moverse(chefPosition) {
	  return chefPosition.left(1)
	}
}

object derecha {

	method imagen(chef) {
		return chef + "" + ".derecha.png"
	}

	method moverse(chefPosition) {
	  return chefPosition.right(1)
	}
}

/*
se necesita:
-(nombre chef).derecha.png
-(nombre chef).izquierda.png
-(nombre chef).arriba.png
-(nombre chef).abajo.png
*/