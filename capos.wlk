object rolando{
    const artefactos  =  #{} //Conjunto VACIO!!! SET porque no importa el orden ni repetidos.
    const historial = [] //importa le orden y repetidos, por eso es una lista.
    var capacidad = 2
    const morada = castillo
    var property poderBase = 100
   
    method incrementarCapacidad(cantidad){
        capacidad += cantidad
    }

    method poder() {
        return poderBase + self.poderArtefactos() // + calcular la suma de los poderes de los artefactos   // esto se calcula
    }

    method poderArtefactos() {
        return artefactos.sum({ artefacto => artefacto.poder(self) })
    }
    
    method batalla() {
        poderBase += 1
        artefactos.forEach( { artefacto => artefacto.usar()})
    }

    method puedeVencer(enemigo) {
        return self.poder() > enemigo.poder()
    }

    method artefactos(){
        return  artefactos
    }

    method posesiones(){
        return  artefactos + morada.baul()
    }
    method artefactoInvocado() {
        return morada.artefactoInvocado(self)
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

    method tieneArtefactoFatal(enemigo) {
        return artefactos.any({ artefacto =>
            enemigo.poder() <= artefacto.poder(self)
        })
    }
    method artefactoFatal(enemigo) {
        return artefactos.find( { artefacto =>
            enemigo.poder() <= artefacto.poder(self)
        })
    } 

 
}

//#################### ARTEFACTOS ########################

// - Espada del destino: Las primera vez que se utiliza aporta la misma cantidad que el poder base del personaje, 
// luego sólo el 50%. 

// - Collar divino: aporta 3 puntos, pero si el personaje tiene un poder base mayor a 6,
//  le suma también un punto por cada batalla en las que se haya usado el collar.

// - Armadura de acero valyrio: Aporta 6 de poder de pelea siempre, el acero valyrio no se gasta con las batallas.
object espada{
    var nueva = true
    method poder(personaje) {
        const coeficiente = if (nueva) {1} else {0.5}
        return personaje.poderBase() * coeficiente
    }

    method usar() {
        nueva = false
    }
}

object libro{
    var property hechizos = []

    method poder(personaje) {
        return if (hechizos.isEmpty()) {0} else {hechizos.first().poder(personaje)}
    }

    method usar() {
        hechizos = hechizos.drop(1)
    }
}
//hechizos 
object bendicion{

    method poder(personaje) {
        return 4
    }

} 

object invisibilidad {
    method poder(personaje) {
        return personaje.poderBase()
    }
}

object invocacion {
    method poder(personaje) {
        return personaje.artefactoInvocado().poder(personaje)
    }
}
//Artefactos
object collar{
    var vecesUsadas = 0

    method poder(personaje) {
        return 3 + if (personaje.poderBase() > 6) vecesUsadas else 0
    }

    method usar() {
        vecesUsadas += 1 
    }
}

object armadura{
    method poder(personaje) {
        return 6
    }

    method usar() {

    }
}

//################### morada ###########################
object castillo{
    var property baul = #{} //No importa el orden ni repetidos, por eso es un conjunto/set. Se utiliza un var para propositos de testeo.

    method depositar(artefactos){
        baul.addAll(artefactos)
    }

    method baul(){ //PARA TESTEAR en un inicio, pero luego se vuelve necesario para que Rolando pueda indicar sus posesiones!
        return baul
    }

    method artefactoInvocado(personaje) {
        return baul.max({
                artefacto => artefacto.poder(personaje)
            })
    }
}

//moradas de enemigos
object palacio{
}
object fortaleza {
}
object torre {
}


//Enemigos
object archibaldo {
    method poder() {
        return 16
    }
    method morada() {
        return palacio
    }
} 
object caterina {
    method poder() {
        return 28
    }
    method morada() {
        return fortaleza
    }
}
object astra {
    method poder() {
        return 15
    }
    method morada() {
        return torre
    }
}
object erethia {
    var property enemigos = #{caterina, astra, archibaldo}

    method enemigosVencibles(personaje) {
        return enemigos.filter( { enemigo =>  
            personaje.puedeVencer(enemigo)
        } )
    }

    method moradasConquistables(personaje) {
        return self.enemigosVencibles(personaje).map({
            enemigo => enemigo.morada()
        }).asSet()
    }

    method esPoderoso(personaje) {
        return enemigos.all({ enemigo => personaje.puedeVencer(enemigo) })
    }

}


