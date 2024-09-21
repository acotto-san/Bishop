#language: es
Característica: Columna agrupados
	Se desea tener una columna en el reporte en tiempo real de colas que muestre cuantos agrupamientos ocurrieron en la cola.
	Trabajado en https://wbd.ms/share/v2/aHR0cHM6Ly93aGl0ZWJvYXJkLm1pY3Jvc29mdC5jb20vYXBpL3YxLjAvd2hpdGVib2FyZHMvcmVkZWVtL2FmM2QzNTAwMzg0YTQ0MGFhMjhjZjk4MDQ1NTRiYmM2X0JCQTcxNzYyLTEyRTAtNDJFMS1CMzI0LTVCMTMxRjQyNEUzRF9kNTRlMmU5OC01Y2MzLTQ1ZGMtYTQ0YS01NDZiOGMxYzg1MTE=

	Regla de negocio: Solo se agrupan dos mensajes consecutivos entrantes 
		
		@tc:6624
		Escenario: Agrupamiento de mensaje en cola
			Dado una cola que posee un mensaje de un usuario
			Cuando ingresa un nuevo mensaje entrante del usuario
			Y el primero es agrupado por el segundo en cola
			Entonces el reporte Tiempo Real de Colas en la columna de la cola registrara +1

		@tc:6625
		Esquema del escenario: Agrupamiento de mensaje en agente
			Dado un agente que posee un mensaje asignado de un servicio en modo <modo>
			Y el ultimo mensaje de la conversacion es un entrante del usuario
			Cuando ingresa un nuevo mensaje entrante del usuario
			Y el primero es agrupado por el segundo en agente
			Entonces el reporte Tiempo Real de Colas en la columna de la cola registrara +1

			Ejemplos: 
				| modo         |
				| modo chat    |
				| modo no-chat |

		 @tc:6626
		 Esquema del escenario: Agrupamiento de mensaje ignora un saliente de sistema
			la respuesta automática puede ser de filtro/sl/bot
			Dado que un mensaje entrante se encuentra en <lugar>
			Y luego del entrante hubo un saliente de sistema
			Cuando ingresa un nuevo mensaje entrante del usuario
			Y el primero es agrupado por el segundo en <lugar>
			Entonces el reporte Tiempo Real de Colas en la columna de la cola registrara +1

			Ejemplos: 
				| lugar  |
				| agente |
				| cola   |
