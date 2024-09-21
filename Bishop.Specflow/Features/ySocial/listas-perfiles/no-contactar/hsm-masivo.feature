#language: es
Característica: Envios de HSM en tareas masivas impedidos por usuario estar en la Lista de Perfiles No Contactar
	Al momento de enviar mensajes HSM mediante una tarea masiva, se desea evaluar si un usuario esta registrado en la lista de perfiles no contactar.
	En caso de que se encuentre el usuario en esta lista impedir el envio del HSM.

	Regla de negocio: usuarios que estan en la lista no deben recibir HSM 
		@tc:5316
		Esquema del escenario: Usuario que esta en la Lista de Perfiles No Contactar no recibe un envio de HSM de tarea masiva
			Dado que un usuario se encuentra en la Lista de Perfiles No Contactar
			Cuando un <@usuarioDeYsocial> agenda una tarea masiva de envios HSM
			Y en la lista de envios se encuentra el contacto del usuario
			Entonces se debe ignorar el envio del HSM del usuario
			Y el resto de los envios deben procesarse correctamente

			Ejemplos:
				| @usuarioDeYsocial |
				| supervisor        |
				| integracion       |
		@tc:5317
		Esquema del escenario: Usuario que no esta en la Lista de Perfiles No Contactar recibe un envio de HSM de tarea masiva
			Dado que un usuario no se encuentra en la Lista de Perfiles No Contactar
			Cuando un <@usuarioDeYsocial> agenda una tarea masiva de envios HSM
			Y en la lista de envios se encuentra el contacto del usuario
			Entonces se le notificara al <@usuarioDeYsocial> que se agenda correctamente el envio 
			Y el usuario debe recibir el mensaje HSM

			Ejemplos:
				| @usuarioDeYsocial |
				| supervisor        |
				| integracion       |
				
	Regla de negocio: Desde el supervisor e integracion se puede ignorar que un usuario este en la lista
		@tc:5318
		Esquema del escenario: Usuario recibe un envio de HSM de una tarea masiva sin importar si esta en la Lista de Perfiles No Contactar
			Dado que un usuario esta <@estadoEnLista> en la Lista de Perfiles No Contactar
			Cuando un <@usuarioDeYsocial> agenda una tarea masiva de envios HSM
			Y en la lista de envios se encuentra el contacto del usuario
			Entonces se le notificara al <@usuarioDeYsocial> que se agenda correctamente el envio 
			Y el usuario debe recibir el mensaje HSM

			Ejemplos: Envios del supervisor
				| @estadoEnLista | @usuarioDeYsocial |
				| presente       | supervisor        |
				| ausente        | supervisor        |

			Ejemplos: Envios de una integracion
				| @estadoEnLista | @usuarioDeYsocial |
				| presente       | integracion       |
				| ausente        | integracion       |