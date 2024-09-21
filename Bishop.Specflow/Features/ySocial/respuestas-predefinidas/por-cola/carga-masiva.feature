#language: es
Característica: Carga masiva de respuestas predefinidas
	Se desea poder cargar muchas respuestas predefinidas al mismo tiempo.
	Se obligara para todas las respuestas predefinidas la misma configuracion (tipo de uso/ tipo de servicio / etiquetas relacionadas)
	Se puede elegir que tipo de separador se tiene cargado en el csv


	Regla de negocio: la carga se debe hacer por archivos csv
		@tc:5648
		Escenario: Supervisor intenta cargar un archivo csv
			Cuando un supervisor seleccione la opcion de carga masiva
			Y seleccione el archivo csv para subir
			Entonces al aceptar la carga masiva se debera ver las respuestas cargadas en el csv

		@tc:5649	
		Escenario: Supervisor intenta cargar un archivo diferente a un csv
			Cuando un supervisor seleccione la opcion de carga masiva
			Y suba un archivo que no sea csv
			Entonces debera aparecer un cartel de error indicando que no es el formato de archivo correcto

	Regla de negocio: dentro del archivo a subir puede decidirse que separador tendra

		@tc:
		Esquema del escenario: supervisor intenta cargar un archivo csv con separador configurable
			Dado un archivo con respuestas predefinidas que posee un separador de tipo <separador>
			Cuando un supervisor intenta realizar el alta masiva de respuestas predefinidas
			Y selecciona el separador "<separador en formulario>" en el formulario de alta
			Entonces el intento de carga masiva sera <resultado>

			Ejemplos: intentos exitosos por respetar el separador
				| separador      | separador en formulario | resultado |
				| barra vertical | barra vertical          | exitoso   |
				| coma           | coma                    | exitoso   |
				| punto y coma   | punto y coma            | exitoso   |

			Ejemplos: intentos fallidos por no coincidir separador 
				| separador      | separador en formulario | resultado |
				| coma           | barra vertical          | fallido   |
				| punto y coma   | barra vertical          | fallido   |
				| barra vertical | coma                    | fallido   |
				| punto y coma   | coma                    | fallido   |
				| barra vertical | punto y coma            | fallido   |
				| coma           | punto y coma            | fallido   |

	Regla de negocio: en la carga masiva se aplica la misma configuracion a todas las respuestas predefinidas
		
		Esquema del escenario: supervisor configura una carga masiva de respuestas predefinidas
			Dado que un supervisor configura un alta masiva de respuestas predefinidas con la siguiente configuracion
				| tipo de uso   | tipo de servicio   | etiquetas relacionadas   |
				| <tipo de uso> | <tipo de servicio> | <etiquetas relacionadas> |
			Y adjunta un csv con la siguiente informacion
				"""
				respuesta 1, hola señor usuario, este esta es una respuesta predefinida
				respuesta 2, hola señor usuario, este esta es una respuesta predefinida

				"""
			Cuando finalice correctamente la carga de respuestas predefinidas
			Entonces estaran cargargadas a la lista de respuestas predefinidas las siguientes:
				| nombre respuesta | tipo de uso   | tipo de servicio   | etiquetas relacionadas   |
				| respuesta 1      | <tipo de uso> | <tipo de servicio> | <etiquetas relacionadas> |
				| respuesta 2      | <tipo de uso> | <tipo de servicio> | <etiquetas relacionadas> |

			Ejemplos: pruebas con el tipo de uso
				| tipo de uso                  | tipo de servicio | etiquetas relacionadas |
				| supervisor                   | chat             | AAA                    |
				| agentes                      | chat             | AAA                    |
				| filtros                      | chat             | AAA                    |
				| supervisor, agente y filtros | chat             | AAA                    |

			Ejemplos: pruebas con el tipo de servicio
				| tipo de uso | tipo de servicio   | etiquetas relacionadas |
				| supervisor  | twitter > publico  | AAA                    |
				| agentes	  | twitter > privado  | AAA                    |
				| filtros	  | twitter > ambos    | AAA                    |
				| supervisor  | facebook > publico | AAA                    |
				| agentes	  | facebook > privado | AAA                    |
				| filtros	  | facebook > ambos   | AAA                    |
				| supervisor  | whatsapp           | AAA                    |
				| agentes	  | telegram           | AAA                    |
				| filtros	  | mail               | AAA                    |
				| supervisor  | chat               | AAA                    |
				| agentes	  | instagram          | AAA                    |
				| filtros	  | messenger          | AAA                    |

			Ejemplos: pruebas con las etiquetas relacionadas
				| tipo de uso | tipo de servicio | etiquetas relacionadas                                               |
				| agentes     | messenger        | nivel 1                                                              |
				| agentes     | messenger        | nivel 1/nivel 2                                                      |
				| agentes     | messenger        | nivel 1/nivel 2/nivel3                                               |
				| agentes     | messenger        | nivel 1/nivel2/nivel 3/nivel 4                                       |
				| agentes     | messenger        | ninguna                                                              |
				| agentes     | messenger        | nivel 1/nivel2/nivel 3/nivel 4  y  nivel 1/nivel2/hermana de nivel 3 |

	Regla de negocio: dentro de la carga masiva se deben visualizar los tooltips de ayuda
	
        @tc5748
        Escenario: Un supervisor ingresa a la carga masiva de respuestas predefinidas
			Dado un supervisor que se encuentra en el formulario de carga masiva de respuestas predefinidas por cola
			Cuando se posicione sobre el icono de informacion de un campo
			Entonces aparecera un tooltip con mas informacion detallada respecto al campo