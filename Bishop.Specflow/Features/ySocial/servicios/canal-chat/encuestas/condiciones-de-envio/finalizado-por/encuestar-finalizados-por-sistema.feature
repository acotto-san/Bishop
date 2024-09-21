#language: es
Característica: encuestar casos finalizados por sistema
    Como supervisor de ySocial
    Quiero configurar que el envio de encuestas se haga solo a casos finalizados por el sistema
    Para no tener encuestas para el 100% de los casos sino solo los cerrados por el sistema

    Antecedentes:
        Dado que el servicio posee vinculado la siguiente encuesta:
            | encuesta  | Colas donde finalizó el chat: | Finalizado por: |
            | a-tercero | Indistinto                    | Sistema         |
        Y que la cola "Cola A" tiene service level configurado con accion de descarte 

    Escenario: se envia encuesta porque caso cumple condicion finalizado por sistema
        Dado un caso de chat de este servicio que se encola en "Cola A"
        Cuando el caso encolado vence el service level de la cola
        Y el caso es cerrado por accion de service level
        Entonces el usuario final vera en la ventana de despedida el enlace para acceder a la encuesta

    Escenario: no se envia encuesta porque caso no cumple condicion finalizado por sistema
        Dado que un usuario crea un caso de chat
        Cuando el caso es finalizado por accion de <@finalizadoPor>
        Entonces el usuario final no tendra visible un enlace para acceder a la encuesta

        Ejemplos: 
            | <@finalizadoPor> |
            | agente           |
            | usuario          |
            | bot              |