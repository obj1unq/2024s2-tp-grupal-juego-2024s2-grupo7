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
import objetosRecepcion.*


import wollok.game.*

const restaurante1 = new Restaurante(muebles= [
estacionTomate,estacionMasa,estacionQueso,estacionAceituna,estacionHongo,estacionHuevo,estacionAtun,
mesada1,mesada2,mesada3,mesada4,mesada5,mesada6,horno1,horno2,tacho,
mesadaHit1, mesadaHit2, mesadaHit3, mesadaHit4, mesadaHit5, mesadaHit6, mesadaHit7, mesadaHit8, mesadaHit9, mesadaHit10,
tachoHitbox1, tachoHitbox2, tachoHitbox3, tachoHitbox4,
caja,sep1,mostrador,sep2,sep3,sep4,sep5,sep6,sep7,sep8,sep9,sep10

])

//NO USAR POSICIONES DECIMALES!!

//chef principal:
const remy = new Chef( name = "Remy", position = game.at(9,48), image = "Remy_down.png", ubicacion = restaurante1) 

//tomates factory  game.at(6, 63)
//masas factory game.at(22,63)
const mesada1 = new Mesada(position = game.at(36,63)) 
const tacho = new Tacho(position = game.at(47, 65)) 
const mesada2 = new Mesada(position = game.at(56 ,63)) 
const horno1 = new Horno(position = game.at(71,63)) 
const mesada3 = new Mesada(position = game.at(87,63)) 
const horno2 = new Horno(position = game.at(102,63)) 

const mesadaHit1 = new MesadaHitbox(position = game.at(37,63), muebleMadre = mesada1)
const mesadaHit2 = new MesadaHitbox(position = game.at(38,63), muebleMadre = mesada1)
const mesadaHit3 = new MesadaHitbox(position = game.at(39,63), muebleMadre = mesada1)
const mesadaHit4 = new MesadaHitbox(position = game.at(40,63), muebleMadre = mesada1)
const mesadaHit5 = new MesadaHitbox(position = game.at(35,63), muebleMadre = mesada1)
const mesadaHit6 = new MesadaHitbox(position = game.at(34,63), muebleMadre = mesada1)
const mesadaHit7 = new MesadaHitbox(position = game.at(33,63), muebleMadre = mesada1)
const mesadaHit8 = new MesadaHitbox(position = game.at(32,63), muebleMadre = mesada1)
const mesadaHit9 = new MesadaHitbox(position = game.at(31,63), muebleMadre = mesada1)
const mesadaHit10 = new MesadaHitbox(position = game.at(38,63), muebleMadre = mesada1)

const tachoHitbox1 = new MesadaHitbox(position = game.at(45,65), muebleMadre = mesada1)
const tachoHitbox2 = new MesadaHitbox(position = game.at(46,65), muebleMadre = mesada1)
const tachoHitbox3 = new MesadaHitbox(position = game.at(48,65), muebleMadre = mesada1)
const tachoHitbox4 = new MesadaHitbox(position = game.at(49,65), muebleMadre = mesada1)

const mesadaHit11 = new MesadaHitbox(position = game.at(38,63), muebleMadre = mesada2)
const mesadaHit12 = new MesadaHitbox(position = game.at(38,63), muebleMadre = mesada2)
const mesadaHit13 = new MesadaHitbox(position = game.at(38,63), muebleMadre = mesada2)
const mesadaHit14 = new MesadaHitbox(position = game.at(38,63), muebleMadre = mesada2)
const mesadaHit15 = new MesadaHitbox(position = game.at(38,63), muebleMadre = mesada2)
const mesadaHit16 = new MesadaHitbox(position = game.at(38,63), muebleMadre = mesada2)
const mesadaHit17 = new MesadaHitbox(position = game.at(38,63), muebleMadre = mesada2)
const mesadaHit18 = new MesadaHitbox(position = game.at(38,63), muebleMadre = mesada2)
const mesadaHit19 = new MesadaHitbox(position = game.at(38,63), muebleMadre = mesada2)
const mesadaHit20 = new MesadaHitbox(position = game.at(38,63), muebleMadre = mesada2)
const mesadaHit21 = new MesadaHitbox(position = game.at(38,63), muebleMadre = mesada2)


//queso factory game.at(116, 63)


const mesada4 = new Mesada(position = game.at(6,44)) 
const mesada5 = new Mesada(position = game.at(22,44)) 
//aceitunas factory game.at(36,44)
//hongos factory game.at(49,44)
//huevos factory game.at(62,44)
const mesada6 = new Mesada(position = game.at(75,44)) 
//atun factory game.at(116,44)

//Parte de recepion:

const sep1 = new MuebleSeparador(position = game.at(116, 25)) 
const sep2 = new MuebleSeparador(position = game.at(106,25))
const sep3 = new MuebleSeparador(position = game.at(96,25))
const mostrador = new Mostrador(position = game.at(86,25)) 
//caja 76,25
const sep4 = new MuebleSeparador(position = game.at(66,25))
const sep5 = new MuebleSeparador(position = game.at(56,25))
const sep6 = new MuebleSeparador(position = game.at(46,25))
const sep7 = new MuebleSeparador(position = game.at(36,25))
const sep8 = new MuebleSeparador(position = game.at(26,25))
const sep9 = new MuebleSeparador(position = game.at(16,25))
const sep10 = new MuebleSeparador(position = game.at(6,25))

//decoracion:
const deco1 = new MesaDeco(position = game.at(22,12))
const deco2 = new MesaDeco(position = game.at(49,12))

//interfaz
//const cartelHorno2 = new Cartel(position = game.at(108,70), objeto = horno2)
//const cartelHorno1 = new Cartel(position = game.at(77,70), objeto = horno1)
//const cartelCliente = new Cartel(position = game.at(96,36), objeto = horno1)

object youWin {
  const property image = "victoria.png"
  const property position = game.at(52,40)
}

object youLose {
  const property image = "derrota.png"
  const property position = game.at(53,41)
}

class MuebleHitbox {
  const property position = null
  const muebleMadre = null

  method usarse(chef) {
    muebleMadre.usarse(chef)
  }
}

class MesadaHitbox inherits MuebleHitbox {

  method procesarIngredientes() {
    muebleMadre.procesarIngredientes()
  }
}
