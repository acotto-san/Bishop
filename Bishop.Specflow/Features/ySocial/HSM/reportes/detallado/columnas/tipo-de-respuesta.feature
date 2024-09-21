#language: es
@us:4994
Característica: columna Tipo de respuesta
	Se desea tener una columna que indique cual fue el tipo de respuesta que el usuario realizó al HSM (boton / texto / N/A / adjunto(quizas))

    Regla de negocio: La columna mostrara algo cuando el usuario responda

        @tc:5774
        Esquema del escenario: La columna "Tipo de respuesta" en el reporte Detallado de HSM recupera los datos en tiempo real de los usuarios
            Dado un usuario de Whatsapp que recibe un mensaje de plantilla enviada por una tarea masiva
            Cuando el usuario <respuesta> mientras el caso del mensaje que recibió está en estado <estado> 
            Y un supervisor genere el reporte detallado de HSM que contenga esta plantilla enviada
            Entonces la columna "Tipo de respuesta" del reporte <resultado> con el dato

            Ejemplos: 
                | respuesta           | estado                  | resultado |
                | selecciona un botón | abierto                 | boton     |
                | tipea respuesta     | abierto                 | texto     |
                | selecciona un botón | cerrado por inactividad | N/A       |
                | envia adjunto       | abierto                 | otra      |
                | envia sticker       | abierto                 | otra      |

    Regla de negocio: La visibilidad de la columna depende de si el check "informacion de entrega" se encuentra activo

        @tc:5775
        Esquema del escenario: Supervisor visualiza la columna "tipo de respuesta" en el reporte online "detallado de mensajes HSM"
            Dado un supervisor que se encuentra en los filtros del reporte detallado de mensajes HSM
            Y habilita los siguientes checks
                | checks           |
                | <checks activos> |
            Cuando realiza la búsqueda
            Entonces en el reporte online estara <estado columna> la columna "tipo de respuesta"

            Ejemplos:
                | checks activos         | estado columna |
                | informacion de entrega | presente       |
                | todos                  | presente       |
                | ninguna                | ausente        |

        @tc:5776
		Esquema del escenario: supervisor visualiza la columna "tipo de respuesta" al exportar manualmente el reporte "detallado de mensajes HSM"
        	Dado un supervisor que se encuentra visualizando el reporte "detallado de mensajes HSM"
            Y el reporte lo genero con el filtro "informacion de entrega" <estado>
			Y que el reporte se encuentra <paginacion>
			Cuando el supervisor descargue el reporte desde <opcion>
			Entonces en el archivo <visibilidad> la columna "tipo de respuesta"

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

        @tc:5777
        Esquema del escenario: supervisor visualiza la columna "tipo de respuesta" en un reporte programado "detallado de mensajes HSM"
            Dado un reporte programado que se configuro con los siguientes filtros
                | checks           |
                | <checks activos> |
            Cuando el supervisor descargue el reporte programado
            Entonces dentro del archivo estara <estado columna>  una columna "respondido por texto"

            Ejemplos:
                | checks activos         | estado columna |
                | informacion de entrega | presente       |
                | todos                  | presente       |
                | ninguna                | ausente        |

    Regla de negocio: La visibilidad en determinado reporte es obligatoria

        @tc:5778
        Esquema del escenario: supervisor visualiza la columna "tipo de respuesta" en un reporte diario "detallado de mensajes HSM"
            Dado un reporte detallado de mensajes HSM que fue generado por el feature de reportes diarios
            Cuando un supervisor visualice el archivo del reporte
			Entonces en el archivo vera la columna "tipo de respuesta"