#language:es 
Característica: configurar campos del query string de la encuesta 
	Se desea que la URL de la encuesta que se envia al usuario tenga campos configurables en su querystring

	Regla de negocio: el campo es configurable por encuesta

		@tc:5390
		Escenario: se agrega campo a una encuesta
			Dado que Sandra es una supervisora que se encuentra editando una encuesta de tercero
			Cuando habilita el check "<nombre del campo>"
			Y guarda cambios
			Entonces el campo "<clave del campo>" quedara agregado al querystring de la encuesta
			Y estara presente en los envios posteriores de dicha encuesta

			Ejemplos: 
				| nombre del campo                          | clave del campo      |
				| Duración del caso                         | caseLength           |
				| Nombre completo de la etiqueta importante | importantTagFullName |
				| Id de la etiqueta importante              | importantTagId       |
				| Id del sitio del último agente            | siteId               |
				| Nombre del sitio del último               | siteName             |

		@tc:5391
		Esquema del escenario: se quita campo de una encuesta
			Dado que Sandra es una supervisora que se encuentra editando una encuesta de tercero
			Cuando deshabilita el check "<nombre del campo>"
			Y guarda cambios
			Entonces el campo "<clave del campo>" dejara de estar presente en el querystring de la encuesta
			Y no se mostrara en los envios posteriores de dicha encuesta

			Ejemplos: 
				| nombre del campo                          | clave del campo      |
				| Duración del caso                         | caseLength           |
				| Nombre completo de la etiqueta importante | importantTagFullName |
				| Id de la etiqueta importante              | importantTagId       |
				| Id del sitio del último agente            | siteId               |
				| Nombre del sitio del último               | siteName             |

	Regla de negocio: el campo se enviara en una encuesta si se encuentra habilitado en la misma

		@tc:5392
		Esquema del escenario: campo se encuentra al comienzo del querystring
			Dada una encuesta de tercero que solo se le habilita el check "<nombre del campo>"
			Cuando se envie la url de la encuesta al usuario
			Entonces la querystring estara compuesta por "?<clave del campo>=value"
			
			Ejemplos: 
				| nombre del campo                          | clave del campo      |
				| Duración del caso                         | caseLength           |
				| Nombre completo de la etiqueta importante | importantTagFullName |
				| Id de la etiqueta importante              | importantTagId       |
				| Id del sitio del último agente            | siteId               |
				| Nombre del sitio del último               | siteName             |

		@tc:5393
		Esquema del escenario: campo no se encuentra al comienzo del querystring
			Dada una encuesta de tercero que se le habilita los siguientes checks:
				| checks             |
				| cualquiera         |
				| <nombre del campo> |
			Cuando se envie la url de la encuesta al usuario
			Entonces la querystring estara compuesta por "?cualquiera=value&<clave del campo>=value"

			Ejemplos: 
				| nombre del campo                          | clave del campo      |
				| Duración del caso                         | caseLength           |
				| Nombre completo de la etiqueta importante | importantTagFullName |
				| Id de la etiqueta importante              | importantTagId       |
				| Id del sitio del último agente            | siteId               |
				| Nombre del sitio del último               | siteName             |

