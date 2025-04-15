object rolando{
    const artefactos  =  #{} //Conjunto VACIAS!!! SET
    const historial = #{}
    var capacidad = 2
    const morada = castillo
   
    method incrementarCapacidad(cantidad){
        capacidad += cantidad
    }

/*
 Se desea saber el orden en que rolando fue encontrandose los artefactos, independientemente de si los agarró o no.
*/
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
        artefactos.clear() //    artefactos.removeAll(artefactos)
    }
 
}

//#################### ARTEFACTOS ########################
object espada{}

object libro{}

object collar{}

object armadura{}

//################### morada ###########################
object castillo{
    const moradores = #{rolando}
    const baul = #{}

    method depositar(artefactos){
        baul.addAll(artefactos)
    }

    method baul(){ //PARA TESTEAR!
        return baul
    }
}