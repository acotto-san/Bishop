#language:es
Característica: Tener una columna que indique cuantas encuestas se finalizaron en el intervalo registrado

	Como analista de métricas de la plataforma
	Quiero poder enterarme cuantas finalizaciones de encuestas hubo en un intervalo
	Para poder contrastar con otros valores como enviadas/abiertas

	Regla de negocio: Las encuestas tradicionales finalizadas dentro del intervalo donde se envio son computadas

		@tc:9199
		Escenario: Usuario finaliza la encuesta enviada en el mismo intervalo de media hora
			Dado que el sistema le envio a un usuario una encuesta a las 15:00
			Y la finaliza a las 15:10
			Cuando un supervisor obtenga el reporte Consolidado de Encuestas configurado con intervalos de media hora
			Entonces vera que el intervalo de las 15:00 muestra 1 en la celda de encuestas finalizadas

		@tc:9200
		Escenario: Usuario finaliza la encuesta enviada en el mismo intervalo diario
			Dado que el sistema le envio a un usuario una encuesta el 17/07/2024
			Y la finaliza en el mismo día
			Cuando un supervisor obtenga el reporte Consolidado de Encuestas configurado con intervalos diarios
			Entonces vera que el intervalo que corresponde al día 17/07/2024 muestra 1 en la celda de encuestas finalizadas

	Regla de negocio: Las encuestas tradicionales pueden estar finalizadas fuera de su intervalo donde se envio
	
		@tc:9201
		Escenario: Usuario finaliza la encuesta en un intervalo de media hora diferente al que fue enviado
			Dado que el sistema le envio a un usuario una encuesta a las 15:00
			Y la finaliza a las 15:40
			Cuando un supervisor obtenga el reporte Consolidado de Encuestas configurado con intervalos de media hora
			Entonces vera que el contador +1 de finalizada se encuentra en un intervalo diferente al del envío:
				| Intervalo | columna enviada | columna finalizada |
				| 15:00     | 1               | 0                  |
				| 15:30     | 0               | 1                  |

		@tc:9202
		Escenario: Usuario finaliza la encuesta en un intervalo diario diferente al que fue enviado
			Dado que el sistema le envio a un usuario una encuesta el 16/07/2024
			Y la finaliza el 17/07/2024
			Cuando un supervisor obtenga el reporte Consolidado de Encuestas configurado con intervalos diarios
			Entonces vera que el contador +1 de finalizada se encuentra en un intervalo diferente al del envío:
				| Intervalo  | columna enviada | columna finalizada |
				| 16/07/2024 | 1               | 0                  |
				| 17/07/2024 | 0               | 1                  |

	Regla de negocio: Las encuestas finalizadas contabilizan al reporte siempre que sean encuestas tradicionales

		@tc:9203
		Esquema del escenario: Usuario de chat finaliza una encuesta 
			Dado que un usuario de chat recibe una encuesta de tipo <tipo-encuesta>
			Cuando el usuario finalice dicha encuesta
			Entonces la misma <salida> contabilizada en la columna Finalizadas

			Ejemplos: 
				| tipo-encuesta | salida  |
				| tradicional   | sera    |
				| terceros      | no sera |

		@tc:9204
		Esquema del escenario: Usuario de messenger finaliza una encuesta 
			Dado que un usuario de messenger recibe una encuesta de tipo <tipo-encuesta>
			Cuando el usuario finalice dicha encuesta
			Entonces la misma <salida> contabilizada en la columna Finalizadas

			Ejemplos: 
				| tipo-encuesta | salida  |
				| tradicional   | sera    |
				| terceros      | no sera |

