#language: es 
@us:6085

Característica: Poder exportar el reporte 
	Como supervisor 
	Quiero poder exportar el reporte  
	Para ver toda la info que se ve en pantalla en formato excel o csv


	Regla de negocio: El reporte debe poder exportar lo visible en pantalla

	@tc:7885
	Escenario: Supervisor exporta el reporte visible
		Dado un supervisor que se encuentra viendo el reporte 
		Cuando seleccione exportar 
		Entonces debera poder exportar el reporte

	@tc:7886
	Esquema del escenario: Supervisor exporta el listado en excel o csv
		Dado un supervisor exporta el reporte
		Cuando haga click en exportar 
		Entonces debera ver el formato <formato> para exportar

		Ejemplos:
		| formato |
		| Excel   |
		| CSV     |