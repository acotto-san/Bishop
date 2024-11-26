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

	Regla de negocio: Un adjunto enviado por yFlow mediante canal chat no es guardado para su consulta posterior

		@tc:7820
		Escenario: Usuario logra descargar un adjunto enviado por el bot en el canal chat
			Dado que yFlow envio un adjunto con la pieza adjunto en un caso de canal chat
			Cuando el usuario reciba el adjunto
			Entonces podra descargarlo
		
		@tc:7821
		Escenario: Supervisor no logra ver un adjunto enviado por el bot en canal chat
			Dado que yFlow envio un adjunto con la pieza adjunto en un caso de canal chat
			Cuando un supervisor visualice el contenido del caso
			Entonces no vera el adjunto que envio el bot

		@tc:7822
		Escenario: Agente ve el titulo de un adjunto enviado por el bot en canal chat
			Dado que yFlow envio un adjunto con la pieza adjunto en un caso de canal chat
			Cuando un agente visualice el contenido del caso
			Entonces vera el mensaje con el nombre del adjunto
			Y no podra descargar el archivo que el bot envio
