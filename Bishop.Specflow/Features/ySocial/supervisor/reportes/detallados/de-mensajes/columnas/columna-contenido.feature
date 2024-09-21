#language: es
Característica: Tener una columna que muestre el contenido del mensaje
    Como supervisor que esta revisando el reporte detallado de mensajes
    quiero poder ver dentro de la columna contenido el mensaje
    para poder ver los mensajes de la conversacion
   
    Regla de negocio: La celda de la columna contenido debe mostrar el cuerpo del mensaje

        @tc5815
        Esquema del escenario: El cuerpo de un mensaje es visualizado en la columna "Contenido"
            Dado que el mensaje id 1 contiene como cuerpo "<mensaje entrante>"
            Cuando el supervisor obtiene el reporte Detallado de Mensajes de manera <tipo de vista>
            Y se ubique sobre la columna contenido para el mensaje id 1
            Entonces deberea ver el mensaje "<mensaje entrante>"

            Ejemplos: Supervisor ve el reporte online
                | tipo de vista | mensaje entrante              |
                | online        | prueba_12_ab_z*hola*@mail.com |

            Ejemplos: Supervisor ve el reporte exportado visible
                | tipo de vista     | mensaje entrante              |
                | exportado manual visible | prueba_12_ab_z*hola*@mail.com |

            Ejemplos: Supervisor ve el reporte exportado completo
                | tipo de vista      | mensaje entrante              |
                | exportado manual completo | prueba_12_ab_z*hola*@mail.com |

            Ejemplos: Supervisor ve el reporte diario
                | tipo de vista    | mensaje entrante              |
                | exportado diario | prueba_12_ab_z*hola*@mail.com |

            Ejemplos: Supervisor ve el reporte programado
                | tipo de vista        | mensaje entrante              |
                | exportado programado | prueba_12_ab_z*hola*@mail.com |


        Escenario: Cuando un usuario final envia un archivo en la columna contenido se muestra vacio
            Dado que el mensaje id 2 contiene como cuerpo un archivo adjunto
            Cuando el supervisor ingrese al detallado de mensajes
            Y se ubique soble la columna contenido para el mensaje id 2
            Entonces debera ver el "-Vacio-"
		
        @tc:5061
	    Escenario: Un supervisor visualiza mensaje ofuscado en el reporte detallado de mensajes
	        Dado que un mensaje de messenger es ofuscado por la pieza ingreso de Datos
            Cuando el supervisor ingrese al reporte detallado de mensajes
	        Y se ubique en el mensaje que fue ofuscado
	        Entonces en la columna Contenido dira Mensaje oculto

    Regla de negocio: El contenido de la celda puede variar si es un caso de mail
        
        @tc:7302
        Escenario: Celda contenido muestra asunto cuando el mensaje es de mail
            Dado un mensaje de mail que ingresa a la plataforma
            Cuando un supervisor obtiene el reporte detallado de mensajes con columna Contenido presente
            Entonces en la columna vera el asunto del mail

        @tc:7303
        Escenario: Celda contenido muestra cuerpo de mail cuando el mismo no tiene asunto
            Dado un mensaje de mail sin asunto que ingresa a la plataforma
            Cuando un supervisor obtiene el reporte detallado de mensajes con columna Contenido presente
            Entonces en la columna vera el cuerpo del mail

    Regla de negocio: La visibilidad de la columna depende de si el check "Incluir Cuerpo del mensaje" se encuentra activo
        

        Esquema del escenario: Supervisor visualiza la columna "Contenido" en el reporte online "Detallado de Mensajes"
            Dado un supervisor que se encuentra en los filtros del reporte Detallado de Mensajes
            Y habilita los siguientes checks
                | checks           |
                | <checks activos> |
            Cuando realiza la búsqueda
            Entonces en el reporte online estara <estado columna> la columna "Contenido"

            Ejemplos:
                | checks activos             | estado columna |
                | Incluir Cuerpo del Mensaje | presente       |
                | todos                      | presente       |
                | ninguna                    | ausente        |


		Esquema del escenario: supervisor visualiza la columna "Contenido" al exportar manualmente el reporte "Detallado de Mensajes"
        	Dado un supervisor que se encuentra visualizando el reporte online Detallado de Mensajes
            Y el reporte lo genero con el filtro "Incluir Cuerpo del Mensaje" <estado>
			Y que el reporte se encuentra <paginacion>
			Cuando el supervisor descargue el reporte desde <opcion>
			Entonces en el archivo <visibilidad> la columna "Contenido"

			Ejemplos: columna activa por filtro
				| estado | paginacion     | opcion            | visibilidad  |
				| activo | con paginacion | exportar visible  | sera visible |
				| activo | con paginacion | exportar completo | sera visible |
				| activo | sin paginacion | exportar          | sera visible |

			Ejemplos: columna inactiva por filtro
				| estado   | paginacion     | opcion            | visibilidad     |
				| inactivo | con paginacion | exportar visible  | no sera visible |
				| inactivo | con paginacion | exportar completo | no sera visible |
				| inactivo | sin paginacion | exportar          | no sera visible |


        Esquema del escenario: supervisor visualiza la columna "Contenido" en un reporte programado "Detallado de Mensajes"
            Dado un reporte Detallado de Mensajes programado que se configuro con los siguientes filtros
                | checks           |
                | <checks activos> |
            Cuando el supervisor descargue el reporte programado
            Entonces dentro del archivo estara <estado columna>  una columna "Contenido"

            Ejemplos:
                | checks activos             | estado columna |
                | Incluir Cuerpo del Mensaje | presente       |
                | todos                      | presente       |
                | ninguna                    | ausente        |

