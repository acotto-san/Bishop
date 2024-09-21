#language: es
@us:7317

Característica: Tener un tablero donde ver los contadores por mensajes
	Como administrador
	Quiero ver un tablero de consumos que contabilice por mensajes
	Para evaluar esa informacion

	- El contador de mensajes cuenta el +1 cuando se hace uso de una pieza que evalue intenciones,entidades,formularios o base de conocimiento.
	- Funcionalidad = Intenciones, Entidades, Base de conocimiento, Formulario

	Regla de negocio: El contador de "Intenciones" debera contar +1 si se procesa una pieza que ejecuta esa funcionalidad

		@tc:8662
		Escenario: Mensaje genera +1 en el contador de intenciones
			Dado un mensaje que ejecuto pieza <pieza>
			Cuando se genere la metrica del intervalo donde ocurrieron las ejecuciones
			Entonces el contador suma +1

			Ejemplos: 
				| pieza                              |
				| Ingreso de datos                   |
				| Ejectutar servicio de cognitividad |

		@tc:8863
		Escenario: Mensaje genera +1 en el contador de intenciones al usar mas de una pieza que ejecuten intenciones
			Dado un mensaje que ejecuto la pieza ingreso de datos
			Y a continuacion ejecuta la pieza Ejecturar servicio de cognitividad
			Cuando se genere la metrica del intervalo donde ocurrieron las ejecuciones
			Entonces el contador debera sumar +1

		@tc:8864
		Escenario: Mensaje genera +0 en el contador de intenciones al usar una pieza que no ejecute intenciones
			Dado un mensaje que ejecuto la pieza Formulario
			Cuando se genere la metrica del intervalo donde ocurrieron las ejecuciones
			Entonces el contador debe sumar +0

		@tc:8666
		Escenario: El mensaje procesado no identifica intenciones
			Dado un mensaje ejecuto la pieza Ingreso de datos
			Y no identifica ninguna intencion
			Cuando se genere la metrica del intervalo donde ocurrieron las ejecuciones
			Entonces el contador sumara +1

	Regla de negocio: El contador de "Entidades" debera contar +1 si se procesa una pieza que ejecuta esa funcionalidad

		@tc:8667
		Escenario: Mensaje genera +1 en el contador de Entidades
			Dado un mensaje que ejecuto pieza <pieza>
			Cuando se genere la metrica del intervalo donde ocurrieron las ejecuciones
			Entonces el contador suma +1

			Ejemplos: 
				| pieza                             |
				| Ingreso de datos                  |
				| Ejecutar servicio de cognitividad |
				| Obtener entidades de un mensaje   |

		@tc:8668
		Escenario: Mensaje genera +1 en el contador de Entidades al usar mas de una pieza que ejecuten Entidades
			Dado un mensaje que ejecuto la pieza ingreso de datos
			Y a continuacion ejecuta la pieza Ejecturar servicio de cognitividad
			Cuando se genere la metrica del intervalo donde ocurrieron las ejecuciones
			Entonces el contador debera sumar +1

		@tc:8669
		Escenario: Mensaje genera +0 en el contador de Entidades al usar una pieza que no ejecute Entidades
			Dado un mensaje que ejecuto la pieza Formulario
			Cuando se genere la metrica del intervalo donde ocurrieron las ejecuciones
			Entonces el contador debe sumar +0

		@tc:8670
		Escenario: El mensaje procesado no identifica Entidades
			Dado un mensaje ejecuto la pieza Ingreso de datos
			Y no identifica ninguna intencion
			Cuando se genere la metrica del intervalo donde ocurrieron las ejecuciones
			Entonces el contador sumara +1
	
	Regla de negocio: El contador de "Base de conocimiento" debera contar por cada vez que una pieza dispara la consulta a una base conocimiento
	
		@tc:8671
		Escenario: Mensaje genera +1 en el contador de Base de conocimientos
		exploratorio: Ingreso de datos y Ejecturar servicio de cognitividad pueden estar asociadas a la base de conocimientos, hacer pruebas de estas piezas
			Dado un mensaje que ejecuto la pieza Base de conocimientos
			Cuando se genere la metrica del intervalo donde ocurrieron las ejecuciones
			Entonces el contador suma +1

		@tc:8672
		Escenario: Mensaje genera +0 en el contador de Base de conocmimientos al usar una pieza que no ejecute Base de conocimientos
			Dado un mensaje que ejecuto la pieza Formulario
			Cuando se genere la metrica del intervalo donde ocurrieron las ejecuciones
			Entonces el contador debe sumar +0

		@tc:8673
		Escenario: El mensaje procesado no identifica Base de conocimientos
			Dado un mensaje ejecuto la pieza Base de conocimientos
			Y no identifica ninguna Base de conocimientos
			Cuando se genere la metrica del intervalo donde ocurrieron las ejecuciones
			Entonces el contador sumara +1
	
	Regla de negocio: El contador de "Formularios" debera contar por mensaje que tenga una interaccion con un formulario

		@tc:8675
		Esquema del escenario: El contador suma +1 por cada mensaje del usuario
			Dado un formulario que pide los datos DNI, NUMERO DE TELEFONO Y ALTURA DE LA CASA
			Y el usuario responde a los 3 datos solicitados en <N> mensajes diferentes
			Cuando se genere la metrica del intervalo donde ocurrieron las ejecuciones
			Entonces el contador debera sumar +<N>

			Ejemplos:
				| N |
				| 1 |
				| 3 |
				| 5 |

		@tc:8676
		Escenario: El contador suma +1 por abandono del usuario
			Dado un formulario que pide los datos DNI, NUMERO DE TELEFONO Y ALTURA DE LA CASA
			Y el usuario abandona al primer intento
			Cuando se genere la metrica del intervalo donde ocurrieron las ejecuciones
			Entonces el contador debera sumar +1
	
	Regla de negocio: Un contador en la sección de mensajes sera igual o mayor a su contraparte en la sección casos
		
		@tc:8678
		Esquema del escenario: Contador en seccion de mensajes es igual o mayor la contra parte
			Dado una tarjeta en consumos de ySmart  en la sección de Mensajes esta mostrando <valor>
			Cuando supervisor vea la tarjeta del mismo contador en la sección de Casos 
			Entonces su valor no será mayor a <valor>
		
			Ejemplos: 
				| Valor |
				| 1     |
				| 3     |
				| 5     |
	
	Regla de negocio: Tener un contador de mensaje que provea la cifra de los casos que se usaron para poblar la metrica

		@tc:8681
		Escenario: Un mismo mensaje es ejecutado 2 veces y registra movimientos para los contadores de mensajes
			Dado que el mensaje 915 pasa por una pieza y se identifica una intencion
			Y luego se vuelve a analizar el mismo mensaje en otra pieza y se identifica otra intencion
			Cuando se consoliden las metricas de uso
			Entonces el mensaje 915 habra provisto +1 al contador de mensaje
	