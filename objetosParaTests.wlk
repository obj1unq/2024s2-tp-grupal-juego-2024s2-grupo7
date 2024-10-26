import restaurante.*
import Chefs.*
import objetosCocina.*
import comestibles.*
import objetosRecepcion.*
import clientes.*



import wollok.game.*

//temporal hasta tener todo en el lugar que se debe

const tomate1 = new Tomate(position= game.at(0, 5))
const queso1 = new Queso (position = game.at(0, 6))
const masa1 = new Masa (position = game.at(0, 7))

const horno = new Horno(position = game.at(1, 0))
const mesada1 = new Mesada(position = game.at(2, 5))
const mesada2 = new Mesada(position = game.at(2, 4))
const tacho1 = new Tacho(position = game.at(2, 7))

const remy = new Chef( position = game.at(0,0), image = "chefPrueba.png", nombre = "remy" )
const ramsay = new Chef( position = game.at(5,5), image = "chefPrueba.png", nombre = "ramsay" )