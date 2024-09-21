#language: es
Característica: cierre de casos automatico por inactividad
    Como supervisor de ySocial
    Quiero que los casos se cierren si los usuarios dejan de responder
    Para no tener casos abiertos en la plataforma que acumulan mucho tiempo de inactividad

    Antecedentes:
        Dado la siguiente configuracion en parametros de sistema:
			| funcionalidad                  | configuracion |
			| Minutos para cierre automatico | 60 minutos    |

    Regla: los casos del servicio seran cerrados por el timer que se tenga seteado 

    Escenario: Caso se cierra por inactividad por el timer configurado 
        Dado un mensaje que es respondido por un <@autorRespuesta>
        Y dado que el servicio del mensaje no sobreescribe la configuracion de casos
        Cuando pasen 60 minutos desde la respueta
        Entonces el caso sera cerrado automaticamente por inactividad

        Ejemplos:
        | @autorRespuesta |
        | agente          |
        | supervisor      |

    Escenario: Caso no se cierra por estar siendo atendido por el bot
        Dado que un mensaje fue respondido por el bot
        Cuando pasen "60" minutos desde la respuesta
        Entonces el no caso sera cerrado automaticamente por inactividad
        
    Escenario: Caso no se cierra por contener solo mensaje HSM
        Dado la siguiente configuracion en parametros de sistema:
			| funcionalidad                               | configuracion |
			| Minutos para cierre automatico de casos HSM | 120 minutos   |
        Cuando un caso que solo contiene mensajes HSM alcance 60 minutos de inactividad de parte del usuario
        Entonces el no caso sera cerrado automaticamente por inactividad

    Escenario: Caso no se cierra debido a que el servicio sobreescribe la configuracion de casos
        Dado que un mensaje es respondido 
        Y el servicio del mensaje sobreescribe la configuracion de casos de la siguiente manera:
            | funcionalidad                  | configuracion |
			| Minutos para cierre automatico | 120 minutos   |
        Cuando el caso acumula 60 minutos de inactividad de parte del usuario
        Entonces el caso no sera cerrado
        

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
