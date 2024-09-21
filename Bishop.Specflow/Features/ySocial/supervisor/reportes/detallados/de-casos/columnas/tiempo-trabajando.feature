# language: es
Característica: Columna "Tiempo trabajando" en el Detallado de Casos
    Como supervisor 
    Quiero tener una columna de tiempo de trabajando del caso
    Para saber cuanto tiempo pasa trabajando un agente sus mensajes 

    Mapa de tiempos: https://wbd.ms/share/v2/aHR0cHM6Ly93aGl0ZWJvYXJkLm1pY3Jvc29mdC5jb20vYXBpL3YxLjAvd2hpdGVib2FyZHMvcmVkZWVtLzJmNDY4NjE0N2ZjMDQ3YWFiOWE0NGU4Y2ZmNjE3ZTU3X0JCQTcxNzYyLTEyRTAtNDJFMS1CMzI0LTVCMTMxRjQyNEUzRF8wZWY5OWY2YS0yODhlLTQ3M2MtYjRhMS05NjZlNzlkYWRhZTc=

    Regla:  Es la suma del tiempo total del operador de los mensajes de un caso. El tiempo total del operador está compuesto por: Tiempo sin leer, de lectura y tiempo de trabajo. 
        
        @tc:6679    
        Esquema del escenario: se suman los tiempos totales del operador
            Dado un caso 41070 en <modo> tiene los siguientes mensajes y tiempos
            | nro | tiempo total de operador |
            | 1   | 3 min                    |
            | 2   | 4 min                    |
            | 3   | 2 min                    |
            Cuando un supervisor busca el reporte detallado del caso
            Entonces el tiempo trabajando deberia ser "00:09:00.ms"

            Ejemplos: 
                | modo   |
                | chat   |
                | normal |

        @tc:7290
        Esquema del escenario: El tiempo de operador de un mensaje descartado sera sumado si lo descarta el agente
            Dado un caso que posee los siguientes mensajes y tiempos
                | nro | tiempo total en operador | estado final gestionado        |
                | 1   | 3 min                    | respondido/atendido por agente |
                | 2   | 4 min                    | respondido/atendido por agente |
                | 3   | 10 min                   | descartado por <autor>         |
            Cuando un supervisor busca el reporte detallado del caso
            Entonces el tiempo trabajando deberia ser "00:<min>:00.ms"

            Ejemplos: 
                | autor      | min |
                | agente     | 17  |
                | supervisor | 17  |

   Regla: El tiempo trabajando no puede ser mayor que la duracion del caso
        
        @tc:6680
        Esquema del escenario: verificar que el tiempo sea menor que la duracion del caso
            Dado un caso de modo <modo> con tiempo trabajando de "00:09:00.ms"
            Cuando el supervisor verifica el modal de Datos del caso
            Entonces el tiempo trabajando debe ser menor que la duracion del caso
            
            Ejemplos: 
                | modo   |
                | chat   |
                | normal |

