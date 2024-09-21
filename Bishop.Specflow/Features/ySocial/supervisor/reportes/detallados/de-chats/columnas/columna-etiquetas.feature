#language: es
Característica: Columna que indique etiquetas del caso
    Como supervisor de ySocial
    Quiero que al reporte detallado de chat se le pueda agregar una columna con etiquetas
    Para no tener que entrar caso por caso para enterarme de las etiquetas de cada uno

Mapa: https://wbd.ms/share/v2/aHR0cHM6Ly93aGl0ZWJvYXJkLm1pY3Jvc29mdC5jb20vYXBpL3YxLjAvd2hpdGVib2FyZHMvcmVkZWVtL2FkNTIzY2JlZjJhMjQ5MmU5ZjBjMzE3YWI1NTU1MTEwX0JCQTcxNzYyLTEyRTAtNDJFMS1CMzI0LTVCMTMxRjQyNEUzRF82Njc0MTRhNC01MGEyLTRiOWEtODA0ZS0zMzEzZjMxYTI0ODk=

Regla de negocio: La columna mostrara la etiqueta colocada en el caso

        @tc:6345
        Esquema del escenario: La columna "etiqueta" en el reporte Detallado de Chats recupera las etiquetas colocadas por el agente
            Dado un agente coloca la etiqueta <etiqueta> al caso 7703 del canal chat
            Cuando un supervisor se encuentra en los filtros del reporte detallado de chats
            Y habilita el check de etiquetas
            Entonces la columna "etiquetas" del caso 7703 tendra el dato <etiqueta>

            Ejemplos: 
            | etiqueta      |
            | 1_ejemplo/asd |
            | N/A           |

Regla de negocio: La visibilidad de la columna depende de si el check "etiquetas" se encuentra activo

        @tc:6346
        Esquema del escenario: Supervisor visualiza la columna "etiquetas" en el reporte online "detallado de chats"
            Dado un supervisor que se encuentra en los filtros del reporte detallado de chats
            Y habilita los siguientes checks
                | checks           |
                | <checks activos> |
            Cuando realiza la búsqueda
            Entonces en el reporte online estara <estado columna> la columna "etiquetas"

            Ejemplos:
                | checks activos         | estado columna |
                | etiquetas              | presente       |
                | todos                  | presente       |
                | ninguna                | ausente        |

        @tc:6347
		Esquema del escenario: Supervisor visualiza la columna "etiquetas" al exportar manualmente el reporte "detallado de chats"
        	Dado un supervisor que se encuentra visualizando el reporte "detallado de chats"
            Y el reporte lo genero con el filtro "etiquetas" <estado>
			Y que el reporte se encuentra <paginacion>
			Cuando el supervisor descargue el reporte desde <opcion>
			Entonces en el archivo <visibilidad> la columna "etiquetas"

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

        @tc:6348
        Esquema del escenario: Supervisor visualiza la columna "etiquetas" en un reporte programado "detallado de chats"
            Dado un reporte programado que se configuro con los siguientes filtros
                | checks           |
                | <checks activos> |
            Cuando el supervisor descargue el reporte programado
            Entonces dentro del archivo estara <estado columna>  una columna "etiquetas"

            Ejemplos:
                | checks activos         | estado columna |
                | etiquetas              | presente       |
                | todos                  | presente       |
                | ninguna                | ausente        |