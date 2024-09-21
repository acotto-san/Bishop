#language: es
Característica: Al copiar servicios se copian parcialmente los campos de origen

	Regla de negocio: La funcionalidad permite rellenar o sobreescribir los campos de un servicio en creacion/edicion con los que posee otro servicio

		@tc:6155
		Escenario: Supervisor utiliza la funcionalidad de copiar servicio al momento de crear uno nuevo
			Dado me encuentro en la pagina de creacion de un servicio de tipo <tipo de servicio>
			Cuando copio la configuracion de otro servicio
			Y completo los campos obligatorios
			Y guardo cambios
			Entonces el guardado del servicio se realiza con exito
			Y la configuracion de ambos servicios sera identica sin considerar los campos exceptuados

		@tc:6156
		Escenario: Supervisor utiliza la funcionalidad de copiar servicio al momento de editar uno
			Dado me encuentro en la pagina de edicion de un servicio de tipo <tipo de servicio>
			Y el servicio tiene los campos obligatorios completados
			Cuando copio la configuracion de otro servicio
			Y guardo cambios
			Entonces el guardado del servicio se realiza con exito
			Y la configuracion de ambos servicios sera identica sin considerar los campos exceptuados

		@tc:6157
		Escenario: Cuando se copia un campo invalido sera captura por la validacion del servicio que estoy guardando
			Dado me encuentro en la pagina de edicion de un servicio
			Y copie la configuracion de un servicio que posee un campo invalido
			Cuando intento guardar los cambios
			Entonces se interrumpira el guardado de la edicion del servicio

	Regla de negocio: Al momento de copiar no voy a tener todos los servicios del ambiente disponibles

		@tc:6158
		Esquema del escenario: No se visualizan servicios de tipo diferente al que se esta configurando
		
			Dado que en ySocial existen los siguientes servicios
				| nombre de servicio | tipo de servicio |
				| Servicio T         | twitter          |
				| Servicio M         | mail             |
				| Servicio I         | instagram        |
				| Servicio W         | whatsapp         |
				| Servicio Me        | messenger        |
				| Servicio F         | facebook         |
				| Servicio C         | chat             |
				| Servicio Ci        | chat integrado   |
			Y me encuentro en la pagina de creacion de un servicio de tipo <tipo de servicio>
			Cuando hago click en la opcion de copiar servicios 
			Entonces en la lista del modal emergente estara unicamente el servicio "<nombre de servicio>"

			Ejemplos: 
				| nombre de servicio | tipo de servicio |
				| Servicio T         | twitter          |
				| Servicio M         | mail             |
				| Servicio I         | instagram        |
				| Servicio W         | whatsapp         |
				| Servicio Me        | messenger        |
				| Servicio F         | facebook         |
				| Servicio C         | chat             |
				| Servicio Ci        | chat integrado   |

		@tc:6159
		Escenario: No se visualizan servicios deshabilitados en la lista de servicios a copiar 
	
			Dado que en ySocial existen los siguientes servicios
				| nombre de servicio | tipo de servicio | estado        |
				| Servicio T         | twitter          | habilitado    |
				| Servicio T2        | twitter          | deshabilitado |
			Y me encuentro en la pagina de creacion de un servicio de tipo <tipo de servicio>
			Cuando hago click en la opcion de copiar servicios 
			Entonces en la lista del modal emergente estara unicamente el servicio: "Servicio T2"

	Regla de negocio: No se copiara el 100% de los campos

		@tc:6160
		Esquema del escenario: Al copiar un servicio se copian casi todos los campos de otro servicio 
			Dado me encuentro en la pagina de <tipo abm> de un servicio de tipo <tipo de servicio>
			Cuando copio la configuracion de otro servicio
			Entonces todos los campos del servicio de origen seran copiados al que visualizo excepto los siguientes:
				"""
				<campos sin modificar>
				"""
			Ejemplos: Editar un servicio
				| tipo de servicio | campos sin modificar                                                                                                                                                                                                | tipo abm |
				| twitter          | De la pestaña "Configuración básica":["Nombre de servicio:","Versión de API:","Versión de API v1.1:","Versión de API v2.0:","Código de Usuario:","Usuario:"]                                                        | edicion  |
				| mail             | La totalidad de la pestaña "Conexión" y de la pestaña "Otras Configuraciones":["Nombre de servicio:"]                                                                                                               | edicion  |
				| instagram        | De la pestaña "Configuración básica":["Nombre de servicio:","User Access Token:","Código de Página:","Nombre de Página:","Page Access Token:","Código de cuenta:","Nombre de cuenta:","Nombre de usuario:"]         | edicion  |
				| whatsapp         | De la pestaña "Configuración básica":["Nombre de servicio:","País del teléfono:","Teléfono:","Access Token:","URL base:"]                                                                                           | edicion  |
				| messenger        | De la pestaña "Configuración básica":["Nombre de servicio:","Código de Página:","Nombre de Página:","Page Access Token:"]                                                                                           | edicion  |
				| facebook         | De la pestaña "Configuración básica":["Nombre de servicio:","Código de Página:","Nombre de Página:","Page Access Token:"]                                                                                           | edicion  |
				| chat             | De la pestaña "Servicio":["Nombre de servicio:","Identificación:"]                                                                                                                                                  | edicion  |
				| chat integrado   | De la pestaña "Servicio":["Nombre de servicio:","Nombre del bot:","URL donde se enviarán mensajes:","URL donde se notificará que un chat finalizó:","URL donde se enviarán acciones en el chat:","Cabeceras HTTP:"] | edicion  |

			Ejemplos: Crear un servicio
				| tipo de servicio | campos sin modificar                                                                                                                                                                                                | tipo abm |
				| twitter          | De la pestaña "Configuración básica":["Nombre de servicio:","Versión de API:","Versión de API v1.1:","Versión de API v2.0:","Código de Usuario:","Usuario:"]                                                        | creacion |
				| mail             | La totalidad de la pestaña "Conexión" y de la pestaña "Otras Configuraciones":["Nombre de servicio:"]                                                                                                               | creacion |
				| instagram        | De la pestaña "Configuración básica":["Nombre de servicio:","User Access Token:","Código de Página:","Nombre de Página:","Page Access Token:","Código de cuenta:","Nombre de cuenta:","Nombre de usuario:"]         | creacion |
				| whatsapp         | De la pestaña "Configuración básica":["Nombre de servicio:","País del teléfono:","Teléfono:","Access Token:","URL base:"]                                                                                           | creacion |
				| messenger        | De la pestaña "Configuración básica":["Nombre de servicio:","Código de Página:","Nombre de Página:","Page Access Token:"]                                                                                           | creacion |
				| facebook         | De la pestaña "Configuración básica":["Nombre de servicio:","Código de Página:","Nombre de Página:","Page Access Token:"]                                                                                           | creacion |
				| chat             | De la pestaña "Servicio":["Nombre de servicio:","Identificación:"]                                                                                                                                                  | creacion |
				| chat integrado   | De la pestaña "Servicio":["Nombre de servicio:","Nombre del bot:","URL donde se enviarán mensajes:","URL donde se notificará que un chat finalizó:","URL donde se enviarán acciones en el chat:","Cabeceras HTTP:"] | creacion |
	