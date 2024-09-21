#language: es
Característica: enviarle al usuario un mensaje configurado en el service level

    Antecedentes:
        Dado que la cola "Cola AAA" posee service level habilitado
        Y posee la siguiente configuracion de service level:
            | atributo                   | valor                    |
            | Notificar al canal de chat | habilitado               |
            | Mensaje a notificar        | Esto es un mensaje de SL |

    Regla: se mostrara a mensajes que aún no tuvieron interaccion
        @tc:5416
        Escenario: mensaje sin interaccion previa recibe notificacion de service level 
            Dado que un mensaje de chat se creo y encolo en la cola "Cola AAA"
            Cuando el mensaje incumple el tiempo de service level
            Entonces aparecera un mensaje en la ventana del chat que indicara "Esto es un mensaje de SL"

    Regla: se mostrara a mensajes que ya tuvieron algun tipo de interaccion
        @tc:5417
        Escenario: mensaje de chat devuelto a la cola por agente recibe notificacion de service level
            Dado que un agente devuelve un mensaje de chat a la cola "Cola AAA"
            Cuando el mensaje incumple el tiempo de service level
            Entonces en la ventana del chat aparecera un popup que indicara "Esto es un mensaje de SL"

        @tc:5418
        Escenario: mensaje de chat transferido de cola por agente recibe notificacion de service level
            Dado que un agente transfiere un mensaje de chat a la cola "Cola AAA"
            Cuando el mensaje incumple el tiempo de service level
            Entonces en la ventana del chat aparecera un popup que indicara "Esto es un mensaje de SL"

        @tc:5419
        Escenario: mensaje de chat derivado por un bot recibe notificacion de service level
            Dado que un bot deriva un mensaje de chat a la cola "Cola AAA"
            Cuando el mensaje incumple el tiempo de service level
            Entonces en la ventana del chat aparecera un popup que indicara "Esto es un mensaje de SL"

        @tc:5420
        Escenario: mensaje de chat desasignado por un supervisor recibe notificacion de service level
            Dado que un mensaje de chat es desasignado y devuelto a la cola "Cola AAA" por un supervisor
            Cuando el mensaje incumple el tiempo de service level
            Entonces en la ventana del chat aparecera un popup que indicara "Esto es un mensaje de SL"

    Regla: se mostrara el mensaje a mensajes que fueron cerrados por el mismo service level

        @tc:5421
        Esquema del escenario: mensaje es notificado y finalizado por service level
            Dado un mensaje que <@interaccion> tuvo interaccion con agente o bot 
            Y se encola en la cola "Cola AAA"
            Cuando el mensaje incumple el tiempo de service level
            Y el caso es cerrado por la accion de service level
            Entonces aparecera un mensaje en la ventana del chat que indicara "Esto es un mensaje de SL"

            Ejemplos: 
            | @interaccion |
            | si           |
            | no           |
