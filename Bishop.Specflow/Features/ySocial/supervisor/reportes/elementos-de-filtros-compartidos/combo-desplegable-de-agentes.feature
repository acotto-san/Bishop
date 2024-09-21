#language: es
Característica: Tener una combo desplegable de agentes para seleccionar multiples
	Como supervisor que estoy por buscar registros en un reporte
	Quiero tener un filtro de agentes
	Para poder elegir que los resultados esten filtrados por una o multiples personas y ocultar el resto

	Regla de negocio: El combo desplegable es un elemento distribuido en diferentes reportes

		@tc:7098
		Esquema del escenario: Lista desplegable de agentes se encuentra disponible en los filtros de un formulario de reporte
			Cuando un supervisor ingresa al formulario del reporte <tipo de reporte>
			Entonces vera en los filtros el combo desplegable de agente

			Ejemplos: 
				| tipo de reporte                   |
				| filtros de Tiempo Real de Agentes |
				| dashboard                         |
				| consolidado de agentes            |
				| detallado de login logout         |
				| detallado de transferencias       |
				| detallado de reapertura de casos  |

	Regla de negocio: El combo desplegable muestra username de los agentes

		@tc:7099
		Escenario: El combo desplegable de agentes muestra usernames
			No lo muestra el username en el tiempo real de agentes
			Dado un agente con los siguientes datos
				| username | nombres         |
				| sacosta  | santiago acosta |
			Cuando un supervisor busque a un agente en el combo desplegable
			Entonces podra ubicarlo mediante su username

		@tc:7100
		Escenario: Supervisor encuentra a un agente filtrando por un username
			Dado un agente con los siguientes datos
				| username | nombres         |
				| sacosta  | santiago acosta |
			Cuando un supervisor ingresa el username del agente en el filtro del combo desplegable
			Entonces debera quedar la lista filtrada mostrando al agente

	Regla de negocio: Se puede seleccionar multiples agentes

		@tc:7101
		Escenario: Supervisor selecciona un agente del combo desplegable de agentes
			Dado un supervisor ingresa al formulario de un reporte
			Cuando selecciona un agente del combo desplegable de agentes
			Entonces podra proseguir con la busqueda del reporte
			Y el resultado del reporte quedara filtrado solo por ese agente

		@tc:7102
		Escenario: Supervisor selecciona multiples agentes del combo desplegable de agentes
			Dado un supervisor ingresa al formulario de un reporte
			Cuando selecciona varios agentes del combo desplegable de agentes
			Entonces podra proseguir con la busqueda del reporte
			Y el resultado del reporte quedara filtrado los agentes seleccionados
