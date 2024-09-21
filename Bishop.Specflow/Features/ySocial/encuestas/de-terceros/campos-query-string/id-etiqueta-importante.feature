#language:es 
Característica: campo id de etiqueta importante
	Se desea tener un campo en el query string de la encuesta que provea el id de la etiqueta importante que posee el caso.

	Regla de negocio: el valor del campo estara compuesto por el nombre de la etiqueta importante que posee el caso

		@tc:5865
		Escenario: querystring de encuesta de terceros muestra id de etiqueta importante
			Dada una encuesta que posee habilitada el check "Id de la etiqueta importante"
			Y un caso que fue cerrado teniendo la etiqueta importante "Viriviri/AAA"
			Y dado que la etiqueta posee el id "30"
			Cuando se le envie la url de la encuesta al usuario
			Entonces el enlace contendra el campo "importantTagId=30"

		@tc:5866
		Escenario: querystring de encuesta de terceros no muestra id de etiqueta importante
			Dada una encuesta que posee habilitada el check "Id de la etiqueta importante"
			Y un caso que fue cerrado sin tener una etiqueta importante
			Cuando se le envie la url de la encuesta al usuario
			Entonces el enlace contendra el campo "importantTagId="