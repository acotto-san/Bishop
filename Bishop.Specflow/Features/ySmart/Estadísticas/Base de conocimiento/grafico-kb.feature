#language: es
Característica:Grafico - Estadísticas de la kb
	Como usuario de ysmart 
	quiero ver las estadísticas de cada archivo de cada base de conocimiento
	para obtener un gráfico con porcentajes

Exploratorio: filtrar por diferentes intervalos de fechas

Regla: Se muestra el porcentaje de cada categoria por intervalos

	@tc:7615
	Escenario: se filtra el grafico de base de conocimiento por el dia de la fecha
		Dado que el archivo ESI se proceso dos veces el dia de hoy
		Y el archivo procrear se proceso seis veces
		Cuando se visualiza el grafico de estadisticas de la kb filtrado por el dia de hoy
		Entonces ESI aparecera con el 25%
		Y procrear con el 75%

	@tc:7616
	Escenario: se visualizan archivos de una misma categoria
		Dado que el archivo A de la categoria procrear se proceso 2 veces esta semana
		Y el archivo B de la categoria procrear se proceso 6 veces
		Cuando se visualiza el grafico de estadisticas de la kb filtrado por la ultima semana
		Entonces la categoria procrear aparecera con un 100%
		Y cada archivo tendra sus apariciones correspondientes


	@tc:7617
	Esquema del escenario: se elimina una kb y no se modifican los registros del gráfico
	#este comportamiento no está asegurado, los registros no se van a eliminar pero no se confirmó que va a estar la aclaración
		Dado que en el dia de ayer se proceso dos veces un archivo de la categoria Procrear
		Y el dia de hoy se elimina ese <elemento>
		Cuando se visualiza el grafico filtrando por el dia de ayer
		Entonces no deberia haber cambios en los registros
		Y aparecera una aclaracion en el elemento eliminado

		Ejemplos: 
		| elemento  |
		| archivo   |
		| categoria |