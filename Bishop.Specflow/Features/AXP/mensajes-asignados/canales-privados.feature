#language: es
Característica: Canales privados
	Como agente axp 
	Quiero poder recibir mensajes y enviar salientes a canales privados
	Para que puedan ser gestionados en mi casilla y en la web del supervisor

Aclaración: por el momento los canales privados no tienen encuestas asociadas ya que no son configurables en social

Exploratorio: cerrar un caso y volver a iniciar otro, que no se renderice en la misma conversación cerrada, sino que inicie uno nuevo
	
Regla: Un servicio que no tiene conexión con el bot deriva sus mensajes entrantes directamente al gateway
	
	@tc:9211
	Esquema del escenario: entrante de un servicio sin bot
		Dado un servicio de <servicio> sin conexion con bot
		Cuando el agente recibe un entrante de ese servicio
		Entonces visualiza correctamente los mensajes del usuario

			Ejemplos:
			| servicios   |
			| whatsapp    |
			| fb mesenger |
			| ig          |
			| telegram    |
			| twitter     |

	@tc:9212 
	Escenario: mensaje entrante con gif
		Dado que un usuario envia un mensaje con un gif
		Cuando el agente visualiza el mensaje
		Entonces deberia indicar que ese mensaje no puede visualizarse
		Y el supervisor deberia ver corresctamente el gif en el detallado de casos

	@tc:9213
	Escenario: se dibujan los mensajes en el agente
		Dado que un usuario envia varios mensajes entrantes al servicio
		Cuando los envia uno tras otro
		Entonces en la conversación del agente deberan mostrarse correctamente en orden

Regla: Un servicio que está conectado a yflow, sus mensajes entrantes pasan por el bot y luego pueden derivarse sin ser encolados

	@tc:9214
	Escenario: se envía mensaje automático de avaya cuando no hay agentes conectados
		Dado que un usuario interactua con el bot
		Cuando es derivado
		Y no hay agentes conectados
		Entonces se envia un mensaje automatico de avaya
		Y en el detallado de mensaje dice enviado por "-1"

	@tc:9215
	Escenario: se visualiza el historial del bot
		Dado que un caso de <servicio> tuvo interaccion con el bot
		Cuando es derivado al agente
		Entonces debera verse el historial con el bot

			Ejemplos:
			| servicios   |
			| whatsapp    |
			| fb mesenger |
			| ig          |
			| telegram    |
			| twitter     |

Regla: Los mensajes salientes del agente son recibidos por el usuario

	@tc:9216 
	Escenario: el usuario recibe los salientes del agente
		Dado que un agente responde a un caso de canal privado
		Cuando envia el mensaje
		Entonces el usuario recibe correctamente los mensajes del agente

	@tc:9217
	Escenario: se dibujan los salientes en el agente
		Dado que un agente envia varios mensajes salientes
		Cuando los envia uno tras otro
		Entonces en la conversacion del agente deberan dibujarse correctamente en orden
		Y el usuario debera recibirlos por completo

Regla: un agente puede recibir mensajes privados y públicos de una mismo usuario

	@tc:9218
	Escenario: un usuario con caso privado abierto envia un mensaje público
		Dado que un usuario tenia un caso abierto de ig privado
		Cuando se comunica por ig publico
		Entonces debera crearse un caso nuevo

Regla: El caso se cierra y queda finalizado en la casilla del agente

	@tc:9219
	Escenario: El agente hace click en la x
		Dado que un agente tiene un caso privado abierto
		Cuando hace click en la x del caso
		Entonces se notifica el cierre del caso en el detallado
		Y se oculta el textarea en el agente

	@tc:9220
	Escenario: El agente hace click en la tilde verde
		Dado que un agente tiene un caso privado cerrado
		Cuando hace click en la tilde verde
		Entonces el caso desaparece de la casilla del agente

	@tc:9221
	Escenario: El supervisor cierra el caso
		Dado que un agente tiene un caso privado abierto
		Cuando un supervisor cierra el caso desde el detallado de casos
		Entonces en el agente se notifica el cierre del caso
		Y se oculta el textarea

	@tc:9222
	Escenario: corre el tiempo de After work
		Dado que un agente tiene un caso privado abierto
		Cuando hace click en la x del caso
		Entonces empieza a correr el tiempo after work
		Y finaliza con el click de la tilde verde

	@tc:9223
	Escenario: cierre de caso por inactividad
		Dado que un caso es derivado al agente sin pasar por el bot
		Y en parametros del sistema estan configurados 15 min para cierre por inactividad
		Cuando el caso queda sin ser gestionado mas de 15 min
		Entonces el caso es cerrado por sistema
		Y el textarea en el agente debera quedar oculto