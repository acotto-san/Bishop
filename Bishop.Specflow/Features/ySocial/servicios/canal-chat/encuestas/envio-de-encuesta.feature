#language: es
Característica: enviar encuestas configuradas en el servicio de chat
    Como supervisor de ySocial.
    Quiero que se le envie encuesta a los casos que cumplen con las condiciones de envio
    Para que automaticamente el servicio le envie alguna encuesta que tenga configurada.

    Regla: el envio de encuestas acepta tanto tradicionales como las de tercero

        Escenario: caso de chat recibe una encuesta de tipo "tradicional"
            Dado que el servicio de chat posee configurada una encuesta
            Y la encuesta seleccionada es de tipo "tradicional"
            Cuando se cierra un caso de chat
            Y la ventana de despedida muestra el enlace de la encuesta
            Y el usuario hace click en el mismo
            Entonces debera ver el inicio de la encuesta dentro del mismo chat

        Escenario: caso de chat recibe una encuesta de tipo "terceros"
            Dado que el servicio de chat posee configurada una encuesta
            Y la encuesta seleccionada es de tipo "terceros"
            Y la encuesta apunta a la url "TBD"
            Cuando se cierra un caso de chat
            Y la ventana de despedida muestra el enlace de la encuesta
            Y el usuario hace click en el mismo
            Entonces deberá ver un iframe dentro del mismo chat que apunta a la url "TBD"

    Regla: cuando un servicio posee más de una encuesta se envían según la primera que de match con las condiciones del caso

        Antecedentes:
            Dado que el servicio posee vinculadas las siguientes encuestas:
                | encuesta      | Colas donde finalizó el chat: | Finalizado por: |
                | a-tercero     | Cola A                        | Usuario         |
                | a-tradicional | Cola A                        | Indistinto      |

        Escenario: envio de la primer encuesta en la lista de encuestas de un servicio de chat
            Dado que un usuario inicia un caso del servicio "QA Chat anonimo"
            Y que el mensaje fue asignado a un agente desde la cola "Cola A"
            Cuando el usuario cierra el caso desde el menu hamburguesa
            Entonces recibirá la encuesta "a-tercero"
        
        Escenario: envio de la segunda encuesta en la lista de encuestas de un servicio de chat
            Dado que un usuario inicia un caso del servicio "QA Chat anonimo"
            Y que el mensaje fue asignado a un agente desde la cola "Cola A"
            Cuando el agente finaliza el caso
            Entonces recibirá la encuesta "a-tradicional"
    
    Regla: las encuestas de las colas no seran tenidas en cuenta por el servicio al momento del cierre del caso

        Escenario: no se envia una encuesta de una cola a un caso de chat
            Dada que en "Cola A" hay configurada una encuesta con la condicion de encuestar todos los casos
            Y que el servicio de chat tiene una encuesta configurada con la condicion de ser un caso cerrado por bot
            Cuando un caso de este servicio se cierra por accion de un agente
            Entonces el caso no será encuestado en absoluto