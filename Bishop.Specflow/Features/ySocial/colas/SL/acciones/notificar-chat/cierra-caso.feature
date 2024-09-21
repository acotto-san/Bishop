#language: es
Característica: accion de service level no finaliza casos de chat

    Antecedentes:
        Dado que la cola "Cola AAA" posee la siguiente configuracion de SL :
            | campo                       | valor           |
            | accion notificar canal chat | habilitado      |
            | mensaje a notificar         | "Mensaje de SL" |
            | Finalizar el chat           | si              |
        @tc:5407
        Escenario: caso de chat sin interaccion es notificado por incumplimiento de service level y es finalizado
            Dado un mensaje de chat que no tuvo interaccion con un agente o bot
            Y se encola en la cola "Cola AAA"
            Cuando el mensaje incumple el tiempo de service level
            Entonces el usuario vera la notificacion "Mensaje de SL"
            Y el caso sera cerrado por el service level
        @tc:5408
        Esquema del escenario: caso de chat con interacciones es notificado por incumplimiento de service level y es finalizado
            Dado un mensaje de chat tuvo interaccion con <@participanteEnCaso>
            Y se encola en la cola "Cola AAA"
            Cuando el mensaje incumple el tiempo de service level
            Entonces el usuario vera la notificacion "Mensaje de SL"
            Y el caso sera cerrado por el service level

            Ejemplos: 
                | @participanteEnCaso |
                | agente              |
                | bot                 |
