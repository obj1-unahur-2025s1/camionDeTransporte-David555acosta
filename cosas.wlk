import camion.*

object knightRider {
  method peso() = 500
  method peligrosidad() = 10 
  method reaccion() {}
  method cantBultos() = 1 
}

object robot {
  method peligrosidad() = 30
}

object auto {
  method peligrosidad() = 15 
}

object bumblebee {
  method peso() = 800
  var transformacion = robot
  method transformacion(tipo) {transformacion = tipo} 
  method peligrosidad() = transformacion.peligrosidad()
  method reaccion() {
    transformacion = robot
  }
  method cantBultos() = 2
}

object ladrillos {
  var cantidad = 100
  var bultos = 0
  method cantidad(cantX) {cantidad = cantX}
  method peso() = cantidad * 2
  method peligrosidad() = 2
  method reaccion() {
    cantidad = cantidad + 12
  }
  /*
  Paquete de ladrillos depende de la cantidad de ladrilos:
  hasta 100 ladrillos ocupa 1 bulto.
  Entre 101 y 300, 2 bultos.
  301 o más, ocupa 3 bultos.
  */

  method cantBultos() {
    if (cantidad <= 100) {
      bultos = 1
    } else {
      if (cantidad >= 101 || cantidad <= 300) {
        bultos = 2
      } else {
        bultos = 3
      }
    }
    return bultos
  }
}

object arena {
  var peso = 100
  method peso(pesoX) {peso = pesoX}
  method peso() = peso 
  method peligrosidad() = 1
  method reaccion() {
    peso = peso - 10
  }

  method cantBultos() = 1 
}

object bateria {
  var bultos = 0
  var tieneMisiles = true
  var peso = 0
  var peligrosidad = 0
  method tieneMisiles(estado) {tieneMisiles = estado}

  method peso() {
    if (tieneMisiles) 
    {
        peso = 300
    } else {
        peso = 200
    }
    return peso
  }

  method peligrosidad() {
    if(tieneMisiles) {
        peligrosidad = 100
    } else {
        peligrosidad = 0
    }
    return peligrosidad
  }

  method reaccion() {
    tieneMisiles = true
  }

  method cantBultos() {
    if (tieneMisiles) {
      bultos = 2
    } else {
      bultos = 1
    }
    return bultos
  }
}

object contenedor {
  const cosas = #{}
  var peligrosidad = 0

  method agregarCosas(cosa) {
    cosas.add(cosa)
  }

  method peso() {
    return 100 + cosas.size()
  }

  method masPeligroso() {
    return cosas.max({c => c.masPeligroso()})
  }

  method peligrosidad() {
    if (cosas.size() == 0) {
        peligrosidad = 0
    } else {
        peligrosidad = self.masPeligroso()
    }
    return peligrosidad
  }

  method reaccion() {
    cosas.forEach({c => c.reaccion()})
  }

  method cantBultos() {
    return 1 + cosas.size()
  }
}


object residuos {
  var peso = 25
  method peso(pesoX) {peso = pesoX}
  method peso() = peso 
  method peligrosidad() = 200
  method reaccion() {
    peso = peso + 15
  }

  method cantBultos() = 1 
}

object embalaje {
  var tieneDentro = bateria
  method tieneDentro(cosa){tieneDentro = cosa}
  method peso() = tieneDentro.peso()
  method peligrosidad() = tieneDentro.peligrosidad() / 2
  method reaccion() {
    
  }

  method cantBultos() = 1 
}
