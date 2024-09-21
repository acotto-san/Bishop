#language:es 
Característica: campo id de sitio del ultimo agente
	Se desea tener un campo en el query string de la encuesta que provea el ID del sitio al cual pertenece el ultimo agente del caso
	
	Regla de negocio: el valor del campo estara compuesto por el nombre del sitio del agente

		@tc:7090
		Escenario: querystring de encuesta de terceros muestra ID del sitio del agente
			Dada una encuesta de terceros que indica el ID del sitio del agente
			Y un caso fue gestionado por los siguientes agentes
				| orden de atencion | username | id sitio de agente |
				| 1                 | poochie  | 9                  |
				| 2                 | qagent   | 4                  |
			Cuando se le envie la url de la encuesta al usuario
			Entonces el enlace contendra el campo "siteId=4"

		@tc:7091
		Esquema del escenario: querystring de encuesta de terceros no muestra id de sitio
			Exploratorio: intentar reproducir el 7090 pero haciendo que el agente 2 no tenga sitio 
			(evaluar que no quede el id de sitio del agente 1)
			Dada una encuesta de terceros que indica el ID del sitio del agente
			Y un caso que fue gestionado por <condicion caso>
			Cuando se le envie la url de la encuesta al usuario
			Entonces el enlace contendra el campo "siteId="

			Ejemplos: 
				| condicion caso      |
				| un agente sin sitio |
				| un bot              |