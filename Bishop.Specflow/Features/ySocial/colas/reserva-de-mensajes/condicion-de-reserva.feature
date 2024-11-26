#language: es 
Característica: Condiciones para reservar

	Las opciones en Condiciones para Reservar, deben ser: Siempre / Reservar únicamente si el mensaje pertenece a un caso abierto.
	Si se configura siempre, se reserva en todas las condiciones. Si se configura la otra opción, se reserva si existe un caso abierto. No se reserva
	si es un caso nuevo.

	Esta configuración es en la cola.

Regla: Condición de siempre Reservar: Todos los mensajes que quedan encolados son reservados siempre a un agente disponible.

	@tc:9534
	Esquema del escenario: se reserva siempre un caso abierto o nuevo
		Dado que la cola B tiene configurado Siempre en Condiciones para reservar
		Y un caso <tipo de caso> ingresa a la cola B
		Cuando el agente Poochie esta disponible
		Entonces debe reservarse el mensaje al agente poochie

		Ejemplos:
			|tipo de caso                                         |
			|abierto (gestionado previamente por agente de cola b)|
			| nuevo                                               |

	@tc:9535
	Escenario: ingresa caso de un perfil que fue gestionado por varios agentes
		Dado que la cola B tiene configurado Siempre en Condiciones para reservar
		Y un perfil que tuvo casos en dos tipos de redes sociales
		Y sus casos fueron gestionado por varios agentes
		Cuando ingresa un caso nuevo a la cola b
		Entonces se reserva al ultimo agente que gestiono ese perfil

Regla: Condición de reserva: Solo se reserva el mensaje a un agente cuando pertenece a un caso abierto.

	@tc:9536
	Escenario: ingresa un caso nuevo y no se reserva
		Dado que la cola B tiene configurado Unicamente si es un caso abierto en Condiciones para reservar
		Y un caso nuevo ingresa a la cola B
		Cuando el agente Poochie esta disponible
		Entonces no debera reservarse el mensaje al agente poochie

	@tc:9537
	Escenario: ingresa un caso abierto y es reservado
		Dado que la cola B tiene configurado Unicamente si es un caso abierto en Condiciones para reservar
		Y un caso abierto habia sido gestionado por Poochie previamente
		Y el agente Poochie est disponible
		Cuando ingresa a la cola B
		Entonces debera reservarse el mensaje al agente poochie

	@tc:9538
	Escenario: caso abierto gestionado por varios agentes
		Dado que la cola B tiene configurado Unicamente si es un caso abierto en Condiciones para reservar
		Y un caso fue gestionado por varios agentes de la cola
		Cuando ingresa un mensaje nuevo de ese caso a la cola b
		Entonces se reserva al ultimo agente que gestiono ese caso

Regla: Si el encolamiento en esa cola no es el primero, no se reserva ese mensaje

	@tc:9539
	Esquema del escenario: se deriva un caso a una cola que no es la default y se cumple la reserva
		Dado que la cola B tiene configurado Siempre en Condiciones para reservar
		Y el servicio de whatsapp tiene la cola A asociada por defecto
		Cuando un caso se deriva a la cola b por <tipo de derivacion>
		Entonces debe cumplirse la reserva 

		Ejemplos:

			|tipo de derivacion |
			|clave de derivacion|
			|filtro             |

	@tc:9540
	Esquema del escenario: un mensaje no es reservado en su segundo encolamiento
		Dado un caso nuevo ingresa a la cola c
		Y la cola b tiene configurada alguna condicion de reserva
		Cuando es transferido a la cola b
		Y el agente Poochie esta disponible
		Entonces ese mismo mensaje no queda reservado

	@tc:9541
	Esquema del escenario: el segundo mensaje que agrupa en un caso transferido se reserva al agente
		Dado que la cola B tiene configurado Siempre en Condiciones para reservar
		Y un caso inicia en la cola C
		Cuando es transferido a la cola b
		Y el agente Poochie está disponible
		Y el usuario envia un segundo mensaje que se agrupa
		Entonces se reserva el segundo mensaje al agente poochie

