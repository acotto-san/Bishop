#language: es
@us:7873
Característica: Permitir enviar salientes de messenger mediante un servicio de facebook público

	- Los mensajes salientes solo saldran por via privada
	- Los perfiles que muestre son unicamente los que se hayan comunicado de manera privada

	Para poder enviar mensajes privados a usuarios que nos hablaron a un servicio de facebook público
	Como agente que tiene acceso al modulo de mensajes salientes
	Quiero que en la lista de servicios para mandar mensajes de facebook me aparezcan los servicios de FB público
	

	Regla de negocio: Se podran ver solo los servicios activos de facebook publico

		@tc:8355
		Escenario: Agente ve los servicios para enviar un saliente
			Dado que un agente entro a la seccion de salientes de facebook
			Cuando vea la lista de servicios de donde enviar
			Entonces debera ver solo los servicios habilitados

		@tc:8356
		Escenario: Agente ve todos los servicios por mas de no estar registrado en la cola de otros servicios
			Dado que un agente que se encuentra registrado en una cola donde no hay servicios de facebook/messenger
			Cuando vea la lista de servicios de donde enviar el saliente 
			Entonces debera ver todos los servicios habilitados

		@tc:8357
		Escenario: Agente intenta enviar saliente a un usuario
			Dado que un usuario solo tuvo comunicacion con el servicio "servicioA"
			Cuando el agente quiera contactarlo desde otro servicio que no sea el "servicioA"
			Entonces no debera encontrar al usuario 

	Regla de negocio: El agente solo podra enviar salientes si el usuario tiene el caso cerrado
		
		@tc:8361
		Escenario: Agente envia saliente a un usuario con el caso cerrado
			Dado que un agente se encuentra enviando un saliente
			Cuando envie el mensaje 
			Y el usuario tenga el caso cerrado
			Entonces el mensaje saldra con normalidad

		@tc:8362
		Escenario: Agente intenta enviar saliente a un usuario con el caso abierto
			Dado que un agente se encuentra enviando un saliente
			Cuando envie el mensaje
			Y el usuario tenga el caso abierto
			Entonces el agente vera una notificacion de que el usuario tiene un caso abierto

	Regla de negocio: Los perfiles que muestra la busqueda son unicamente los que se hayan comunicado por privado
		
		@tc:8363
		Escenario: Usuario se comunica unicamente por privado
			Dado que el usuario "pepe" se comunico unicamente de manera privada
			Cuando el agente busque el usuario "pepe"
			Entonces debera encontrarlo

		@tc:8364
		Escenario: Usuario se comunica unicamente por publico
			Dado que el usuario "susana" se comunica unicamente de manera publica
			Cuando el agente busque el usuario "susana"
			Entonces no deberia encontrarlo