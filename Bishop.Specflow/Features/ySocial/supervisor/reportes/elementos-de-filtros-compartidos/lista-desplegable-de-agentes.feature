#language: es
Característica: Tener una lista desplegable de agentes para seleccionar uno
	Como supervisor que estoy por buscar registros en un reporte
	Quiero tener un filtro de agente
	Para poder elegir que los resultados esten filtrados por una persona y ocultar el resto

	Regla de negocio: La lista desplegable es un elemento distribuido en diferentes reportes

		@tc:7094
		Esquema del escenario: Lista desplegable de agentes se encuentra disponible en los filtros de un formulario de reporte
			Cuando un supervisor ingresa al formulario del reporte <tipo de reporte>
			Entonces vera en los filtros la lista desplegables de agente

			Ejemplos: 
				| tipo de reporte                    |
				| detallado de segmentos de mensajes |
				| detallado de mensajes              |
				| detallado de casos                 |
	
	Regla de negocio: La lista desplegable muestra username de los agentes

		@tc:7095
		Escenario: Lista desplegable de agentes muestra usernames
			Dado un agente con los siguientes datos
				| username | nombres         |
				| sacosta  | santiago acosta |
			Cuando un supervisor busque a un agente en la lista desplegable
			Entonces podra ubicarlo mediante su username

		@tc:7096
		Escenario: Supervisor encuentra a un agente filtrando por un username
			Dado un agente con los siguientes datos
				| username | nombres         |
				| sacosta  | santiago acosta |
			Cuando un supervisor ingresa el username del agente en el filtro de la lista desplegable
			Entonces debera quedar la lista filtrada mostrando al agente

	Regla de negocio: Solo se puede seleccionar 1 elemento de la lista

		@tc:7097
		Escenario: Supervisor selecciona un agente de la lista
			Dado un supervisor ingresa al formulario de un reporte
			Cuando selecciona un agente de la lista desplegable
			Entonces no podra seleccionar otro agente de la lista
			Y el resultado del reporte quedara filtrado solo por ese agente
