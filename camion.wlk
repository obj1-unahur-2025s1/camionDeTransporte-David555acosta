import cosas.*

object camion {
  method tara() = 1000
  var cantBultos = 0
  const carga = #{}

  method cargar(cosa) {
    cosa.reaccion()
    carga.add(cosa)
  }

  method descargar(cosa) {
    carga.remove(cosa)
  }

  method todosLosPesosSonPares() {
    return carga.all({c => c.peso().even()})
  }

  method hayCosaQuePeseX(pesoX) {
    return carga.any({c => c.peso() == pesoX})
  }

  method primerCosaCargadaConPeligrosidad(nivel) {
    return carga.find({c => c.peligrosidad() == nivel})
  }

  method obtenerTodosLosQueSuperen(nivel) {
    return carga.filter({c => c.peligrosidad() > nivel})
  }

  method estaExcedido() {
    return carga.sum({c => c.peso()}) + self.tara() > 25000
  }

  method puedeCircularEnRuta(maximoPeligrosidad) {
    return not self.estaExcedido() and carga.any({c => not c.peso() >= maximoPeligrosidad})
  }

  method maximoCamion() {
    return carga.max({c => c.peso()})
  }

  method hayCosaConPesoEntre(minimo , maximo) {
    return carga.any({c => c.peso()}).between(minimo, maximo)
  }

  method mostrarCamion() {
    return carga
  }
}

