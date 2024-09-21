#language: es
Característica: no se permiten transferencias ingresantes fuera del horario habilitado en la cola

    Antecedentes: 
        Dado que la cola "Cola AAA" posee configurado en "Horarios permitidos para recibir retornos o transferencias" el siguiente horario:
            |dia    |intervalo  |estado         |
            |lunes  |1300       |habilitado     |
            |lunes  |1330       |deshabilitado  |

    Regla: los agentes no puede transferir a la cola si la misma esta fuera del horario habilitado

        Escenario: agente no logra transferir a una cola que esta fuera del horario habilitado
            Dado un agente con un mensaje asignado desde la cola "Cola BBB"
            Cuando el agente intenta realizar la transferencia del mensaje hacia la cola "Cola AAA" a las 1340 horas del dia lunes
            Entonces no podra realizar la transferencia del mensaje a la cola
            Y sera informado de que no puede transferir a una cola fuera del horario habilitado

        Escenario: agente transfiere un mensaje a una cola que esta dentro del horario habilitado
            Dado un agente con un mensaje asignado desde la cola "Cola BBB"
            Cuando el agente intenta realizar la transferencia del mensaje hacia la cola "Cola AAA" a las 1310 horas del dia lunes
            Entonces el mensaje sera correctamente transferido a la cola

    Regla: los supervisores no pueden transferir a la cola si la misma esta fuera del horario habilitado

        Escenario: supervisor no logra transferir a una cola que esta fuera del horario habilitado
            Cuando un supervisor intenta transferir un mensaje de la cola "Cola BBB" hacia "Cola AAA" a las 1340 horas del dia lunes
            Entonces no podra realizar la transferencia del mensaje a la cola
            Y sera informado de que no puede transferir a una cola fuera del horario habilitado

        Escenario: supervisor transfiere un mensaje a una cola que esta dentro del horario habilitado
            Cuando un supervisor intenta transferir un mensaje de la cola "Cola BBB" hacia "Cola AAA" a las 1310 horas del dia lunes
            Entonces el mensaje sera correctamente transferido a la cola

    Regla: se puede configurar la excepción a la limitacion para los supervisores

        Escenario: supervisor transfiere un mensaje a una cola que esta fuera del horario habilitado
            Dado que en la configuracion de la cola se encuentra habilitado la excepcion a supervisores
            Cuando un supervisor intenta transferir un mensaje de la cola "Cola BBB" hacia "Cola AAA" a las 1340 horas del dia lunes
            Entonces el mensaje sera correctamente transferido

    Regla: Servive Level y Vencimiento en Cola no podran transferir a la cola si al misma esta fuera del horario habilitado
    
        Antecedentes:
            Dado que la cola "Cola BBB" posee la siguiente configuracion:
                | atributo                  | valor                                                         |
                | accion de "Service Level" | transferencia a cola "Cola AAA","Aplicar etiqueta prueba/2/3" |               

        Escenario: Service Level no logra transferir a una cola que esta fuera del horario habilitado
            Cuando un mensaje encolado en "Cola BBB" vence el tiempo de Service Level a las 1340 horas del dia lunes
            Entonces la accion de transferencia del Service Level no se debe ejecutar 
            Y el mensaje debe continuar en la cola "Cola BBB"
        
        Escenario: Service Level no detiene todas sus acciones al impedirse la transferencia a cola fuera de horario
            Cuando la cola "Cola BBB" ejecuta sus acciones de Service Level sobre un mensaje a las 1340 horas del dia lunes
            Y no logra realizar la transferencia del mensaje 
            Entonces el caso del mensaje debe contener la etiqueta "prueba/2/3"

        Escenario: Service Level transfiere un mensaje a una cola que esta dentro del horario habilitado
            Cuando un mensaje encolado en "Cola BBB" vence el tiempo de Service Level a las 1310 horas del dia lunes
            Entonces el mensaje sera correctamente transferido a la cola "Cola AAA"

    Regla: Vencimiento en Cola no podran transferir a la cola si al misma esta fuera del horario habilitado

            Antecedentes:
                Dado que la cola "Cola BBB" posee la siguiente configuracion:
                    | atributo                        | valor                                                               |
                    | accion de "Vencimiento en Cola" | transferencia a cola "Cola AAA","Aplicar etiqueta Cobranzas/Deudas" |

        Escenario: Vencimiento en Cola no logra transferir a una cola que esta fuera del horario habilitado
            Cuando un mensaje encolado en "Cola BBB" vence el tiempo de Vencimiento en Cola a las 1340 horas del dia lunes
            Entonces la accion de transferencia del Vencimiento en Cola no se debe ejecutar 
            Y el mensaje debe continuar en la cola "Cola BBB"

        Escenario: Vencimiento en Cola no detiene todas sus acciones al impedir transferencia a cola fuera de horario
            Cuando la cola "Cola BBB" ejecuta sus acciones de Vencimiento en Cola sobre un mensaje a las 1340 horas del dia lunes
            Y no logra realizar la transferencia del mensaje 
            Entonces el caso del mensaje debe contener la etiqueta "Cobranzas/Deudas"

        Escenario: Vencimiento en Cola transfiere un mensaje a una cola que esta dentro del horario habilitado
            Cuando un mensaje encolado en "Cola BBB" vence el tiempo de Vencimiento en Cola a las 1310 horas del dia lunes
            Entonces el mensaje sera correctamente transferido a la cola "Cola AAA"

    Regla: se puede configurar la excepción a la limitacion para Service Level / Vencimiento en Cola

        Antecedentes:
            Dado que en la configuracion de la cola se encuentra habilitado la excepcion a Service Level y Vencimiento en Cola
                
        Escenario: Service Level transfiere un mensaje a una cola que esta fuera del horario habilitado
            Dado que la cola "Cola BBB" posee la siguiente configuracion:
                | atributo                  | valor                           |
                | accion de "Service Level" | transferencia a cola "Cola AAA" |
            Cuando un mensaje encolado en "Cola BBB" vence el tiempo de Service Level a las 1340 horas del dia lunes
            Entonces el mensaje sera correctamente transferido a la cola "Cola AAA"

        Escenario: Vencimiento en Cola transfiere un mensaje a una cola que esta fuera del horario habilitado
            Dado que la cola "Cola BBB" posee la siguiente configuracion:
                | atributo                        | valor                           |
                | accion de "Vencimiento en Cola" | transferencia a cola "Cola AAA" |
            Cuando un mensaje encolado en "Cola BBB" vence el tiempo de Vencimiento en Cola a las 1340 horas del dia lunes
            Entonces el mensaje sera correctamente transferido a la cola "Cola AAA"