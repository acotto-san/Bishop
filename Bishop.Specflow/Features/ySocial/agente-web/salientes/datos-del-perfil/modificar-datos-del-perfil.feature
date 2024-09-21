#language: es
@us:7896
Característica: modificar el perfil de un mensaje saliente
	Al realizar un mensaje saliente, se debe agregar "el lapicito" en el modal del perfil del usuario para poder modificar datos del perfil.
	En algunos casos se van a poder modificar usuarios sin perfil existente en social, en otros únicamente cuando son existentes.

	En Twiter, Mail y WhatsApp se puede enviar a usuarios existentes e inexistentes. A Telegram, Facebook Messenger e Instagram únicamente a usuarios existentes.
	En twitter no se puede modificar el usuario inexistente.
	Exploratorio: modificar todos los datos del perfil (basicos, de negocio y campos adicionales)

	El buscador de Facebook/Messenger busca por data del perfil, toma el nombre y el business data.

Antecedentes:
	Dado que en la configuracion del agente o grupo de agentes se tiene el permiso de edición del perfil en mensaje saliente


	Regla: Cuando el agente envía un saliente a un usuario inexistente, crea el usuario en ysocial con los datos que le haya agregado. Caso de twiter, wa y mail.

		@tc:8007
		Esquema del escenario: Guarda datos de un usuario inexistente y cancela saliente
			Dado un agente que ingresa el <usuario> de un usuario inexistente en un saliente
			Y modifica datos del perfil 
			Y guardar los datos del perfil en el modal
			Cuando cancela el envio del saliente
			Entonces no se crea el perfil

			Ejemplos: 
				| usuario  |
				| mail     |
				| whatsapp |

		@tc:8008
		Esquema del escenario: Guarda datos de un usuario inexistente y envía saliente
	
			Dado un agente que ingresa el <usuario> de un usuario inexistente en un saliente
			Y modifica datos del perfil 
			Y guardar los datos del perfil en el modal
			Cuando envia el saliente
			Entonces crea el perfil de ese usuario
			
			Ejemplos:
				| usuario  |
				| mail     |
				| whatsapp |

	Regla: El agente puede cambiar los datos de un usuario existente al modificarlos en el modal del saliente.

		@tc:8009
		Esquema del escenario: Modifica datos de un usuario existente y cancela saliente

			Dado un agente que ingresa el <usuario> de un usuario existente en un saliente
			Y modifica datos del perfil 
			Y guardar los datos del perfil en el modal
			Cuando cancela el envio del saliente
			Entonces se modifican los datos en su perfil de ysocial

			Ejemplos:
				| usuario      |
				| twitter      |
				| mail         |
				| whatsapp     |
				| telegram     |
				| fb messenger |
				| instagram    |

		@tc:8010  
		Esquema del escenario: Modifica datos de un usuario existente y envia saliente

			Dado un agente que ingresa el <usuario> de un usuario existente en un saliente
			Y modifica datos del perfil 
			Y guardar los datos del perfil en el modal
			Cuando envia el saliente
			Entonces se modifican los datos en el perfil de ysocial

			Ejemplos:
				| usuario      |
				| mail         |
				| twitter      |
				| whatsapp     |
				| telegram     |
				| fb messenger |
				| instagram    |

	Regla: si se deshabilita el permiso, debería dejar de estar habilitada la edición

		@tc:8183
		Escenario: Se deshabilita el permiso del agente para editar el perfil de un saliente
		Exploratorio: deshabilitar en el agente y grupo de agentes. Probar con varios salientes
			Dado un supervisor deshabilita la opcion de editar perfil de un saliente en el agente Poochie
			Cuando el agente Poochie configura un mensaje saliente
			Entonces no visualizara el lapiz para editar el perfil