#language: es
Característica: Responder un mensaje asignado con adjunto

	Regla de negocio: El boton de adjuntar depende de si el servicio permite adjuntos
		
		@tc:6843
		Escenario: Agente responde mensaje asignado enviando un adjunto
			Dado que el agente tiene un caso asignado
			Y el servicio permite adjuntos	
			Cuando el agente responde el mensaje adjuntando un archivo
			Entonces el usuario final debe recibir el adjunto

		@tc:6844 
		Escenario: Agente recibe una asignacion de caso y no ve el boton de adjunto
			Dado que el agente tiene un caso asignado
			Y el servicio no permite adjuntos
			Cuando el agente intente adjuntar un archivo
			Entonces vera que no hay un boton para adjuntar