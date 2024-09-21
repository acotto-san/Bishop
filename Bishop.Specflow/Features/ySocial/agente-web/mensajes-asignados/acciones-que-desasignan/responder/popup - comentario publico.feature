#language: es 
Característica: popup - comentario publico
    Como agente
    quiero tener una instancia de confirmación antes de enviar una respuesta publica 
    para evitar errores

    Antecedentes: 
        Dado que el agente tiene el check de popup activo en su configuración

    Regla: Un agente que tiene activo el check activo en su configuración, siempre que el cuadro de texto de “respuesta publica” tenga contenido, visualizará el popup.

        @tc:6274
        Esquema del escenario: agente redacta respuesta publica a un mensaje asignado
            Dado que un agente recibe un mensaje de un <tipo de servicio>
            Cuando escribe una respuesta publica 
            Y envia mensaje
            Entonces visualizara el popup pidiendole confirmacion

            Ejemplos:
                | tipo de servicio |
                | twitter          |
                | facebook         |
                | youtube          |
                | playstore        |
                | instagram        |

        @tc:6273
        Esquema del escenario: agente deja vacio cuadro de texto respuesta publica en mensaje asignado
            Dado que un agente recibe un mensaje de un <tipo de servicio>
            Cuando deja vacio el cuadro de texto de respuesta publica
            Y envia mensaje
            Entonces no visualizara el popup pidiendole confirmacion
        
            Ejemplos:
                | tipo de servicio |
                | twitter          |
                | facebook         |
                | youtube          |
                | playstore        |
                | instagram        |