#language: es 
@us:4372
Característica: Casillas favoritas de un servicio de mail
	Se desea tener una lista de casillas favoritas, para que los agentes al momento de mandar un mail puedan escribir solo unas letras de la casilla y les sea sugerida.
	Así de esta manera no tienen que escribir la casilla completa.

	Regla de negocio: La lista se configura en cada servicio y no es compartida con otros servicios de chat.
		
		@tc:5269
		Escenario: supervisor agrega casillas favoritas a un servicio de mail
			Dado que Sandra es una supervisora que se encuentra en la pestaña "Otras Configuraciones" del sevicio de mail "-QA · Frank Reynolds Mail-"
			Cuando ingresa la siguiente lista de casillas en el campo "Mails favoritos":
				"""
				casilla_global01@dominio.com,yoizenA@mail.es,Reynolds@YOIZEN.com
				"""
			Y guarda cambios
			Entonces la web regresara a la lista de servicios
			Y la lista de casillas debe quedar guardada en el campo "Mails favoritos"

		@tc:5270
		Escenario: no se permite guardar cambios del servicio por tener datos invalidos en el campo "Mails favoritos"
			Dado que Sandra es una supervisora que se encuentra en la pestaña "Otras Configuraciones" del sevicio de mail "-QA · Frank Reynolds Mail-"
			Y que ingreso en el campo "Mails favoritos" los siguientes datos:
				"""
				casilla_global01@dominio.com,casilla.dominio.com
				"""
			Cuando intenta guardar cambios
			Entonces se interrumpira el guardado de la edicion del servicio
			Y se mostrara una alerta junto al campo indicando que posee una configuracion invalida

	Regla de negocio: el agente puede hacer uso de las casillas favoritas al tener que completar el campo de destinatario/cc/cco

#		Esquema del escenario: agente selecciona una casilla favorita en CC/CCO al responder un mensaje asignado
#			Dado que Adrian es un agente que posee asignado un mensaje del servicio de mail "-QA · Frank Reynolds Mail-"
#			Y que el servicio posee configurado las siguientes casillas favoritas
#				| casillas favoritas             |
#				| casilla_global0101@dominio.com |
#				| yoizenA@mail.ar                |
#				| Reynolds@YOIZEN.com            | 
#			Cuando Adrian habilita el campo "<@campoAgregado>"
#			E ingresa en el mismo "<@inputDeAgente>"
#			Entonces en las sugerencias debe aparecer la/s siguiente/s casilla/s: <@casillasSugeridas>
#			Y al seleccionarla debe quedar agregada al campo
#
#			Ejemplos: Agente utiliza campo CC
#				| @campoAgregado | @inputDeAgente | @casillasSugeridas                    |
#				| CC             | yoizen         | yoizenA@mail.ar y Reynolds@YOIZEN.com |
#				| CC             | _glob          | casilla_global0101@dominio.com        |
#				| CC             | 0101           | casilla_global0101@dominio.com        |
#
#			Ejemplos: Agente utiliza campo CCO
#				| @campoAgregado | @inputDeAgente | @casillasSugeridas                    |
#				| CCO            | yoizen         | yoizenA@mail.ar y Reynolds@YOIZEN.com |
#				| CCO            | _glob          | casilla_global0101@dominio.com        |
#				| CCO            | 0101           | casilla_global0101@dominio.com        |
#
#		Esquema del escenario: agente selecciona una casilla favorita en destinatario al reenviar un mensaje asignado
#			Dado que Adrian es un agente que posee asignado un mensaje del servicio de mail "-QA · Frank Reynolds Mail-"
#			Y selecciono la opcion "Reenviar mensaje" 
#			Y que el servicio posee configurado las siguientes casillas favoritas
#				| casillas favoritas             |
#				| casilla_global0101@dominio.com |
#				| yoizenA@mail.ar                |
#				| Reynolds@YOIZEN.com            | 
#
#
#		Esquema del escenario: agente selecciona una casilla favorita en CC/CCO al reenviar un mensaje asignado
#			Dado que Adrian es un agente que posee asignado un mensaje del servicio de mail "-QA · Frank Reynolds Mail-"
#			Y selecciono la opcion "Reenviar mensaje" 
#			Y que el servicio posee configurado las siguientes casillas favoritas
#				| casillas favoritas             |
#				| casilla_global0101@dominio.com |
#				| yoizenA@mail.ar                |
#				| Reynolds@YOIZEN.com            | 
#			Cuando Adrian habilita el campo "<@campoAgregado>" en la seccion de reenvio
#			E ingresa en el mismo "<@inputDeAgente>" 
#			Entonces en las sugerencias debe aparecer la/s siguiente/s casilla/s: <@casillasSugeridas>
#			Y al seleccionarla debe quedar agregada al campo
#
#			Ejemplos: Agente utiliza campo CC
#				| @campoAgregado | @inputDeAgente | @casillasSugeridas                    |
#				| CC             | yoizen         | yoizenA@mail.ar y Reynolds@YOIZEN.com |
#				| CC             | _glob          | casilla_global0101@dominio.com        |
#				| CC             | 0101           | casilla_global0101@dominio.com        |
#
#			Ejemplos: Agente utiliza campo CCO
#				| @campoAgregado | @inputDeAgente | @casillasSugeridas                    |
#				| CCO            | yoizen         | yoizenA@mail.ar y Reynolds@YOIZEN.com |
#				| CCO            | _glob          | casilla_global0101@dominio.com        |
#				| CCO            | 0101           | casilla_global0101@dominio.com        |
#
#		Esquema del escenario: agente selecciona una casilla favorita en destinatario de modal Generar Saliente
#			Dado que Adrian es un agente que posee asignado un mensaje del servicio de mail "-QA · Frank Reynolds Mail-"
#			Y que el servicio posee configurado las siguientes casillas favoritas
#				| casillas favoritas             |
#				| casilla_global0101@dominio.com |
#				| yoizenA@mail.ar                |
#				| Reynolds@YOIZEN.com            |
#			Cuando Adrian seleeciona la opcion "Generar Saliente"
#			E ingresa en el campo del destinatario "<@inputDeAgente>"
#			Entonces en las sugerencias debe aparecer la/s siguiente/s casilla/s: <@casillasSugeridas>
#			Y al seleccionarla debe quedar agregada al campo
#
#			Ejemplos: 
#				| @inputDeAgente | @casillasSugeridas                    |
#				| yoizen         | yoizenA@mail.ar y Reynolds@YOIZEN.com |
#				| _glob          | casilla_global0101@dominio.com        |
#				| 0101           | casilla_global0101@dominio.com        |
#
#		Esquema del escenario: agente selecciona una casilla favorita en CC/CCO de modal Generar Saliente
#			Dado que Adrian es un agente que ingreso al modal de "Generar Saliente" a partir de un mensaje asignado del servicio de mail "-QA · Frank Reynolds Mail-"
#			Y que el servicio posee configurado las siguientes casillas favoritas
#				| casillas favoritas             |
#				| casilla_global0101@dominio.com |
#				| yoizenA@mail.ar                |
#				| Reynolds@YOIZEN.com            |
#			Cuando Adrian habilita el campo "<@campoAgregado>"
#			E ingresa en el mismo "<@inputDeAgente>"
#			Entonces en las sugerencias debe aparecer la/s siguiente/s casilla/s: <@casillasSugeridas>
#			Y al seleccionarla debe quedar agregada al campo
#
#			Ejemplos: Agente utiliza campo CC
#				| @campoAgregado | @inputDeAgente | @casillasSugeridas                    |
#				| CC             | yoizen         | yoizenA@mail.ar y Reynolds@YOIZEN.com |
#				| CC             | _glob          | casilla_global0101@dominio.com        |
#				| CC             | 0101           | casilla_global0101@dominio.com        |
#
#			Ejemplos: Agente utiliza campo CCO
#				| @campoAgregado | @inputDeAgente | @casillasSugeridas                    |
#				| CCO            | yoizen         | yoizenA@mail.ar y Reynolds@YOIZEN.com |
#				| CCO            | _glob          | casilla_global0101@dominio.com        |
#				| CCO            | 0101           | casilla_global0101@dominio.com        |

		@tc:5399
		Esquema del escenario: agente selecciona una casilla favorita
			Dado el servicio "-QA · Frank Reynolds Mail-" que posee configurado las siguientes casillas favoritas
				| casillas favoritas             |
				| casilla_global0101@dominio.com |
				| yoizenA@mail.ar                |
				| Reynolds@YOIZEN.com            |
			Y que Adrian es un agente que se encuentra posicionado en la pantalla de <@vistaDelAgente>
			Y que el servicio que gestionara el mensaje es "-QA · Frank Reynolds Mail-"
			Cuando intenta ingresar en el campo <@campoDeInput> el siguiente texto: <@inputDeAgente>
			Entonces en las sugerencias debe aparecer la/s siguiente/s casilla/s: <@casillasSugeridas>
			Y al seleccionar una debe quedar agregada al campo

			Ejemplos: Desde un mensaje asignado
				| @vistaDelAgente     | @campoDeInput | @inputDeAgente | @casillasSugeridas                    |
				| un mensaje asignado | CC            | yoizen         | yoizenA@mail.ar y Reynolds@YOIZEN.com |
				| un mensaje asignado | CC            | _glob          | casilla_global0101@dominio.com        |
				| un mensaje asignado | CC            | 0101           | casilla_global0101@dominio.com        |
				| un mensaje asignado | CCO           | yoizen         | yoizenA@mail.ar y Reynolds@YOIZEN.com |
				| un mensaje asignado | CCO           | _glob          | casilla_global0101@dominio.com        |
				| un mensaje asignado | CCO           | 0101           | casilla_global0101@dominio.com        |

			Ejemplos: Desde "Reenviar mensaje" de un mensaje asignado
				| @vistaDelAgente                | @campoDeInput | @inputDeAgente | @casillasSugeridas                    |
				| reenvio de un mensaje asignado | Para          | yoizen         | yoizenA@mail.ar y Reynolds@YOIZEN.com |
				| reenvio de un mensaje asignado | Para          | _glob          | casilla_global0101@dominio.com        |
				| reenvio de un mensaje asignado | Para          | 0101           | casilla_global0101@dominio.com        |
				| reenvio de un mensaje asignado | CC            | yoizen         | yoizenA@mail.ar y Reynolds@YOIZEN.com |
				| reenvio de un mensaje asignado | CC            | _glob          | casilla_global0101@dominio.com        |
				| reenvio de un mensaje asignado | CC            | 0101           | casilla_global0101@dominio.com        |
				| reenvio de un mensaje asignado | CCO           | yoizen         | yoizenA@mail.ar y Reynolds@YOIZEN.com |
				| reenvio de un mensaje asignado | CCO           | _glob          | casilla_global0101@dominio.com        |
				| reenvio de un mensaje asignado | CCO           | 0101           | casilla_global0101@dominio.com        |

			Ejemplos: Desde el modal de "Generar Salientes"
				| @vistaDelAgente                                               | @campoDeInput | @inputDeAgente | @casillasSugeridas                    |
				| modal de mail de "Generar Saliente" desde un mensaje asignado | Para          | yoizen         | yoizenA@mail.ar y Reynolds@YOIZEN.com |
				| modal de mail de "Generar Saliente" desde un mensaje asignado | Para          | _glob          | casilla_global0101@dominio.com        |
				| modal de mail de "Generar Saliente" desde un mensaje asignado | Para          | 0101           | casilla_global0101@dominio.com        |
				| modal de mail de "Generar Saliente" desde un mensaje asignado | CC            | yoizen         | yoizenA@mail.ar y Reynolds@YOIZEN.com |
				| modal de mail de "Generar Saliente" desde un mensaje asignado | CC            | _glob          | casilla_global0101@dominio.com        |
				| modal de mail de "Generar Saliente" desde un mensaje asignado | CC            | 0101           | casilla_global0101@dominio.com        |
				| modal de mail de "Generar Saliente" desde un mensaje asignado | CCO           | yoizen         | yoizenA@mail.ar y Reynolds@YOIZEN.com |
				| modal de mail de "Generar Saliente" desde un mensaje asignado | CCO           | _glob          | casilla_global0101@dominio.com        |
				| modal de mail de "Generar Saliente" desde un mensaje asignado | CCO           | 0101           | casilla_global0101@dominio.com        |

			Ejemplos: Desde "Mensajes Salientes"
				| @vistaDelAgente                       | @campoDeInput | @inputDeAgente | @casillasSugeridas                    |
				| modal de mail de "Mensajes Salientes" | Para          | yoizen         | yoizenA@mail.ar y Reynolds@YOIZEN.com |
				| modal de mail de "Mensajes Salientes" | Para          | _glob          | casilla_global0101@dominio.com        |
				| modal de mail de "Mensajes Salientes" | Para          | 0101           | casilla_global0101@dominio.com        |
				| modal de mail de "Mensajes Salientes" | CC            | yoizen         | yoizenA@mail.ar y Reynolds@YOIZEN.com |
				| modal de mail de "Mensajes Salientes" | CC            | _glob          | casilla_global0101@dominio.com        |
				| modal de mail de "Mensajes Salientes" | CC            | 0101           | casilla_global0101@dominio.com        |
				| modal de mail de "Mensajes Salientes" | CCO           | yoizen         | yoizenA@mail.ar y Reynolds@YOIZEN.com |
				| modal de mail de "Mensajes Salientes" | CCO           | _glob          | casilla_global0101@dominio.com        |
				| modal de mail de "Mensajes Salientes" | CCO           | 0101           | casilla_global0101@dominio.com        |

			Ejemplos: Desde "Busqueda de casos"
				| @vistaDelAgente                                        | @campoDeInput | @inputDeAgente | @casillasSugeridas                    |
				| agregar un mensaje a un caso desde "Busqueda de Casos" | CC            | yoizen         | yoizenA@mail.ar y Reynolds@YOIZEN.com |
				| agregar un mensaje a un caso desde "Busqueda de Casos" | CC            | _glob          | casilla_global0101@dominio.com        |
				| agregar un mensaje a un caso desde "Busqueda de Casos" | CC            | 0101           | casilla_global0101@dominio.com        |
				| agregar un mensaje a un caso desde "Busqueda de Casos" | CCO           | yoizen         | yoizenA@mail.ar y Reynolds@YOIZEN.com |
				| agregar un mensaje a un caso desde "Busqueda de Casos" | CCO           | _glob          | casilla_global0101@dominio.com        |
				| agregar un mensaje a un caso desde "Busqueda de Casos" | CCO           | 0101           | casilla_global0101@dominio.com        |

			Ejemplos: Desde "Mis casos pendientes"
				| @vistaDelAgente                                           | @campoDeInput | @inputDeAgente | @casillasSugeridas                    |
				| agregar un mensaje a un caso desde "Mis casos pendientes" | CC            | yoizen         | yoizenA@mail.ar y Reynolds@YOIZEN.com |
				| agregar un mensaje a un caso desde "Mis casos pendientes" | CC            | _glob          | casilla_global0101@dominio.com        |
				| agregar un mensaje a un caso desde "Mis casos pendientes" | CC            | 0101           | casilla_global0101@dominio.com        |
				| agregar un mensaje a un caso desde "Mis casos pendientes" | CCO           | yoizen         | yoizenA@mail.ar y Reynolds@YOIZEN.com |
				| agregar un mensaje a un caso desde "Mis casos pendientes" | CCO           | _glob          | casilla_global0101@dominio.com        |
				| agregar un mensaje a un caso desde "Mis casos pendientes" | CCO           | 0101           | casilla_global0101@dominio.com        |

		@tc:5401
		Escenario: una casilla favorita de un servicio no aparecera como sugerencia en otro servicio
			Dado el servicio "-QA · Frank Reynolds Mail-" que posee configurado las siguientes casillas favoritas
				| casillas favoritas             |
				| casilla_global0101@dominio.com |
				| yoizenA@mail.ar                |
				| Reynolds@YOIZEN.com            |
			Y el servicio -QA · Itchy&Scratchy Mail- que posee configura las siguientes casillas favoritas
				| casillas favoritas             |
				| Itchy@YOIZEN.com               |
			Y que Adrian es un agente que se encuentra posicionado en la pantalla de un mensaje asignado del servicio "-QA · Itchy&Scratchy Mail-"
			Cuando intenta ingresar en el campo CC el texto "yoizen"
			Entonces en las sugerencias debe aparecer la casilla "Itchy@YOIZEN.com"
			Y no debe estar presente la casilla "Reynolds@YOIZEN.com"