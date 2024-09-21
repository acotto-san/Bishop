#language: es
Característica: Tener una pieza para realizar una consulta a una base de datos

	Regla de negocio: La pieza consulta una base realizando una query
		
		@tc:9395 @flowjson @csv
		Escenario: Se ejecuta una pieza Consultar Base de Datos y realiza una consulta a una tabla
			Dado que en una tabla hay registros de clientes
			Y entre los registros se encuentra el del cliente "Juan Perez"
			Cuando una pieza Consultar Base de Datos es ejecutada con la siguiente configuracion
				| columna a consultar | valor a buscar |
				| nombreCliente       | Juan Perez     |
			Entonces devolverá el registro de Juan Perez