# language: es
Característica: tiempo de lectura
    Como supervisor 
    Quiero tener una columna de tiempo de trabajo de lectura
    Para saber cuanto cuanto tiempo se paso el agente desde que abrio el mensaje hasta que empezo a redactar la respuesta

    Las pruebas deben incluir el check de tiempos de mensaje. Verificar reporte online, exportar visible/completo, diario y programado.
    Mapa de tiempos: https://wbd.ms/share/v2/aHR0cHM6Ly93aGl0ZWJvYXJkLm1pY3Jvc29mdC5jb20vYXBpL3YxLjAvd2hpdGVib2FyZHMvcmVkZWVtLzJmNDY4NjE0N2ZjMDQ3YWFiOWE0NGU4Y2ZmNjE3ZTU3X0JCQTcxNzYyLTEyRTAtNDJFMS1CMzI0LTVCMTMxRjQyNEUzRF8wZWY5OWY2YS0yODhlLTQ3M2MtYjRhMS05NjZlNzlkYWRhZTc=
  
    Regla: el ingreso a la conversación puede ser accionado por el agente y empieza el contador

        @tc:6662
        Escenario: agente hace click en la asignacion e inicia el contador
            Dado que en la configuracion no hay autolectura de mensajes
            Y un agente se encuentra con todos sus slots libres
            Cuando se le asigna un mensaje
            Y el agente hace click en el icono de la conversacion
            Entonces debera empezar el contador del tiempo de lectura

    Regla: el ingreso a la conversación ocurre de manera automatica y empieza el contador

        @tc:6663
        Escenario: se autolee el mensaje e inicia el contador
            Dado que en la configuracion esta habilitada la autolectura de mensajes
            Y un agente se encuentra con todos sus slots libres
            Cuando se le asigna un mensaje
            Y se autolee
            Entonces debera empezar el contador del tiempo de lectura

        @tc:6664
        Escenario: la lectura de otro mensaje no detiene un contador previo
            Dado que el agente recibe dos casos asignados
            Y la autolectura del primer mensaje comienza el contador
            Cuando el agente hace click en el segundo caso
            Entonces el contador del primer mensaje no se detiene

    Regla: hay diferentes maneras validas de pararlo. Estas diferencias varian según modo normal o modo chat.

        @tc:6665
        Esquema del escenario: en modo normal el agente hace click en el control y detiene el contador
            Dado un servicio en modo normal
            Y un agente con el contador de tiempo de lectura de un mensaje activado
            Cuando hace click en el control de <control> 
            Y se abre el textarea
            Entonces se detiene el contador del tiempo de lectura.
                
            Ejemplos:
                | control                 |
                | responder               |
                | responder con plantilla |
                | descartar               |
                | devolver                |
                | transferir              |

        @tc:6666
        Escenario: en modo chat el agente hace click en la flecha de responder y detiene el contador
            Dado un servicio en modo chat
            Y un agente con el contador de tiempo de lectura de un mensaje activado
            Cuando hace click en la flecha para enviar la respuesta
            Entonces se detiene el contador del tiempo de lectura.

        @tc:6667
        Esquema del escenario: el agente hace click en un control de abajo en modo chat y detiene el contador
        Revisar cuando se finalizo de leer en el historico de estados
            Dado un agente con el contador de tiempo de lectura de un mensaje activado
            Cuando hace click a los 2 minutos de iniciarse en el boton <control>
            Y pasado un minuto hace click en otro boton
            Entonces se detiene el contador del tiempo de lectura a los 2 minutos

            Ejemplos:
                | control    |
                | devolver   |
                | transferir |
                | descartar  |

        @tc:6668
        Escenario: en modo chat se desasigna por timer del agente y se detiene contador
            Dado un servicio en modo chat
            Y un agente con el contador de tiempo de lectura de un mensaje activado
            Cuando se desasigna el mensaje por el timer del agente
            Entonces se detiene el contador del tiempo de lectura

        @tc:6669 
        Escenario: supervisor desasigna el mensaje y se detiene el contador
            Dado un agente con el contador de tiempo de lectura de un mensaje activado
            Cuando un supervisor desasigna el mensaje
            Y cierra el caso
            Entonces se detiene el contador del tiempo de lectura

    Regla: hay maneras invalidas de parar el contador, que hace que no se compute el tiempo 

        @tc:6670
        Escenario: agente se desconecta y el tiempo es ignorado
            Dado un agente con el contador de tiempo de lectura de un mensaje activado
            Cuando el agente piede conexion/cierra la pestaña
            Entonces el tiempo contado es ignorado

        @tc:7291
        Escenario: Mensaje agrupado en agente con modo chat ignora el tiempo de lectura
            Dado un mensaje asignado a un agente que lleva 2min de lectura
            Cuando se asigna un nuevo entrante y agrupa al mensaje anterior 
            Entonces el primer mensaje no tendra tiempo de lectura

    Regla: si el contador se detuvo de manera válida entonces puede sumarse a futuros segmentos

        @tc:6671
        Escenario: se devuelve el mensaje a la cola y se suman los tiempos de lectura
            Dado que el agente A detiene el contador de tiempo de lectura del mensaje 2356 a los 2 minutos
            Cuando <sujeto> devuelve el mensaje a la cola
            Y el agente B comienza y detiene validamente el contador de tiempo de lectura lectura a los 3 minutos
            Entonces el tiempo contado de lectura del mensaje 2356 sera de 5 minutos
        
            Ejemplos:
                | sujeto                       |
                | supervisor                   |
                | agente A                     |
                | timer de agente  - modo chat |
                | cierre de pestaña            |
                | corte de conexion            |

    Regla: Un mensaje podría perder su chance de comenzar el contador

        @tc:6672 
        Escenario: un mensaje agrupado no contabiliza su tiempo de lectura
            Dado que el mensaje 2345 se encuentra encolado
            Cuando se agrupa el mensaje 2346 en la cola
            Entonces el mensaje 2345 nunca comenzara su contador de tiempo de lectura