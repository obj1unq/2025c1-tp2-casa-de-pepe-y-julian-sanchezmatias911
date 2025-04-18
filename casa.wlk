import cosas.* 







/*#################################
       AUN NO ESTA TERMINADO!!!
* ################################# */
object casaDePepeYJulian {

    /*  "compras":
             *puede comprar cosas repetidas
            

        **los metodos que no son de la Interfaz de casaDePepeYJulian 
            se encuentran en "METODOS AUXILIARES"**     
    */
    const compras =[] //list
    //const historialCompras = [] // list
    
    method comprar(cosa){ 
        compras.add(cosa)
    }

    method cantidadDeCosasCompradas(){
        return compras.size()
    }

    method tieneAlgun(categoria){
        /*
        */
        return compras.any({bien =>bien.categoria() == categoria})
    }

    method vieneDeComprar(categoria){ //
            /*

            */
            if (not self.compreAlgo()){ 
                    self.error("no compre nada de nada")
            }

            return self.ultimaCompra().categoria() == categoria
    }

    method esDerrochona(){ 
        return self.importeTotal()>= 9000
    }

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

    method comprados(categoria){
        /**/
        return compras.filter({bien => bien.categoria()==categoria}) 
    }

    // #######################################################
    // SOLUCION PROVISORIA
    method malaEpoca(){
        return compras.all({bien => self.esDeCategoria(bien,comida)})
    }

    method esDeCategoria(bien,categoria){
        return bien.categoria()==categoria
    }
    // ######################################################

    method queFaltaComprar(lista){
    //Se espera que reciba de argumento una lista sin repetidos

        return compras.filter({bien => not (self.compre(bien,lista))})
    }

    
    // #########PROVISORIA##############
    //preguntar si esta bien llamar por la referencia global
    //a un metodo exclusivo de ese objeto
    method faltaComida(){
        return not compras.contains(comida)
    }
    //#######################

    method categoriasCompradas(){
        return compras.map({bien => bien.categoria()}).asSet()
    }


    

    //######## METODOS AUXILIARES #########

    method ultimaCompra(){
        /*  Proposito : Devuelve el ultimo bien comprado
            **No rompe porque solo se invoca si mi lista de compras no esta vacia**
        */
        return compras.last()
    }
    
    method compreAlgo(){
        return not compras.isEmpty()
    }

    method importeTotal(){
        /*
            Proposito: Si compre bienes me da la suma de todas las compras
                       En caso de no haber comprado retorna 0 
        */
        return compras.sum({bien => bien.precio()})
     }

   
    method comprasSet(){
        return compras.asSet()
    }
    method compre(bien,lista){

        return lista.contains(bien)
    }
    // ############################

}




