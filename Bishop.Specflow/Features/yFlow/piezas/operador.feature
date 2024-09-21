#language: es
Característica: Tener una pieza para derivar un usuario a los agentes
	
	Como chatbot trainer que esta armando la definición de un flujo
	Quiero poder encolar a los usuarios
	Para cuando lleguen a una parte del flujo que necesita ser continuado por una atención de agente

	Regla de negocio: La pieza por default debe asignar el caso a la cola default del servicio
		
		@tc:9373 @flowjson
		Escenario: Usuario es derivado por pieza operador
			Dado un flujo con pieza operador
			Cuando Ursula hablando con el bot ejecuta la pieza
			Entonces su ultimo mensaje entrante sera encolado en la cola default del sistema

	Regla de negocio: Se puede realizar un encolamiento en una cola específica
		
		@tc:9372 @flowjson
		Escenario: Usuario es derivado por pieza operador a una cola diferente a la default
			Dado un flujo con pieza operador que deriva a cola AAA
			Cuando Ursula hablando con el bot ejecuta la pieza
			Entonces su ultimo mensaje entrante sera encolado en cola AAA

	Regla de negocio: Cuando una pieza derive puede dejar una alerta temporal para el mensaje asignado
		
		@tc:9375 @flowjson
		Escenario: Augusto recibe una notificacion del bot al recibir una asignación
			Dado que un chatbot trainer desea comunicarle algo al agente que reciba la derivacion
			Cuando Ursula hablando con el bot ejecuta la pieza operador con una alerta temporal
			Y Augusto recibe la asignación del caso
			Entonces vera una alerta emergente para llamar su atencion con el mensaje
			Y luego de desvanecerse el mensaje quedara presente arriba del nombre del perfil de usuario

		@tc:pendiente @flowjson:9375
		Escenario: Augusto recibe un mensaje transferido de cola que posee un mensaje de derivacion

		@tc:pendiente @flowjson:9375
		Escenario: Augusto deja de ver la alerta cuando el usuario vuelve a escribir

		@tc:9376 @flowjson:9375
		Escenario: Mensaje encolado que posee la alerta temporal es agrupado perdiendo la alerta
			Dado un mensaje encolado de Ursula que ejecutó la pieza operador con la alerta temporal
			Cuando un nuevo mensaje entrante de Ursula agrupa al viejo en la cola
			Y Augusto recibe la asignación del segundo entrante
			Entonces no vera la alerta temporal que tenía relacionada el primer entrante


	Regla de negocio: Cuando una pieza derive puede dejar un registro dentro del caso para futura lectura

		@tc:9378 @flowjson
		Escenario: Charly deja registro del estado del caso al momento de derivarse
			Dado que Charly desea dejar registrado el estado de unas variables en el caso al derivar
			Cuando Ursula una pieza operador que registra contexto adicional del mensaje
			Entonces Augusto podra ver en el cuerpo de la conversación un texto justo al mensaje entrante
			Y el contenido sera lo que Charly había configurado en la pieza operador