#language: es
@us:7959
Característica: obligar etiquetado y finalizar chat abandonado no son excluyentes

	Poder seleccionar la opción "Finalizar automáticamente chats abandonados" y en simultaneo "Etiquetar al finalizar" para que el agente 
	tenga la obligatoriedad de etiquetar los chats que finaliza con el botón finalizar

	Previamente, la configuración de estas opciones eran excluyentes.
	Los checks que se habilitan en estas pruebas están en la configuración del servicio de chat:
		-Etiquetar al finalizar
		-Finalizar automáticamente chats abandonados

	Probar con los 3 tipos de chat: anónimo, autenticado e integrado.

	Regla: Si el agente finaliza el chat presionando el botón finalizar, lo obliga a poner la etiqueta. 

		@tc:8044
		Esquema del escenario: el etiquetado al finalizar está habilitado y finalizar automáticamente los chats abandonados está deshabilitado
			Dada la siguiente configuración del servicio de chat:
				| check                                       | estado        |
				| Etiquetar al finalizar                      | habilitado    |
				| Finalizar automáticamente chats abandonados | deshabilitado |
			Y un agente tiene multiples conversaciones de chat en su web
			Cuando el <sujeto> finaliza un chat
			Entonces el agente colocara una etiqueta para cerrar la conversacion

				Ejemplos:
				| sujeto  |
				| usuario |
				| agente  |

	Regla: Si el chat está asignado a un agente y ese chat se autofinaliza por abandono mientras el agente está trabajando en otro caso, y el agente no tuvo que presionar el boton finalizar, no aplica la obligatoriedad

		@tc:8045
		Esquema del escenario: el etiquetado y finalizar automáticamente los chats abandonados están habilitados
			Dada la siguiente configuración del servicio de chat:
				| check                                       | estado     |
				| Etiquetar al finalizar                      | habilitado |
				| Finalizar automáticamente chats abandonados | habilitado |
			Y un agente tiene multiples conversaciones de chat en su web
			Cuando el <sujeto> finaliza el chat
			Entonces <resultado obtenido>

				Ejemplos:
				| sujeto  | resultado obtenido                                           |
				| usuario | la conversacion desaparece de los slots de la web del agente |
				| agente  | agente colocara una etiqueta para cerrar la conversacion     |

		@tc:8046
		Esquema del escenario: el etiquetado al finalizar está deshabilitado y finalizar automáticamente los chats abandonados está habilitado
			Dada la siguiente configuración del servicio de chat:
				| check                                       | estado        |
				| Etiquetar al finalizar                      | deshabilitado |
				| Finalizar automáticamente chats abandonados | habilitado    |
			Y un agente tiene multiples conversaciones de chat en su web
			Cuando el <sujeto> finaliza el chat
			Entonces <resultado obtenido>

				Ejemplos:
				| sujeto  | resultado obtenido                                           |
				| usuario | la conversacion desaparece de los slots de la web del agente |
				| agente  | no tiene obligacion de etiquetar para cerrar la conversacion |

		@tc:8047
		Esquema del escenario: el etiquetado y finalizar automáticamente los chats abandonados están deshabilitados
			Dada la siguiente configuración del servicio de chat:
				| check                                       | estado        |
				| Etiquetar al finalizar                      | deshabilitado |
				| Finalizar automáticamente chats abandonados | deshabilitado |
			Y un agente tiene multiples conversaciones de chat en su web
			Cuando el <sujeto> finaliza el chat
			Entonces <resultado obtenido>

				Ejemplos:
				| sujeto  | resultado obtenido                                                                   |
				| usuario | alerta que el usuario abandona y agente no tiene obligacion de etiquetar para cerrar |
				| agente  | el agente no tiene obligacion de etiquetar                                           |