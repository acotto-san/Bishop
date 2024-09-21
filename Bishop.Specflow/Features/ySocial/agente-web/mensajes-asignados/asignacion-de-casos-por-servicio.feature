#language: es
Característica: Recibir asignaciones de cualquier red social habilitada
	Como agente 
	Quiero recibir asignaciones de las redes que me habilitaron
	Para poder atender a los usuarios de esas redes

	Esquema del escenario: Agente recibe mensajes privados de Twitter
		Dado que el agente posee habilitado el permiso para recibir asignaciones de Twitter
		Y que en el sistema existe un servicio de twitter con la siguiente configuracion
			| version de la api   | aplicacion utilizada |
			| <twitterApiVersion> | <twitterAppName>     |
		Cuando ySocial encola un mensaje privado del servicio en la cola del agente
		Y el agente es el unico disponible para recibir la asignacion
		Entonces el agente vera que recibe una nueva asignacion
		Y al abrirla vera la conversacion del caso asignado

		Ejemplos: 
			| twitterApiVersion | twitterAppName |
			| 2.0               | SMCC Totalplay |

	Esquema del escenario: Agente recibe mensajes publicos de Twitter
		Dado que el agente posee habilitado el permiso para recibir asignaciones de Twitter
		Y que en el sistema existe un servicio de twitter con la siguiente configuracion
			| version de la api   | aplicacion utilizada |
			| <twitterApiVersion> | <twitterAppName>     |
		Cuando ySocial encola un mensaje publico del servicio en la cola del agente
		Y el agente es el unico disponible para recibir la asignacion
		Entonces el agente vera que recibe una nueva asignacion
		Y al abrirla vera la conversacion del caso asignado

		Ejemplos: 
			| twitterApiVersion | twitterAppName |
			| 2.0               | SMCC Totalplay |