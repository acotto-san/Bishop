#language: es
Característica: Pieza para consultar si una entidad estuvo presente en el último análisis cognitivo

	Como implementador que analiza frases del usuario en yFlow
	Quiero tener una manera de averiguar si en las entidades identificadas había una en particular presente
	Para poder obtener el valor que estaba presente en la frase

	Regla de negocio: la pieza guarda el resultado en una variable
		
		@tc:pendiente
		Escenario: la pieza "obtener entidad" encuentra una entidad presente en la lista de entidades y guarda su valor en otra variable
			Dado que la ultima vez que se analizo una frase se identifico:
				| nombre entidad | valor encontrado |
				| direccion      | corrientes 3360  |
				| edad           | 2 años y 5 meses |
				| codigo postal  | 1130             |
			Y una pieza obtener entidad que posee configurado recuperar la entidad direccion
			Cuando la pieza es ejecutada
			Entonces en una variable guardara el valor "corrientes 3360"

