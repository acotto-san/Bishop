#language: es 
Característica: Tiempo en Cola 
    Como supervisor 
    Quiero tener una columna de tiempo en cola en el detallado de colas
    Para saber cuanto tiempo estuvo encolado el caso

    El reporte debe incluir el check de tiempos.
    Se pueden ejecutar pruebas de la misma columna en el detallado de mensajes del caso para verificar consistencia.

    Regla: Es la suma del tiempo en cola de todos los mensajes del caso.
            
        @tc:6610
        Escenario: se encolan multiples mensajes en un caso
            Dado un caso 40687 que contiene los siguientes mensajes:
            | # | tiempo en cola | estado siguiente                                                                |
            | 1 | 2 minutos      | asignado a agente                                                               |
            | 2 | 3 minutos      | agrupado por mensaje #3                                                         |
            | 3 | 2 minutos      | asignado a agente (tiene que finalizar/descartar para lograr la accion del 4to) |
            | 4 | 2 minutos      | descartado por supervisor                                                       |
            Cuando se cierra el caso
            Entonces en la columna de tiempo en cola del caso 40687 debera verse "00:09:00.ms"
                
            
