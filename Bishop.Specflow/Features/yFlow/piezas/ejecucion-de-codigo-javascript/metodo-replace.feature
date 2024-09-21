#language: es
Característica: Metodo replace
	como supervisor
	quiero tener un metodo que me permita reemplazar caracteres seleccionados
	para poder modificarlos

	Piezas donde se puede usar:
	-Asignar una variable
	-Elemento/s de un array
	-Concatenacion

	Forma de armar la expresion:
	VariableAModificar.replace(patronAIdentificar,datoQueVaEnReemplazo)
	${Texto1.replace("1","UNO")}$ Imprime = TextoUNO
	Trilogia de :
		-elemento a modificar (puede ser una variable string o un una key (string) de un objeto: objeto.name)
		-patron a identificar (string literal: "esto esta entre comillas" variable: Variable1 de yFlow con valor 'texto' )
		-elemento a dejar como reemplazo (Puede ser lo que se desee dejar como reemplazo)

Regla de negocio: el metodo replace reemplaza los caracteres que se le configure

	Escenario: implementador utiliza el metodo replace con un string como patron a identificar
		Dado que un implementador tiene una variable de texto
			| Nombre de la variable | Contenido de la variable |
			| VariableA             | Hola,chau chau           |
		Cuando utlice el metodo replaceAll sobre la variable "VariableA" de la siguiente manera "VariableA.replacel('chau','adios')"
		Entonces el texto de la variable debera ser "Hola,adios chau"

	Escenario: implementador utiliza el metodo replace con una variable como patron a identificar
		Dado que un flujo posee las siguientes variables de tipo texto
			| Nombre de la variable | Contenido de la variable |
			| VariableB             | Hola                     |
		Cuando utlice el metodo replaceAll sobre la variable "VariableB" de la siguiente manera "VariableB.replace(VariableB,'Adios')
		Entonces el texto de la variable debera ser "Adios"

	Escenario: implementado utiliza el metodo con un regex como como patron a identificar
		Dado que un implementador tiene una variable de texto
			| Nombre de la variable | Contenido de la variable |
			| VariableC             | 11-263335-83             |
		Cuando utilice el metodo replaceAll con sobre la variable "VariableC" de la siguiente manera "VariableC.replace(/[-\s]/g, "")"
		Entonces el texto de la variable debera ser "1126333583"
 
Regla de negocio: si el metodo se encuentra con mas de un match solo debera cambiar el primer match

	Escenario: metodo replace se encuentra con mas de un match
		Dado que un implementador configura el metodo replace
		Cuando este se encuentre con mas de un match 
		Entonces debera modificar solo el primer match que se encuentre

	Escenario: metodo replace se encuentra con un solo match
		Dado que un implementador configura el metodo replace
		Cuando este se encuentra con un solo match 
		Entonces debera solo modificar ese match

	Escenario: metodo replace no se encuentra con ningun match
		Dado que un implementador configura el metodo replace
		Cuando este no se encuentre con ningun match
		Entonces no debera modificar nada

Regla de negocio: se puede concatenar la ejecucion del metodo

	
	Escenario: metodo se ejecuta tomando como input el resultado de un metodo previo
		Dada una pieza con la siguiente expresion de javascript
		```
		${variableTexto.toUpperCase().replace("-","")}$
		```
		Y la variable "variableTexto" contiene el siguiente dato: 
		```
		1 - visa \n 2 - master
		```
		Cuando la pieza ejecuta el codigo
		Entonces el resultado de la expresion sera
		```
		1  VISA \n 2 - MASTER
		```

	 
	Escenario: metodo genera un output para usarse en el siguiente metodo
		Dada una pieza con la siguiente expresion de javascript
		```
		${variableTexto.replace("-","").toUpperCase()}$
		```
		Y la variable "variableTexto" contiene el siguiente dato: 
		```
		1 - visa \n 2 - master
		```
		Cuando la pieza ejecuta el codigo
		Entonces el resultado de la expresion sera
		```
		1  VISA \n 2 - MASTER
		```