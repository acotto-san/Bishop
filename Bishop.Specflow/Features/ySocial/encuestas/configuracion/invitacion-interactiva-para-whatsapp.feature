#language: es
Característica: Invitacion interactiva para canales de whatsapp
	Como supervisor/administrador
	quiero utilizar el mensaje interactivo para enviar encuestas de canales de Whatsapp,
	para mejorar la forma de envío. De esta forma se evita utilizar el acortador de Yoizen.

	Esta configuración se realiza por cola o por servicio.
	

Regla: La opción de Invitación Interactiva para canales de WhatsApp es optativa en la configuración de la encuesta.

	@tc:9330
	Esquema del escenario: el campo de invitación interactiva para whatsapp queda vacío
		Dado que se tiene una encuesta asociada a <seccion>
		Y se ingresa a la configuracion de la encuesta
		Cuando se completa la invitacion a participar con el comodin del link
		Y se deja vacia la invitacion interactiva para canales de whatsapp
		Y se deja vacio el texto del boton
		Entonces se puede guardar la edicion de la encuesta

		Ejemplos:
			| seccion                 |
			| una cola                |
			| un servicio de whatsapp |

	@tc:9331
	Esquema del escenario: el campo de invitación a participar queda vacío
		Dado que se tiene una encuesta asociada a <seccion>
		Y se ingresa a la configuracion de la encuesta
		Cuando se completa la invitacion interactiva para canales de whatsapp
		Y se deja vacia la invitacion a participar 
		Entonces no se podra guardar la edicion de la encuesta

		Ejemplos:
		    | seccion                 |
		    | una cola                |
		    | un servicio de whatsapp |

	@tc:9332
	Esquema del escenario: se completa el texto del botón interactivo pero la invitación queda vacía
		Dado que se tiene una encuesta asociada a <seccion>
		Y se ingresa a la configuracion de la encuesta
		Cuando se completa texto del boton interactivo de whatsapp
		Y se deja vacia la invitacion interactiva para canales de whatsapp
		Entonces no se podra guardar la edicion de la encuesta

		Ejemplos:
			| seccion              |
			| cola                 |
			| servicio de whatsapp |

	@tc:9333
	Esquema del escenario: se completan los campos de la invitación interactiva por whatsapp
		Dado que se ingresa a la configuracion de una encuesta asociada a <seccion> 
		Y tiene una invitacion a participar configurada
		Cuando se completa la invitacion interactiva para canales de whatsapp
		Y se completa el texto del boton interactivo de whatsapp
		Entonces se podra guardar la edicion de la encuesta

		Ejemplos:
			| seccion              |
			| cola                 |
			| servicio de whatsapp |

Regla: El Texto del botón del mensaje interactivo debe tener más de 0 caracteres y menos de 21
	
	@tc:9334
	Esquema del escenario: se valida cantidad de caracteres en el texto del boton
		Dado que un usuario configura una encuesta asociada a una cola o servicio de whatsapp
		Cuando completa el campo del texto del boton del mensaje interactivo con <caracteres>
		Entonces <resultado obtenido>

		Ejemplos:
			| caracteres | resultado obtenido                         |
			| 0          | no podra guardar la edicion de la encuesta |
			| 20         | podra guardar la edicion de la encuesta    |
			| 21         | no podra guardar la edicion de la encuesta |

Regla: Esta configuracion es exclusiva del canal Whatsapp

	@tc:9335
	Esquema del escenario: edición de una encuesta de un servicio que no es de whatsapp
		Dado que se edita una encuesta asociada a un servicio de <servicio>
		Cuando se abre el modal de edicion
		Entonces no aparecera la invitacion interactiva para canal whatsapp

		Ejemplos: 
			| servicio  |
			| mail      |
			| instagram |
			| facebook  |
			| messenger |
			| chat      |
			| telegram  |
			| twitter   |
		
	@tc:9336
	Escenario: encuesta configurada con invitación simple e invitación interactiva de whatsapp
		Dado un servicio de whatsapp con encuesta asociada
		Y que tiene completa la invitacion a participar 
		Y la invitacion interactiva de whatsapp
		Cuando se le envia la encuesta a un usuario
		Entonces deberia aparece solamente la invitacion interactiva

	@tc:9337
	Esquema del escenario: encuesta asociada a una cola es configurada con las dos invitaciones 
		Dado que una encuesta esta asociada a la cola B
		Y tiene configurada las dos invitaciones
		Cuando se cierra un caso del <servicio>
		Entonces el usuario recibira la <resultado obtenido> de la encuesta

		Ejemplos: 
			| servicio  | resultado obtenido                     |
			| whatsapp  | invitacion interactiva de whatsapp     |
			| mail      | invitacion a participar de la encuesta |
			| instagram | invitacion a participar de la encuesta |
			| messenger | invitacion a participar de la encuesta |
			| telegram  | invitacion a participar de la encuesta |
			| chat      | invitacion a participar de la encuesta |
			| twitter   | invitacion a participar de la encuesta |

	@tc:9338
	Escenario: usuario que interactúa en messenger y finaliza su interacción en whatsapp
		Dado un usuario que interactua con messenger
		Y pasa por la pieza enviar hsm
		Y continua su interaccion en whatsapp
		Cuando se le envia la encuesta
		Entonces deberia aparece la invitacion interactiva de whatsapp

Regla: el usuario puede ingresar a la encuesta seleccionando el botón interactivo

	@tc:9339
	Escenario: usuario selecciona botón de whatsapp
		Dado que un usuario recibe la invitacion interactiva de whatsapp
		Cuando selecciona el boton 
		Entonces lo lleva a la web definida por la encuesta

	@tc:9340
	Escenario: impactan las métricas de una encuesta recibida por invitacion interactiva de whatsapp
	Exploratorio: revisar detallado de encuestas
		Dado que un usuario recibe la invitacion interactiva de whatsapp
		Cuando ingresa a la encuesta
		Y completa la encuesta
		Entonces se contabilizaran las metricas correspondientes para esa encuesta.