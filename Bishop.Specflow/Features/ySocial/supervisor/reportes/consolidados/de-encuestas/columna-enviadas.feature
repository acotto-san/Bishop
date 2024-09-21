#language:es
Característica: Tener una columna que indique cuantas encuestas se enviaron en el intervalo registrado

	Como analista de métricas de la plataforma
	Quiero poder enterarme cuantos envíos de encuestas hubo en un intervalo
	Para poder contrastar con otros valores como abiertas/finalizadas

	Regla de negocio: La columna contabiliza encuestas enviadas tanto tradicionales como de terceros

		@tc:9186
		Esquema del escenario: Un supervisor ve las encuestas enviadas al visualizar el Consolidado de Encuestas con intervalos de media hora
			Dado que el sistema le envio a un usuario una encuesta <tipo-encuesta> a las 15:00
			Cuando un supervisor obtenga el reporte Consolidado de Encuestas configurado con intervalos de media hora
			Entonces vera que el intervalo de las 15:00 muestra 1 en la celda de encuestas enviadas

			Ejemplos: 
				| tipo-encuesta |
				| tradicional   |
				| de terceros   |
		@tc:9187
		Esquema del escenario: A un usuario le envian una encuesta de terceros, el evento es contabilizado por la métric
			Dado que el sistema le envio a un usuario una encuesta <tipo-encuesta> el 18/07/2024
			Cuando un supervisor obtenga el reporte Consolidado de Encuestas configurado con intervalos diarios
			Entonces vera que el intervalo del día 18/07/2024 muestra 1 en la celda de encuestas enviadas

			Ejemplos: 
				| tipo-encuesta |
				| tradicional   |
				| de terceros   |

	Regla de negocio: Para la métrica es irrelevante quien administra el envío de la encuesta (la cola o el servicio)

		@tc:9188
		Escenario: Reporte contabiliza el envío de una encuesta configurada en una cola
			Dado que un caso cierra en cola
			Y el sistema le envia la encuesta configurada en dicha cola
			Cuando un supervisor obtenga el reporte Consolidado de Encuestas
			Entonces el envio de dicha encuesta va a estar contabilizado en el intervalo donde ocurrio el envío

		@tc:9189
		Escenario: Reporte contabiliza el envío de una encuesta configurada en un servicio para casos que cierran en el bot
			Dado que un caso cierra en el bot
			Y el sistema le envia la encuesta configurada en el servicio para casos cerrados en el bot
			Cuando un supervisor obtenga el reporte Consolidado de Encuestas
			Entonces el envio de dicha encuesta va a estar contabilizado en el intervalo donde ocurrio el envío

		@tc:9190
		Escenario: Reporte contabiliza el envío de una encuesta configurada en un servicio de chat
			Dado que un caso de Canal Chat cierra en la cola
			Y el sistema le envia la encuesta configurada en el servicio de chat
			Cuando un supervisor obtenga el reporte Consolidado de Encuestas
			Entonces el envio de dicha encuesta va a estar contabilizado en el intervalo donde ocurrio el envío