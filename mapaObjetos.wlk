import restaurante.*
import personaBase.*
import posiciones.*
import clientes.*
import chefs.*
import comestibles.*
import ingredientesBase.*
import factoryIngredientes.*
import objetosCocina.*
import mueblesBase.*
import adminClientes.*


import wollok.game.*

const restaurante = new Restaurante()

//hacer paredes invisibles solo a los cosatados de la cocina

const remy = new Chef( name = "remy", position = game.at(0,4), image = "remy_abajo.png") 

//tomates factory 
//masas factory 
const mesada = new Mesada(position = game.at(2,5))
const tacho = new Tacho(position = game.at(3,5))
const mesada2 = new Mesada(position = game.at(4,5))
const horno = new Horno(position = game.at(5,5)) 
const mesada3 = new Mesada(position = game.at(6,5))
const horno2 = new Horno(position = game.at(7,5)) 
const mesadaX = new Mesada(position = game.at(10,10))

const mesada4 = new Mesada(position = game.at(0,2))
//aceitunas factory
//queso factory
//hongos factory
//huevos factory
const mesada5 = new Mesada(position = game.at(5,2))
const mesada6 = new Mesada(position = game.at(6,2))
//atun factory