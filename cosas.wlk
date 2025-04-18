object electrodomestico{
	
}

object mueble {
	
}

object comida {
	method esComestible() = true

}

object heladera {
	method precio() { return 20000 }
	method categoria() { return electrodomestico }
	//method esDeCategoria(categoria) = self.categoria()==categoria
	method esComestible() = false
	
}

object cama {
	method precio() { return 8000 }
	method categoria() { return mueble }
	//method esDeCategoria(categoria) = self.categoria() == categoria
	method esComestible() = false
	
}

object tiraDeAsado {
	method precio() { return 350 }
	method categoria() { return comida }
	//method esDeCategoria(categoria) = self.categoria()==categoria
	method esComestible() = true
}

object paqueteDeFideos {
	method precio() { return 50 }
	method categoria() { return comida }
	//method esDeCategoria(categoria) = self.categoria()==categoria
	method esComestible() = true

}

object plancha {
	method precio() { return 1200 }
	method categoria() { return electrodomestico }
	//method esDeCategoria(categoria) = self.categoria()==categoria
	method esComestible() = false
	
}

/* ################## CUENTAS ######################
	-las *cuentas* saben decir:
	 saldo()
	 depositar()
	 extraer()

 ################################################## */
object cuentaCorriente{
	 var saldo = 0 // valor iniciar para casaDePepeYJulian

	method saldo() = saldo
	method saldo(_saldo){saldo =_saldo}	 //solo para testear,no accesible para usuario

	method depositar(dinero){
        saldo += dinero
    }

    method extraer(dinero){
        if((saldo-dinero) < 0){self.error("no cuenta con dinero suficiente")}
        else {saldo -= dinero}
    }
}
object cuentaGastos {
	var saldo = 0 // valor iniciar para casaDePepeYJulian
	var costoOperacion = 0

	method saldo() = saldo

	method saldo(_saldo){saldo= _saldo} // solo para testear, no accesible para usuario
	
	method costoOperacion(_costoOperacion){
		costoOperacion=_costoOperacion
	}

	method depositar(dinero){
		if (dinero>1000){
			self.error("limite de 1000 pesos para depositar")
		}
		saldo = saldo  + dinero - costoOperacion
	}

	method extraer(dinero) {
		saldo = saldo - dinero
	}
}
