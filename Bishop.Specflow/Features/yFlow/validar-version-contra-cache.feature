#language: es 

Característica: validar version de yFlow contra cache

	Regla: Durante un upgrade si se compila el back de yflow en una versión nueva y el front o ysocial en otra versión anterior debería aparecer una señal de error.

	@tc:7397
	Escenario: compilación con error - ySocial en una versión anterior a yFlow
		Dado que ySocial se encuentra en la version 8.4 
		Y se hace un upgrade del back de yflow a la version 8.5
		Cuando un usuario envia mensajes al bot
		Entonces debera aparecer un mensaje de error en el log de yFlow
		Y el mensaje del usuario quedara encolado

	@tc:7398 
	Escenario: compilación con error - front de yFlow en una version anterior al back
		Dado que el front de yFlow se encuentra en la version 8.4
		Y se hace un upgrade del back a la version 8.5
		Cuando un implementador intenta publicar un flujo
		Entonces debera aparecer un mensaje de error

	@tc:7399
	Escenario: compilación exitosa - yflow en una versión anterior a ySocial
		Dado que el back de yFlow se encuentra en la version 8.4 
		Y se hace un upgrade del ySocial a la version 8.5
		Cuando un usuario envia mensajes al bot
		Entonces no debera haber errores en ySocial

	@tc:7400
	Escenario: compilación exitosa - back de yFlow en una versión anterior al front
		Dado que el back de yFlow se encuentra en la version 8.4
		Y se hace un upgrade del front a la version 8.5
		Cuando un implementador intenta publicar un flujo
		Entonces no debera aparecer ningun mensaje de error
	
	@tc:7401
	Escenario: misma versión de yFlow e ySocial
		Dado que ySocial tuvo un upgrade a la version 8.5
		Y se hace un upgrade del back de yflow a la version 8.5
		Cuando un usuario envia mensajes al bot
		Entonces no debera haber errores en ySocial

	@tc:7402
	Escenario: misma versión back y front de yFlow
		Dado que el front de yFlow tuvo un upgrade a la version 8.5
		Y se hace un upgrade del back de yflow a la version 8.5
		Cuando un implementador intenta publicar un flujo
		Entonces no debera aparecer ningun mensaje de error
