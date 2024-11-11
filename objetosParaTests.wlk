import restaurante.*
import chefs.*
import objetosCocina.*
import comestibles.*
import objetosRecepcion.*
import clientes.*

import wollok.game.*

//temporal hasta tener todo en el lugar que se debe

/*

[m,_,3,_,_,_,_,_],
[_,_,_,_,_,_,_,_],
[t,_,1,_,_,q,_,_],
[_,_,_,2,_,_,_,_],
[_,_,_,_,_,_,_,_],
[g,_,_,_,_,_,_,_],
[h,_,_,_,_,_,_,_],
[r,H,_,_,_,_,_,_]

*/

const tomate = new Tomate(position= game.at(0, 5)) //T
const queso = new Queso (position = game.at(5, 5)) //Q
const masa = new Masa (position = game.at(0, 7)) //M

const preparacion = new Masa(position = game.at(0, 2)) //g
const preparacion2 = new Masa(position = game.at(0, 2)) 

const horno = new Horno(position = game.at(1, 0)) //H
const horno2 = new Horno(position = game.at(1, 0)) //h
const mesada1 = new Mesada(position = game.at(2, 5)) //1
const mesada2 = new Mesada(position = game.at(2, 4)) //2
const tacho3 = new Tacho(position = game.at(2, 7)) //3

const remy = new Chef( position = game.at(0,0), image = "chefPrueba.png", nombre = "remy" ) //r

const cliente1 = new ClienteNormal()
const cliente2 = new ClienteQuisquilloso()
const cliente3 = new ClientePaciente()

