#language: es
Característica: enviarle al usuario un mensaje configurado en el vencimiento en cola

    Antecedentes:
        Dado que la cola "Cola AAA" posee vencimiento en cola habilitado
        Y posee la siguiente configuracion de vencimiento en cola:
            | atributo                   | valor                                     |
            | Notificar al canal de chat | habilitado                                |
            | Mensaje a notificar        | Esto es un mensaje de vencimiento en cola |

    Regla: se mostrara a mensajes que aún no tuvieron interaccion
        Escenario: mensaje sin interaccion previa recibe notificacion de vencimiento en cola 
            Dado que un mensaje de chat se creo y encolo en la cola "Cola AAA"
            Cuando el mensaje incumple el tiempo de vencimiento en cola
            Entonces aparecera un mensaje en la ventana del chat que indicara "Esto es un mensaje de vencimiento en cola"

    Regla: se mostrara a mensajes que ya tuvieron algun tipo de interaccion
        Escenario: mensaje de chat devuelto a la cola por agente recibe notificacion de vencimiento en cola
            Dado que un agente devuelve un mensaje de chat a la cola "Cola AAA"
            Cuando el mensaje incumple el tiempo de vencimiento en cola
            Entonces en la ventana del chat aparecera un popup que indicara "Esto es un mensaje de vencimiento en cola"

        Escenario: mensaje de chat transferido de cola por agente recibe notificacion de vencimiento en cola
            Dado que un agente transfiere un mensaje de chat a la cola "Cola AAA"
            Cuando el mensaje incumple el tiempo de vencimiento en cola
            Entonces en la ventana del chat aparecera un popup que indicara "Esto es un mensaje de vencimiento en cola"

        Escenario: mensaje de chat derivado por un bot recibe notificacion de vencimiento en cola
            Dado que un bot deriva un mensaje de chat a la cola "Cola AAA"
            Cuando el mensaje incumple el tiempo de vencimiento en cola
            Entonces en la ventana del chat aparecera un popup que indicara "Esto es un mensaje de vencimiento en cola"

        Escenario: mensaje de chat desasignado por un supervisor recibe notificacion de vencimiento en cola
            Dado que un mensaje de chat es desasignado y devuelto a la cola "Cola AAA" por un supervisor
            Cuando el mensaje incumple el tiempo de vencimiento en cola
            Entonces en la ventana del chat aparecera un popup que indicara "Esto es un mensaje de vencimiento en cola"

    Regla: se mostrara el mensaje a mensajes que fueron cerrados por el mismo vencimiento en cola

        Esquema del escenario: mensaje es notificado y finalizado por vencimiento en cola
            Dado un mensaje que <@interaccion> tuvo interaccion con agente o bot 
            Y se encola en la cola "Cola AAA"
            Cuando el mensaje incumple el tiempo de vencimiento en cola
            Y el caso es cerrado por la accion de vencimiento en cola
            Entonces aparecera un mensaje en la ventana del chat que indicara "Esto es un mensaje de vencimiento en cola"

            Ejemplos: 
            | @interaccion |
            | si           |
            | no           |
