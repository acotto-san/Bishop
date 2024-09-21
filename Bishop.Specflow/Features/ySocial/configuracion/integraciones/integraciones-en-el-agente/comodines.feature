#language: es
@us6533

Característica: Tener diferentes comodines en un pedido http
	Como administrador o supervisor 
	Quiero tener diferentes comodines 
	Para poder seleccionar informacion para el armado del cuerpo del http

	Regla de negocio: Descripcion de los comodines 
	
		@tc:7711
		Esquema del escenario: Supervisor ingresa a un tipo de integracion
			Dado que un supervisor ingresa al tipo de integracion <integracion>
			Cuando vea los comodines disponibles
			Entonces debera ver las descripciones de para que se utiliza el comodin

			Ejemplos: 
				| integracion                                                              |
				| Actualizacion de caso                                                    |
				| Actualización de datos de perfil de usuario                              |
				| Agente se quedó sin mensajes                                             |
				| Atención finalizada de mensaje por el Agente                             |
				| Cambio de estado a auxiliar                                              |
				| Cambio de estado a disponible                                            |
				| Cambio de estado a trabajando                                            |
				| Cambio de mensaje seleccionado                                           |
				| Chat finalizado en el Agente                                             |
				| Informar que el login del agente falló                                   |
				| Lectura de primer mensaje asignado del caso                              |
				| Login del Agente                                                         |
				| Logoff del Agente                                                        |
				| Mensaje descartado por el Agente                                         |
				| Mensaje devuelvo a la cola por el agente                                 |
				| Mensaje marcado como leído por el agente                                 |
				| Mensaje respondido por el agente                                         |
				| Mensaje se finalizo de leer por el agente                                |
				| Mnesaje transferido a yFlow                                              |
				| Nuevo mensaje asignado al agente                                         |
				| Vinculacion de perfiles                                                  |
				| Configuracion de iFrame en el panel de informacion del perfil de usuario |
				| Configuracion de iFrame en el modal de informacion del perfil de usuario |
				| Configuracion de iFrame en el panel de informacion del caso              |
				| Configuracion de iFrame en el modal de informacion del caso              |

		@tc:7712
		Escenario: Supervisor ingresa al tipo de integracion "Vinculacion de perfiles"
			Dado un supervisor ingresa al tipo de integracion vinculacion de perfiles
			Cuando seleccione la accion ejecutar un pedido http
			Entonces debera ver los siguientes comodines con sus descripciones:
				| @@FECHA@@ Numerico: Indica la fecha y hora actual. Se enviara en formato Timestamp de UNIX con milisegundos     |
				| @@AGENTE[CODIGO]@@ Numerico: Indica el codigo del agente.                                                       |
				| @@AGENTE[NOMBRE]@@ Texto: Indica el nombre del agente                                                           |
				| @@AGENTE[USERNAME]@@ Texto: Indica el nombre de usuario del agente                                              |
				| @@PERFIL[CODIGO]@@ Numerico: Indica el codigo de perfil del usuario                                             |
				| @@PERFIL[CAMPOS]@@ Objeto: Indica los campos extendidos del perfil del usuario                                  |
				| @@PERFIL[NOMBRE]@@ Texto: Indica el nombre de perfil del usuario                                                |
				| @@PERFIL[VIP]@@ Booleano: Indica si el perfil del usuario es VIP                                                |
				| @@PERFIL[EMAIL]@@ Texto: Indica el mail principal del perfil de usuario                                         |
				| @@PERFIL[DATOS]@@ Texto: Indica los datos de negocio del perfil de usuario                                      |
				| @@PERFIL[TELEFONO]@@ Texto: Indica el telefono del perfil del usuario                                           |
				| @@PERFIL_VIEJO[CODIGO]@@ Numerico: Indica el codigo de perfil del usuario que se unifico dentro del otro perfil |

		@tc:7713
		Escenario: Supervisor ingresa al tipo de integracion "Actualizacion de datos de perfil del usuario"
			Dado un supervisor ingresa al tipo de integracion vinculacion de perfiles
			Cuando seleccione la accion ejecutar un pedido http
			Entonces debera ver los siguientes comodines con sus descripciones:
				| @@FECHA@@ Numerico: Indica la fecha y hora actual. Se enviara en formato Timestamp de UNIX con milisegundos     |
				| @@AGENTE[CODIGO]@@ Numerico: Indica el codigo del agente.                                                       |
				| @@AGENTE[NOMBRE]@@ Texto: Indica el nombre del agente                                                           |
				| @@AGENTE[USERNAME]@@ Texto: Indica el nombre de usuario del agente                                              |
				| @@PERFIL[CODIGO]@@ Numerico: Indica el codigo de perfil del usuario                                             |
				| @@PERFIL[CAMPOS]@@ Objeto: Indica los campos extendidos del perfil del usuario                                  |
				| @@PERFIL[NOMBRE]@@ Texto: Indica el nombre de perfil del usuario                                                |
				| @@PERFIL[VIP]@@ Booleano: Indica si el perfil del usuario es VIP                                                |
				| @@PERFIL[EMAIL]@@ Texto: Indica el mail principal del perfil de usuario                                         |
				| @@PERFIL[DATOS]@@ Texto: Indica los datos de negocio del perfil de usuario                                      |
				| @@PERFIL[TELEFONO]@@ Texto: Indica el telefono del perfil del usuario                                           |

		@tc:7714
		Escenario: Supervisor ingresa al tipo de integracion "Actualizacion de caso"
			Dado un supervisor ingresa al tipo de integracion actualizacion de caso
			Cuando seleccione la accion ejecutar un pedido http
			Entonces debera ver los siguientes comodines con sus descripciones:
		| @@FECHA@@Numérico: Indica la fecha y hora actual. Se enviará en formato Timestamp de UNIX con milisegundos |
		| @@AGENTE[CODIGO]@@Numérico: Indica el código de agente                                                     |
		| @@AGENTE[NOMBRE]@@Texto: Indica el nombre del agente                                                       |
		| @@AGENTE[USERNAME]@@Texto: Indica el nombre de usuario del agente                                          |
		| @@CASO[CODIGO]@@Numérico: Indica el código de caso                                                         |
		| @@CASO[ETIQUETAS]@@Texto: Indica los códigos de etiqueta del caso (separados por coma)                     |
		| @@CASO[OBSERVACIONES]@@Texto: Indica las observaciones del caso                                            |
		| @@CASO[ETIQUETAIMPORTANTE]@@Texto: Indica las etiquetas importantes del caso                               |
		| @@CASO[CAMPOS]@@Texto: Indica los campos del caso                                                          |

		@tc:7715
		Escenario: Supervisor ingresa al tipo de integracion "Cambio de mensaje seleccionado"
			Dado un supervisor ingresa al tipo de integracion cambio de mensaje seleccionado
			Cuando seleccione la accion ejecutar un pedido http
			Entonces debera ver los siguientes comodines con sus descripciones:
				| @@FECHA@@Numérico: Indica la fecha y hora actual. Se enviará en formato Timestamp de UNIX con milisegundos |
				| @@AGENTE[CODIGO]@@Numérico: Indica el código de agente                                                     |
				| @@AGENTE[NOMBRE]@@Texto: Indica el nombre del agente                                                       |
				| @@AGENTE[USERNAME]@@Texto: Indica el nombre de usuario del agente                                          |
				| @@MENSAJE[CODIGO]@@Numérico: Indica el código de mensaje                                                   |
				| @@MENSAJE[VIM]@@Booleano: Indica si el mensaje es VIM                                                      |
				| @@MENSAJE[TEXTO]@@Texto: Indica el texto del mensaje                                                       |
				| @@MENSAJE[TEXTO:JSON]@@Texto: Indica el texto del mensaje con el texto seguro para incorporar en un JSON   |
				| @@MENSAJE[TEXTO:XML]@@Texto: Indica el texto del mensaje con el texto seguro para incorporar en un XML     |
				| @@MENSAJE[TIPO]@@ Texto: Indica el tipo de mensaje                                                         |
				| @@USUARIO[NOMBRE]@@Texto: Indica el nombre de usuario                                                      |
				| @@USUARIO[CODIGO]@@Numérico: Indica el código de usuario                                                   |
				| @@USUARIO[VIP]@@Booleano: Indica si el usuario de red social es VIP                                        |
				| @@USUARIO[TIPO]@@Numérico: Indica el código del tipo de servicio al que pertenece el usuario de red social |
				| @@USUARIO[DATOS]@@Texto: Indica los datos de negocio del usuario                                           |
				| @@USUARIO[EMAIL]@@ Tecto: Indica el email del usuario                                                      |
				| @@PERFIL[CODIGO]@@Numérico: Indica el código de perfil del usuario                                         |
				| @@PERFIL[CAMPOS]@@Objeto: Indica los campos extendidos del perfil del usuario                              |
				| @@PERFIL[NOMBRE]@@ Texto: Indica el nombre del usuario                                                     |
				| @@PERFIL[VIP]@@ Booleano: Indica si el perfil del usuario es VIP                                           |
				| @@PERFIL[EMAIL]@@ Texto: Indica el mail principal del perfil de usuario                                    |
				| @@PERFIL[DATOS]@@ Texto: Indica los datos de negocio del perfil de usuario                                 |
				| @@PERFIL[TELEFONO]@@ Texto: Indica el telefono del perfil de usuario                                       |
				| @@CASO[CODIGO]@@Numérico: Indica el código de caso                                                         |
				| @@CASO[ETIQUETAS]@@ Texto: Indica los codigos de etiqueta del caso (separados por coma)                    |
				| @@CASO[OBSERVACIONES]@@ Texto: Indica las observaciones del caso                                           |
				| @@CASO[ETIQUETAIMPORTANTE]@@ Texto: Indica las etiquetas importantes del caso                              |
				| @@CASO[CAMPOS]@@ Texto: Indica los campos del caso                                                         |
				| @@SERVICIO[CODIGO]@@Numérico: Indica el código de servicio                                                 |
				| @@SERVICIO[NOMBRE]@@Texto: Indica el nombre del servicio                                                   |
				| @@SERVICIO[TIPO]@@Numérico: Indica el tipo de servicio                                                     |
				| @@CHAT[CODIGO]@@Numérico: Indica el código de chat                                                         |

		@tc:7716
		Escenario: Supervisor ingresa al tipo de integracion "Chat finalizado en el agente"
			Dado un supervisor ingresa al tipo de integracion chat finalizado en el agente
			Cuando seleccione la accion ejecutar un pedido http
			Entonces debera ver los siguientes comodines con sus descripciones:
				| @@FECHA@@Numérico: Indica la fecha y hora actual. Se enviará en formato Timestamp de UNIX con milisegundos |
				| @@AGENTE[CODIGO]@@Numérico: Indica el código de agente                                                     |
				| @@AGENTE[NOMBRE]@@Texto: Indica el nombre del agente                                                       |
				| @@AGENTE[USERNAME]@@Texto: Indica el nombre de usuario del agente                                          |
				| @@MENSAJE[CODIGO]@@Numérico: Indica el código de mensaje                                                   |
				| @@MENSAJE[VIM]@@Booleano: Indica si el mensaje es VIM                                                      |
				| @@MENSAJE[TEXTO]@@Texto: Indica el texto del mensaje                                                       |
				| @@MENSAJE[TEXTO:JSON]@@Texto: Indica el texto del mensaje con el texto seguro para incorporar en un JSON   |
				| @@MENSAJE[TEXTO:XML]@@Texto: Indica el texto del mensaje con el texto seguro para incorporar en un XML     |
				| @@MENSAJE[TIPO]@@ Texto: Indica el tipo de mensaje                                                         |
				| @@USUARIO[NOMBRE]@@Texto: Indica el nombre de usuario                                                      |
				| @@USUARIO[CODIGO]@@Numérico: Indica el código de usuario                                                   |
				| @@USUARIO[VIP]@@Booleano: Indica si el usuario de red social es VIP                                        |
				| @@USUARIO[TIPO]@@Numérico: Indica el código del tipo de servicio al que pertenece el usuario de red social |
				| @@USUARIO[DATOS]@@Texto: Indica los datos de negocio del usuario                                           |
				| @@USUARIO[EMAIL]@@ Tecto: Indica el email del usuario                                                      |
				| @@PERFIL[CODIGO]@@Numérico: Indica el código de perfil del usuario                                         |
				| @@PERFIL[CAMPOS]@@Objeto: Indica los campos extendidos del perfil del usuario                              |
				| @@PERFIL[NOMBRE]@@ Texto: Indica el nombre del usuario                                                     |
				| @@PERFIL[VIP]@@ Booleano: Indica si el perfil del usuario es VIP                                           |
				| @@PERFIL[EMAIL]@@ Texto: Indica el mail principal del perfil de usuario                                    |
				| @@PERFIL[DATOS]@@ Texto: Indica los datos de negocio del perfil de usuario                                 |
				| @@PERFIL[TELEFONO]@@ Texto: Indica el telefono del perfil de usuario                                       |
				| @@CASO[CODIGO]@@Numérico: Indica el código de caso                                                         |
				| @@CASO[ETIQUETAS]@@ Texto: Indica los codigos de etiqueta del caso (separados por coma)                    |
				| @@CASO[OBSERVACIONES]@@ Texto: Indica las observaciones del caso                                           |
				| @@CASO[ETIQUETAIMPORTANTE]@@ Texto: Indica las etiquetas importantes del caso                              |
				| @@CASO[CAMPOS]@@ Texto: Indica los campos del caso                                                         |
				| @@SERVICIO[CODIGO]@@Numérico: Indica el código de servicio                                                 |
				| @@SERVICIO[NOMBRE]@@Texto: Indica el nombre del servicio                                                   |
				| @@SERVICIO[TIPO]@@Numérico: Indica el tipo de servicio                                                     |
				| @@CHAT[CODIGO]@@Numérico: Indica el código de chat                                                         |

		@tc:7717
		Escenario: Supervisor ingresa al tipo de integracion "Lectura de primer mensaje asignado al caso"
			Dado un supervisor ingresa al tipo de integracion lectura de primer mensaje asignado del caso
			Cuando seleccione la accion ejecutar un pedido http
			Entonces debera ver los siguientes comodines con sus descripciones:
				| @@FECHA@@Numérico: Indica la fecha y hora actual. Se enviará en formato Timestamp de UNIX con milisegundos |
				| @@AGENTE[CODIGO]@@Numérico: Indica el código de agente                                                     |
				| @@AGENTE[NOMBRE]@@Texto: Indica el nombre del agente                                                       |
				| @@AGENTE[USERNAME]@@Texto: Indica el nombre de usuario del agente                                          |
				| @@MENSAJE[CODIGO]@@Numérico: Indica el código de mensaje                                                   |
				| @@MENSAJE[VIM]@@Booleano: Indica si el mensaje es VIM                                                      |
				| @@MENSAJE[TEXTO]@@Texto: Indica el texto del mensaje                                                       |
				| @@MENSAJE[TEXTO:JSON]@@Texto: Indica el texto del mensaje con el texto seguro para incorporar en un JSON   |
				| @@MENSAJE[TEXTO:XML]@@Texto: Indica el texto del mensaje con el texto seguro para incorporar en un XML     |
				| @@MENSAJE[TIPO]@@ Texto: Indica el tipo de mensaje                                                         |
				| @@USUARIO[NOMBRE]@@Texto: Indica el nombre de usuario                                                      |
				| @@USUARIO[CODIGO]@@Numérico: Indica el código de usuario                                                   |
				| @@USUARIO[VIP]@@Booleano: Indica si el usuario de red social es VIP                                        |
				| @@USUARIO[TIPO]@@Numérico: Indica el código del tipo de servicio al que pertenece el usuario de red social |
				| @@USUARIO[DATOS]@@Texto: Indica los datos de negocio del usuario                                           |
				| @@USUARIO[EMAIL]@@ Tecto: Indica el email del usuario                                                      |
				| @@PERFIL[CODIGO]@@Numérico: Indica el código de perfil del usuario                                         |
				| @@PERFIL[CAMPOS]@@Objeto: Indica los campos extendidos del perfil del usuario                              |
				| @@PERFIL[NOMBRE]@@ Texto: Indica el nombre del usuario                                                     |
				| @@PERFIL[VIP]@@ Booleano: Indica si el perfil del usuario es VIP                                           |
				| @@PERFIL[EMAIL]@@ Texto: Indica el mail principal del perfil de usuario                                    |
				| @@PERFIL[DATOS]@@ Texto: Indica los datos de negocio del perfil de usuario                                 |
				| @@PERFIL[TELEFONO]@@ Texto: Indica el telefono del perfil de usuario                                       |
				| @@CASO[CODIGO]@@Numérico: Indica el código de caso                                                         |
				| @@CASO[ETIQUETAS]@@ Texto: Indica los codigos de etiqueta del caso (separados por coma)                    |
				| @@CASO[OBSERVACIONES]@@ Texto: Indica las observaciones del caso                                           |
				| @@CASO[ETIQUETAIMPORTANTE]@@ Texto: Indica las etiquetas importantes del caso                              |
				| @@CASO[CAMPOS]@@ Texto: Indica los campos del caso                                                         |
				| @@SERVICIO[CODIGO]@@Numérico: Indica el código de servicio                                                 |
				| @@SERVICIO[NOMBRE]@@Texto: Indica el nombre del servicio                                                   |
				| @@SERVICIO[TIPO]@@Numérico: Indica el tipo de servicio                                                     |
				| @@CHAT[CODIGO]@@Numérico: Indica el código de chat                                                         |
	
		@tc:7718
		Escenario: Supervisor ingresa al tipo de integracion "Mensaje descartado por el agente"
			Dado un supervisor ingresa al tipo de integracion mensaje descartado por el agente
			Cuando seleccione la accion ejecutar un pedido http
			Entonces debera ver los siguientes comodines con sus descripciones:
				| @@FECHA@@Numérico: Indica la fecha y hora actual. Se enviará en formato Timestamp de UNIX con milisegundos |
				| @@AGENTE[CODIGO]@@Numérico: Indica el código de agente                                                     |
				| @@AGENTE[NOMBRE]@@Texto: Indica el nombre del agente                                                       |
				| @@AGENTE[USERNAME]@@Texto: Indica el nombre de usuario del agente                                          |
				| @@MENSAJE[CODIGO]@@Numérico: Indica el código de mensaje                                                   |
				| @@MENSAJE[VIM]@@Booleano: Indica si el mensaje es VIM                                                      |
				| @@MENSAJE[TEXTO]@@Texto: Indica el texto del mensaje                                                       |
				| @@MENSAJE[TEXTO:JSON]@@Texto: Indica el texto del mensaje con el texto seguro para incorporar en un JSON   |
				| @@MENSAJE[TEXTO:XML]@@Texto: Indica el texto del mensaje con el texto seguro para incorporar en un XML     |
				| @@MENSAJE[TIPO]@@ Texto: Indica el tipo de mensaje                                                         |
				| @@USUARIO[NOMBRE]@@Texto: Indica el nombre de usuario                                                      |
				| @@USUARIO[CODIGO]@@Numérico: Indica el código de usuario                                                   |
				| @@USUARIO[VIP]@@Booleano: Indica si el usuario de red social es VIP                                        |
				| @@USUARIO[TIPO]@@Numérico: Indica el código del tipo de servicio al que pertenece el usuario de red social |
				| @@USUARIO[DATOS]@@Texto: Indica los datos de negocio del usuario                                           |
				| @@USUARIO[EMAIL]@@ Tecto: Indica el email del usuario                                                      |
				| @@PERFIL[CODIGO]@@Numérico: Indica el código de perfil del usuario                                         |
				| @@PERFIL[CAMPOS]@@Objeto: Indica los campos extendidos del perfil del usuario                              |
				| @@PERFIL[NOMBRE]@@ Texto: Indica el nombre del usuario                                                     |
				| @@PERFIL[VIP]@@ Booleano: Indica si el perfil del usuario es VIP                                           |
				| @@PERFIL[EMAIL]@@ Texto: Indica el mail principal del perfil de usuario                                    |
				| @@PERFIL[DATOS]@@ Texto: Indica los datos de negocio del perfil de usuario                                 |
				| @@PERFIL[TELEFONO]@@ Texto: Indica el telefono del perfil de usuario                                       |
				| @@CASO[CODIGO]@@Numérico: Indica el código de caso                                                         |
				| @@CASO[ETIQUETAS]@@ Texto: Indica los codigos de etiqueta del caso (separados por coma)                    |
				| @@CASO[OBSERVACIONES]@@ Texto: Indica las observaciones del caso                                           |
				| @@CASO[ETIQUETAIMPORTANTE]@@ Texto: Indica las etiquetas importantes del caso                              |
				| @@CASO[CAMPOS]@@ Texto: Indica los campos del caso                                                         |
				| @@SERVICIO[CODIGO]@@Numérico: Indica el código de servicio                                                 |
				| @@SERVICIO[NOMBRE]@@Texto: Indica el nombre del servicio                                                   |
				| @@SERVICIO[TIPO]@@Numérico: Indica el tipo de servicio                                                     |
				| @@CHAT[CODIGO]@@Numérico: Indica el código de chat                                                         |

		@tc:7719
		Escenario: Supervisor ingresa al tipo de integracion "Mensaje devuelto a la cola por el agente"
			Dado un supervisor ingresa al tipo de integracion mensaje devuelto a la cola por el agente
			Cuando seleccione la accion ejecutar un pedido http
			Entonces debera ver los siguientes comodines con sus descripciones:
				| @@FECHA@@Numérico: Indica la fecha y hora actual. Se enviará en formato Timestamp de UNIX con milisegundos |
				| @@AGENTE[CODIGO]@@Numérico: Indica el código de agente                                                     |
				| @@AGENTE[NOMBRE]@@Texto: Indica el nombre del agente                                                       |
				| @@AGENTE[USERNAME]@@Texto: Indica el nombre de usuario del agente                                          |
				| @@MENSAJE[CODIGO]@@Numérico: Indica el código de mensaje                                                   |
				| @@MENSAJE[VIM]@@Booleano: Indica si el mensaje es VIM                                                      |
				| @@MENSAJE[TEXTO]@@Texto: Indica el texto del mensaje                                                       |
				| @@MENSAJE[TEXTO:JSON]@@Texto: Indica el texto del mensaje con el texto seguro para incorporar en un JSON   |
				| @@MENSAJE[TEXTO:XML]@@Texto: Indica el texto del mensaje con el texto seguro para incorporar en un XML     |
				| @@MENSAJE[TIPO]@@ Texto: Indica el tipo de mensaje                                                         |
				| @@USUARIO[NOMBRE]@@Texto: Indica el nombre de usuario                                                      |
				| @@USUARIO[CODIGO]@@Numérico: Indica el código de usuario                                                   |
				| @@USUARIO[VIP]@@Booleano: Indica si el usuario de red social es VIP                                        |
				| @@USUARIO[TIPO]@@Numérico: Indica el código del tipo de servicio al que pertenece el usuario de red social |
				| @@USUARIO[DATOS]@@Texto: Indica los datos de negocio del usuario                                           |
				| @@USUARIO[EMAIL]@@ Tecto: Indica el email del usuario                                                      |
				| @@PERFIL[CODIGO]@@Numérico: Indica el código de perfil del usuario                                         |
				| @@PERFIL[CAMPOS]@@Objeto: Indica los campos extendidos del perfil del usuario                              |
				| @@PERFIL[NOMBRE]@@ Texto: Indica el nombre del usuario                                                     |
				| @@PERFIL[VIP]@@ Booleano: Indica si el perfil del usuario es VIP                                           |
				| @@PERFIL[EMAIL]@@ Texto: Indica el mail principal del perfil de usuario                                    |
				| @@PERFIL[DATOS]@@ Texto: Indica los datos de negocio del perfil de usuario                                 |
				| @@PERFIL[TELEFONO]@@ Texto: Indica el telefono del perfil de usuario                                       |
				| @@CASO[CODIGO]@@Numérico: Indica el código de caso                                                         |
				| @@CASO[ETIQUETAS]@@ Texto: Indica los codigos de etiqueta del caso (separados por coma)                    |
				| @@CASO[OBSERVACIONES]@@ Texto: Indica las observaciones del caso                                           |
				| @@CASO[ETIQUETAIMPORTANTE]@@ Texto: Indica las etiquetas importantes del caso                              |
				| @@CASO[CAMPOS]@@ Texto: Indica los campos del caso                                                         |
				| @@SERVICIO[CODIGO]@@Numérico: Indica el código de servicio                                                 |
				| @@SERVICIO[NOMBRE]@@Texto: Indica el nombre del servicio                                                   |
				| @@SERVICIO[TIPO]@@Numérico: Indica el tipo de servicio                                                     |
				| @@CHAT[CODIGO]@@Numérico: Indica el código de chat                                                         |

		@tc:7720
		Escenario: Supervisor ingresa al tipo de integracion "Mensaje marcado como leido por el agente"
			Dado un supervisor ingresa al tipo de integracion Mensaje marcado como leido por el agente
			Cuando seleccione la accion ejecutar un pedido http
			Entonces debera ver los siguientes comodines con sus descripciones:
				| @@FECHA@@Numérico: Indica la fecha y hora actual. Se enviará en formato Timestamp de UNIX con milisegundos |
				| @@AGENTE[CODIGO]@@Numérico: Indica el código de agente                                                     |
				| @@AGENTE[NOMBRE]@@Texto: Indica el nombre del agente                                                       |
				| @@AGENTE[USERNAME]@@Texto: Indica el nombre de usuario del agente                                          |
				| @@MENSAJE[CODIGO]@@Numérico: Indica el código de mensaje                                                   |
				| @@MENSAJE[VIM]@@Booleano: Indica si el mensaje es VIM                                                      |
				| @@MENSAJE[TEXTO]@@Texto: Indica el texto del mensaje                                                       |
				| @@MENSAJE[TEXTO:JSON]@@Texto: Indica el texto del mensaje con el texto seguro para incorporar en un JSON   |
				| @@MENSAJE[TEXTO:XML]@@Texto: Indica el texto del mensaje con el texto seguro para incorporar en un XML     |
				| @@MENSAJE[TIPO]@@ Texto: Indica el tipo de mensaje                                                         |
				| @@USUARIO[NOMBRE]@@Texto: Indica el nombre de usuario                                                      |
				| @@USUARIO[CODIGO]@@Numérico: Indica el código de usuario                                                   |
				| @@USUARIO[VIP]@@Booleano: Indica si el usuario de red social es VIP                                        |
				| @@USUARIO[TIPO]@@Numérico: Indica el código del tipo de servicio al que pertenece el usuario de red social |
				| @@USUARIO[DATOS]@@Texto: Indica los datos de negocio del usuario                                           |
				| @@USUARIO[EMAIL]@@ Tecto: Indica el email del usuario                                                      |
				| @@PERFIL[CODIGO]@@Numérico: Indica el código de perfil del usuario                                         |
				| @@PERFIL[CAMPOS]@@Objeto: Indica los campos extendidos del perfil del usuario                              |
				| @@PERFIL[NOMBRE]@@ Texto: Indica el nombre del usuario                                                     |
				| @@PERFIL[VIP]@@ Booleano: Indica si el perfil del usuario es VIP                                           |
				| @@PERFIL[EMAIL]@@ Texto: Indica el mail principal del perfil de usuario                                    |
				| @@PERFIL[DATOS]@@ Texto: Indica los datos de negocio del perfil de usuario                                 |
				| @@PERFIL[TELEFONO]@@ Texto: Indica el telefono del perfil de usuario                                       |
				| @@CASO[CODIGO]@@Numérico: Indica el código de caso                                                         |
				| @@CASO[ETIQUETAS]@@ Texto: Indica los codigos de etiqueta del caso (separados por coma)                    |
				| @@CASO[OBSERVACIONES]@@ Texto: Indica las observaciones del caso                                           |
				| @@CASO[ETIQUETAIMPORTANTE]@@ Texto: Indica las etiquetas importantes del caso                              |
				| @@CASO[CAMPOS]@@ Texto: Indica los campos del caso                                                         |
				| @@SERVICIO[CODIGO]@@Numérico: Indica el código de servicio                                                 |
				| @@SERVICIO[NOMBRE]@@Texto: Indica el nombre del servicio                                                   |
				| @@SERVICIO[TIPO]@@Numérico: Indica el tipo de servicio                                                     |
				| @@CHAT[CODIGO]@@Numérico: Indica el código de chat                                                         |

		@tc:7721
		Escenario: Supervisor ingresa al tipo de integracion "Mensaje respondido por el agente"
			Dado un supervisor ingresa al tipo de integracion Mensaje respondido por el agente
			Cuando seleccione la accion ejecutar un pedido http
			Entonces debera ver los siguientes comodines con sus descripciones:
				| @@FECHA@@Numérico: Indica la fecha y hora actual. Se enviará en formato Timestamp de UNIX con milisegundos |
				| @@AGENTE[CODIGO]@@Numérico: Indica el código de agente                                                     |
				| @@AGENTE[NOMBRE]@@Texto: Indica el nombre del agente                                                       |
				| @@AGENTE[USERNAME]@@Texto: Indica el nombre de usuario del agente                                          |
				| @@MENSAJE[CODIGO]@@Numérico: Indica el código de mensaje                                                   |
				| @@MENSAJE[VIM]@@Booleano: Indica si el mensaje es VIM                                                      |
				| @@MENSAJE[TEXTO]@@Texto: Indica el texto del mensaje                                                       |
				| @@MENSAJE[TEXTO:JSON]@@Texto: Indica el texto del mensaje con el texto seguro para incorporar en un JSON   |
				| @@MENSAJE[TEXTO:XML]@@Texto: Indica el texto del mensaje con el texto seguro para incorporar en un XML     |
				| @@MENSAJE[TIPO]@@ Texto: Indica el tipo de mensaje                                                         |
				| @@USUARIO[NOMBRE]@@Texto: Indica el nombre de usuario                                                      |
				| @@USUARIO[CODIGO]@@Numérico: Indica el código de usuario                                                   |
				| @@USUARIO[VIP]@@Booleano: Indica si el usuario de red social es VIP                                        |
				| @@USUARIO[TIPO]@@Numérico: Indica el código del tipo de servicio al que pertenece el usuario de red social |
				| @@USUARIO[DATOS]@@Texto: Indica los datos de negocio del usuario                                           |
				| @@USUARIO[EMAIL]@@ Tecto: Indica el email del usuario                                                      |
				| @@PERFIL[CODIGO]@@Numérico: Indica el código de perfil del usuario                                         |
				| @@PERFIL[CAMPOS]@@Objeto: Indica los campos extendidos del perfil del usuario                              |
				| @@PERFIL[NOMBRE]@@ Texto: Indica el nombre del usuario                                                     |
				| @@PERFIL[VIP]@@ Booleano: Indica si el perfil del usuario es VIP                                           |
				| @@PERFIL[EMAIL]@@ Texto: Indica el mail principal del perfil de usuario                                    |
				| @@PERFIL[DATOS]@@ Texto: Indica los datos de negocio del perfil de usuario                                 |
				| @@PERFIL[TELEFONO]@@ Texto: Indica el telefono del perfil de usuario                                       |
				| @@CASO[CODIGO]@@Numérico: Indica el código de caso                                                         |
				| @@CASO[ETIQUETAS]@@ Texto: Indica los codigos de etiqueta del caso (separados por coma)                    |
				| @@CASO[OBSERVACIONES]@@ Texto: Indica las observaciones del caso                                           |
				| @@CASO[ETIQUETAIMPORTANTE]@@ Texto: Indica las etiquetas importantes del caso                              |
				| @@CASO[CAMPOS]@@ Texto: Indica los campos del caso                                                         |
				| @@SERVICIO[CODIGO]@@Numérico: Indica el código de servicio                                                 |
				| @@SERVICIO[NOMBRE]@@Texto: Indica el nombre del servicio                                                   |
				| @@SERVICIO[TIPO]@@Numérico: Indica el tipo de servicio                                                     |
				| @@CHAT[CODIGO]@@Numérico: Indica el código de chat                                                         |

		@tc:7722
		Escenario: Supervisor ingresa al tipo de integracion "Mensaje se finalizo de leer por el agente"
			Dado un supervisor ingresa al tipo de integracion Mensaje se finalizo de leer por el agente
			Cuando seleccione la accion ejecutar un pedido http
			Entonces debera ver los siguientes comodines con sus descripciones:
				| @@FECHA@@Numérico: Indica la fecha y hora actual. Se enviará en formato Timestamp de UNIX con milisegundos |
				| @@AGENTE[CODIGO]@@Numérico: Indica el código de agente                                                     |
				| @@AGENTE[NOMBRE]@@Texto: Indica el nombre del agente                                                       |
				| @@AGENTE[USERNAME]@@Texto: Indica el nombre de usuario del agente                                          |
				| @@MENSAJE[CODIGO]@@Numérico: Indica el código de mensaje                                                   |
				| @@MENSAJE[VIM]@@Booleano: Indica si el mensaje es VIM                                                      |
				| @@MENSAJE[TEXTO]@@Texto: Indica el texto del mensaje                                                       |
				| @@MENSAJE[TEXTO:JSON]@@Texto: Indica el texto del mensaje con el texto seguro para incorporar en un JSON   |
				| @@MENSAJE[TEXTO:XML]@@Texto: Indica el texto del mensaje con el texto seguro para incorporar en un XML     |
				| @@MENSAJE[TIPO]@@ Texto: Indica el tipo de mensaje                                                         |
				| @@USUARIO[NOMBRE]@@Texto: Indica el nombre de usuario                                                      |
				| @@USUARIO[CODIGO]@@Numérico: Indica el código de usuario                                                   |
				| @@USUARIO[VIP]@@Booleano: Indica si el usuario de red social es VIP                                        |
				| @@USUARIO[TIPO]@@Numérico: Indica el código del tipo de servicio al que pertenece el usuario de red social |
				| @@USUARIO[DATOS]@@Texto: Indica los datos de negocio del usuario                                           |
				| @@USUARIO[EMAIL]@@ Tecto: Indica el email del usuario                                                      |
				| @@PERFIL[CODIGO]@@Numérico: Indica el código de perfil del usuario                                         |
				| @@PERFIL[CAMPOS]@@Objeto: Indica los campos extendidos del perfil del usuario                              |
				| @@PERFIL[NOMBRE]@@ Texto: Indica el nombre del usuario                                                     |
				| @@PERFIL[VIP]@@ Booleano: Indica si el perfil del usuario es VIP                                           |
				| @@PERFIL[EMAIL]@@ Texto: Indica el mail principal del perfil de usuario                                    |
				| @@PERFIL[DATOS]@@ Texto: Indica los datos de negocio del perfil de usuario                                 |
				| @@PERFIL[TELEFONO]@@ Texto: Indica el telefono del perfil de usuario                                       |
				| @@CASO[CODIGO]@@Numérico: Indica el código de caso                                                         |
				| @@CASO[ETIQUETAS]@@ Texto: Indica los codigos de etiqueta del caso (separados por coma)                    |
				| @@CASO[OBSERVACIONES]@@ Texto: Indica las observaciones del caso                                           |
				| @@CASO[ETIQUETAIMPORTANTE]@@ Texto: Indica las etiquetas importantes del caso                              |
				| @@CASO[CAMPOS]@@ Texto: Indica los campos del caso                                                         |
				| @@SERVICIO[CODIGO]@@Numérico: Indica el código de servicio                                                 |
				| @@SERVICIO[NOMBRE]@@Texto: Indica el nombre del servicio                                                   |
				| @@SERVICIO[TIPO]@@Numérico: Indica el tipo de servicio                                                     |
				| @@CHAT[CODIGO]@@Numérico: Indica el código de chat                                                         |

		@tc:7724
		Escenario: Supervisor ingresa al tipo de integracion "Nuevo mensaje asignado al Agente"
			Dado un supervisor ingresa al tipo de integracion Nuevo mensaje asignado al Agente
			Cuando seleccione la accion ejecutar un pedido http
			Entonces debera ver los siguientes comodines con sus descripciones:
				| @@FECHA@@Numérico: Indica la fecha y hora actual. Se enviará en formato Timestamp de UNIX con milisegundos |
				| @@AGENTE[CODIGO]@@Numérico: Indica el código de agente                                                     |
				| @@AGENTE[NOMBRE]@@Texto: Indica el nombre del agente                                                       |
				| @@AGENTE[USERNAME]@@Texto: Indica el nombre de usuario del agente                                          |
				| @@MENSAJE[CODIGO]@@Numérico: Indica el código de mensaje                                                   |
				| @@MENSAJE[VIM]@@Booleano: Indica si el mensaje es VIM                                                      |
				| @@MENSAJE[TEXTO]@@Texto: Indica el texto del mensaje                                                       |
				| @@MENSAJE[TEXTO:JSON]@@Texto: Indica el texto del mensaje con el texto seguro para incorporar en un JSON   |
				| @@MENSAJE[TEXTO:XML]@@Texto: Indica el texto del mensaje con el texto seguro para incorporar en un XML     |
				| @@MENSAJE[TIPO]@@ Texto: Indica el tipo de mensaje                                                         |
				| @@USUARIO[NOMBRE]@@Texto: Indica el nombre de usuario                                                      |
				| @@USUARIO[CODIGO]@@Numérico: Indica el código de usuario                                                   |
				| @@USUARIO[VIP]@@Booleano: Indica si el usuario de red social es VIP                                        |
				| @@USUARIO[TIPO]@@Numérico: Indica el código del tipo de servicio al que pertenece el usuario de red social |
				| @@USUARIO[DATOS]@@Texto: Indica los datos de negocio del usuario                                           |
				| @@USUARIO[EMAIL]@@ Tecto: Indica el email del usuario                                                      |
				| @@PERFIL[CODIGO]@@Numérico: Indica el código de perfil del usuario                                         |
				| @@PERFIL[CAMPOS]@@Objeto: Indica los campos extendidos del perfil del usuario                              |
				| @@PERFIL[NOMBRE]@@ Texto: Indica el nombre del usuario                                                     |
				| @@PERFIL[VIP]@@ Booleano: Indica si el perfil del usuario es VIP                                           |
				| @@PERFIL[EMAIL]@@ Texto: Indica el mail principal del perfil de usuario                                    |
				| @@PERFIL[DATOS]@@ Texto: Indica los datos de negocio del perfil de usuario                                 |
				| @@PERFIL[TELEFONO]@@ Texto: Indica el telefono del perfil de usuario                                       |
				| @@CASO[CODIGO]@@Numérico: Indica el código de caso                                                         |
				| @@CASO[ETIQUETAS]@@ Texto: Indica los codigos de etiqueta del caso (separados por coma)                    |
				| @@CASO[OBSERVACIONES]@@ Texto: Indica las observaciones del caso                                           |
				| @@CASO[ETIQUETAIMPORTANTE]@@ Texto: Indica las etiquetas importantes del caso                              |
				| @@CASO[CAPOS]@@ Texto: Indica los campos del caso                                                          |
				| @@SERVICIO[CODIGO]@@Numérico: Indica el código de servicio                                                 |
				| @@SERVICIO[NOMBRE]@@Texto: Indica el nombre del servicio                                                   |
				| @@SERVICIO[TIPO]@@Numérico: Indica el tipo de servicio                                                     |
				| @@CHAT[CODIGO]@@Numérico: Indica el código de chat                                                         |

		@tc:7730
		Escenario: Supervisor ingresa al tipo de integracion "Configuracion de iFrame en el panel de informacion del perfil de usuario"
			Dado un supervisor ingresa al tipo de integracion Configuracion de iFrame en el panel de informacion del perfil de usuario
			Cuando vea las url a invocar
			Entonces debera ver los siguientes comodines con sus descripciones:
				| @@FECHA@@Numérico: Indica la fecha y hora actual. Se enviará en formato Timestamp de UNIX con milisegundos |
				| @@EVENTO@@Numérico: Indica el tipo de evento que se está enviando                                          |
				| @@MENSAJE[CODIGO]@@Numérico: Indica el código de mensaje                                                   |
				| @@MENSAJE[TEXTO]@@ Texto: Indica el texto del mensaje                                                      |
				| @@MENSAJE[TEXTO:JSON]@@ Texto: Indica el tecto del mensaje con el texto seguro para incorporar en un json  |
				| @@MENSAJE[TEXTO:XML]@@ Texto: Indica el tecto del mensaje con el texto seguro para incorporar en un XML    |
				| @@MENSAJE[VIM]@@ Numerico: Indica si el mensaje es VIM                                                     |
				| @@MENSAJE[TIPO]@@ Texto: Indica el tipo de mensaje                                                         |
				| @@AGENTE[CODIGO]@@Numérico: Indica el código de agente                                                     |
				| @@AGENTE[NOMBRE]@@ Texto: Indica el nombre del agente                                                      |
				| @@AGENTE[USERNAME]@@ Texto: Indica el nombre de usuario del agente                                         |
				| @@CASO[CODIGO]@@Numérico: Indica el código de caso                                                         |
				| @@CASO[ETIQUETAS]@@ Texto: Indica los codigos de etiqueta del caso (separados por coma)                    |
				| @@CASO[OBSERVACIONES]@@ Texto: Indica las observaciones del caso                                           |
				| @@CASO[ETIQUETAIMPORTANTE]@@ Texto: Indica las etiquetas importantes del caso                              |
				| @@CASO[CAMPOS]@@ Texto: Indica los campos del caso                                                         |
				| @@SERVICIO[CODIGO]@@Numérico: Indica el código de servicio                                                 |
				| @@SERVICIO[NOMBRE]@@Texto: Indica el nombre del servicio                                                   |
				| @@SERVICIO[TIPO]@@ Numerico: Indica el tipo de servicio                                                    |
				| @@USUARIO[NOMBRE]@@Texto: Indica el nombre de usuario                                                      |
				| @@USUARIO[CODIGO]@@Numérico: Indica el código de usuario                                                   |
				| @@USUARIO[VIP]@@Booleano: Indica si el usuario de red social es VIP                                        |
				| @@USUARIO[TIPO]@@Numérico: Indica el código del tipo de servicio al que pertenece el usuario de red social |
				| @@USUARIO[DATOS]@@Texto: Indica los datos de negocio del usuario                                           |
				| @@UUSUARIO[EMAIL]@@ Texto: Indica el mail del usuario                                                      |
				| @@PERFIL[CODIGO]@@Numérico: Indica el código de perfil del usuario                                         |
				| @@PERFIL[NOMBRE]@@Texto: Indica el nombre de perfil del usuario                                            |
				| @@PERFIL[VIP]@@Booleano: Indica si el perfil del usuario es VIP                                            |
				| @@PERFIL[EMAIL]@@Texto: Indica el mail principal del perfil de usuario                                     |
				| @@PERFIL[DATOS]@@Texto: Indica los datos de negocio del perfil de usuario                                  |
				| @@PERFIL[TELEFONO]@@ Texto: Indica el telefono del perfil de usuario                                       |

		@tc:7731
		Escenario: Supervisor ingresa al tipo de integracion "Configuracion de iFrame en el modal de informacion del perfil de usuario"
			Dado un supervisor ingresa al tipo de integracion Configuracion de iFrame en el modal de informacion del perfil de usuario
			Cuando vea las url a invocar
			Entonces debera ver los siguientes comodines con sus descripciones:
				| @@FECHA@@Numérico: Indica la fecha y hora actual. Se enviará en formato Timestamp de UNIX con milisegundos |
				| @@EVENTO@@Numérico: Indica el tipo de evento que se está enviando                                          |
				| @@AGENTE[CODIGO]@@Numérico: Indica el código de agente                                                     |
				| @@AGENTE[NOMBRE]@@Texto: Indica el nombre del agente                                                       |
				| @@AGENTE[USERNAME]@@Texto: Indica el nombre de usuario del agente                                          |
				| @@PERFIL[CODIGO]@@Numérico: Indica el código de perfil del usuario                                         |
				| @@PERFIL[NOMBRE]@@Texto: Indica el nombre de perfil del usuario                                            |
				| @@PERFIL[VIP]@@Booleano: Indica si el perfil del usuario es VIP                                            |
				| @@PERFIL[EMAIL]@@Texto: Indica el mail principal del perfil de usuario                                     |
				| @@PERFIL[DATOS]@@Texto: Indica los datos de negocio del perfil de usuario                                  |
				| @@PERFIL[TELEFONO]@@Texto: Indica el telefono del perfil del usuario                                       |

		@tc:7732
		Escenario: Supervisor ingresa al tipo de integracion "Configuración de iFrame en el panel de información del caso"
			Dado un supervisor ingresa al tipo de integracion Configuración de iFrame en el panel de información del caso
			Cuando vea las url a invocar
			Entonces debera ver los siguientes comodines con sus descripciones:
				| @@FECHA@@Numérico: Indica la fecha y hora actual. Se enviará en formato Timestamp de UNIX con milisegundos |
				| @@EVENTO@@Numérico: Indica el tipo de evento que se está enviando                                          |
				| @@AGENTE[CODIGO]@@Numérico: Indica el código de agente                                                     |
				| @@AGENTE[NOMBRE]@@Texto: Indica el nombre del agente                                                       |
				| @@AGENTE[USERNAME]@@Texto: Indica el nombre del usuario del agente                                         |
				| @@CASO[CODIGO]@@Numérico: Indica el código de caso                                                         |
				| @@CASO[ETIQUETAS]@@Texto: Indica los codigos de etiqueta del caso (separados por coma)                     |
				| @@CASO[OBSERVACIONES]@@Texto: Indica las observaciones del caso                                            |
				| @@CASO[ETIQUETAIMPORTANTE]@@Texto: Indica las etiquetas importantes del caso                               |
				| @@CASO[CAMPOS]@@Texto: Indica los campos del caso                                                          |
				| @@PERFIL[CODIGO]@@Numérico: Indica el código de perfil del usuario                                         |
				| @@PERFIL[NOMBRE]@@Texto: Indica el nombre de perfil del usuario                                            |
				| @@PERFIL[VIP]@@Booleano: Indica si el perfil del usuario es VIP                                            |
				| @@PERFIL[EMAIL]@@Texto: Indica el mail principal del perfil de usuario                                     |
				| @@PERFIL[DATOS]@@Texto: Indica los datos de negocio del perfil de usuario                                  |
				| @@PERFIL[TELEFONO]@@Texto: Indica el telefono del perfil de usuario                                        |
		
		@tc:7733
		Escenario: Supervisor ingresa al tipo de integracion "Configuracion de iFrame en el modal de informacion del caso"
			Dado un supervisor ingresa al tipo de integracion Configuracion de iFrame en el modal de informacion del caso
			Cuando vea las url a invocar
			Entonces debera ver los siguientes comodines con sus descripciones:
				| @@FECHA@@Numérico: Indica la fecha y hora actual. Se enviará en formato Timestamp de UNIX con milisegundos |
				| @@EVENTO@@Numérico: Indica el tipo de evento que se está enviando                                          |
				| @@AGENTE[CODIGO]@@Numérico: Indica el código de agente                                                     |
				| @@AGENTE[NOMBRE]@@Texto: Indica el nombre del agente                                                       |
				| @@AGENTE[USERNAME]@@Texto: Indica el nombre del usuario del agente                                         |
				| @@CASO[CODIGO]@@Numérico: Indica el código de caso                                                         |
				| @@CASO[ETIQUETAS]@@Texto: Indica los codigos de etiqueta del caso (separados por coma)                     |
				| @@CASO[OBSERVACIONES]@@Texto: Indica las observaciones del caso                                            |
				| @@CASO[ETIQUETAIMPORTANTE]@@Texto: Indica las etiquetas importantes del caso                               |
				| @@CASO[CAMPOS]@@Texto: Indica los campos del caso                                                          |
				| @@PERFIL[CODIGO]@@Numérico: Indica el código de perfil del usuario                                         |
				| @@PERFIL[NOMBRE]@@Texto: Indica el nombre de perfil del usuario                                            |
				| @@PERFIL[VIP]@@Booleano: Indica si el perfil del usuario es VIP                                            |
				| @@PERFIL[EMAIL]@@Texto: Indica el mail principal del perfil de usuario                                     |
				| @@PERFIL[DATOS]@@Texto: Indica los datos de negocio del perfil de usuario                                  |
				| @@PERFIL[TELEFONO]@@Texto: Indica el telefono del perfil de usuario                                        |
		