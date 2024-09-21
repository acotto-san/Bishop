#language: es 
Característica: Tiempo en Cola 
    Como supervisor 
    Quiero tener una columna de tiempo en cola en el Detallado de mensajes 
    Para saber cuanto tiempo estuvo el mensaje encolado
    
    Las pruebas deben incluir el check de tiempos de mensaje. Verificar reporte online, exportar visible/completo y programado.
    Mapa de tiempos: https://wbd.ms/share/v2/aHR0cHM6Ly93aGl0ZWJvYXJkLm1pY3Jvc29mdC5jb20vYXBpL3YxLjAvd2hpdGVib2FyZHMvcmVkZWVtLzJmNDY4NjE0N2ZjMDQ3YWFiOWE0NGU4Y2ZmNjE3ZTU3X0JCQTcxNzYyLTEyRTAtNDJFMS1CMzI0LTVCMTMxRjQyNEUzRF8wZWY5OWY2YS0yODhlLTQ3M2MtYjRhMS05NjZlNzlkYWRhZTc=

    Regla: El tiempo del mensaje en cola comienza en el encolamiento y finaliza cuando cambia de estado, deja de estar encolado.

        @tc:6602
        Escenario: el mensaje se asigna a un agente y se detiene el contador
            Dado el mensaje 2345 entra a la cola B a las 12:30
            Y no hay agentes disponibles en la cola B
            Cuando el agente Poochie pasa a estado disponible
            Y el mensaje es asignado a las 12:35
            Entonces en la columna de tiempo en cola debera verse "00:05:00.ms"

        @tc:6603
        Esquema del escenario: el supervisor detiene el contador
            Dado el mensaje 2346 entra a la cola B a las 12:00
            Y no hay agentes disponibles en la cola B
            Cuando un supervisor <accion> el mensaje a las 12:02
            Entonces en la columna de tiempo en cola debera verse "00:02:00.ms"

            Ejemplos:
            | accion   |
            | descarta |
            | responde |  

        @tc:6604
        Escenario: ingresa un mensaje que agrupa y se detiene el contador
            Dado el mensaje 1 entra a la cola B a las 12:00
            Y el mensaje 2 se agrupa en la cola a las 12:01
            Y no hay agentes disponibles en la cola B
            Cuando el agente Poochie pasa a estado disponible a las 12:04
            Y el mensaje 2 se asigna agrupando a los anteriores
            Entonces en la columna de tiempo en cola del mensaje 1 debera verse "00:01:00.ms"

    Regla: si el contador se detuvo de manera válida entonces puede sumarse a futuros segmentos
        
        @tc:6706
        Escenario: Todavia no termina la gestion del segundo segmento y no suma el tiempo del mismo
            Este es un escenario complejo debido a que se debe que tener en cuenta que el segundo segmento
            seria desde que VUELVE a encolarse hasta que deja de estar vinculado a la cola 
            (porque se respondio/descarto/transfirio a otra cola/ se retorno desde el agente otra vez*aca seguiria en la cola). 
            Por ende hasta que el segmento no termine (por mas que en pestaña "tiempo" de datos del mensaje ya tenga data)
            esta no se suma al total de la celda hasta que el fin del segmento haya ocurrido. 
            A continuacion describo un escenario donde no se suma por no haber terminado el segmento
           
            Dado que un mensaje en su primer segmento acumulo 1 minuto en cola
            Y el agente lo retorno a la misma comenzando su segundo segmento
            Cuando se asigne el mensaje a un nuevo agente
            Y haya registrado 3 minutos en cola para su segundo semgento
            Entonces la celda de "tiempo total en cola" continuara diciendo 1 minuto

        @tc:6605
        Esquema del escenario: Mensaje es transferido a otra cola y se suman los tiempos en cola de ambos segmentos
            Dado el mensaje 27345 entra a la cola B a las 12:00
            Cuando el mensaje es transferido a la cola C a las 12:05 por <sujeto>
            Y es asignado a un agente de la cola C a las 12:10
            Y el agente descarta el mensaje
            Entonces en la columna de tiempo en cola debera verse "00:10:00.ms"

            Ejemplos:
                | sujeto     |
                | supervisor |
                | sistema    |   
            
        @tc:6760
        Escenario: Mensaje es transferido por agente y se suman los tiempos en cola de ambos segmentos
            Dado que un agente recibio la asignacion de un mensaje que tuvo 5 minutos de tiempo encola
            Y lo transfirio a una cola diferente
            Cuando el mensaje se vuelva a asignar luego de haber acumulado 2 minutos de tiempo en cola 
            Entonces en la columna de tiempo en cola debera verse "00:07:00.ms"

        @tc:6606 
        Escenario: Mensaje es devuelto a la cola y su tiempo en cola es la suma de ambos segmentos
            Dado el mensaje 27346 entra a la cola B a las 12:30
            Y es asignado por Poochie a las 12:35
            Cuando el mensaje es devuelto a la cola por Poochie 12:36
            Y es asignado a un agente de la cola a las 12:41
            Y el agente descarta el mensaje
            Entonces en la columna de tiempo en cola debera verse "00:10:00.ms"

    Regla: Un mensaje puede tener la columna vacía en tiempo en cola

        @tc:6607 
        Escenario: mensaje gestionado por un bot
            Dado un usuario interactua con un bot
            Cuando envia el mensaje 27347
            Entonces la columna de tiempo en cola debera verse vacio
        
        @tc:6608 
        Escenario: mensaje no entrante
            Dado un mensaje 27348 entra a la cola B
            Cuando se envia un mensaje saliente 27349 al mismo caso por sistema - service level
            Entonces la columna de tiempo en cola de 27349 debera verse vacio

        @tc:6609 
        Escenario: mensaje agrupado tiene columna vacía hasta que se gestione su cabecera
            Dado un mensaje 27350 ingresa a la cola a las 12:30
            Cuando es agrupado por el mensaje 27351 en la cola a las 12:32
            Y no es asignado a ningun agente
            Entonces la columna de tiempo en cola de 27350 debera verse vacio