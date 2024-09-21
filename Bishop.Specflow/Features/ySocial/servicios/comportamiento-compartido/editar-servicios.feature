#language: es
Característica: Editar un servicio
	Como supervisor
	Quiero poder editar un servicio
	Poder configurarlo de la manera deseada

	Regla de negocio: Se puede ingresar a la edicion de un servicio
	
		@tc:7025
		Escenario: Supervisor edita un servicio
			Dado que un supervisor se encuentra en el listado de servicios
			Cuando haga click en la opcion editar de un servicio
			Entonces debera ver la configuracion las diferentes configuraciones del servicio

	Regla de negocio: Se puede habilitar yFlow en un servicio

		@tc:7026
		Esquema del escenario: Supervisor habilita yFlow en un servicio
			Dado que un supervisor se encuentra editando un servicio de canal <tipo de canal>
			Cuando asocie yFlow
			Entonces se debera habilitar la pestaña "configuracion avanzada" de yFlow

			Ejemplos: 
				| tipo de canal |
				| messenger     |
				| chat          |
				| whatsapp      |
				| twitter       |
				| instagram     |
				| telegram      |
				| skype         |
				| mercado libre |
				| google rbm    |
				| apple         |