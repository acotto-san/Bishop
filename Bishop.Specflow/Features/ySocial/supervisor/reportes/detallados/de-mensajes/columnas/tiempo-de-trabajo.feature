# language: es
Característica: tiempo de trabajo
    Como supervisor 
    Quiero tener una columna de tiempo de trabajo del mensaje en el Reporte Detallado de Mensajes
    Para saber cuanto tiempo estan demorando los agentes en responder los mensajes


    Regla: si el servicio es modo normal contabiliza desde que el agente hace click en responder y finaliza cuando hace click en responder/responder y cerrar
        
        @tc:6673
        Esquema del escenario: mensaje asignado cambia a estado respondido y se modifica el tiempo de trabajo
            Como algunos botones tienen modal de confirmación y otros no, se decidió especificar que 
            la ultima accion es el click que genera el cambio de estado del mensaje (a descartado/encolado/respondido).
            Por lo tanto puede ser en el último responder, como el click de confirmación en el modal de descartar, etc.
            Dado que un agente tiene asignado el mensaje "154004"
            Y hace click en el boton <nombreBoton> 
            Cuando transcurren 20 segundos desde el clickeo en el boton <nombreBoton>
            Y realiza la ultima accion antes de cambiar el estado del mensaje 
            Entonces en la columna "Tiempo de trabajo" debe verse "00:00:20.ms"
            
            Ejemplos:
                | nombreBoton             |
                | responder               |  //no tiene modal de confirmacion
                | responder con plantilla |  //no tiene modal de confirmacion   
                | descartar               |  //tiene modal de confirmacion
                | devolver                |  //tiene modal de confirmacion
                | transferir              |  //tiene modal de confirmacion
    
    Regla: en modo chat se contabiliza desde que se manda un mensaje de respuesta hasta que el asignado deja de estar en ese estado
        
        @tc:6674
        Escenario: mensaje asignado cambia a estado atendido por agrupacion de nuevo mensaje entrante y consolida tiempo de trabajo
            Dado que un agente tiene asignado el mensaje "154028"
            Y responde el mensaje
            Cuando pasados 163 segundos desde la respuesta del mensaje se asigna un nuevo mensaje
            Y cambia el estado del "154028" a estado atendido
            Entonces en la colmuna "Tiempo de trabajo" debe verse "00:02:43.ms"
        
        @tc:6675
        Escenario: mensaje asignado cambia a estado atendido por finalizacion de la atencion
            Dado que un agente tiene asignado el mensaje "154032"
            Y responde el mensaje
            Cuando pasados 25 segundos desde que respondio el mensaje finaliza la atencion confirmando el modal
            Entonces en la columna "Tiempo de trabajo" debe verse "00:00:25.ms"

        @tc:7292
        Escenario: si mensaje no es respondido se considera el tiempo de lectura como el tiempo de trabajo
            Dado un mensaje de modo chat asignado a un agente
            Y dado que acumula 2 minutos de lectura
            Cuando un nuevo mensaje es asignado agrupando al primero
            Entonces el primer mensaje tendra los siguientes tiempos
                | tiempo de lectura | tiempo de trabajo |
                | 0:00:00ms         | 0:02:00ms         |

    Regla: En modo chat al descartar el mensaje por el timer de inactividad del usuario se stopea el timer 
        
        @tc:6676
        Escenario: se desasigna por timer del usuario y se detiene contador de trabajo
            Dado un servicio en modo chat
            Y un agente con el contador de tiempo de trabajo de un mensaje activado
            Cuando se desasigna el mensaje por el timer del usuario
            Entonces se detiene el contador del tiempo de trabajo

    Regla: Un mensaje podría perder su chance de comenzar el contador
        
        @tc:6677
        Escenario: un mensaje agrupado no contabiliza su tiempo de trabajo
            Dado que el mensaje 2345 se encuentra encolado
            Cuando se agrupa el mensaje 2346 en la cola
            Entonces el mensaje 2345 nunca comenzara su contador de tiempo de trabajo