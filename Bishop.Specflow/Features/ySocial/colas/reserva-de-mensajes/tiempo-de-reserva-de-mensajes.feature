#language: es 
@us:6537
Característica: Tiempos de Reserva de mensajes
    Se va a agregar un check a la cola, que va a modificar la forma en que se marca la reserva de mensajes cuando el mensaje esta en cola, y se agrupan nuevos mensajes.
    Actualmente el tiempo de reserva se renueva cuando se agrupa un mensaje, pero se deberia medir el tiempo de reserva desde el primer mensaje en cola cuando el check esté activado.

Regla: Se puede habilitar un check en la cola para que el tiempo de reserva se renueve ante mensajes agrupados en cola

    @tc:6863
    Escenario: mensaje agrupado renueva reserva de mensaje encolado
        Dado que el check de renovar reserva al agrupar esta habilitado en la cola
        Y la marca de reserva se quita a los 15 minutos
        Cuando usuario manda los siguientes mensajes:
        | nro | hora | estado                      |
        | 1   | 10:00| se encola                   |
        | 2   | 10:05| agrupa mensaje 1 en la cola |
        | 3   | 10:15| agrupa mensaje 2 en la cola |
        Entonces el tiempo de reserva se renueva hasta las 10:30
        
    @tc:6864
    Escenario: reserva generada por un supervisor es renovada cuando ocurren agrupamientos en la cola
        Dado que el check de renovar reserva al agrupar esta habilitado en la cola
        Y a los 15 minutos vencio la reserva de un mensaje al agente Poo Chie
        Cuando un supervisor reserva el mensaje a Patiño en la misma cola a las 10:00 
        Y un segundo mensaje se agrupa en cola a las 10:10
        Entonces el tiempo de reserva a Patiño se renueva hasta las 10:25
        
    @tc:6865
    Escenario: reserva renovada en segundo encolamiento
        Dada las siguientes colas
            | nombre cola | tiempo de reserva | renovar reserva al agrupar |
            | Cola B      | 15                | N/A                        |
            | Cola C      | 5                 | habilitado                 |
        Y un mensaje vencio su reserva en cola B
        Cuando un supervisor transfiere el mensaje a la cola C 
        Y reserva el mensaje a un agente a las 10:00
        Y se agrupa un segundo mensaje en cola a las 10:03
        Entonces la reserva del ultimo mensaje vencera a las 10:08

Regla: Por default la reserva no renueva sus minutos con los mensajes agrupados en cola - check deshabilitado
    
    @tc:6866
    Escenario: nuevo mensaje no genera reserva ya que hay una actualmente
        Dado que el check de renovar reserva al agrupar esta deshabilitado en la cola
        Y la marca de reserva se quita a los 15 minutos
        Cuando usuario manda los siguientes mensajes:
        | nro | hora | estado                        |
        | 1   | 10:00| se encola e inicia la reserva |
        | 2   | 10:05| agrupa mensaje 1 en la cola   |
        | 3   | 10:10| agrupa mensaje 2 en la cola   |
        Entonces no se renueva el tiempo de reserva
        Y el vencimiento de la reserva es a las 10:15

    @tc:6867
    Escenario: reserva generada por un supervisor no es renovada cuando ocurren agrupamientos en la cola
        Dado que el check de renovar reserva al agrupar esta deshabilitado en la cola
        Y a los 15 minutos vencio la reserva de un mensaje al agente Poo Chie
        Cuando un supervisor reserva el mensaje a Patiño en la misma cola a las 10:00 
        Y un segundo mensaje se agrupa en cola a las 10:10
        Entonces no se renueva el tiempo de reserva
        Y el tiempo de reserva a Patiño vence a las 10:15

    @tc:6868 
    Escenario: mensaje sera reservado por segunda vez al tener un segundo encolamiento
        Dada las siguientes colas
            | nombre cola | tiempo de reserva | renovar reserva al agrupar |
            | Cola B      | 15                | N/A                        |
            | Cola C      | 5                 | deshabilitado              |
        Y un mensaje vencio su reserva en cola B
        Cuando un supervisor transfiere el mensaje a la cola C 
        Y reserva el mensaje a un agente a las 10:00
        Y se agrupa un segundo mensaje en cola a las 10:03
        Entonces la reserva del ultimo mensaje vencera a las 10:05

    @tc:6869
    Escenario:nuevo agrupamiento instaura una nueva reserva luego de que el mensaje viejo agoto su reserva
        Dado que un mensaje A vencio su reserva en cola
        Cuando un mensaje B ingresa y agrupa al primero
        Entonces la reserva comenzara de nuevo al momento del encolamiento del mensaje B

Regla: Si no se agrupan mensajes en la cola. La reserva vence a los minutos configurados.

    @tc:6870
    Esquema del escenario: mensaje encolado sin agrupar vence segun su tiempo configurado
        Dado que el check de mensajes agrupados esta <estado> en la cola
        Y la marca se quita a los 15 minutos
        Cuando un mensaje queda encolado a las 10:00
        Entonces su reserva vence a las 10:15

        Ejemplos:
        | estado        |
        | habilitado    |
        | deshabilitado |