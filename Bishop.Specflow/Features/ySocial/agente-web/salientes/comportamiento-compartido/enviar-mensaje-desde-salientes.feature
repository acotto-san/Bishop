#language: es
Característica: Componer un mensaje para ser enviado desde el modulo salientes

	Regla de negocio: El agente podra enviar diferentes formatos de mensajes 

		@tc:8358
		Escenario: Agente envia un mensaje saliente
			Dado que un agente se encuentra enviando un saliente
			Cuando escriba el mensaje 
			Entonces podra enviarlo

		@tc:8359
		Escenario: Agente envia una url acortada
			Dado que un agente se encuentra enviando un saliente
			Cuando seleccione para ingresar una url acortada
			Entonces podra enviarla

		@tc:8360
		Escenario: Agente envia una respuesta predefinida
			Dado que un agente se encuentra enviando un saliente
			Cuando seleccione una respuesta predefinida
			Entonces podra enviarla