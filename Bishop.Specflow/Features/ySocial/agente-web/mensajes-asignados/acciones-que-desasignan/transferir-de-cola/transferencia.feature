#language: es
Característica: Poder transferir un mensaje a otra cola
	Como agente con un mensaje asignado
	Quiero poder mover el mensaje que tengo asignado hacia otra cola de atencion
	Ya que por regla de negocio no corresponde ser atendido desde la cola donde me encuentro

	Regla de negocio: Habra situaciones en donde se impedira la transferencia
		
		@tc:7050
		Escenario: Se impide la transferencia porque hay un nuevo mensaje en cola
			Dado un agente que posee asignado un mensaje 1
			Cuando un mensaje 2 del caso esta en la cola a punto de ser asignado
			Y el agente intenta realizar una transferencia a otra cola del mensaje 1
			Entonces se impedira la transferencia