#language: es
Característica: Tener una lista desplegable de colas para que sea utilizado en un filtro
	Dado que como supervisor tengo muchas colas que ver en reportes/vistas
	Quiero un filtro de colas en de tipo lista
	Para poder filtrar el total de mis reportes seleccionando por 1 cola en especial

	Regla de negocio: La lista muestra resultados de lo que se busque en el filtro de la lista

		Escenario: Supervisor encuentra resultados escribiendo el nombre completo de la cola
			Dado una cola con el siguiente nombre 
			| Cola   |
			| Cola Z |
			Cuando el supervisor escriba en el filtro "Cola Z" 
			Entonces como resultado vera la "Cola Z"

		Escenario: Supervisor encuentra resultados escribiendo el nombre parcial de la cola

			Dado una cola con el siguiente nombre
			| Cola  |
			| ABCDE |
			Cuando el supervisor ingrese en el filtro las letras "ABC" 
			Entonces como resultado vera la cola "ABCDE"

	Regla de negocio: La lista solo permite elegir 1 cola

		Escenario: Supervisor selecciona solo una cola
			Dado un supervisor ingresa a la lista de busqueda
			Cuando haga click en una cola
			Entonces el filtro debera quedar con esa cola seleccionada

		Escenario: Supervisor clickea varias colas
			Dado un supervisor ya tiene seleccionada la cola "COLA1"
			Cuando haga click en la cola "COLA2"
			Entonces debera quedar seleccionada "COLA2"

	Regla de negocio: La lista no debe mostrar las colas deshabilitdadas 
		
		Escenario: Supervisor busca una cola que se encuentra deshabilitada
			Dado las siguientes colas
			| Cola   | Estado        |
			| Cola 2 | Habilitado    |
			| Cola 3 | Deshabilitado |
			Cuando el supervisor busque la cola "Cola 3"
			Entonces no debera ver la cola para seleccionarla

	Regla de negocio: La lista no debe mostrar las colas que se hayan eliminado

		Escenario: Supervisor busca una cola que se elimino
			Dado que la siguiente cola se encuentra eliminada
			| Cola  |
			| COLAZ |
			Cuando el supervisor busque la "COLAZ"
			Entonces no debera ver la cola para seleccionarla