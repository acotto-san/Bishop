# language: es
Característica: Tiempo sin leer
Como supervisor 
    Quiero tener una columna de tiempo sin leer en el Detallado de mensajes 
    Para saber cuanto tiempo estuvo sin lectura
    
    Las pruebas deben incluir el check de tiempos de mensaje. Verificar reporte online, exportar visible/completo, diario y programado.
    Mapa de tiempos: https://wbd.ms/share/v2/aHR0cHM6Ly93aGl0ZWJvYXJkLm1pY3Jvc29mdC5jb20vYXBpL3YxLjAvd2hpdGVib2FyZHMvcmVkZWVtLzJmNDY4NjE0N2ZjMDQ3YWFiOWE0NGU4Y2ZmNjE3ZTU3X0JCQTcxNzYyLTEyRTAtNDJFMS1CMzI0LTVCMTMxRjQyNEUzRF8wZWY5OWY2YS0yODhlLTQ3M2MtYjRhMS05NjZlNzlkYWRhZTc=

    Regla: asignacion puede ser accionada por el agente y empieza el contador
        
        @tc:6649
        Escenario: agente activa slot y se asigna mensaje encolado
            Dado un agente que no esta mirando las conversaciones de su web
            Y tiene un mensaje encolado esperando agruparse
            Cuando el agente activa el slot 
            Y se agrupa el mensaje 
            Entonces empieza su contador de tiempo sin lectura

        @tc:6650
        Escenario: agente cambia de estado a disponible e inicia contador
            Dado un agente en estado no disponible
            Y un mensaje en colado 
            Cuando se pone en estado disponible
            Y se le asigna un mensaje nuevo
            Entonces empieza su contador de tiempo sin lectura

        @tc:6651
        Escenario: agente libera un slot y se asigna nuevo mensaje
            Dado un agente que tiene todos los slots ocupados
            Y un mensaje nuevo encolado
            Cuando libera un slot
            Y el nuevo mensaje se asigna
            Entonces empieza su contador de tiempo sin lectura

    Regla: asignacion ocurre de manera automatica y empieza el contador
        
        @tc:6652
        Escenario: agente sin casos, se le asigna un mensaje e inicia contador
            Dado un agente sin casos en estado disponible
            Cuando se le asigna un mensaje
            Entonces empieza su contador de tiempo sin lectura

        @tc:6653
        Escenario: agente trabajando un mensaje y se le asigna uno nuevo
            Dado un agente que esta disponible
            Y esta trabajando un mensaje en el slot 1
            Cuando se le asigna un mensaje nuevo en el slot 2
            Entonces empieza su contador de tiempo sin lectura

    Regla: hay diferentes maneras validas de pararlo
        
        @tc:6654
        Escenario: agente marca mensaje como leido y detiene contador
            Dado un agente que tiene un mensaje asignado en slot 1
            Y su contador de tiempo sin leer activo
            Cuando hace click en el caso
            Entonces se detiene el tiempo sin lectura

        @tc:6655
        Escenario: tiempo sin lectura se detiene al agrupar mensaje encolado
            Dado un agente que tiene un mensaje asignado sin leer
            Y un mensaje encolado esperando agruparse a ese mensaje
            Cuando hace click en el caso
            Y se agrupa el mensaje
            Entonces se detiene el tiempo sin lectura

    Regla: hay maneras invalidas de parar el contador, que hace que no se compute el tiempo 

        @tc:6656 @deudatecnica
        Escenario: supervisor desasigna el mensaje y se ignora el contador
            Dado un agente que tiene un mensaje sin leer
            Y el contador de tiempo sin lectura estaba activo
            Cuando el supervisor desasigna ese mensaje
            Entonces el tiempo contado se ignora

        @tc:6657 @deudatecnica
        Escenario: en modo chat el timer del agente desasigna el mensaje
            Dado un servicio configurado en modo chat
            Y un agente que tiene un mensaje sin leer
            Y el contador de tiempo sin lectura estaba activo
            Cuando el mensaje se desasigna por el timer - temporizador - del agente
            Entonces se ignora el tiempo contado

        @tc:6658
        Escenario: el agente se desconecta o cierra su pestaña
            Esto podría ser deuda técnica, cuando salga la oportunidad discutirlo en equipo
            Dado un agente que tiene un mensaje sin leer
            Y el contador de tiempo sin lectura estaba activo
            Cuando el agente pierde conexion/cierra su pestaña
            Entonces se ignora el tiempo contado

    Regla: si el contador se detuvo de manera válida entonces puede sumarse a futuros segmentos
        
        @tc:6659
        Esquema del escenario: se devuelve el mensaje y suma los segmentos de tiempo sin lectura
            Dado que el agente A detiene el contador de tiempo sin lectura del mensaje 2356 a los 2 minutos
            Cuando <sujeto> devuelve el mensaje a la cola
            Y el agente B comienza y detiene validamente el contador de tiempo sin lectura a los 3 minutos
            Entonces el tiempo contado sin lectura del mensaje 2356 sera de 5 minutos
    
            Ejemplos:
                | sujeto                           |
                | supervisor                       |
                | agente A                         |
                | timer de agente - solo modo chat |
                | cierre de pestaña                |
                | corte de conexión                |

    Regla: un mensaje podría perder su chance de comenzar el contador
        
        @tc:6660
        Escenario: se agrupa el mensaje y nunca inicia el contador de tiempo sin lectura
            Dado que el mensaje 2344 se encuentra encolado
            Cuando se agrupa el mensaje 2345 en la cola
            Entonces el mensaje 2344 nunca comenzara su contador de tiempo sin lectura