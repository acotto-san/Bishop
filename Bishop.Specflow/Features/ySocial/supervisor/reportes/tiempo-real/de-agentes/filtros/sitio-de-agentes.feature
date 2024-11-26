#language: es
Característica: Filtrar la lista de agentes para ver los de determinado sitio

	Regla de negocio: Un supervisor puede decidir filtrar seleccionando cualquier sitio creado en la plataforma
		Con esto quiero decir que todos los supervisores ven todos los sitios en el desplegable

		@tc:pendiente
		Escenario: Supervisor ve los sitios del sistema en el desplegable
			Dado que existen sitios creados en ySocial
			Cuando un supervisor visualiza el filtro de sitios en el Tiempo Real de Agentes
			Entonces podra filtrar por cualquiera de los sitios creados en ySocial

	Regla de negocio: Lista de agentes queda filtrada cuando un supervisor filtra por sitio
		
		@tc:pendiente
		Escenario: Supervisor filtra por sitio y la vista queda con agentes que pertenece al sitio

		@tc:pendiente
		Escenario: Supevisor filtra por sitio y la lista de agentes queda vacía

	Regla de negocio: La lista de agentes filtrada sigue respetando los agentes que