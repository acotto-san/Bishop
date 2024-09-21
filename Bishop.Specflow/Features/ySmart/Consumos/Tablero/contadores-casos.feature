#language: es
@us:7317

Característica: Tener un tablero donde ver los contadores por caso
	Como administrador
	Quiero ver un tablero de consumos que contabilice por casos 
	Para evaluar esa informacion

	- El contador de casos cuenta el +1 cuando evalua si una frase tiene intenciones,entidades,formularios o base de conocimiento.

	Regla de negocio: Un caso nunca sumara un valor superior a 1 en una tarjeta

		@tc:8649
		Esquema del escenario: Caso genera +1 en contador de intenciones
			Dado un caso que ejecuto <N> veces una pieza <X>
			Cuando se genere la metrica del intervalo donde ocurrieron las ejecuciones
			Entonces el contador suma +1

		Ejemplos: 
			| X                                 | N |
			| Ingreso de datos                  | 1 |
			| ingreso de datos                  | 5 |
			| Ejecutar servicio de cognitividad | 1 |
			| Ejectura servicio de cognitividad | 5 |

		@tc:8654
		Esquema del escenario: Caso genera +1 en contador de entidades
			Dado un caso que ejecuto <N> veces una pieza <X>
			Cuando se genere la metrica del intervalo donde ocurrieron las ejecuciones
			Entonces el contador suma +1

		Ejemplos: 
			| X                                 | N |
			| Ingreso de datos                  | 1 |
			| ingreso de datos                  | 5 |
			| Ejecutar servicio de cognitividad | 1 |
			| Ejectura servicio de cognitividad | 5 |
			| Obtener entidades de un mensaje   | 1 |
			| Obtener entidades de un mensaje   | 5 |

		@tc:8655
		Esquema del escenario: Caso genera +1 en contador de base de conocimientos
			Dado un caso que ejecuto <N> veces una pieza <X>
			Cuando se genere la metrica del intervalo donde ocurrieron las ejecuciones
			Entonces el contador suma +1

		Ejemplos: 
			| X                    | N |
			| Base de conocimiento | 1 |
			| Base de conocimiento | 5 |

		@tc:8656
		Esquema del escenario: Caso genera +1 en contador de formulario
			Dado un caso que ejecuto <N> veces una pieza <X>
			Cuando se genere la metrica del intervalo donde ocurrieron las ejecuciones
			Entonces el contador suma +1

		Ejemplos: 
			| X                      | N |
			| Formulario inteligente | 1 |
			| Formulario inteligente | 5 |

	Regla de negocio: El registro de un movimiento en diferentes intervalos no rompe la regla de que un caso no genera un valor mayor a 1 en cada tarjeta

		@tc:8657
		Escenario: Un caso logra registrar nuevos movimientos en otro intervalo
			Dado que en el intervalo 1 un caso registra movimiento para el contador "Intenciones"
			Y en el intervalo 2 el mismo caso registra movimiento para el contador "Intenciones" y el contador "Entidades"
			Cuando se visualiza el tablero de contadores filtrando por ambos intervalos juntos
			Entonces el contador "Entidades" tendra +1

		@tc:8658
		Escenario: Un caso no genera valor mayor a +1 en tarjeta por haber hecho movimientos en diferentes intervalos 
			Dado que en el intervalo 1 un caso registra movimiento para el contador "Formulario"
			Y en el intervalo 2 el mismo caso registra movimiento para el contador "Formulario"
			Cuando se visualiza el tablero de contadores filtrando por ambos intervalos juntos
			Entonces el contador "Formularios" mostrara 1

	Regla de negocio: Tener un contador de casos que provea la cifra de los casos que se usaron para poblar la metrica

		@tc:8659
		Escenario: Un caso acumula nueva metrica en otro intervalo y el contador de caso no suma +2
			Dado que en el intervalo 1 un caso registra movimiento para el contador A
			Y en el intervalo 2 el mismo caso registra movimiento para el contador B
			Cuando se visualiza el tablero de contadores filtrando por ambos intervalos juntos
			Entonces el contador de casos mostrara 1
	
	Regla de negocio: Un contador no podra  superar la cantidad de casos registrados

		@tc:8660
		Escenario: El contador de casos no sera mayor al contador de casos? Pendiente a revisar..
			Dado que en casos la tarjeta con valor más alto es 10
			Cuando supevisor visualice el contador de casos
			Entonces este no podrá ser menor que el valor de la tarjeta