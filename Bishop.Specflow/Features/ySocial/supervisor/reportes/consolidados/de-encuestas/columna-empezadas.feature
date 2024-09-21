#language: es
Característica: Tener una columna para contabilizar cuantas encuestas fueron empezadas en un intervalo

	Como un analista de metricas 
	Quiero enterarme cuantas encuestas fueron empezadas en un intervalo de tiempo
	Para poder contrastarla con metricas como enviadas/finalizadas

	Regla de negocio: Las encuestas tradicionales empezadas dentro del intervalo donde se envio son computadas

		@tc:9191
		Escenario: usuario empieza la encuesta en el mismo intervalo de media hora
			Dado que el sistema le envio a un usuario una encuesta a las 15:00
			Y la abre a las 15:10
			Cuando un supervisor obtenga el reporte Consolidado de Encuestas configurado con intervalos de media hora
			Entonces vera que el intervalo de las 15:00 muestra 1 en la celda de encuestas empezadas

		@tc:9192
		Escenario: usuario empieza la encuesta en el mismo intervalo diario
			Dado que el sistema le envio a un usuario una encuesta el 17/07/2024
			Y la abre en el mismo día
			Cuando un supervisor obtenga el reporte Consolidado de Encuestas configurado con intervalos diarios
			Entonces vera que el intervalo que corresponde al día 17/07/2024 muestra 1 en la celda de encuestas empezadas

	Regla de negocio: Las encuestas tradicionales pueden ser empezadas fuera de su intervalo donde se envio
		
		@tc:9193
		Escenario: Reporte contabiliza encuestas empezadas en un intervalo de media hora diferente al que fueron enviadas
			Dado que el sistema le envio a un usuario una encuesta a las 15:00
			Y la empieza a las 15:40
			Cuando un supervisor obtenga el reporte Consolidado de Encuestas configurado con intervalos de media hora
			Entonces vera que el contador +1 de empezadas se encuentra en un intervalo diferente al del envío:
				| Intervalo | columna enviada | columna empezadas | 
				| 15:00     | 1               | 0                 |
				| 15:30     | 0               | 1                 |

		@tc:9194
		Escenario: Reporte contabiliza encuestas empezadas en un intervalo diario diferente al que fueron enviadas
			Dado que el sistema le envio a un usuario una encuesta el 16/07/2024
			Y la empieza el 17/07/2024
			Cuando un supervisor obtenga el reporte Consolidado de Encuestas configurado con intervalos diarios
			Entonces vera que el contador +1 de empezadas se encuentra en un intervalo diferente al del envío:
				| Intervalo  | columna enviada | columna empezadas |
				| 16/07/2024 | 1               | 0                 |
				| 17/07/2024 | 0               | 1                 |

	Regla de negocio: Las encuestas empezadas contabilizan al reporte siempre que sean encuestas tradicionales

		@tc:9195
		Esquema del escenario: Usuario de chat empieza una encuesta 
			Dado que un usuario de chat recibe una encuesta de tipo <tipo-encuesta>
			Cuando el usuario abre dicha encuesta
			Entonces la misma <salida> contabilizada en la columna Empezadas

			Ejemplos: 
				| tipo-encuesta | salida  |
				| tradicional   | sera    |
				| terceros      | no sera |

		@tc:9196
		Esquema del escenario: Usuario de messenger empieza una encuesta 
			Dado que un usuario de messenger recibe una encuesta de tipo <tipo-encuesta>
			Cuando el usuario finalice dicha encuesta
			Entonces la misma <salida> contabilizada en la columna Empezadas

			Ejemplos: 
				| tipo-encuesta | salida  |
				| tradicional   | sera    |
				| terceros      | no sera |

	Regla de negocio: Solo es contabilizada la primer apertura de la encuesta

		@tc:9197
		Escenario: Reapertura de encuesta no es contabilizada para columna "Empezadas"
			Dado que un usuario abrio por primera vez una encuesta a las 15:20
			Y el evento fue contabilizado en el Consolidado de Encuestas
			Cuando vuelva a abrir de nuevo la misma encuesta a las 15:25
			Entonces en el intervalo de las 15:00 se contabiliza solo +1 

		@tc:9198
		Escenario: Reapertura de encuesta no es contabilizada para columna "Empezadas" al reabrir en un nuevo intervalo
			Dado que un usuario abrio por primera vez una encuesta a las 15:20
			Y el evento fue contabilizado en el Consolidado de Encuestas
			Cuando vuelva a abrir de nuevo la misma encuesta a las 15:35
			Entonces en los intervalos se tendra:
				| intervalo | valor columna empezada |
				| 15:00     | 1                      |
				| 15:30     | 0                      |