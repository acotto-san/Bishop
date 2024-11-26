#language: es
@us:9015
Característica: Tener una columna que indique el tiempo que espera el cliente desde el priemr encolamiento hasta asignacion en agente
  Como supervisor de ySocial
  Quiero saber cuanto tiempo paso desde que se encolo el primer mensaje hasta que tuvo la asignacion de un agente que respondio
  Para poder medir la velocidad de la primer respuesta sin contar el tiempo del agente


    Regla de negocio: Si la primer respuesta es al primer mensaje encolado se le extrae diferencia entre fecha primer encolamiento y fecha ultimo desencolamiento

        @tc:9549
        Escenario: Primer mensaje encolado del caso está 5 minutos en la cola y luego el agente le responde
            Dado que a un agente le asignan el primer mensaje encolado del caso
            Y el mensaje estuvo 5 minutos en cola
            Cuando un agente le responde 
            Entonces la metrica dira 00:05:00

        @tc:9550
        Escenario: El agente responde un mensaje asignado después de 3 horas
            Dado que un agente tuvo asignado el primer mensaje encolado del caso durante 3 horas
            Y ese mensaje estuvo encolado solo 5 minutos
            Cuando el agente procede a responder el mensaje
            Entonces el valor de la celda será 5 minutos

        @tc:9551
        Escenario: Un mensaje con múltiples encolamientos muestra el tiempo total en la celda
            Dado que un mensaje representa el primer encolamiento del caso y ha tenido múltiples encolamientos
            Cuando el mensaje se desencola por última vez
            Entonces la celda mostrará el tiempo transcurrido desde que se encoló por primera vez hasta que se desencoló por última vez

        @tc:9552
        Escenario: No se calcula la métrica de encolamiento para casos que comienzan con un mensaje saliente
            Dado que el caso comenzó con un mensaje saliente
            Cuando se intenta calcular la métrica de encolamiento
            Entonces metrica dira -Sin Datos-

    Regla de negocio: Si hay agrupamientos la métrica arranca con el primer mensaje encolado y termina con el que al asignarse le ocupa un slot al agente

        @tc:9554
        Escenario: Agrupaciones en cola de mensajes entre el primer encolamiento y el último desencolamiento
            Dado que a un agente le asignaron un caso que tuvo agrupaciones en la cola
            Y los tiempos del caso fueron
                | nro mensaje | hora encolamiento | hora desencolamiento | ultima accion sobre mensaje    |
                | 1           | 12:00             | 12:01                | Agrupado en cola por mensaje 2 |
                | 2           | 12:01             | 12:04                | Asignacion al agente           |
            Cuando el agente procede a responder el mensaje
            Entonces la metrica dira 00:04

        @tc:9555
        Escenario: Agrupaciones en agente de mensajes entre el primer encolamiento y el último desencolamiento
            Dado que a un agente le asignaron el primer mensaje encolado del caso
                | hora de encolamiento | hora de asignacion |
                | 11:40:14             | 11:40:53           |
            Y el usuario envia un segundo mensaje que agrupa el primero en la pantalla del agente
            Cuando el agente procede a responder el mensaje
            Entonces la metrica dira 00:00:39

    Regla de negocio: La metrica contabiliza a pesar de que el caso posea descartes antes de la respuesta

        @tc:9556
        Escenario: El agente descarta el primer mensaje del caso y la metrica no se computa
            Dado que a un agente le asignaron el primer mensaje encolado de un caso
            Cuando el agente descarta ese mensaje
            Entonces metrica dira -Sin Datos- porque el caso ya contiene un mensaje descartado

        @tc:pendiente
        Esquema del escenario: El caso se cierra con un descarte sin respuestas
            Dado que un caso no tiene mensajes salientes de un agente
            Cuando el <usuario> descarta y cierra el caso
            Entonces metrica dira -Sin Datos- porque el caso no contiene respuestas

            Ejemplos: 
                | usuario    |
                | agente     |
                | supervisor |

        @tc:9557
        Escenario: El sistema realiza un descarte antes de la primer respuesta y agente responde
            Dado que a un agente le asignaron un caso con los siguientes mensajes
                | nro mensaje | hora encolamiento | hora desencolamiento | ultima accion sobre mensaje |
                | 1           | 15:48:52          | 15:50:56             | Descarte por Service Level  |
                | 2           | 15:57:45          | 15:57:47             | Asignacion al agente        |
            Cuando el agente procede a responder el mensaje
            Entonces la metrica el tiempo transcurrido desde 15:48:52 hasta 15:57:47

        @tc:9606
        Escenario: Un supervisor realiza un descarte antes de la primer respuesta y agente responde
            Dado que a un agente le asignaron un caso con los siguientes mensajes
                | nro mensaje | hora encolamiento | hora desencolamiento | ultima accion sobre mensaje     |
                | 1           | 16:29:48          | 16:30:08             | Descarte en cola por Supervisor |
                | 2           | 16:30:23          | 16:31:31             | Asignacion al agente            |
            Cuando el agente procede a responder el mensaje
            Entonces la metrica dira el tiempo transcurrido desde 16:29:48 hasta 16:31:31

        @tc:pendiente
        Escenario: Agente responde mensaje de un caso que ya tuvo fecha de asignación a agente
            Dado que a un agente le asignaron un caso con los siguientes mensajes
                | nro mensaje | hora encolamiento | hora desencolamiento | ultima accion sobre mensaje     |
                | 1           | 16:29:48          | 16:30:08             | Descarte por otro Agente        |
                | 2           | 16:30:23          | 16:31:31             | Asignacion al agente            |
            Cuando el agente procede a responder el mensaje
            Entonces la metrica dira el tiempo transcurrido desde 16:29:48 hasta 16:31:31
            

    Regla de negocio: La primera respuesta de un caso puede no ser un mensaje normal de un agente

        @tc:9558
        Escenario: Agente genera la primer respuesta del caso con una plantilla HSM
            Dado que a un agente le asignaron un mensaje de whatsapp que ingresó al sistema hace más de 24hs
            Y el mensaje asignado no se puede responder con un mensaje normal pero si con plantilla HSM
            Cuando el agente envíe la plantilla HSM convirtiendose en la primer respuesta de agente en el caso
            Entonces la metrica dira -Sin Datos-

        @tc:9559
        Escenario: La métrica no se contabiliza cuando un supervisor responde al primer mensaje encolado del caso
            Dado que un mensaje representa el primer encolamiento del caso
            Y el mensaje esta encolado
            Cuando un supervisor responde el mensaje desde la cola
            Entonces la metrica dira -Sin Datos-

    Regla de negocio: Cuando a un agente le toca responder y en el caso alguna entidad ya le respondio al usuario, entonces la metrica se calcula igual
        
        @tc:9553
        Escenario: Se calcula la métrica de un caso que inicio por bot
            Dado que un caso inicio a las 10:00 en el bot
            Y el caso se encolo a las 12:00 por primera vez
            Cuando el agente reciba la asignacion del primer mensaje encolado a las 12:02
            Y procede a responderlo
            Entonces la metrica dira 00:02

        @tc:9611
        Escenario: Agente genera la primer respuesta a un caso que contiene respuestas automáticas del sistema
            Dado que a un agente le asignaron el primer mensaje encolado de un caso
            Pero a dicho mensaje el sistema ya le envió una respuesta automática
            Cuando el agente procede a responder el mensaje
            Entonces la metrica dira el tiempo transcurrido desde el primer encolamiento y la ultima asignación

        @tc:9613
        Escenario: Agente genera la primer respuesta a un caso que contiene respuestas de un supervisor
            Dado que a un agente le asignaron un caso sin respuesta de agente
            Y en dicho caso ya hay una respuesta de un supervisor
                | nro mensaje | hora encolamiento | hora desencolamiento | ultima accion sobre mensaje      |
                | 1           | 16:29:48          | 16:30:08             | Respuesta en cola por Supervisor |
                | 2           | 16:30:23          | 16:31:31             | Asignacion al agente             |
            Cuando el agente procede a responder el mensaje asignado
            Entonces la metrica dira el tiempo transcurrido desde 16:29:48 hasta 16:31:31
