#language: es
@us:7317

Característica: Tener una parte del tablero donde ver los consumos de tokens gpt
	Como administrador
	Quiero poder ver un los consumos de tokens en una parte del tablero
	Para asi poder ver la cantidad de tokens de entrada, tokens de salida y la totalidad de tokens que consumo

	Regla de negocio: El contador de tokens de entrada debera contar los tokens de entrada consumidos
		
		@tc:8632
		Escenario: Mensaje genera tokens de entrada
			Dado que el mensaje 900 pasa por una pieza que identifica intencion y produce 50 tokens de entrada
			Cuando se consolide la metrica
			Entonces los tokens de entrada deberan ser 50 

		@tc:8634
		Escenario: Mensaje genera tokens de entrada y se vuelve a analizar
			Dado que el mensaje 915 pasa por una pieza que identifica intencion y produce 100 tokens de entrada
			Y luego vuelve a analizar el mismo mensaje en otra pieza que consulta base de conocimiento y genera 300 tokens de entrada
			Cuando se concolide la metrica de tokens
			Entonces los tokens de entrada fueron 400

	Regla de negocio: El contador de Tokens de salida debera contar los tokens de salida consumidos
		
		@tc:8635
		Escenario: Mensaje genera tokens de salida
			Dado que el mensaje 800 pasa por una pieza que identifica intencion y produce 10 tokens de salida
			Cuando se consolide la metrica
			Entonces los tokens de salida deberan ser 10 

	Regla de negocio: El contador de Tokens totales debera mostrar la suma de la entrada y salida de tokens
		
		@tc:8636
		Escenario: Contador de tokens totales muestra la suma de tokens de entrada y tokens de salida
			Dado que tengo 50 tokens de entrada y 50 tokens de salida
			Cuando vea el contador de tokens totales
			Entonces debera mostrar 100 tokens

		@tc:8637
		Escenario: Contador de tokens totales muestra la suma de tokens de entrada y de salida en diferentes dias
			Dado que el dia 20/02 tengo 25 tokens de salida y 25 de entrada
			Y el dia 21/02 tengo 50 tokens de salida y 50 de entrada
			Cuando filtre el tablero con las fechas "20/02 al 21/02"
			Entonces en tokens totales debera mostrar 150 tokens