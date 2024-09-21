#language: es
Característica: tener una columna que cuente los respondidos fuera de SL en un intervalo

    Antecedentes:
        Dado que en el intervalo aun no se han respondido mensajes

    Regla: los mensajes respondidos por agentes son contados en la metrica
    
    Escenario: Agente responde mensaje que vencio su SL en estado asignado
        Dado que un agente tiene asignado un mensaje 
        Y que el mensaje vence su SL mientras sigue asignado
        Cuando el mensaje es respondido por el agente
        Entonces la columna mostrara "1" en el intervalo

    Escenario: Agente responde mensaje que vencio su SL en estado no asignado
        Dado que un mensaje esta encolado
        Y el mensaje vence su SL mientras esta en la cola
        Cuando el mensaje es asignado a un agente
        Y es respondido por el agente
        Entonces la columna mostrara "1" en el intervalo

    Regla: los mensajes respondidos por supervisor son contados en la metrica

    Escenario: Supervisor responde mensaje que vencio su SL en estado no asignado
        Dado que un mensaje esta encolado
        Y el mensaje vence su SL mientras esta en la cola
        Cuando el supervisor responde el mensaje
        Entonces la columna mostrara "1" en el intervalo

    Escenario: Supervisor responde mensaje que vencio su SL en estado asignado
        Dado que un agente tiene asignado un mensaje
        Y que el mensaje vence su SL mientras sigue asignado
        Cuando el mensaje retorna a la cola
        Y el supervisor responde el mensaje
        Entonces la columna mostrara "1" en el intervalo

    Regla: los mensajes que son respondidos por service level son contados en la metrica

    Escenario: Cola envía respuesta automática por SL a un mensaje encolado
        Dado que el SL de la cola posee como accion una respuesta automatica 
        Y que un mensaje se encuentra en estado encolado
        Cuando el mensaje vence su SL
        Y la cola envía la respuesta automatica
        Entonces la columna mostrara "1" en el intervalo