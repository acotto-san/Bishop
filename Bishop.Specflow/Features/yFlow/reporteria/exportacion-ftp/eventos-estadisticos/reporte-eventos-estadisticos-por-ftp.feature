# language: es
Característica: reporte de eventos estadisticos por ftp
    Como supervisor 
    Quiero que al finalizar el dia se envie por ftp un reporte de eventos estadisticos
    Para tener automaticamente un reporte de las metricas del dia que acaba de cerrar


    Escenario: reporte de eventos muetra interacciones en las zonas limite de la franja horaria
        Dado que en un flujo se ejecuto el evento estadistico "evento bienvenida" en los siguientes horarios:
            |horario    |
            |0015       |
            |0045       |
            |2315       |
            |2345       |
        Cuando se genera el reporte al finalizar el dia
        Entonces en su contenido tendra los siguientes registros:
            |intervalo  |evento             |
            |30         |evento bienvenida  |
            |100        |evento bienvenida  |
            |2330       |evento bienvenida  |
            |0          |evento bienvenida  |