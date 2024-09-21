#language: es 
@us:4581
Característica: url de integracion con ySocial
	Se desea que el flujo pueda consultar que datos tiene el ambiente de ySocial para poder consumirlos.
	Y esto se realiza indicandole la url donde esta ubicado el ambiente a consultar.
	(EJ: de esta manera el flujo obtiene cuales plantillas HSM contienen los servicios de ese ambiente)

	Regla de negocio: la url se completa automaticamente al crear el flujo

		@tc:5451
		Esquema del escenario: se crea un flujo y la url de integracion con ySocial se establece automaticamente
			Dado que un ambiente de yFlow esta alojado en la url "<url>/yflow"
			Cuando que un usuario crea un nuevo bot en yFlow
			Entonces el flujo en su integracion con ySocial contendra la siguiente url: "<url>"

				Ejemplos: 
					| url                         |
					| https://qa.ysocial.net/test |


	Regla de negocio: la url no podra ser editada por cualquier usuario

		@tc:5452
		Esquema del escenario: supervisor de yFlow no puede modificar url de integracion con ySocial
			Dado un usuario que <tienePermiso> el permiso "administrador" en yFlow
			Cuando ingresa a los ajustes de un bot
			Entonces el campo url de integracion con ySocial no sera editable

				Ejemplos: 
					| tienePermiso |
					| posee        |
					| no posee     |
		@tc:5453 
		Escenario: cuenta "Administrador" puede modificar url de integracion con ySocial
			Cuando un supervisor ingresa a yFlow con las credenciales del usuario "Administrador"
			E ingresa a los ajustes de un bot
			Entonces el campo url de integracion con ySocial sera editable

