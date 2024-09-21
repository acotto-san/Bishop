#language: es
Característica: Pieza adjunto

	Regla de negocio: La pieza permite el envio de adjuntos de diferente tipo de datos

		@tc:6840 @flowjson
		Escenario: Pieza adjunto envia un archivo utilizando una url
			Dado un flujo que posee una variable de tipo texto con una url de un archivo
			Cuando la pieza adjunto configurada en "url" es invocada 
			Y posee la variable configurada
			Entonces el usuario final recibira el archivo alojado en la url

		@tc:6841 @flowjson
		Escenario: Pieza adjunto envia un archivo utilizando un binario
		json de flujo: https://drive.google.com/file/d/1C0vwuv6W8X1IGUiLHvKy2BQGecJQdQNA/view?usp=sharing
			Dado un flujo que posee una variable de tipo binario con un archivo obtenido por integracion
			Cuando la pieza adjunto configurada en "variable" es invocada
			Y posee la variable configurada
			Entonces el usuario final recibira el archivo que devuelve la integracion	

		@tc:6842 @flowjson
		Escenario: Pieza adjunto envia un archivo utilizando un base64
			Dado un flujo que posee una variable de tipo base64 con un archivo en texto
			Cuando la pieza adjunto configurada en "variable" es invocada
			Y posee la variable configurada
			Entonces el usuario final recibira el archivo que el base64 representa