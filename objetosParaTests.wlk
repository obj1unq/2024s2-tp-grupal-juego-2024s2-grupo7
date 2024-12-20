import personaBase.*
import chefs.*
import restaurante.*
import factoryIngredientes.*
import posiciones.*
import objetosCocina.*
import ingredientesBase.*
import comestibles.*
import clientes.*
import objetosRecepcion.*

import wollok.game.*

const restaurantest = new Restaurante(muebles = [mesada, tacho, mesada2, horno, mesada3, horno2, mesada4, mesada5, mesada6, estacionTomate, estacionQueso, estacionMasa, estacionHuevo, estacionAtun, estacionAceituna,estacionHongo])


const remy = new Chef( name = "remy", position = game.at(95,49), image = "remy_abajo.png", ubicacion = restaurantest) 

//tomates factory 
//masas factory 
const mesada = new Mesada(position = game.at(4,27), contenido = masa)
const tacho = new Tacho(position = game.at(4,28))
const mesada2 = new Mesada(position = game.at(4,29), contenido = queso)
const horno = new Horno(position = game.at(4,30)) 
const mesada3 = new Mesada(position = game.at(4,31))
const horno2 = new Horno(position = game.at(4,32)) 
const mesadaX = new Mesada(position = game.at(4,33))
const mostrador = new Mostrador(position = game.at(86,25)) 

const mesada4 = new Mesada(position = game.at(4,34), contenido = tomate)
//aceitunas factory
//queso factory
//hongos factory
//huevos factory
const mesada5 = new Mesada(position = game.at(2,54))
const mesada6 = new Mesada(position = game.at(4,36))
//atun factory


const masa = new Masa(estadoPosition = apoyado1)
const queso = new Queso(estadoPosition = apoyado1)
const tomate = new Tomate(estadoPosition = apoyado1)

const apoyado1 = new Apoyado(queLoSostiene = mesadaX)

const cliente1 = new ClienteNormal()
const cliente2 = new ClienteQuisquilloso()
const cliente3 = new ClientePaciente()