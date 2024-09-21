#language: es
Característica: Devolver mensajes a la cola 
	Como agente que poseo un mensaje asignado
	Quiero poder devolverlo a la cola de donde provino
	Para dejar de tenerlo asignado ya que yo no lo voy a gestionar

	Regla de negocio: Habra situaciones en donde se impedira la devolucion a la cola

		@tc:7049
		Escenario: Se impide la devolucion porque hay un nuevo mensaje en cola
			Dado un agente que posee asignado un mensaje 1
			Cuando un mensaje 2 del caso esta en la cola a punto de ser asignado
			Y el agente intenta realizar la devolucion a la cola del mensaje 1
			Entonces se impedira la transferencia