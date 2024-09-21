#language: es
Característica: Deshabilitar servicio
	Como supervisor 
	Quiero recibir un mensaje de error cuando no puedo deshabilitar un servicio
	Para tener conocimiento del estado del servicio

	Regla: Se puede deshabilitar un servicio cuando no tiene mensajes encolados o asignados.

		@tc:7002
		Esquema del escenario: Se deshabilita un servicio
			Dado un servicio que no tiene mensajes <tipo de mensajes>
			Cuando un supervisor deshabilita ese servicio
			Entonces el servicio sera deshabilitado

			Ejemplos: 
				| tipo de mensajes |
				| encolados        |
				| asignados        |

		@tc:7003
		Esquema del escenario: Se impide la deshabilitacion de un servicio al tener mensajes en el sistema
			Dado un servicio que tiene mensajes <tipo de mensajes>
			Cuando un supervisor deshabilita ese servicio
			Entonces aparece un popup alertando que <mensaje>

			Ejemplos: 
				| tipo de mensajes | mensaje                                                      |
				| encolados        | se cerraran los mensajes encolados una vez deshabilitado |
				| asignados        | no puede deshabilitarlo                                  |

		@tc:7004
		Escenario: Un servicio es deshabilitado teniendo casos abiertos
			Dado un servicio que tiene casos abiertos
			Cuando un supervisor deshabilita ese servicio
			Entonces el servicio sera deshabilitado
			Y los casos continuaran abiertos 
