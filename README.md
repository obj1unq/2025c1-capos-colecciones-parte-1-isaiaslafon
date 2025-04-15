# Capos

Este ejercicio busca ser una primer aproximación al mundo de las colecciones.

## Rolando

Se trata de un juego en el cual nuestro personaje, Rolando, va recolectando distintos artefactos por el mundo.
Para la primera versión, existen 4 artefactos:

- Espada del destino
- Libro de hechizos 
- Collar divino
- Armadura de acero valyrio

Al principio Rolando solo puede llevar hasta 2 artefactos a la vez, 
pero se espera que a medida que se desarrolla el juego pueda incrementar 
su capacidad.

Cada vez que rolando se encuentra con un artefacto, y tiene capacidad para llevarlo, lo levanta. 

### Ejemplo:
 1. rolando encuentra la espada del destino (la agarra)
 2. rolando encuentra el libro de hechizos (la agarra)
 3. rolando encuentra el collar divino (no lo agarra, ya que tiene la espada y el libro encima y su capacidad es de 2)

## Castillo de piedra

El castillo de piedra es donde Rolando vive. Es tan grande que allí no hay límite 
para almacenar artefactos.
Cuando rolando llega al castillo de piedra guarda en él todos los artefactos que lleva encima, 
liberando espacio para poder levantar nuevos. 

### Ejemplo:
 1. rolando encuentra la espada del destino (la agarra)
 2. rolando encuentra el libro de hechizos (la agarra)
 3. rolando llega al castillo de piedra (deja en el castillo la espada y el libro de hechizos)
 4. rolando encuentra el collar divino (ahora si lo puede agarrar, ya que liberó espacio)
 3. rolando llega al castillo de piedra de nuevo(deja el collar, con lo cual ahora el castillo tiene el collar, la espada y el libro)
 

## Saber los artefactos de Rolando
 Hay dos preguntas interesantes que debe poder contestar Rolando, por un lado cuales son los artefactos que tiene encima 
 (ya resuelto en el punto anterior), pero tambien debe saber cuales son todos los artefactos que él posee 
 sin importar si lo tiene encima o en su castillo.
 
 También se quiere preguntar si posee un artefacto en especial.
 
#Ejemplo: 
	Si el castillo tiene el collar, la espada. Rolando tiene la armadura. 
	Entonces rolando posee el collar, la espada y la armadura.
	El libro no lo posee.
 
## Saber la historia de los encuentros con los artefactos.
 
 Se desea saber el orden en que rolando fue encontrandose los artefactos, independientemente de si los agarró o no.
 
### Ejemplo:
 
 1. rolando encuentra la espada del destino (la agarra)
 2. rolando encuentra el libro de hechizos (la agarra)
 3. rolando encuentra el collar divino (no lo agarra, ya que tiene la espada y el libro encima y su capacidad es de 2)
 4. rolando llega al castillo de piedra (deja en el castillo la espada y el libro de hechizos)
 5. rolando encuentra la armadura de acero valyrio (la agarra)
 6. rolando encuentra el collar divino (ahora si lo puede agarrar, ya que liberó espacio)
 
Si consultamos la historia de encuentro con los artefactos debería ser:
 1. espada del destino 
 2. libro de hechicos
 3. collar divino
 4. armadura de acero valyrio
 5. collar divino (de nuevo!)
 
 


  
 






 

