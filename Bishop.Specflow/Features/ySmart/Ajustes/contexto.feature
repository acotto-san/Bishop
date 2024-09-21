#language: es
Característica: memoria - historial de mensajes

	Regla: Los mensajes del historial se limitan por la cantidad configurada en los ajustes del proyecto

	@tc:7674
	Escenario: se limita 1 mensaje de contexto
		Dado que proyecto tiene configurado un limite de 1 mensaje de contexto
		Cuando se manda a procesar una frase por cognitividad
		Entonces en los logs se debe visualizar 1 mensaje anterior de contexto


	@tc:7675 
	Escenario: se cambia la configuracion del limite de mensajes de contexto
		Dado que proyecto tiene configurado un limite de 1 mensaje de contexto
		Y se cambia a un limite de 2 mensajes de contexto
		Cuando se manda a procesar una frase por cognitividad
		Entonces en los logs se deben visualizar 2 mensajes anteriores de contexto