import chefs.*
import objetosCocina.*
import comestibles.*
import clientes.*

import wollok.game.*


const remy = new Chef( position = game.at(0,4), image = "remy_abajo.png", nombre = "remy" ) //r

//tomates factory 
//masas factory 
const mesada = new Mesada(position = game.at(2,5), contenido = masa)
const tacho = new Tacho(position = game.at(3,5))
const mesada2 = new Mesada(position = game.at(4,5), contenido = queso)
const horno = new Horno(position = game.at(5,5)) 
const mesada3 = new Mesada(position = game.at(6,5))
const horno2 = new Horno(position = game.at(7,5)) 

const mesada4 = new Mesada(position = game.at(0,2), contenido = tomate)
//aceitunas factory
//queso factory
//hongos factory
//huevos factory
const mesada5 = new Mesada(position = game.at(5,2))
const mesada6 = new Mesada(position = game.at(6,2))
//atun factory


const masa = new Masa()
const queso = new Queso()
const tomate = new Tomate()

const cliente1 = new ClienteNormal()
const cliente2 = new ClienteQuisquilloso()
const cliente3 = new ClientePaciente()