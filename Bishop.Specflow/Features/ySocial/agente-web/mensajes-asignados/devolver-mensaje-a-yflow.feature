#language: es
Característica: agente puede devolver mensaje a yFlow
	Cliente que lo usa: telecentro
	Como agente que esta atendiendo un caso
	Quiero poder devolver el mensaje yFlow
	Para que el usuario siga gestionando su caso con el bot



	Regla de negocio: El agente solo vera el boton si coincide una determinada configuracion

		@tc:7557
		Escenario: devolucion a yFlow se encuentra bien configurada y el agente visualiza el boton
			Dado un servicio que posee habilitada la devolucion de mensajes a yFlow
			Y su flujo asociado posee configurados bloques para recibir las transferencias
			Cuando el agente este gestionando un caso de ese servicio
			Entonces vera el boton de devolver a yFlow

		@tc:7558
		Escenario: el flujo asociado al servicio no posee bloque configurado para transferir entonces el agente no ve el boton
			Dado un servicio que posee habilitada la devolucion de mensajes a yFlow
			Y su flujo asociado no posee configurados bloques para recibir transferencias
			Cuando el agente este gestionando un caso de ese servicio
			Entonces vera el boton de devolver a yFlow

	Regla de negocio: El agente vera disponibles los bloques que posea configurado el flujo

		@tc:7559
		Escenario: el agente intenta derivar al flujo y solo puede elegir los bloques que posee configurado el mismo
			Dado un flujo que posee configurado los siguientes bloques para recibir transferencias
				| nombre de bloque         |
				| bienvenida               |
				| bloque de transferencias |
			Cuando un agente esta gestionando un caso del servicio que posee vinculado este flujo
			E intenta realizar la transferencia 
			Entonces solo vera disponible los bloques
				| nombre de bloque         |
				| bienvenida               |
				| bloque de transferencias |
	
	Regla de negocio: una vez transferido el caso continuara en el bot
	
		@tc:7560
		Escenario: el agente deriva el caso a yFlow y continua con la ejecucion del mismo
			Dado un caso que estaba en gestion con el agente
			Cuando el agente lo deriva al bloque Bienvenida del flujo
			Entonces el caso continuara con la ejecucion de la logica que hay en el bloque
