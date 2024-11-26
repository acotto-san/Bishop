#language: es
Característica: Configurar los canales Públicos en AXP
	Se incorporan los canales públicos al portal. Éstos no pasaran por el bot.
	En el widget de la conversación aparecerá una indicación de canal público/privado. 
	Si el mensaje es público se verá una sola respuesta (no el histórico). Si el mensaje es privado, el agente verá el histórico del caso.


	Regla: ingresa un mensaje publico a la web del agente

		@tc:7863 
		Esquema del escenario: Mensaje entrante de un canal público
			Dado un servicio de <tipo de servicio> 
			Cuando un usuario escribe un mensaje publico
			Entonces el agente recibe el entrante

			Ejemplos: 
				| tipo de servicio |
				| instagram        |
				| facebook         |
				| twitter          |

	Regla:Los canales públicos no pasaran por el bot

		@tc:7864
		Esquema del escenario: usuario envia mensaje publico y no interactua con el bot
			Dado un servicio de <tipo de servicio> con yflow asociado
			Cuando un usuario escribe un mensaje <tipo de mensaje>
			Entonces <resultado obtenido>

			Ejemplos: de facebook
			| tipo de servicio | tipo de mensaje | resultado obtenido                            |
			| facebook         | publico         | sera derivado a agente                        |
			| facebook         | privado         | interactuara con el bot y luego sera derivado |

			Ejemplos: de instagram
			| tipo de servicio | tipo de mensaje | resultado obtenido                            |
			| instagram        | publico         | sera derivado a agente                        |
			| instagram        | privado         | interactuara con el bot y luego sera derivado |

			Ejemplos: de twitter
			| tipo de servicio | tipo de mensaje | resultado obtenido                            |
			| twitter          | publico         | sera derivado a agente                        |
			| twitter          | privado         | interactuara con el bot y luego sera derivado |

	Regla: El agente puede responder a un mensaje público

		@tc:7865 
		Esquema del escenario: agente responde a mensaje público y mensaje continúa asignado
			Dado que se le asigna un mensaje publico del servicio de <tipo de servicio>
			Cuando el agente responde a ese mensaje
			Entonces el usuario recibe la respuesta
			Y la pareja entrante-saliente sigue en pantalla del agente 

			Ejemplos: 
					| tipo de servicio |
					| instagram        |
					| facebook         |
					| twitter          |

		@tc:8256
		Escenario: al responder el mensaje público el agente no puede escribir más mensajes
			Dada la web del agente AXP visualizando un caso iniciado por un mensaje público
			Y el agente redacto un mensaje de respuesta en el textarea
			Cuando confirme el envio del mensaje
			Entonces el textarea dejara de estar presente

		@tc:8257
		Escenario: al responder un público el caso sigue abierto
			Dado un mensaje entrante que fue derivado por gateway al agente AXP
			Cuando el agente responde el mensaje público
			Entonces el caso seguira abierto

		@tc:8258
		Esquema del escenario: agente tiene asignado un público y se le asigna un nuevo entrante
			Dada la web del agente AXP visualizando un caso iniciado por un mensaje público
			Y la conversacion tiene una respuesta del agente
			Cuando un nuevo mensaje entrante público ingrese
			Entonces el mensaje nuevo creara un nuevo caso


	Regla: Las asignaciones públicas son separadas a las asignaciones privadas del mismo canal
		
		@tc:8259
		Escenario: Luego de responder un mensaje público se asigna un privado
			Dado que un mensaje publico y un privado de un mismo canal fueron asignados a un agente
			Y el agente esta visualizando solo el público
			Cuando responde el mensaje
			Entonces se deshabilita el textarea
			Y se agrega la respuesta al cuerpo de la conversacion
			Y queda el caso del mensaje privado para continuar en otra asignacion


		#se dejan comentados los tcs 8260 y 8261 ya que se modificó el comportamiento
		#antes si un usuario mandaba un mensaje por vía pública y via privada, el agente recibía primero el caso público y luego de responder se renderizaba 
		#el mismo caso y se unificaba el privado. Así de forma viceversa.
		#Ahora cada vía tiene su caso por separado.
#		@tc:8260
#		Esquema del escenario: Agente con 2 mensajes de diferentes vías responde al primer mensaje
#			Dado que a un agente de AXP se le asigna un mensaje <via primer mensaje> y uno <via segundo mensaje>
#			Y tiene en pantalla el primero de los mensajes
#			Cuando responde
#			Entonces la respuesta se enviara por la via <via primer mensaje>
#
#			Ejemplos: 
#				| via primer mensaje | via segundo mensaje |
#				| privado            | privada             |
#				| publico            | privado             |
#
#		@tc:8261
#		Esquema del escenario: Agente con 2 mensajes de diferentes vías responde al segundo mensaje
#			Dado que a un agente de AXP se le asigna un mensaje <via primer mensaje> y uno <via segundo mensaje>
#			Y respondio al primer mensaje
#			Y paso a tener en pantalla al segundo mensaje
#			Cuando responde 
#			Entonces la respuesta se enviara por la via <via primer mensaje>
#
#			Ejemplos: 
#				| via primer mensaje | via segundo mensaje |
#				| privado            | publico             |
#				| publico            | privado             |

		@tc:9209
		Escenario: un usuario envia un mensaje público y uno privado al mismo canal
			Dado que un usuario envia un mensaje publico de facebook
			Y el agente recibe el caso publico en su casilla
			Cuando el mismo usuario envia un mensaje privado de messenger al mismo servicio de fb
			Entonces el agente debera recibir un caso nuevo privado


	Regla: En el widget existe una indicación de canal público o privado

		@tc:7866 
		Esquema del escenario: se visualiza el tipo de canal en el widget 
			Dado que se asigna un mensaje <tipo de mensaje> de <tipo de servicio>
			Cuando el agente atiende ese mensaje
			Entonces visualiza el marcador de mensaje <tipo de mensaje>

			Ejemplos: 
			| tipo de servicio | tipo de mensaje |
			| facebook         | publico         |
			| facebook         | privado         |
			| instagram        | publico         |
			| instagram        | privado         |
			| twitter          | publico         |
			| twitter          | privado         |

	Regla: si el mensaje entrante es público el agente solo verá una sola respuesta (no el histórico).Si el entrante es un mensaje privado verá el histórico del caso.

		@tc:7867
		Escenario: el agente solo ve el ultimo mensaje en un caso de canal público
			Dado que el agente responde a un mensaje entrante 1 de un canal publico
			Y el usuario responde a ese saliente del agente
			Cuando el agente atiende el entrante 2 de ese mismo caso
			Entonces solo visualizara el mensaje 2 en el portal

		@tc:7868
		Escenario:el agente visualiza el historico de un caso de canal privado
			Dado que el agente responde a un mensaje entrante 1 de un canal privado
			Y el usuario responde a ese saliente del agente
			Cuando el agente atiende el entrante 2 de ese mismo caso
			Entonces el historico del caso en el portal