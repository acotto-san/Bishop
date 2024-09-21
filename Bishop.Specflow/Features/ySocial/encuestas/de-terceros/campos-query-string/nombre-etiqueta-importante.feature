#language:es 
Característica: campo nombre de etiqueta importante
	Se desea tener un campo en el query string de la encuesta que provea el nombre de la etiqueta importante que posee el caso.

	Regla de negocio: el valor del campo estara compuesto por el nombre de la etiqueta importante que posee el caso

		@tc:5867
		Escenario: querystring de encuesta de terceros muestra nombre de etiqueta importante
			Dada una encuesta que posee habilitada el check "Nombre completo de la etiqueta importante"
			Y un caso que fue cerrado teniendo la etiqueta importante "Viriviri/AAA"
			Cuando se le envie la url de la encuesta al usuario
			Entonces el enlace contendra el campo "importantTagFullName=Viriviri/AAA"

		@tc:5868
		Escenario: querystring de encuesta de terceros no muestra nombre de etiqueta importante
			Dada una encuesta que posee habilitada el check "Nombre completo de la etiqueta importante" 
			Y un caso que fue cerrado sin tener una etiqueta importante
			Cuando se le envie la url de la encuesta al usuario
			Entonces el enlace contendra el campo "importantTagFullName="