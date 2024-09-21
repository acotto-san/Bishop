#language: es
Característica: Una columna "texto de respuesta" para indicar de que manera fue respondido un mensaje HSM
	Se desea cual fue el texto de la respuesta a un mensaje HSM 

	Regla de negocio: la columna mostrara un texto si es que el usuario respondio con uno

        @tc:5689
	    Esquema del escenario: La columna "texto de respuesta" en el reporte Detallado de HSM recupera los datos en tiempo real de los usuarios
            Dado un usuario de Whatsapp recibe un mensaje de plantilla enviada por una tarea masiva
            Cuando el usuario <respuesta> mientras el caso del mensaje que recibió está en estado <estado>  
            Y un supervisor genere el reporte detallado de HSM que contenga esta plantilla enviada
            Entonces la columna "texto de respuesta" del reporte mostrara el resultado <resultado>

            Ejemplos:
                | respuesta                  | estado                  | resultado |
                | envia mensaje "hola hola"  | abierto                 | hola hola |
                | envia sticker              | abierto                 | N/A       |
                | envia adjunto              | abierto                 | N/A       |
                | selecciona un botón previo | abierto                 | N/A       |
                | tipea respuesta            | cerrado por inactividad | N/A       |

    Regla de negocio: La visibilidad de la columna depende de si el check "informacion de entrega" se encuentra activo
        
        @tc:5690
        Esquema del escenario: Supervisor visualiza la columna "texto de respuesta" en el reporte online "detallado de mensajes HSM"
            Dado un supervisor que se encuentra en los filtros del reporte detallado de mensajes HSM
            Y habilita los siguientes checks
                | checks           |
                | <checks activos> |
            Cuando realiza la búsqueda
            Entonces en el reporte online estara <estado columna> la columna "texto de respuesta"

            Ejemplos:
                | checks activos         | estado columna |
                | informacion de entrega | presente       |
                | todos                  | presente       |
                | ninguna                | ausente        |

		@tc:5691
		Esquema del escenario: supervisor visualiza la columna "texto de respuesta" al exportar manualmente el reporte "detallado de mensajes HSM"
			Dado un supervisor que se encuentra visualizando el reporte "detallado de mensajes HSM"
            Y el reporte lo genero con el filtro "informacion de entrega" <estado>
			Y que el reporte se encuentra <paginacion>
			Cuando el supervisor descargue el reporte desde <opcion>
			Entonces en el archivo vera la columna "texto de respuesta"

			Ejemplos: columna activa por filtro
				| estado | paginacion     | opcion            |
				| activo | con paginacion | exportar visible  |
				| activo | con paginacion | exportar completo |
				| activo | sin paginacion | exportar          |

			Ejemplos: columna inactiva por filtro
				| estado   | paginacion     | opcion            |
				| inactivo | con paginacion | exportar visible  |
				| inactivo | con paginacion | exportar completo |
				| inactivo | sin paginacion | exportar          |

        @tc:5692
        Esquema del escenario: supervisor visualiza la columna "texto de respuesta" en un reporte programado "detallado de mensajes HSM"
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

        @tc:5715
        Esquema del escenario: supervisor visualiza la columna "texto de respuesta" en un reporte diario "detallado de mensajes HSM"
            Dado un reporte detallado de mensajes HSM que fue generado por el feature de reportes diarios
            Cuando un supervisor visualice el archivo del reporte
			Entonces en el archivo vera la columna "texto de respuesta"