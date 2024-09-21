#language: es
Característica: Tener una metrica AHT para utilizarla en el calculo de EWT(Estimated Wait Time)
	Como supervisor 
	Quiero extraer una franja de los ultimos # minutos de ASA Diario llamandolo AHT
	Para utilizarlo en la computación de EWT de la misma cola

	En resumen es como un ASA custom de tiempo limitado (del presente hacia x minutos atras)
	Donde se configura: puede ser en params de sistema para una configuración global o en una cola en particular en la pestaña EWT para SOBREESCRIBIR lo que haya 
	en params de sistema (en ambos lugares se ve a nombre de ASA y tiene un slider para configurar los minutos)

	Precondiciones:
		El servicio debe poder recolecta ASA y hoy en día 14/5/24 el "Canal Chat" no recolecta métrica ASA por lo tanto, 
		dicho canal no cuenta para este feature.

	Regla de negocio: AHT recupera tiempo de mensajes de ambos modos
	
		@tc:6738
		Esquema del escenario: Mensaje tiene un tiempo para el ASA de 10 minutos y el AHT lo recolecta
			Dado que un AHT compuesto por 2 mensajes es igual 100 segundos 
			Y un mensaje de modo <modo> es <accion> en la cola del AHT acumulando 10 minutos de gestion
			Cuando se calcula el AHT nuevamente
			Entonces el nuevo valor de AHT sera de 266 segundos

			Ejemplos: 
				| modo   | accion     |
				| chat   | atendido   |
				| normal | respondido |

		@tc:6739
		Escenario: Supervisor responde mensaje y no es recolectado por el AHT
			A diferencia del ASA, este evento no es capturado por el AHT y este mensaje será
			ignorado para realizar el cálculo.
			Dado que una cola tiene un AHT de 100
			Y un mensaje es respondido por un supervisor en la misma cola
			Cuando se calcula el AHT nuevamente
			Entonces el valor de AHT seguira siendo el mismo

	Regla de negocio: La recoleccion de la metrica estara regida por la franja de minutos configurada

		@tc:6740
		Escenario: Supervisor configura el AHT para recolectar mensajes de 10 minutos atras
			Dado que un supervisor configuro el AHT para recolectar mensajes de 10 minutos atras
			Y en los ultimos 20 minutos se respondieron/atendieron los siguientes mensajes:
				| minutos atras | modo   | segundos de gestion |
				| 20            | N/A    | 1000                |
				| 11            | N/A    | 1000                |
				| 9             | normal | 1000                |
				| 1             | chat   | 500                 |
			Cuando se calcula el AHT nuevamente
			Entonces este sera de 750 segundos	

		@tc:6741
		Esquema del escenario: Una cola sobreescribe la configuracion de AHT de parámetros del sistema
			Dado que globalmente en el sistema el ASA (AHT) contempla mensajes de 5 minutos atras
			Y una cola sobreescribe dicha config global contemplando mensajes de 50 minutos atras
			Cuando se calcula el AHT de la cola
			Entonces esta calculara el AHT con mensajes mas viejos que los que recolectan el resto de las colas