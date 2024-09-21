#language: es
@us:6634
Característica: Metodo replaceAll
	Como supervisor
	quiero tener un metodo que me permita reemplazar todos los caracteres seleccionados
	para no tener que cambiarlos uno por uno

	Piezas donde se puede usar:
	-Asignar una variable
	-Elemento/s de un array
	-Concatenacion

	Forma de armar la expresion:
	${replaceAll(elemento a modificar,patron a identificar,elemento a dejar como reemplazo)}$
	${replaceAll(06/09/23,"/","-")}$ Imprime = 06-09-23
	Trilogia de :
		-elemento a modificar (puede ser una variable string o un una key (string) de un objeto: objeto.name)
		-patron a identificar (string literal: "esto esta entre comillas" variable: Variable1 de yFlow con valor 'texto' )
		-elemento a dejar como reemplazo (Puede ser lo que se desee dejar como reemplazo)

	Regla de negocio: el metodo replaceAll reemplaza todos los caracteres que se le configure
	
		@tc:6913
		Escenario: implementador utiliza el metodo con un string como patron a identificar
			Dado que un implementador tiene una variable de texto
				| Nombre de la variable | Contenido de la variable |
				| VariableC             | Hola,chau                |
			Cuando utilice el metodo replaceAll con la expresion "replaceAll(VariableC,'chau','adios')"
			Entonces el texto de la variable debera ser "Hola,adios"

		@tc:6914
		Escenario: implementador utiliza el metodo con una variable como patron a identificar
			Dado que un flujo posee las siguientes variables de tipo texto
				| Nombre de la variable | Contenido de la variable |
				| VariableA             | 'Valor 1'                |
				| VariableB             | '1'                      |
			Cuando utlice el metodo replaceAll sobre la variable "VariableA" de la siguiente manera "replaceAll(VariableA,VariableB,'UNO')
			Entonces el texto de la variable debera ser "Valor UNO"

	Regla de negocio: si el metodo tiene mas de un match debe reemplazar todo con lo que matchee
		
		@tc:6915
		Escenario: metodo replaceAll se encuentra con mas de un match
			Dado que un implementador configura el metodo replaceAll
			Cuando este se encuentre con mas de un match 
			Entonces debera modificar todos los matchs con los que se encuentre

		@tc:6916
		Escenario: metodo replaceAll se encuentra con un solo match
			Dado que un implementador configura el metodo replaceAll
			Cuando este se encuentra con un solo match 
			Entonces debera solo modificar ese match

		@tc:6917
		Escenario: metodo replaceAll no se encuentra con ningun match
			Dado que un implementador configura el metodo replaceAll
			Cuando este no se encuentre con ningun match
			Entonces no debera modificar nada

	Regla de negocio: Se puede utilizar la llamada a un metodo en el primer argumento de replaceAll

		@tc:6918
		Escenario: metodo se ejecuta tomando como input el resultado de un metodo previo
			Dada una pieza con la siguiente expresion de javascript
				```
				${replaceAll(VariableTexto.toUpperCase(),"-", "")}$
				```
			Y la variable "variableTexto" contiene el siguiente dato: 
				```	
				1 - visa \n 2 - master
				```
			Cuando la pieza ejecuta el codigo
			Entonces el resultado de la expresion sera
				```
				1  VISA \n 2  MASTER
				```

		@tc:6919
		Escenario: metodo genera un output y es provisto al siguiente metodo
			Dada una pieza con la siguiente expresion de javascript
				```
				${replaceAll(VariableTexto.toUpperCase(),"-", "")}$
				```
			Y la variable "variableTexto" contiene el siguiente dato: 
				```
				1 - visa \n 2 - master
				```
			Cuando la pieza ejecuta el codigo
			Entonces el resultado de la expresion sera
				```
				1  VISA \n 2  MASTER
				```