#language: es
Característica: accion de vencimiento en cola finaliza casos no iniciados de chat

    Antecedentes:
        Dado que la cola "Cola AAA" posee la siguiente configuracion de vencimiento en cola :
            | campo                       | valor                            |
            | accion notificar canal chat | habilitado                       |
            | mensaje a notificar         | "Mensaje de vencimiento en cola" |
            | Finalizar el chat           | unicamente si no fue atendido    |

        Escenario: caso de chat sin interaccion es notificado por incumplimiento de vencimiento en cola es finalizado
            Dado un mensaje de chat que no tuvo interaccion con un agente o bot
            Y se encola en la cola "Cola AAA"
            Cuando el mensaje incumple el tiempo de vencimiento en cola
            Entonces el usuario vera la notificacion "Mensaje de vencimiento en cola"
            Y el caso sera cerrado por el vencimiento en cola

        Esquema del escenario: caso de chat con interacciones es notificado por incumplimiento de vencimiento en cola pero no es finalizado
            Dado un mensaje de chat tuvo interaccion con <@participanteEnCaso>
            Y se encola en la cola "Cola AAA"
            Cuando el mensaje incumple el tiempo de vencimiento en cola
            Entonces el usuario vera la notificacion "Mensaje de vencimiento en cola"
            Y el caso no sera cerrado por el vencimiento en cola

            Ejemplos: 
                | @participanteEnCaso |
                | agente              |
                | bot                 |
