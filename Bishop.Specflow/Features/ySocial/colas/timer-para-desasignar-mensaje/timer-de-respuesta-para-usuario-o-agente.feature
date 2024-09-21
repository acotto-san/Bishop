#language: es
@us:6086
Característica: Timer para desasignar mensajes en servicios modo chat
Como administrador
Quiero poder asignar 2 valores para que las conversaciones en modo chat en el agente se desasigne si el usuario o el agente no escribe por x tiempo
Para evitar que los agentes se queden con conversaciones por mucho tiempo


	Regla de negocio: El timer solo es aplicable en servicios con modo chat

		@tc:6384
		Esquema del escenario: Supervisor asigna un timer a cola A
			Dado que un supervisor configuro en la cola A 1 minuto al timer
			Cuando un agente que se encuentra dentro de la cola A visualize un mensaje de <no aplica>
			Y pase mas de un minuto
			Entonces el mensaje no se desasignara 
		
			Ejemplos: 
				| no aplica |
				| Youtube   |
				| Twitter   |
				| Mail      |
				| Instagram |
				| Linked in |
				| Facebook  |

		@tc:6385
		Esquema del escenario: Supervisor asigna un timer a cola B
			Dado que un supervisor configuro en la cola B 1 minuto al timer
			Cuando un agente que se encuentre de la cola B visualize un mensaje de <aplica>
			Y pase mas de un minuto
			Entonces el mensaje se desasignara

			Ejemplos: 
				| aplica             |
				| Whatsapp           |
				| Telegram           |
				| Facebook Messenger |

	Regla de negocio: El supervisor puede configurar el timer tanto para respuesta del agente como del usuario 
		
		@tc:6386
		Escenario: Supervisor configura el timer por falta de respuesta del agente
			Dado un supervisor configurando el timer para el agente
			Cuando configure la cantidad de minutos que desee
			Entonces debera quedar habilitado el timer

		@tc:6389
		Escenario: Supervisor configura el timer por falta de respuesta del usuario  
			Dado un supervisor configurando el timer para el usuario
			Cuando configure la cantidad de minutos que desee
			Entonces debera quedar habilitado el timer

		@tc:6387
		Escenario: Supervisor deshabilita el timer
			Dado un supervisor configurando el timer
			Cuando configure 0 minutos 
			Entonces debera quedar deshabilitado el timer

	Regla de negocio: El timer se puede detener 
		
		@tc:6394
		Escenario: Agente detiene su propio timer
			Dado que un supervisor configuro en la cola A 1 minuto en el timer de desasignacion del mensaje para el agente
			Cuando el agente que se encuentra en esa cola conteste un mensaje de un usuario en menos de un minuto
			Entonces se debera detener el timer 

		@tc:6935
		Escenario: Usuario detiene su propio timer
			Dado que un supervisor configuro en la cola A 1 minuto en el timer de desasignacion del mensaje para el usuario
			Cuando el usuario reciba un mensaje del agente 
			Y lo responda en menos de un minuto
			Entonces se debera detener el timer

		@tc:6396
		Esquema del escenario: Timer deja de correr al ser desasignado el caso
			Dado que un supervisor configuro en la cola A 1 minuto en el timer de desasignacion del mensaje
			Cuando un usuario envie un mensaje 
			Y este mensaje sea <desasignacion>
			Entonces se debera detener el timer

		Ejemplos: 
			| desasignacion          |
			| devuelto a la cola     |
			| tranferido a otra cola |
			| finalizado             |

	Regla de negocio: Acciones al vencimiento del timer del agente

		#editado
		@tc:6397
		Escenario: Timer del agente vence y retorna el mensaje a la cola
			EXPLORATORIO: en el modal "datos del mensaje" hay una pestaña que se llama tiempos. Dentro de la misma hay una sección que se
			llama "segmentos" un segmento es una visita del mensaje a una seccion diferente (segumento 1: cola/
			segmento 1:agente pepe(agente devuelve a la cola)/segmento 2: cola (de nuevo))
			-La asignación puede estar activa o no activa
			Dado un agente que posee un caso asignado de una cola con timer de agente habilitado
			Y el timer ya se encuentra corriendo
			Y no hay otro mensaje en la cola
			Cuando el timer se agote
			Entonces el mensaje debera ser devuelto a la cola 

		#nuevo
		@tc:6507
		Escenario: Timer del agente vence y le muestra un popup al agente
			-exploratorio: ver que pasa si aparecen dos o más al mismo tiempo
			Dado un agente que posee un caso asignado de una cola con timer de agente habilitado
			Y la asignacion no esta activa
			Y el timer ya se encuentra corriendo
			Y hay un mensaje en la cola a espera de ser agrupado
			Cuando el timer se agote
			Entonces aparecera un popup indicandole al agente que debe gestionar el caso asignado que vencio el timer

		@tc:6398
		Escenario: Supervisor revisa en el historico de estados que sucedio con el mensaje que se desasigno
			Dado que en la cola A se configuro el timer en un minuto para el agente
			Cuando pase mas de un minuto sin responder el mensaje 
			Entonces dentro del Historico de estados se podra ver que el mensaje fue desasignado por el timer y devuelto a la cola
		
		@tc:6399
		Escenario: Supervisor revisa en el detallado de login logout que sucedio con el mensaje que se desasigno
			Dado que a un agente se le desasigno el mensaje 200464 por agotar el timer de agente
			Cuando un supervisor visualice el reporte detallado de login logout para dicho agente 
			Entonces debera ver un registro indicando que el mensaje 200464 se desasigno por inactividad en modo chat

	Regla de negocio: Accion de vencimiento del timer del usuario

		@tc:6400
		Escenario: Mensaje se elimina de la cola por incumplimiento del timer por parte del usuario
			Dado que en la cola A esta configurado 1 minuto para el timer por parte del usuario
			Cuando el usuario no responde el mensaje por mas de un minuto
			Entonces el mensaje debera ser desasignado y descartado con el motivo de inactividad del usuario
		
		@tc:6401
		Escenario: Supervisor revisa en el historico de estados que sucedio con el mensaje que se descarto
			Dado que en la cola A se configuro el timer en un minuto para el usuario
			Cuando el usuario pase mas de un minuto sin responder el mensaje 
			Entonces dentro del Historico de estados se podra ver que el mensaje fue desasignado por el timer y descartado

		@tc:6402
		Escenario: Supervisor revisa en el detallado de login logout que sucedio con el mensaje que se desasigno y descarto
			Dado que en la cola A se configuro el timer en un minuto para el usuario
			Cuando el usuario pase mas de un minuto sin responder el mensaje 
			Entonces al ver el reporte detallado de login logout se debera ver que el mensaje fue desasignado y descartado por el timer	

	Regla de negocio: El timer del agente puede ser iniciado por el agente o por el usuario
		
		@tc:6405
		#cumple rol autolectura
		Esquema del escenario: Agente sin casos asignados recibe primer asignacion y comienza timer
			Dado un agente que no posee asignaciones
			Y que en parametros del sistema se encuentra <estado> la funcionalidad de autolectura
			Cuando se <accion> el primer mensaje de una cola con timer del agente
			Entonces debera empezar a correr el timer

			Ejemplos: 
				| estado        | accion           |
				| habilitado    | asigna y autolee |
				| deshabilitado | solo se asigna   |

		@tc:6408
		#no cumple rol autolectura
		Escenario: Agente con casos asignados recibe nueva asignacion y comienza timer
			Dado un agente que se encuentra con una asignacion activa en pantalla
			Cuando recibe una segunda asignacion de una cola con timer del agente
			Entonces debera empezar a correr el timer

		@tc:6508
		Escenario: Agente manualmente ejecuta el timer al producir una asignacion
			En este escenario el timer no esta corriendo debido a que ya vencio y se le mostro el popup
			Dado un agente posee una asignacion no activa de una cola con timer del agente
			Y el timer no se encuentra corriendo
			Y un mensaje en cola espera a ser agrupado
			Cuando el agente hace click en la asignacion 
			Y el mensaje de la cola se agrupa/asigna
			Entonces debera empezar a correr el timer

		@tc:6509
		Esquema del escenario: Timer del agente inicia por un mensaje que es encolado
			-puede estar o no activa la conversacion
			Dado un agente posee una asignacion <visibilidad de caso> de una cola con timer del agente
			Y el ultimo mensaje del caso es un saliente del agente
			Cuando se encole un nuevo mensaje del caso
			Y <accion consecuente>
			Entonces debera empezar a correr el timer

			Ejemplos: 
				| visibilidad de caso | accion consecuente     |
				| activa              | se agrupe en el agente |
				| no activa           | quede encolado         |

	Regla de negocio: El timer del usuario puede ser iniciado por el agente
	Exploratorio: Si el agente adueda una respuesta y sale un hsm para, esto no deberia ser considerado
	como una respuesta para el timer

		@tc:6406
		Escenario: El timer del usuario inicia cuando el agente responde
			Dado que se encuentra configurado el timer para el usuario
			Cuando el agente envie el primer mensaje saliente desde el ultimo entrante
			Entonces debera empezar a correr el timer para el usuario

		@tc:6407
		Escenario: Timer del usuario en curso no se altera cuando agente envia un segundo mensaje
			Dado que se encuentra configurado el timer para el usuario
			Cuando el agente responda el mensaje enviado por el usuario
			Y envie otro saliente mas
			Entonces el timer debera seguir corriendo desde el primer mensaje respondio
	
	Regla de negocio: La desasignacion debe ocurrir sin importar donde esta el agente pero no afectar su operatoria actual
		
		@tc:6510
		Esquema del escenario: Agente esta en Mis Casos y un mensaje se desasigna por vencimiento de timer
			De manera exploratoria habria que jugar un poco con qué es lo que el agente estaba haciendo en 
			Mis casos (mirando un pendiente/ un caso trabajado/redactando un nuevo mensaje en alguno de ellos)
			Dado que un agente se encuentra en mis casos 
			Y tiene un mensaje asignado que esta por vencer el timer de <usuario>
			Cuando el mensaje vence el timer y se desasigna del agente
			Entonces el agente debe continuar en la seccion de mis casos

			Ejemplos: 
				| usuario |
				| agentes |
				| usuario |

		@tc:6511
		Escenario: Agente esta en Mensajes Salientes y un mensaje se desasigna por vencimiento de timer
			Dado que un agente se encuentra en Mensajes Salientes
			Y tiene un mensaje asignado que esta por vencer el timer de <usuario>
			Cuando el mensaje vence el timer y se desasigna del agente
			Entonces el agente debe continuar en la seccion de Mensajes Salientes
			
			Ejemplos: 
				| usuario |
				| agentes |
				| usuario |

	Regla de negocio: Nuevos mensajes evaluan si ya hay un timer corriendo
		
		@tc:6512
		Esquema del escenario: Timer del agente en ejecucion no se modifica por nuevos entrantes del usuario
			Dado un timer del agente de 10 minutos que se encuentra a 1 minuto de vencerse
			Cuando un nuevo mensaje del caso se <accion>
			Entonces al timer activo continuara quedandole 1 minuto para vencerse

			Ejemplos: 
				| accion |
				| encola |
				| asigna |

		@tc:6513
		Escenario: Timer del usuario en ejecucion no se modifica por nuevos salientes del agente
			Dado un timer del usuario de 10 minutos que se encuentra a 1 minuto de vencerse
			Cuando el agente envia un nuevo saliente
			Entonces al timer activo continuara quedandole 1 minuto para vencerse