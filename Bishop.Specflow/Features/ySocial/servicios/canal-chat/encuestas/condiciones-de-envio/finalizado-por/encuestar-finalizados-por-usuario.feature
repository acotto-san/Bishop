#language: es
Característica: encuestar casos finalizados por usuario
    Como supervisor de ySocial
    Quiero configurar que el envio de encuestas se haga solo a casos finalizados por el usuario
    Para no tener encuestas para el 100% de los casos sino solo los cerrados por el usuario

    Antecedentes:
        Dado que el servicio posee vinculado la siguiente encuesta:
            | encuesta  | Colas donde finalizó el chat: | Finalizado por: |
            | a-tercero | Indistinto                    | Usuario         |

    Escenario: se envia encuesta a un caso con agente porque cumple condicion finalizado por usuario
        Dado que un caso de chat creado por el servicio se encola
        Y el caso es asignado a un agente
        Cuando el caso es cerrado por el usuario desde el menu hamburguesa
        Entonces el usuario final vera en la ventana de despedida el enlace para acceder a la encuesta
        
    Esquema del escenario: no se envia encuesta porque caso no cumple condicion finalizado por usuario
        Dado que un usuario crea un caso de chat
        Cuando el caso es finalizado por accion de <@finalizadoPor>
        Entonces el usuario final no tendra visible un enlace para acceder a la encuesta

        Ejemplos: 
            |<@finalizadoPor>|
            |agente|
            |sistema|
            |bot|