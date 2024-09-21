#language: es
Característica: Realizar un mensaje saliente de tipo HSM
	Como agente que necesita contactar a un usuario del cual no posee un caso asignado
	Quiero tener una opción de escribirle un HSM al usuario
	Para poder comunicarme con el usuario cuando esta cerrada la ventana de 24hs

	Regla de negocio: Cuando el usuario responda el HSM ira directo a la cola
		
		@tc:pendiente
		 Escenario: Usuario recibe un HSM que inicia el caso y al responder no pasa por el bot
			Dado un servicio que posee yFlow habilitado
			Y un caso que inicio por el envío de un HSM desde la web del agente
			Cuando el usuario responda el HSM
			Entonces el mensaje entrante ingresara directo a la cola

		@tc:pendiente
		Escenario: Usuario recibe un HSM en un caso abierto con el bot y al responder ingresa a la cola
			Dado un servicio que posee yFlow habilitado
			Y un usuario con un caso abierto en el bot
			Y un agente le envia un HSM al usuario
			Cuando el usuario responda el HSM
			Entonces el mensaje entrante ingresara directo a la cola