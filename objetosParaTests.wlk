import restaurante.*
import Chefs.*
import objetosCocina.*
import comestibles.*
import objetosRecepcion.*
import clientes.*

import wollok.game.*

//temporal hasta tener todo en el lugar que se debe

/*
mapa tests:

[m,_,3,_,_,_,_,_],
[_,_,_,_,_,_,_,_],
[t,_,1,_,_,q,_,_],
[_,_,_,2,_,_,_,_],
[_,_,_,_,_,_,_,_],
[_,_,_,_,_,_,_,_],
[_,_,_,_,_,_,_,_],
[r,h,_,_,_,_,_,_]

*/

const tomate = new Tomate(position= game.at(0, 5))
const queso = new Queso (position = game.at(5, 5))
const masa = new Masa (position = game.at(0, 7))

const horno = new Horno(position = game.at(1, 0))
const mesada1 = new Mesada(position = game.at(2, 5))
const mesada2 = new Mesada(position = game.at(2, 4))
const tacho3 = new Tacho(position = game.at(2, 7))

const remy = new Chef( position = game.at(0,0), image = "chefPrueba.png", nombre = "remy" )
//const ramsay = new Chef( position = game.at(5,5), image = "chefPrueba.png", nombre = "ramsay" )