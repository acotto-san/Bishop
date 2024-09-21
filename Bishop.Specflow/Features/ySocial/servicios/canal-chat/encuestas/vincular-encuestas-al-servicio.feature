#language: es
Característica: vincular encuestas al servicio de chat
    Como supervisor de ySocial
    Quiero que el servicio de chat pueda tener encuestas vinculadas
    Para que las envie cuando un caso coincida con las condiciones de envio
    
    Antecedentes:
        Dado un servicio de chat que tiene configurado <@tipoDeAutenticacion>
            | <@tipoDeAutenticacion> |
            | anonimo                |
            | autenticado            |  

    Regla: las encuestas de chat solo se pueden configurar en el servicio
        Escenario: creación de encuesta de chat en el servicio 
            Dado que un supervisor habilita el uso de encuestas en la pestaña "encuestas" del servicio
            Cuando selecciona una nueva encuesta 
            Y le configura las condiciones envío
            Y confirma la creación de la encuesta
            Entonces dicha encuesta quedará guardada en la lista de encuestas
    
    Regla: se pueden crear multiples encuestas en un servicio
        Escenario: creación de una segunda encuesta en un servicio
            Dado que el servicio ya posee posee vinculada la encuesta "a-tercero"
            Cuando el supervisor procede a agregar la encuesta "a-tradicional"
            Y confirma el guardado de la nueva encuesta
            Entonces en la lista de encuestas del servicio debe quedar:
            Ejemplos:
                |posicion encuesta | nombre encuesta |
                |1                 | a-tercero       |
                |2                 | a-tradicional   |

    Regla: le encuesta vinculada es acompañada de un mensaje para invitar al usuario a completarla
        Escenario: usuario recibe mensaje configurado en el servicio junto al enlace de la encuesta
            Dado que el servicio posee vinculada la encuesta "a-tradicional"
            Y el campo del mensaje a mostrar contiene "Te invitamos a responder este cuestionario"
            Cuando un caso se cierra con las condiciones para que se le envie la encuesta
            Y en la ventana de despedida se muestra el enlace de la encuesta
            Entonces arriba del enlace debe encontrarse el mensaje "Te invitamos a responder este cuestionario"