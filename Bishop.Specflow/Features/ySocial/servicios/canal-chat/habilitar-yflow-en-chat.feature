#language:es
Característica: Poder habilitar para que yFlow gestione los casos de chat
	
	Como administrador de ySocial que gestiona un servicio de chat
	Quiero poder habilitarle yFlow
	Para que los casos del servicio sean atendidos por el bot

	Regla de negocio: Poder habilitar yFlow dependera de si ySocial posee configurado un ambiente de yFlow

		@tc:9389
		Escenario: Supervisor no visualiza la configuración de yFlow en servicio de chat
			Dado que ySocial no tiene conexión a yFlow configurada
			Cuando un administrador ingresa a la edición de un servicio de chat
			Entonces no encontrara disponible una manera de conectar el servicio a yFlow

	Regla de negocio: Se puede elegir un flujo de yFlow para empezar a responder los casos
		
		@tc:9390 @flowjson
		Escenario: Supervisor conecta un flujo al servicio de chat y empieza a responder el bot
			Dado que un servicio de chat no tiene yFlow habilitado
			Cuando un supervisor habilita yFlow en su edición
			Y elige un flujo 
			Entonces los casos futuros seran atendidos por la logica de ese flujo de bot