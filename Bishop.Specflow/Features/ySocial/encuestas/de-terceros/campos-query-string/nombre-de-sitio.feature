#language:es 
Característica: campo nombre de sitio del ultimo agente
	Se desea tener un campo en el query string de la encuesta que provea el nombre del sitio al cual pertenece el ultimo agente del caso

	Regla de negocio: el valor del campo estara compuesto por el nombre del sitio del agente

		@tc:7092
		Escenario: querystring de encuesta de terceros muestra nombre del sitio del agente
			Exploratorio: probar con valores con espacios o símbolos
			Dada una encuesta de terceros que indica el nombre del sitio del agente
			Y un caso fue gestionado por los siguientes agentes
				| orden de atencion | username | nombre sitio de agente |
				| 1                 | poochie  | sede comuna 1          |
				| 2                 | qagent   | CasaCentral            |
			Cuando se le envie la url de la encuesta al usuario
			Entonces el enlace contendra el campo "siteName=CasaCentral"

		@tc:7093
		Esquema del escenario: querystring de encuesta de terceros no muestra nombre de sitio
			Exploratorio: intentar reproducir el 7092 pero haciendo que el agente 2 no tenga sitio 
			(evaluar que no quede el nombre de sitio del agente 1)
			Dada una encuesta de terceros que indica el nombre del sitio del agente
			Y un caso que fue gestionado por <condicion caso>
			Cuando se le envie la url de la encuesta al usuario
			Entonces el enlace contendra el campo "siteName="

			Ejemplos: 
				| condicion caso      |
				| un agente sin sitio |
				| un bot              |