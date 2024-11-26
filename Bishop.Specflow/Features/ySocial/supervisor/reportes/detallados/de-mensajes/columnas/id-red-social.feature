#language:es
Característica: ID de cuenta de red social

    Como administrador
    Quiero poder visualizar el ID de la cuenta en el reporte detallado de mensajes
    Para poder cruzar los datos con otros sistemas internos.

    Mapa: https://wbd.ms/share/v2/aHR0cHM6Ly93aGl0ZWJvYXJkLm1pY3Jvc29mdC5jb20vYXBpL3YxLjAvd2hpdGVib2FyZHMvcmVkZWVtLzU4NTg0Mjg1N2M0ZTRhOGE4NDRjMDY2MzI1NjMxZjFmX0JCQTcxNzYyLTEyRTAtNDJFMS1CMzI0LTVCMTMxRjQyNEUzRF8zZDJhNDJkZC03ZjI3LTRiM2UtODAyMy05ZDgxOTgzYTRlMDM=

    Regla: existirá un check que habilita la nueva columna de id. La columna se visualizará al final del reporte, antes de las dinámicas.
    
        @tc:6808
        Esquema del escenario: supervisor activa el check y visualiza la columna de id
            Dado un supervisor que se encuentra en los filtros del reporte Detallado de Mensajes
            Y habilita los siguientes checks
                | checks           |
                | <checks activos> |
            Cuando realiza la busqueda del reporte
            Entonces en el reporte online estara <estado columna> la columna ID al final de todas las columnas estaticas

            Ejemplos:
                | checks activos | estado columna |
                | ID             | presente       |
                | todos          | presente       |
                | ninguna        | ausente        |

    Regla: la columna aparece en el reporte online, exportado visible y completo, diario y programado.

        @tc:6809
        Esquema del escenario: el id aparece en todas las vistas y tipos de reporte
            Dado un mensaje del usuario con ID 5837178822986016
            Cuando el supervisor activa el check id del Reporte Detallado de Mensajes
            Y obtiene el reporte de manera <tipo de vista>
            Entonces debera ver 5837178822986016 en la columna ID de ese mensaje

            Ejemplos:
                | tipo de vista      |
                | online             |
                | exportado visible  |
                | exportado completo |
                | programado         |
                | diario             |

    Regla: se agrega el dato del id de la tabla SocialUser. Es el mismo que figura en el perfil del usuario

        @tc:6810
        Esquema del escenario: usuario sin id de red social
            Dado un usuario que interactua con un servicio de chat
            Y no se autentica
            Cuando el supervisor activa el check id del Reporte Detallado de Mensajes
            Y obtiene el reporte detallado de mensajes
            Entonces la columna id de ese usuario deberia estar vacio

        @tc:6811
        Esquema del escenario: aparece el mismo id que en el perfil del usuario
            Dado un usuario que interactua con un servicio de <canal>
            Cuando el supervisor activa el check id del Reporte Detallado de Mensajes
            Y obtiene el reporte detallado de mensajes
            Entonces el id de ese usuario debe ser el mismo que aparece en su perfil    

            Ejemplos:
                | canal              |
                | FB messenger       |
                | Instagram          |
                | Whatsapp           |
                | FB                 |
                | Mail               |
                | Chat (autenticado) |
                | Twitter            |
                | Telegram           |

        @tc:6812
        Escenario: usuario con cuentas unificadas, aparece id del servicio 
            Dado que un usuario con un perfil en ysocial con cuentas de fb y chat
            Y interactua con un servicio de fb
            Cuando el supervisor activa el check id del Reporte Detallado de Mensajes
            Y obtiene el reporte detallado de mensajes
            Entonces en esa columna deberia ver el id de la cuenta de fb del perfil de ese usuario