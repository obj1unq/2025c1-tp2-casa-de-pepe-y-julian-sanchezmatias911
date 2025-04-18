import cosas.* 

object casaDePepeYJulian {

    /*  ACLARACIONES:
            -En **compras** puede haber repetidos
            
            -Uso **bien** de argumento como singular de **bienes** que son los distintos objetos que puede comprar            

            -los metodos que no son de la Interfaz de casaDePepeYJulian 
             se encuentran en "METODOS AUXILIARES"**  al final    

            -Las cuentas bancarias son objetos implementados en "cosas.wlk" 
            la casaDePepeYJulian entiende:
              cuentaActual(cuentaActual): alternar entre su cuenta corriente y cuentaGastos
              depositar_enCuenta(dinero,cuenta)
              extraer_deCuenta(dinero,cuenta)

    */

    const compras =[] 
    var cuentaActual = cuentaCorriente

    
    // ########## CUENTAS BANCARIAS ###########
    method cuentaActual(_cuentaActual){ //
        cuentaActual = _cuentaActual
    }

    method depositar_enCuenta(dinero,cuenta){
        cuenta.depositar(dinero)
    } 

    method extraer_deCuenta(dinero,cuenta){
        cuenta.extraer(dinero)
    }

    

   
    

    // ######################################## 

    
    method comprar(cosa){ 
        compras.add(cosa)
    }

    method cantidadDeCosasCompradas() = compras.size()

    method tieneAlgun(categoria) = compras.any({bien =>bien.categoria() == categoria})
    

    method vieneDeComprar(categoria){ //
            
            if (not self.compreAlgo()){ 
                    self.error("no compre nada de nada")
            }

            return self.ultimaCompra().categoria() == categoria
    }

    method esDerrochona() = self.importeTotal()>= 9000
    

     method compraMasCara(){
         /*
            Proposito: 
                *devuelve el objeto con el precio mas caro de mi lista de compras
                *si no he comprado nada lanza una excepcion
         */
         return compras.maxIfEmpty({bien => bien.precio()}, 
                                   {"No he comprado nada"} 
                                  )
    }

    method comprados(categoria) = compras.filter({bien => bien.categoria()==categoria}) 
    

    // #######################################################
    // SOLUCION PROVISORIA
    method malaEpoca(){
        return compras.all({bien => self.esDeCategoria(bien,comida)})
    }

   
    // ######################################################

    method queFaltaComprar(lista){
    /* PROPOSITO: devuelve una lista de objetos de **lista** que no compre,
                  es decir, que no esta en **compras**,
            *Se espera que reciba de argumento una lista sin repetidos*/

        return lista.filter({bien => not (self.compre(bien,compras))})
    }

    
    /* #############  PREGUNTA! ##########################
        Al principio habia escrito:

        method faltaComida() = compras.contains(comida)

        ¿Esta mal ya que estoy llamando a comida usando su referencia global?
        Si este metodo es exclusivo para llamar a la referencia **comida**,¿ esta bien
        usar su referencia global o podria acarrear problemas?

        Use una subtarea para llamar distintos bienes como argumento 
        por esta duda mas abajo.

    #####################################################*/
    method faltaComida() =  not self.compre(comida,compras)
    
    


    method categoriasCompradas() = compras.map({bien => bien.categoria()}).asSet()


    // ####################################################################
    //                           METODOS AUXILIARES
    // ####################################################################

    method ultimaCompra(){
        /*  Proposito : Devuelve el ultimo bien comprado
            **No rompe porque solo se invoca si mi lista de compras no esta vacia**
        */
        return compras.last()
    }
    
    method compreAlgo()=  not compras.isEmpty()
    

    method importeTotal(){
        /*
            Proposito: Si compre bienes me da la suma de todas las compras
                       En caso de no haber comprado retorna 0 
        */
        return compras.sum({bien => bien.precio()})
     }

   
    method comprasSet() = compras.asSet()
    
    method compre(bien,lista) =  lista.contains(bien)
    
    method esDeCategoria(bien,categoria) = bien.categoria()==categoria
    
   

}




