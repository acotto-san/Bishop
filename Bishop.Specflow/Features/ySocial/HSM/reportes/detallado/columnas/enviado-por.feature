#language:es
@us:5680
Característica: Columna con el tipo de usuario que solicito el envio
	Como supervisor que visualiza el reporte detallado de plantillas
	Quiero que haya una columna que especifique el tipo de usuario que realizó el envío
	Para poder diferenciar quienes son los que envian de entre un monton de registros

	Regla de negocio: La celda contendra el tipo de usuario que realizo el envio del hsm

		@tc:6260
		Esquema del escenario: Columna indica el tipo de usuario que solicito el envio del mensaje mediante una tarea masiva
			Dado que un/a <entidad solicitante> envio un mensaje de plantilla hsm mediante una tarea
			Cuando un supervisor visualiza el registro de dicho mensaje en el Reporte Detallado de Plantillas
			Entonces la columna "enviado por" debera indicar "<entidad solicitante>"

			Ejemplos: 
				| entidad solicitante |
				| supervisor          |
				| integracion         |
				| agente              |
				| yflow               |

		@tc:6261
		Esquema del escenario: Columna indica el tipo de usuario que solicito el envio del mensaje mediante un envio individual
			Dado que un/a <entidad solicitante> envio un mensaje de plantilla hsm mediante el envio individual
			Cuando un supervisor visualiza el registro de dicho mensaje en el Reporte Detallado de Plantillas
			Entonces la columna "enviado por" debera indicar "<entidad solicitante>"

			Ejemplos: 
				| entidad solicitante |
				| supervisor          |
				| integracion         |
				| agente              |
				| yflow               |

	Regla de negocio: La columna sera siempre visible en el reporte 
		
		@tc:6262
		Esquema del escenario: Se visualiza columna "Enviado por" al ver el reporte
			Cuando un supervisor se encuentra visualizando el Reporte Detallado de Plantillas en su vista <vista>
			Entonces vera que el reporte posee la columna "Enviado por"

			Ejemplos: 
				| vista                  |
				| online                 |
				| exportacion manual     |
				| exportacion automatica |