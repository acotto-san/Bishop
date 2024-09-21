#language: es
Característica: columna service level acumulado en reporte de tiempo real de colas
    Como supervisor en el reporte de tiempo real de colas
    Quiero tener una columna que muestre cuantos mensajes fueron respondidos/atendidos dentro de service level
    Asi puedo saber si la cola está teniendo buen performance respecto a la atencion dentro de service level

    Antecedentes: 
        Dado que la cola "AAA" tiene SL habilitado en 2 minutos
        Y que en día de hoy en la cola se atendieron/respondieron 3 mensajes dentro de SL

    Regla: La metrica contabiliza la cantidad de mensajes que fueron respondidos dentro del SL

        Antecedentes:
            Dado el servicio "Paddy's Pub" tiene deshabilitado el modo chat
        
        Escenario: Supervisor visualiza columna "SL Acumulado"
            Dado que la cola "AAA" respondio los siguientes mensajes:
            Cuando el supervisor visualiza la columna "SL Acumulado" de la cola "AAA"
            Entonces vera que contiene  "3(#%)" 

        Escenario: Agente responde mensaje dentro del SL y la metrica crece +1
            Dado que un agente tiene un mensaje asignado del servicio "Paddy's Pub"
            Cuando el agente responde el mensaje dentro del SL
            Y el estado del mensaje cambia a respondido
            Entonces en la columna "SL Acumulado" el supervisor vera "4(#%)"

        Escenario: Supervisor responde mensaje dentro del SL y la metrica crece +1
            Dado que un mensaje se encuentra encolado en cola "AAA"
            Y el mensaje aun no vencio su SL
            Cuando un supervisor responde el mensaje desde la cola
            Y el estado del mensaje cambia a respondido
            Entonces en la columna "SL Acumulado" el supervisor vera "4(#%)"

    Regla: La metrica contabiliza la cantidad de mensajes que fueron atendidos dentro del SL

        Antecedentes:
            Dado el servicio "Paddy's Pub" tiene habilitado el modo chat
        
        Escenario: Un mensaje pasa a atendido por agrupamiento y la metrica crece +1
            Dado que un agente tiene asignado un mensaje de "Paddy's Pub"
            Y dado que el agente responde el mensaje
            Cuando un nuevo mensaje entrante le es asignado al agente
            Y el primer mensaje cambia a estado atendido
            Entonces en la columna "SL Acumulado" el supervisor vera "4(#%)"
        
        Escenario: Un mensaje pasa a atendido por finalizar la atención y la metrica crece +1
            Dado que un agente tiene asignado un mensaje de "Paddy's Pub"
            Y dado que el agente responde el mensaje
            Cuando el agente finaliza la atencion
            Y el mensaje cambia de estado a atendido
            Entonces en la columna "SL Acumulado" el supervisor vera "4(#%)"

    Regla: La metrica puede contabilizar como respuesta dentro de SL a un mensaje automático de sistema
    
        Escenario: Un mensaje es respondido automáticamente como accion de SL y la metrica crece
            Dado que la cola posee como acción de SL enviar una respuesta automatica 
            Y que un caso se encola en dicha cola
            Cuando el caso vence su SL
            Y se envía la respueta automática
            Entonces en la columna "SL Acumulado" el supervisor vera "4(#%)"
    Regla: dentro de los parentesis de la metrica estara el porcentaje de los respondidos/atendidos dentro de service level por sobre el total de respondidos/atendidos 
        Escenario: el total de los respondidos/atendidos aumenta cuando se responde/atiende un mensaje dentro de service level
            #TODO   
        Escenario: el total de los respondidos/atendidos aumenta cuando se responde/atiende un mensaje dentro fuera de service level
            #TODO   