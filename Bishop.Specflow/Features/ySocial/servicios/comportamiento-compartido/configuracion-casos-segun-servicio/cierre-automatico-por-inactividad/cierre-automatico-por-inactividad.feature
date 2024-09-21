#language: es
Característica: servicio realiza cierre de casos automatico por inactividad
    Como supervisor de ySocial
    Quiero que los casos se cierren si los usuarios dejan de responder
    Para no tener casos abiertos en la plataforma que acumulan mucho tiempo de inactividad

    Antecedentes:
        Dado que en parametros del sistema se tiene configurado "Minutos para cierre automático" en 15 minutos
        Y dado que el servicio "Itchy and Scratchy Messenger" no sobreescribe la configuracion de casos del sistema

    Regla: los casos del servicio seran cerrados por el timer que se tenga seteado 

    Escenario: Caso se cierra por inactividad por el timer configurado 
        Dado un mensaje del servicio "Itchy and Scratchy Messenger" que es respondido por un <@autorRespuesta>
        Cuando pasen 15 minutos desde la respueta
        Entonces el caso debe cerrarse automaticamente

        Ejemplos:
        |<@autorRespuesta>  |
        |agente             |
        |supervisor         |

    Regla: Cada vez que el proceso de cierre corre imprime datos en el log de la web
    Escenario: la plataforma no encuentra mensajes para cerrar
        #TODO: gherkin para cuando el proceso no encuentra casos para cerrar
    Escenario: se graba informacion en el log cuando el caso se cierra
        Dado que el caso "33305" tiene las condiciones para ser cerrado automaticamente por inactividad
        Cuando la plataforma cierra el caso automaticamente por inactividad
        Entonces en el log de la web se imprime:
            """
            -Se cerrarán los casos que no hayan tenido interacciones en los últimos 1 minutos
            -Se procesará los casos que puedan ser respondidos antes de cerrarse del servicio -QA · Itchy and Scratchy Twitter Episode II-
            -Se obtuvieron 1 casos que podrían ser cerrados
            -Se cerrará el caso 33305
            -Se cerró automáticamente el caso 33305
            """
