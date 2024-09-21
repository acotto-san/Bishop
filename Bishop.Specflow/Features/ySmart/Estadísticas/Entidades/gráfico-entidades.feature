#language: es
Característica: Gráfico - estadísticas de entidades

	Como usuario de ysmart 
	quiero ver las estadísticas de cada entidad 
	para obtener un gráfico con porcentajes

Exploratorio: probar distintos intervalos de fechas

Regla: Se muestra el porcentaje de cada entidad por intervalos

	@tc:7770
	Escenario: se filtra el grafico de entidades por el dia de la fecha
	Exploratorio: hacer hover en la entidad, debe contar la cantidad de apariciones
		Dado que la entidad domicilio se proceso dos veces el dia de hoy
		Y la entidad pokemon se proceso seis veces
		Cuando se visualiza el grafico de estadisticas entidades filtrado por el dia de hoy
		Entonces domicilio aparecera con el 25% 
		Y pokemon con el 75%


	@tc:7771
	Esquema del escenario: se elimina una entidad y no se modifican los registros del gráfico
		Dado que en el dia de ayer se proceso dos veces la entidad pokemon
		Y el dia de hoy se elimina esa entidad
		Cuando se visualiza el grafico filtrando por el dia de ayer
		Entonces no deberia haber cambios en los registros
		Y aparecera una aclaracion en la entidad pokemon

