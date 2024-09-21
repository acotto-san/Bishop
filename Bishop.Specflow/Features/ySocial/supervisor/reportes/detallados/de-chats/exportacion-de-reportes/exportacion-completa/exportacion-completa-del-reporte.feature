#language: es 
@us:6085

Característica: Poder exportar el reporte completo
	Como supervisor 
	Quiero poder exportar el reporte completo 
	Para ver toda la info en formato excel o csv


	Regla de negocio: El reporte se debe exportar completo con toda la info

	@tc:7883
	Escenario: Supervisor exporta el reporte completo
		Dado un supervisor que se encuentra viendo el reporte que contiene mas de los registros que se pueden visualizar
		Cuando seleccione exportar 
		Entonces debera poder exportar el reporte completo 

	@tc:7884
	Esquema del escenario: Supervisor exporta el listado completo en excel o csv
		Dado un supervisor exporta el reporte completo
		Cuando haga click en exportar 
		Entonces debera ver el formato <formato> para exportar

		Ejemplos:
		| formato |
		| Excel   |
		| CSV     |