object rolando{
    const artefactos  =  #{} //Conjunto VACIO!!! SET porque no importa el orden ni repetidos.
    const historial = [] //importa le orden y repetidos, por eso es una lista.
    var capacidad = 2
    const morada = castillo
   
    method incrementarCapacidad(cantidad){
        capacidad += cantidad
    }

    method artefactos(){
        return  artefactos
    }

    method posesiones(){
        return  artefactos + morada.baul()
    }

    method encontrar(artefacto){
        if(self.tieneCapacidad()){
            artefactos.add(artefacto)
        } 
        historial.add(artefacto)
    }

    method historial(){
        return historial
    }

    method tieneCapacidad(){
        return artefactos.size() < capacidad
    }

    method irAMorada(){
        morada.depositar(artefactos)
        artefactos.clear() //    artefactos.removeAll(artefactos) //EQUIVALENTE pero no aprovecha el clear.
    }
 
}

//#################### ARTEFACTOS ########################
object espada{}

object libro{}

object collar{}

object armadura{}

//################### morada ###########################
object castillo{
    const baul = #{} //No importa el orden ni repetidos, por eso es un conjunto/set.

    method depositar(artefactos){
        baul.addAll(artefactos)
    }

    method baul(){ //PARA TESTEAR en un inicio, pero luego se vuelve necesario para que Rolando pueda indicar sus posesiones!
        return baul
    }
}