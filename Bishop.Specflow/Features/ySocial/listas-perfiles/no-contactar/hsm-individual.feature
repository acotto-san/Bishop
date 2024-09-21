#language: es
@us:4995
Característica: Envios de HSM individual impedidos por usuario estar en la Lista de Perfiles No Contactar
	Al momento de enviar mensajes HSM individuales, se desea evaluar si un usuario esta registrado en la lista de perfiles no contactar.
	En caso de que se encuentre el usuario en esta lista impedir el envio del HSM.

	Regla de negocio: usuarios que estan en la lista no deben recibir HSM 
		@tc:5313
		Esquema del escenario: Usuario que esta en la Lista de Perfiles No Contactar no recibe un envio de HSM indiviual
			Dado que un usuario se encuentra en la Lista de Perfiles No Contactar
			Cuando un <@usuarioDeYsocial> intenta enviar un mensaje hsm individual al usuario
			Entonces se le notificara al <@usuarioDeYsocial> que no se puede realizar el envio 

				Ejemplos:
					| @usuarioDeYsocial |
					| agente            |
					| supervisor        |
					| integracion       |
		@tc:5314
		Esquema del escenario: Usuario que no esta en la Lista de Perfiles No Contactar recibe un envio de HSM individual
			Dado que un usuario no se encuentra en la Lista de Perfiles No Contactar
			Cuando un <@usuarioDeYsocial> intenta enviar un mensaje hsm individual al usuario
			Entonces se le notificara al <@usuarioDeYsocial> que se agenda correctamente el envio 
			Y el usuario debe recibir el mensaje HSM
			
			Ejemplos:
				| @usuarioDeYsocial |
				| agente            |
				| supervisor        |
				| integracion       |

	Regla de negocio: Desde el supervisor e integracion se puede ignorar que un usuario este en la lista
		
		@tc:5315
		Esquema del escenario: Usuario recibe un envio de HSM individual sin importar si esta en la Lista de Perfiles No Contactar
			Dado que un usuario esta <@estadoEnLista> en la Lista de Perfiles No Contactar
			Cuando un <@usuarioDeYsocial> intenta enviar un mensaje hsm individual al usuario
			Y en la configuracion del envio establece que no se va chequear si el usuario esta o no en la lista
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