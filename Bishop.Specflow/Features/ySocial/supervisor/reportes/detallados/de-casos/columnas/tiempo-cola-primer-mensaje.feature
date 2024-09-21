#language: es
@us:9015
Característica: Tener una columna que muestre cuanto tiempo paso encolado el primer mensaje que fue respondido del caso
  Como supervisor de ySocial
  Quiero saber cuanto tiempo paso desde que se encolo el primer mensaje hasta que tuvo la asignacion de un agente que respondio
  Para poder medir la velocidad de la primer respuesta sin contar el tiempo del agente


    Regla de negocio: Si la primer respuesta es al primer mensaje encolado se le extrae diferencia entre fecha primer encolamiento y fecha ultimo desencolamiento

        @tc:9549
        Escenario: Primer mensaje encolado del caso está 5 minutos en la cola y luego el agente le responde
            Dado que un mensaje es el primer encolado del caso y permanece 5 minutos en la cola
            Cuando un agente le responde dentro de esos 5 minutos
            Entonces se verá 5 minutos de encolamiento en la celda correspondiente

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
            Entonces la celda en el reporte mostrará un 0

    Regla de negocio: Aunque un caso tenga respuestas de bot la metrica intenta capturar el tiempo de primera respuesta de agente

        @tc:9553
        Escenario: Se calcula la métrica de un caso que inicio por bot
            Dado que un caso inicio a las 10:00 en el bot
            Y el caso se encolo a las 12:00 por primera vez
            Cuando el agente reciba la asignacion del primer mensaje encolado a las 12:02
            Y procede a responderlo
            Entonces la metrica dira 00:02

    Regla de negocio: Si hay agrupamientos la métrica arranca con el primer mensaje encolado y termina con el que sera respondido

        @tc:9554
        Escenario: Agrupaciones en cola de mensajes entre el primer encolamiento y el último desencolamiento
            Dado que a un agente le asignaron un caso que tuvo agrupaciones en la cola
            Y los tiempos del caso fueron
                | primer encolamiento    | 12:00 |
                | ultimo desencolamiento | 12:04 |
            Cuando el agente procede a responder el mensaje
            Entonces la metrica dira 00:04

        @tc:9555
        Escenario: Agrupaciones en agente de mensajes entre el primer encolamiento y el último desencolamiento
            Dado que a un agente le asignaron un caso que tuvo agrupaciones en la cola
            Y los tiempos del caso fueron
                | primer encolamiento    | 12:00 |
                | ultimo desencolamiento | 12:04 |
            Cuando le cae un nuevo mensaje más del usuario agrupandose a las 12:07
            Y el agente procede a responder el mensaje
            Entonces la metrica dira 00:07

    Regla de negocio: No contabilizar la métrica si hay un descarte antes de que un mensaje entrante sea respondido por un agente

        @tc:9556
        Escenario: El agente descarta el primer mensaje del caso
            Dado que a un agente le asignaron el primer mensaje encolado de un caso
            Cuando el agente descarta ese mensaje
            Entonces la celda en el reporte mostrará un 0

        @tc:9557
        Escenario: El descarte del sistema no afecta la métrica
            Dado que a un agente le asignaron un caso con los siguientes mensajes
                | nro mensaje | hora encolamiento | hora desencolamiento | ultima accion sobre mensaje |
                | 1           | 12:00             | 12:02                | Descarte por Service Level  |
                | 2           | 12:05             | 12:06                | Asignacion al agente        |
            Cuando el agente procesde a responder el mensaje
            Entonces la metrica dira 00:06

    Regla de negocio: La primera respuesta de un caso puede no ser un mensaje normal de un agente

        @tc:9558
        Escenario: Agente genera la primer respuesta del caso con una plantilla HSM
            Dado que se ha configurado una ventana de respuesta de 24 horas
            Cuando la respuesta no es de un agente
            Y el tiempo de respuesta supera las 24 horas
            Entonces la celda en el reporte mostrará un 0

        @tc:9559
        Escenario: La métrica no se contabiliza cuando un supervisor responde al primer mensaje encolado del caso
            Dado que un mensaje representa el primer encolamiento del caso
            Y el mensaje esta encolado
            Cuando un supervisor responde el mensaje desde la cola
            Entonces la celda en el reporte mostrará un 0
