#language:es
@us:6453
Característica: Columna mensajes rechazados

    La columna mensajes rechazados registra aquellos mensajes que fueron rechazados por Meta y que no fueron enviados a los contactos.

    Los mensajes que son rechazados por Meta con mayor frecuencia son por un tipo de teléfono inválido como uno fijo o un número que no recibe mensajes de Whatsapp.

Regla: Son rechazados los mensaje cuando Meta al intentar el envío lo considera inválido

    @tc:7117
    Escenario: se registran mensajes rechazados por parámetros inválidos
        Dado un supervisor carga el siguiente csv
        Y usan la plantilla "test_header_multi_video":
            """
                5491126333583,video,NOMBREDELVIDEO,1,param1,param2,button
                5491158638852,video,NOMBREDELVIDEO,1,param1,param2,button
            """
        Cuando se termine de ejecutar la tarea
        Entonces los mensajes seran rechazados

    @tc:7118
    Escenario: se registran mensajes rechazados por tener números de teléfono fijo
        Dado un supervisor carga un csv con 3 registros de telefono fijo
        Cuando se termina de ejecutar la tarea
        Entonces los 3 mensajes seran rechazados

    @tc:7119
    Escenario: se registran mensajes válidos no rechazados por Meta
        Dado un supervisor carga una tarea con parametros y numeros de telefono validos
        Cuando se termina de ejecutar la tarea
        Entonces los mensajes seran enviados por Meta

Regla: La columna rechazados suma 1 por cada registro que Meta considera inválido  
   
    @tc:7120 
    Escenario: la columna mensajes rechazados suma uno
        Dado un supervisor carga una tarea con 10 registros
        Y 1 de ellos es un destinatario no valido para Meta
        Cuando se termina de ejecutar la tarea
        Entonces el reporte online suma uno en la columna de mensajes rechazados

    @tc:7121
    Escenario: la columna de mensajes rechazado no tiene registros
        Dado un supervisor carga una tarea con 10 registros
        Cuando termine de ejecutar las tarea
        Y todos los mensajes son enviados
        Entonces el reporte online tiene 0 registros en la columna de mensajes rechazados

Regla: Se visualiza el código de error y el mensaje de error en el reporte completo/diario
    
    @tc:7122
    Escenario: aparece el código de error del mensaje en los reportes
        Dado un supervisor carga una tarea con 1 registro rechazado
        Cuando se termina de generar el reporte <tipo de reporte> de esa tarea
        Entonces aparecera el codigo de error de Meta de ese mensaje

            Ejemplos:
                | tipo de reporte    |
                | diario             |
                | exportado completo |
