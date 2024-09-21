#language: es
Característica: Como agente ver un mensaje del bot de pieza mensaje
	Como agente que esta viendo una conversacion que inicio en el bot
	Quiero ver los mensajes que el bot imprimio con la pieza mensaje
	Para no perderme la conversacion previa

	Esto funciona igual para la mayoría de los servicios excepto chat que tiene su propia configuración

	Regla: Mensajes enviados por la pieza mensaje son visualizados en el agente web

		@tc:7629
		Escenario: el agente visualiza un mensaje enviado por el bot con la pieza mensaje 
			Dado un caso que tiene un mensaje enviado por el bot con la pieza mensaje
			Cuando un agente recibe la asignacion de dicho caso
			Entonces vera el mensaje que el bot envio

	Regla: El agente puede ver los botones

		@tc:7630
		Escenario: el agente visualiza un mensaje con botones enviado por el bot con la pieza mensaje 
			Dado un caso que tiene un mensaje con botones enviado por el bot con la pieza mensaje
			Cuando un agente recibe la asignacion de dicho caso
			Entonces vera el mensaje que el bot envio
			Y estaran presentes los botones del mensaje

		@tc:7631
		Escenario: el agente ve cual boton presiono el usuario del mensaje con botones enviado por el bot
			Dado un caso que tiene un mensaje con botones enviado por el bot con la pieza mensaje
			Y el usuario final presiono un boton
			Cuando un agente recibe la asignacion de dicho caso
			Entonces vera un mensaje entrante con el texto del boton presionado