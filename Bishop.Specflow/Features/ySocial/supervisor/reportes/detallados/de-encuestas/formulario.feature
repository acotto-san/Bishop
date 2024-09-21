#language: es
Característica: Formulario para solicitar el reporte detallado de encuestas
	Como supervisor 
	Quiero tener un formulario del reporte detallado de encuestas
	Para poder customizar la vista final que me provee el reporte

	Regla de negocio: El formulario obliga al supervisor a completar un campo antes de efectuar la busqueda

		@tc:6250
		Escenario: Formulario no realiza busqueda hasta tener completado el filtro de "Fecha de inicio del caso"
			Dado que un supervisor se encuentra en el formulario del Reporte Detallado de Encuestas
			Y los campos de fechas del filtro "Fecha de inicio del caso" no se encuentran completos
			Cuando el supervisor intenta confirmar la busqueda del formulario
			Entonces se le informara que debe completar dicho campo para continuar