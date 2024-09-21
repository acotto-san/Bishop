#language: es
Característica: Encuestar si caso supera una cantidad de mensajes
	Como supervisor que configura una encuesta
	Quiero que salgan solamente los que tienen más de X cantidad de mensajes
	Para que no se envíen encuestas a casos que practicamente no tuvieron gestión
	
	Esta funcionalidad esta al habilitar una encuesta ya sea en cola, en servicio (para yFlow) o en chat.

	Regla: La configuracion aplica a cada encuesta

		@tc:7634
		Escenario: supervisor configura la cantidad de mensajes que debe tener una encuesta
			Cuando un supervisor esta configurando una encuesta en una cola
			Entonces en las condiciones de envio tendra disponible la configuracion de la cantidad minima de mensajes

	Regla: Solo se encuestaran los casos que superen la cantidad de mensajes configurados

		@tc:7635
		Esquema del escenario: caso supera la cantidad de mensajes y es agendado para ser encuestado
			Dada una encuesta que posee <cantidad necesaria> configurado en la condicion de cantidad de mensajes
			Cuando un caso finaliza con <cantidad mensajes>
			Entonces el caso sera encuestado

			Ejemplos: 
				| cantidad necesaria | cantidad mensajes |
				| 5                  | 5                 |
				| 5                  | 101               |

		@tc:pendiente
		Escenario: se encuesta un caso que alcanza la cantidad de mensajes al mismo tiempo que se cierra
			Dada una encuesta que posee 5 configurado en la condicion de cantidad de mensajes
			Y un caso activo con 4 mensajes
			Cuando un agente responde y cierra el caso al mismo tiempo
			Entonces el caso sera encuestado

		@tc:7636
		Escenario: caso no es agendado para ser encuestado por no alcanzar la cantidad de mensajes minimos
			Dada una encuesta que posee <cantidad necesaria> configurado en la condicion de cantidad de mensajes
			Cuando un caso finaliza con <cantidad mensajes>
			Entonces el caso no sera encuestado

			Ejemplos: 
				| cantidad necesaria | cantidad mensajes |
				| 5                  | 4                 |
				| 10                 | 9                 |

	Regla: Se puede deshabilitar la funcionalidad
		
		@tc:7637
		Esquema del escenario: la funcionalidad esta deshabilitada al tener configurado un 0
			Dada una encuesta que posee 0 configurado en la condicion de cantidad de mensajes
			Cuando un caso finalice con <cantidad mensajes> mensajes
			Entonces el caso sera encuestado

			Ejemplos: 
				| cantidad mensajes |
				| 1                 |
				| 101               |