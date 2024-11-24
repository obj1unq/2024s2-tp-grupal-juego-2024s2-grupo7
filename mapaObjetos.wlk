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

const restaurante1 = new Restaurante(muebles= [estacionTomate,estacionMasa,estacionQueso,estacionAceituna,estacionHongo,estacionHuevo,estacionAtun,mesada1,mesada2,mesada3,mesada4,mesada5,mesada6,horno1,horno2,tacho])

//chef principal:
const remy = new Chef( name = "Remy", position = game.at(9,48), image = "Remy_down.png", ubicacion = restaurante1) 


//hacer paredes invisibles solo a los cosatados de la cocina???
//game.at(x, y), distancias de 15,2 aprox -> los demacimales traen problemas

//tomates factory  game.at(6.5, 63.5)
//masas factory game.at(21.7,63.5)
const mesada1 = new Mesada(position = game.at(36,63)) //game.at(36.9,63.5)
const tacho = new Tacho(position = game.at(47, 65)) //game.at(47, 65)
const mesada2 = new Mesada(position = game.at(56 ,63)) //game.at(56.7 ,63.5)
const horno1 = new Horno(position = game.at(71,63)) //game.at(71.6,63.5)
const mesada3 = new Mesada(position = game.at(87,63)) //game.at(86.8,63.5)
const horno2 = new Horno(position = game.at(102,63)) //game.at(102,63.5)
//queso factory game.at(116, 63.5)


const mesada4 = new Mesada(position = game.at(6,44)) //game.at(6.5,44)
const mesada5 = new Mesada(position = game.at(22,44)) //game.at(21.7,44)
//aceitunas factory game.at(36.9,44)
//hongos factory game.at(49,44)
//huevos factory game.at(62,44)
const mesada6 = new Mesada(position = game.at(75,44)) //game.at(75.2,44)
//atun factory 