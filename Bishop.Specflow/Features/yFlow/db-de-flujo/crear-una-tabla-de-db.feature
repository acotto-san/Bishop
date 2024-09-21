#language:es
Característica: Crear una tabla para consultarla en la ejecución de un flujo

	Regla de negocio: Poder subir un archivo para que se cree una tabla de DB

		@tc:9394
		Escenario: creo una tabla para un flujo a partir de un csv
			Dado que Charly desea consultar una tabla en la ejecución del flujo
			Y posee un csv con columnas y registros
			Cuando sube el csv como una tabla de DB del flujo
			Entonces luego podra consultarla desde una pieza específica