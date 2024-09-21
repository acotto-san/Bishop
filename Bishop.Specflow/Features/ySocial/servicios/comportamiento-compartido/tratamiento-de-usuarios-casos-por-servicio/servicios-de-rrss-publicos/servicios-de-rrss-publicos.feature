#language: es
Característica: Los servicios de redes sociales publicos que recuperan privados agrupan ambos tipos de mensaje en el mismo caso

    Antecedentes: 
        Dado que el perfil de <@RRSS> <@nombrePerfil> se encuentra configurado en ySocial de la siguiente manera
        Y que la recuperacion de mensajeria publica la realiza el servicio <@tipoDeServicioParaPublico>
        Y que la recuperacion de mensajeria privada la realiza el servicio <@tipoDeServicioParaPrivado>
        Y para la mensajeria privada yFlow se encuentra <@estadoYflow>

    Regla: un servicio de mensajeria publica puede atender por bot a los mensajes privados

        Esquema del escenario: usuario inicia un caso con mensaje privado y es atendido por el bot
            Dado no tengo un caso creado en ySocial
            Cuando le mando al perfil un mensaje privado
            Entonces ySocial crea un nuevo caso
            Y mi mensaje privado sera <@tratamientoDelMensaje>
            Ejemplos:
                |@RRSS      |@nombrePerfil          |@tipoDeServicioParaPublico  |@tipoDeServicioParaPrivado |@estadoYflow   |@tratamientoDelMensaje     |
                |Facebook   |Paddys pub             |facebook                    |facebook                   |habilitado     |atendido por el bot        |
                |Facebook   |Itchy and Scratchy's   |facebook                    |facebook                   |deshabilitado  |encolado                   |
                |Facebook   |Cat's Clothes          |facebook                    |facebook messenger         |habilitado     |atendido por el bot        |
                |Facebook   |Oldversion             |facebook                    |facebook messenger         |deshabilitado  |encolado                   |

        Esquema del escenario: usuario se encuentra hablando con el bot por privado y envia un mensaje publico
            Dado que creo un caso de ySocial al mandarle al perfil un mensaje privado
            Y el bot me responde
            Cuando le mando al perfil un mensaje publico
            Entonces mi mensaje publico sera <@tratamientoDelMensaje> bajo el caso <@asignacionDelMensaje>
            Ejemplos:
                |@RRSS      |@nombrePerfil      |@tipoDeServicioParaPublico  |@tipoDeServicioParaPrivado |@estadoYflow   |@tratamientoDelMensaje     |@asignacionDelMensaje         |
                |Facebook   |Paddys pub         |facebook                    |facebook                   |habilitado     |encolado                   |mismo que el privado          |
                |Facebook   |Cat's Clothes      |facebook                    |facebook messenger         |habilitado     |encolado                   |uno nuevo que creo el mensaje |

    Regla: los agentes responden publicos con privados y se espera que el usuario responda al privado para continuar el caso por ese medio

        Esquema del escenario: usuario intenta continuar por mensajeria privada un caso que inicio por publico
            Dado que creo un caso al mandarle al perfil un mensaje publico
            Y un agente me responde el mensaje publico con un mensaje privado
            Cuando respondo el mensaje privado que me envio el agente
            Entonces ese mensaje debe insertarse en el caso: <@asignacionDelMensaje>
            Ejemplos:
                |@RRSS      |@nombrePerfil          |@tipoDeServicioParaPublico  |@tipoDeServicioParaPrivado |@estadoYflow   |@asignacionDelMensaje                |
                |Facebook   |Paddys pub             |facebook                    |facebook                   |habilitado     |mismo caso                           |
                |Facebook   |Itchy and Scratchy's   |facebook                    |facebook                   |deshabilitado  |mismo caso                           |
                |Facebook   |Cat's Clothes          |facebook                    |facebook messenger         |habilitado     |caso separado (atendido por el bot)  |
                |Facebook   |Oldversion             |facebook                    |facebook messenger         |deshabilitado  |caso separado (encolado)             |
    
    Regla: los mensajes privados y publicos se agruparian si ambos tipos de mensajes son obtenidos por el mismo servicio (facebook/twitter/instagram)

        Esquema del escenario: usuario tiene un caso con mensajes publicos y envia un mensaje privado
            Dado que creo un caso al mandar al perfil un mensaje publico
            Y el mensaje esta en estado: <@estadoDelMensaje>
            Cuando le mando al perfil un mensaje privado
            Entonces ese mensaje debe insertarse en el caso: <@asignacionDelMensaje>
            Ejemplos:
                |@RRSS      |@nombrePerfil          |@tipoDeServicioParaPublico  |@tipoDeServicioParaPrivado |@estadoYflow   |@estadoDelMensaje     |@asignacionDelMensaje                |
                |Facebook   |Paddys pub             |facebook                    |facebook                   |habilitado     |asignado              |mismo caso                           |
                |Facebook   |Itchy and Scratchy's   |facebook                    |facebook                   |deshabilitado  |asignado              |mismo caso                           |
                |Facebook   |Cat's Clothes          |facebook                    |facebook messenger         |habilitado     |asignado              |caso separado (atendido por el bot)  |
                |Facebook   |Oldversion             |facebook                    |facebook messenger         |deshabilitado  |asignado              |caso separado (encolado)             |
                |Facebook   |Paddys pub             |facebook                    |facebook                   |habilitado     |encolado              |mismo caso                           |
                |Facebook   |Itchy and Scratchy's   |facebook                    |facebook                   |deshabilitado  |encolado              |mismo caso                           |
                |Facebook   |Cat's Clothes          |facebook                    |facebook messenger         |habilitado     |encolado              |caso separado (atendido por el bot)  |
                |Facebook   |Oldversion             |facebook                    |facebook messenger         |deshabilitado  |encolado              |caso separado (encolado)             |
                |Facebook   |Paddys pub             |facebook                    |facebook                   |habilitado     |respondido            |mismo caso                           |
                |Facebook   |Itchy and Scratchy's   |facebook                    |facebook                   |deshabilitado  |respondido            |mismo caso                           |
                |Facebook   |Cat's Clothes          |facebook                    |facebook messenger         |habilitado     |respondido            |caso separado (atendido por el bot)  |
                |Facebook   |Oldversion             |facebook                    |facebook messenger         |deshabilitado  |respondido            |caso separado (encolado)             |
                |Facebook   |Paddys pub             |facebook                    |facebook                   |habilitado     |descartado            |mismo caso                           |
                |Facebook   |Itchy and Scratchy's   |facebook                    |facebook                   |deshabilitado  |descartado            |mismo caso                           |
                |Facebook   |Cat's Clothes          |facebook                    |facebook messenger         |habilitado     |descartado            |caso separado (atendido por el bot)  |
                |Facebook   |Oldversion             |facebook                    |facebook messenger         |deshabilitado  |descartado            |caso separado (encolado)             |

        Esquema del escenario: usuario tiene un caso con mensajes privados y envia un mensaje publico
            Dado que creo un caso al mandar al perfil un mensaje privado
            Y el mensaje esta en estado: <@estadoDelMensaje>
            Cuando le mando al perfil un mensaje publico
            Entonces ese mensaje debe insertarse en el caso: <@asignacionDelMensaje>
            Ejemplos:
                |@RRSS      |@nombrePerfil          |@tipoDeServicioParaPublico  |@tipoDeServicioParaPrivado |@estadoYflow   |@estadoDelMensaje     |@asignacionDelMensaje                |
                |Facebook   |Paddys pub             |facebook                    |facebook                   |habilitado     |asignado              |mismo caso                           |
                |Facebook   |Itchy and Scratchy's   |facebook                    |facebook                   |deshabilitado  |asignado              |mismo caso                           |
                |Facebook   |Cat's Clothes          |facebook                    |facebook messenger         |habilitado     |asignado              |caso separado (encolado)             |
                |Facebook   |Oldversion             |facebook                    |facebook messenger         |deshabilitado  |asignado              |caso separado (encolado)             |
                |Facebook   |Paddys pub             |facebook                    |facebook                   |habilitado     |encolado              |mismo caso                           |
                |Facebook   |Itchy and Scratchy's   |facebook                    |facebook                   |deshabilitado  |encolado              |mismo caso                           |
                |Facebook   |Cat's Clothes          |facebook                    |facebook messenger         |habilitado     |encolado              |caso separado (encolado)             |
                |Facebook   |Oldversion             |facebook                    |facebook messenger         |deshabilitado  |encolado              |caso separado (encolado)             |
                |Facebook   |Paddys pub             |facebook                    |facebook                   |habilitado     |respondido            |mismo caso                           |
                |Facebook   |Itchy and Scratchy's   |facebook                    |facebook                   |deshabilitado  |respondido            |mismo caso                           |
                |Facebook   |Cat's Clothes          |facebook                    |facebook messenger         |habilitado     |respondido            |caso separado (encolado)             |
                |Facebook   |Oldversion             |facebook                    |facebook messenger         |deshabilitado  |respondido            |caso separado (encolado)             |
                |Facebook   |Paddys pub             |facebook                    |facebook                   |habilitado     |descartado            |mismo caso                           |
                |Facebook   |Itchy and Scratchy's   |facebook                    |facebook                   |deshabilitado  |descartado            |mismo caso                           |
                |Facebook   |Cat's Clothes          |facebook                    |facebook messenger         |habilitado     |descartado            |caso separado (encolado)             |
                |Facebook   |Oldversion             |facebook                    |facebook messenger         |deshabilitado  |descartado            |caso separado (encolado)             |



