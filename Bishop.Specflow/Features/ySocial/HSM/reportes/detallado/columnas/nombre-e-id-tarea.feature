#language:es
@us:5680
Característica: Tener una columna que indique de cual tarea masiva proviene dicho mensaje 
	Como supervisor que visualiza mensajes enviados por plantillas hsm
	Quiero poder saber que tarea masiva envio cada mensaje
	Para diferenciar si es que un mensaje fue enviado mediante una tarea masiva y en caso de ser correcto saber cual exactamente

	Regla de negocio: Si un mensaje de plantilla hsm fue enviado por una tarea la celda indicará cual fue el nombre e id de la misma

		@tc:6263
		Esquema del escenario: Se visualiza nombre e id de la tarea masiva que envio el mensaje
			Dado que un/a <entidad solicitante> envio un mensaje de plantilla hsm mediante una tarea
			Cuando un supervisor visualiza dicho mensaje en el Reporte Detallado de Plantillas
			Entonces vera en la columna "Tarea" el nombre e id de dicha tarea masiva

			Ejemplos: 
				| entidad solicitante |
				| supervisor          |
				| integracion         |
		
		@tc:6264
		Esquema del escenario: No se visualiza nombre e id de tarea de un mensaje al no haber sido enviado por una
			Dado que un/a <entidad solicitante> envio un mensaje de plantilla hsm de manera individual
			Cuando un supervisor visualiza dicho mensaje en el Reporte Detallado de Plantillas
			Entonces vera "N/A" en la columna "Tarea" 

			Ejemplos: 
				| entidad solicitante |
				| supervisor          |
				| integracion         |

	Regla de negocio: La columna sera siempre visible en el reporte 
		
		@tc:6265
		Esquema del escenario: Se visualiza columna "Tarea" al ver el reporte
			Cuando un supervisor se encuentra visualizando el Reporte Detallado de Plantillas en su vista <vista>
			Entonces vera que el reporte posee la columna "Tarea"

			Ejemplos: 
				| vista                  |
				| online                 |
				| exportacion manual     |
				| exportacion automatica |