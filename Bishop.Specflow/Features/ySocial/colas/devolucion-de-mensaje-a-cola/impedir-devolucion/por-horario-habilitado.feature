#language: es
Característica: no se permiten devoluciones fuera del horario habilitado en la cola

    Antecedentes: 
        Dado que la cola "Cola AAA" posee configurado en "Horarios permitidos para recibir retornos o transferencias" el siguiente horario:
            |dia    |intervalo  |estado         |
            |lunes  |1300       |habilitado     |
            |lunes  |1330       |deshabilitado  |

    Escenario: agente no logra devolver un mensaje por estar fuera de un horario habilitado
        Cuando un agente intenta devolver un mensaje a la cola a las 1340 horas del dia lunes
        Entonces no podra realizar la devolucion del mensaje a la cola
        Y sera informado de que no puede devolver a una cola fuera del horario habilitado


    Escenario: agente logra devolver mensaje a una cola que se encuentra dentro de un horario habilitado
        Cuando un agente intenta devolver un mensaje a la cola a las 1310 horas del dia lunes
        Entonces el mensaje sera correctamente devuelto a la cola