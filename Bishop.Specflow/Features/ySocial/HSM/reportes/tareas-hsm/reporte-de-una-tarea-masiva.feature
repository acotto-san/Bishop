# language: es
@us:5171
Característica: El supervisor puede ver en el reporte el resultado de los envios del hsm
    Como supervisor
    Quiero poder ver en un reporte el resultado del envio
    Para saber si el envio fue exitoso o no

    Regla de negocio: Se pueden ver en el reporte "TAREAS DE ENVÍO MASIVO DE PLANTILLA DE MENSAJES (HSM)" los resultados del envio

        @tc:8348
        Escenario: Supervisor saca un reporte
            Dado que un supervisor pide un reporte de "tareas de envio masivo de plantillas de mensajes (HSM)"
            Cuando vea el reporte
            Entonces debera ver los resultados de los envios hechos

        @tc:8349
        Escenario: Supervisor exporta el reporte
            Dado que un supervisor exporta el reporte de "tareas de envio masivo de plantillas de mensajes (HSM)"
            Cuando descargue el archivo
            Entonces debera ver los mismos resultados que ve en el reporte web
