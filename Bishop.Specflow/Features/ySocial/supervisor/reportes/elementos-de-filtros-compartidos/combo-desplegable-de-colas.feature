#language: es
Característica: Tener un combo desplegable de colas para que sea utilizado en un filtro
	Dado que como supervisor tengo muchas colas que ver en reportes/vistas
	Quiero un filtro de colas en de tipo combo
	Para poder filtrar el total de mis reportes seleccionando por 1 o más colas

Lugares donde se puede encontrar el combo:
	-Reportes
	Consolidado de Encuestas
	Consolidado de colas
	Detallado de mensajes
	Detallado de casos
	Detallado de chats
	Detallado de encuestas
	Detallado de transferencias
	Detallado de segmentos de tiempos de mensajes
	-Configuracion-colas
	Transferir mensajes a otra cola
	-Configuracion
	Etiquetas
	-Mis ajustes
	Colas en tiempo real
	-Configuracion - servicio - config avanzada (yFlow)
	"Compartir mensajes encolados de las siguientes colas"
	"Compartir agentes conectados de las siguientes colas"

	Regla de negocio: El combo muestra resultados de lo que se busque en el filtro de la lista

		@tc:7168
		Escenario: Supervisor encuentra resultados escribiendo el nombre completo de la cola
			Dado una cola con el siguiente nombre 
			| Cola   |
			| Cola A |
			Cuando el supervisor escriba en el filtro "Cola A" 
			Entonces como resultado vera la "Cola A"

		@tc:7169
		Escenario: Supervisor encuentra resultados escribiendo el nombre parcial de la cola

			Dado una cola con el siguiente nombre
			| Cola  |
			| ABCDE |
			Cuando el supervisor ingrese en el filtro las letras "ABC" 
			Entonces como resultado vera la cola "ABCDE"

	Regla de negocio: El combo permite elegir 1 o mas colas

		@tc:7170
		Escenario: Supervisor selecciona varias colas 
			Dado un supervisor ingresa al combo de busqueda
			Cuando haga click en varias colas
			Entonces el filtro debera quedar con esas colas seleccionadas
	
		@tc:7171
		Escenario: Supervisor selecciona solo una cola
			Dado un supervisor ingresa al combo de busqueda
			Cuando haga click en una sola cola
			Entonces el filtro debera quedar con esa cola seleccionada

	Regla de negocio: El combo permite marcar o desmarcar todas las colas
		
		@tc:7172
		Escenario: Supervisor marca todas las colas
			Dado un supervisor ingresa al combo de busqueda
			Cuando clickee la opcion de "marcar todas"
			Entonces debera ver todas las colas seleccionadas

		@tc:7173
		Escenario: Supervisor desmarca todas las colas
			Dado un supervisor tiene todas las colas seleccionadas 
			Cuando clickee en la opcion "desmarcar todas" 
			Entonces debera ver todas las colas desmarcadas

	Regla de negocio: La busqueda no debe mostrar las colas deshabilitadas
		
		@tc:7177
		Escenario: Supervisor busca una cola que se encuentra deshabilitada
			Dado las siguientes colas
			| Cola   | Estado        |
			| Cola A | Habilitado    |
			| Cola B | Deshabilitado |
			Cuando el supervisor busque la cola "Cola B"
			Entonces no debera ver la cola para seleccionarla

	Regla de negocio: La busqueda no debe mostrar las colas eliminadas

		@tc:7178
		Escenario: Supervisor busca una cola que se elimino
			Dado que la siguiente cola se encuentra eliminada
			| Cola  |
			| COLA1 |
			Cuando el supervisor busque la "COLA1"
			Entonces no debera ver la cola para seleccionarla