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

const restaurante = new Restaurante(muebles= [estacionTomate,estacionMasa,estacionQueso,estacionAceituna,estacionHongo,estacionHuevo,estacionAtun,mesada1,mesada2,mesada3,mesada4,mesada5,mesada6,mesada7,horno1,horno2,tacho])

/*
factories:
estacionTomate game.at(6.5, 63.5)
estacionMasa  game.at(21.7,63.5)
estacionQueso game.at(11.5,45)
estacionAceituna game.at(9.5,45)
estacionHongo game.at(13.5,45)
estacionHuevo game.at(15.5,45)
estacionAtun game.at(7,45)
*/

//hacer paredes invisibles solo a los cosatados de la cocina???
//game.at(x, y), distancias de 15,2

//tomates factory 
//masas factory 
const mesada1 = new Mesada(position = game.at(36.9,63.5))
const tacho = new Tacho(position = game.at(47, 65))
const mesada2 = new Mesada(position = game.at(56.7 ,63.5))
const horno1 = new Horno(position = game.at(71.6,63.5)) 
const mesada3 = new Mesada(position = game.at(17.5,63.5))
const horno2 = new Horno(position = game.at(19.5,63.5)) 


const mesada4 = new Mesada(position = game.at(5.5,51))
const mesada5 = new Mesada(position = game.at(7.5,45))
//aceitunas factory
//queso factory
//hongos factory
//huevos factory
const mesada6 = new Mesada(position = game.at(17.5,45))
const mesada7 = new Mesada(position = game.at(19.5,45))
//atun factory

//chef principal:
const remy = new Chef( name = "remy", position = game.center()/*position = game.at(9.5,48)*/, image = "remy_abajo.png", ubicacion = restaurante) 