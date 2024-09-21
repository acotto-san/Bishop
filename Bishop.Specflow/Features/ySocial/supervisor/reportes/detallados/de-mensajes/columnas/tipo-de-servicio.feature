#language: es
Característica: Columna que indique el tipo de servicio de donde provino el mensaje
	Como supervisor de ySocial que estoy mirando un reporte detallado de mensajes
	Quiero tener solo en los reportes exportables una columna que indique el tipo de servicio
	Ya que luego me sirve para filtrar los mensajes por tipo de servicio

	Regla de negocio: La columna no es configurable y solo se ve cuando la exportas
		
		@tc:7445
		Escenario: no se ve la columna en la vista online del detallado de mensajes
			Dado un supervisor solicita un detallado de mensajes con todos los checks activos del formulario
			Cuando visualiza el contenido del reporte
			Entonces no vera una columna que indique "tipo de servicio"

		@tc:7446
		Escenario: el reporte se genera por exportacion visible y se ve la columna
			Dado un supervisor solicita un detallado de mensajes con todos los checks activos del formulario
			Y lo exporto utilizando la exportacion visible
			Cuando visualice el contenido del reporte
			Entonces vera una columna que indique "tipo de servicio"

		@tc:7447
		Escenario: el reporte se genera por exportacion completa y se ve la columna
			Dado un supervisor solicita un detallado de mensajes con todos los checks activos del formulario
			Y lo exporto utilizando la exportacion completa
			Cuando visualice el contenido del reporte
			Entonces vera una columna que indique "tipo de servicio"

		@tc:7448
		Escenario: el repote lo genera la exportacion diaria y se ve la columna
			Cuando un reporte detallado de mensajes es generado por la funcionalidad de exportacion diaria
			Y un supervisor accede a dicho reporte
			Entonces vera una columna que indique "tipo de servicio"

		@tc:7451
		Escenario: el repote lo genera la exportacion programada y se ve la columna
			Cuando un reporte detallado de mensajes es generado por la funcionalidad de reportes programados
			Y un supervisor accede a dicho reporte
			Entonces vera una columna que indique "tipo de servicio"

	Regla de negocio: Una celda de la columna debe indicar el tipo de canal que genero el mensaje

		@tc:7449
		Escenario: un mensaje se envia por un servicio y en la columna indica el tipo de servicio que es
			Dado un mensaje generado por el siguiente servicio:
				| nombre de servicio         | tipo de servicio   |
				| Itchy & Scratchy messenger | facebook messenger |
			Cuando un supervisor exporta un detallado de mensajes que contiene dicho mensaje
			Entonces ese mensaje tendra "facebook messenger" como valor en la columna "tipo de servicio"