#language: es
@us:4356
Característica: ver info de un perfil al que se le esta por enviar un mensaje desde Mensajes Salientes
	Desde los mensajes asignados se puede visualizar un modal con informacion detallada del perfil,
	y se desea agregar el acceso de esta misma vista a un perfil que se le este por escribir desde Mensajes Salientes.
	

	Regla de negocio: se podra ver el modal siempre y cuando el usuario tenga un perfil ya creado en ysocial

		@tc:5502
		Esquema del escenario: usuario visualiza modal de info de un perfil
			Dado un agente que se encuentra en Mensajes Salientes a punto de escribir un saliente de <canal de saliente>
			Y ya ubico a un perfil de un usuario que ya tuvo contacto con la plataforma
			Cuando hace click en la lupa que se encuentra en el perfil
			Entonces debera aparecer el modal de informacion detallada del perfil
		
		@tc:5503
		Escenario: pestañas "Datos del perfil del usuario" y "Campos adicionales" visibles desde modal
			Dado un agente que se encuentra en Mensajes Salientes
			Y ya ubico a un perfil de un usuario que ya tuvo contacto con la plataforma
			Cuando hace click en la lupa que se encuentra en el perfil
			Y aparece el modal de informacion detallada del perfil
			Entonces el modal debera contener las pestañas "Datos del perfil del usuario" y "Campos adicionales"
			
	Regla de negocio: el modal debe de ser solo lectura

		@tc:5504
		Esquema del escenario: pestañas dentro de modal de informacion del usuario contienen campos de solo lectura
			Dado un agente que se encuentra en Mensajes Salientes
			Y ya ubico a un perfil de un usuario que ya tuvo contacto con la plataforma
			Cuando hace click en la lupa que se encuentra en el perfil
			Y se posiciona en la pestaña <pestaña a evaluar>
			Entonces los campos dentro de la pestaña seran de solo lectura
		
			Ejemplos: 
				| pestaña a evaluar           |
				| Datos del perfil de usuario |
				| Campos adicionales          |
		