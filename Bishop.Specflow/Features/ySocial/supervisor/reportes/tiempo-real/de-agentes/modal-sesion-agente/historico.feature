#language: es
Característica: Histórico del agente en el modal - reporte de tiempo real de agentes

	Como supervisor, en el modal de información de la actividad del agente 
	quiero visualizar la información de los eventos realizados por el agente 
	para que pueda analizarse

	Regla: Se puede visualizar el cambio de estado del agente y el tiempo de cada estado
		
		@tc:7411
		Esquema del escenario: el agente cambia de estados y se muestra en el histórico del agente
		Exploratorio: probar con diferentes tipos de estado auxiliar
			Dado que un agente se loguea
			Y permanece en el estado login durante 1 minuto
			Cuando pasa a estado <estado> 
			Y permanece en ese estado 3 minutos
			Entonces se visualizan correctamente esos eventos y sus tiempos en el historico del agente

				Ejemplos:
				| estado     |
				| auxiliar   |
				| disponible |
				| trabajando |

		@tc:7412
		Escenario: agente cambia a un estado auxiliar recientemente creado y se muestra en el histórico del agente
			Dado que el supervisor crea un nuevo estado auxiliar "Recreo"
			Y se lo asigna a un agente
			Cuando este agente pasa del estado login a ese estado auxiliar "Recreo"
			Entonces en el historico aparece el pasaje al estado "Recreo"

	Regla: el contenido de esta pestaña se borra cuando el agente deja de estar conectado
		
		@tc:7463
		Escenario: el histórico del agente se borra al desconectarse
			Dado que un agente se encuentra logueado
			Y se visualizan sus cambios de estado en el historico del agente
			Cuando el agente se desconecta
			Y vuelve a loguearse
			Entonces el historico de estado se reincia con una nueva sesion