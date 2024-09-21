#language: es
Característica: encuestar casos finalizados por bot
    Como supervisor de ySocial
    Quiero configurar que el envio de encuestas se haga solo a casos finalizados por un bot
    Para no tener encuestas para el 100% de los casos sino solo los cerrados por un bot

    Antecedentes:
        Dado que el servicio posee vinculado la siguiente encuesta:
            | encuesta  | Colas donde finalizó el chat: | Finalizado por: |
            | a-tercero | Indistinto                    | bot             |


    Escenario: se envia encuesta porque caso cumple condicion finalizado por bot
        Dado que un caso de chat creado por el servicio inicia por yFlow
        Cuando el bot finaliza el caso
        Entonces el usuario final vera en la ventana de despedida el enlace para acceder a la encuesta

    Escenario: no se envia encuesta porque no caso cumple condicion finalizado por bot
        Dado que un usuario crea un caso de chat
        Cuando <@finalizadoPor> finaliza el caso
        Entonces el usuario final no tendra visible un enlace para acceder a la encuesta

        Ejemplos: 
            | <@finalizadoPor> |
            | usuario          |
            | sistema          |
            | agente           |