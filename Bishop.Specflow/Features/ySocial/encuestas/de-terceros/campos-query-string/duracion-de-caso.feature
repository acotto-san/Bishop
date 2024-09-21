#language:es
@us:5089
Característica: agregar al querystring un campo con la duracion del caso
	Se desea que en la querystring que se genera para redireccionar al usuario a la encuesta se agregue un campo para graficar el tiempo que duro el caso

	Regla de negocio: el valor del campo estara compuesto por el tiempo de vida que tuvo el caso

		@tc:5394
		Escenario: campo caseLength se completa con el tiempo que duro un caso 
			Dada una encuesta que posee habilitada el check "ID del caso:"
			Y un caso que fue cerrado cuando tenia 20 minutos desde que habia sido creado
			Cuando se le envie la url de la encuesta al usuario
			Entonces el enlace contendra el campo "caseLength=1200"

		@tc:5395
		Escenario: campo caseLength se completa con el tiempo que duro un caso reabierto
			Dada una encuesta que posee habilitada el check "ID del caso:"
			Y un caso que fue cerrado cuando tenia 20 minutos desde que habia sido creado
			Y tuvo una reapertura
			Y acumulo 10 minutos mas de vida hasta que fue cerrado nuevamente
			Cuando se le envie la url de la encuesta al usuario
			Entonces el enlace contendra el campo "caseLength=1800"
