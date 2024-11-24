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

//NO USAR DECIMALES PARA POSICIONAR COSAS

//tomates factory  game.at(6, 63)
//masas factory game.at(22,63)
const mesada1 = new Mesada(position = game.at(36,63)) 
const tacho = new Tacho(position = game.at(47, 65)) 
const mesada2 = new Mesada(position = game.at(56 ,63)) 
const horno1 = new Horno(position = game.at(71,63)) 
const mesada3 = new Mesada(position = game.at(87,63)) 
const horno2 = new Horno(position = game.at(102,63)) 
//queso factory game.at(116, 63)


const mesada4 = new Mesada(position = game.at(6,44)) 
const mesada5 = new Mesada(position = game.at(22,44)) 
//aceitunas factory game.at(36,44)
//hongos factory game.at(49,44)
//huevos factory game.at(62,44)
const mesada6 = new Mesada(position = game.at(75,44)) 
//atun factory game.at(116,44)