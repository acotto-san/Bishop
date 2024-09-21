#language: es
Característica: no se permiten transferencias ingresantes si no hay agentes logueados
    
    Antecedentes: 
        Dado que la cola "Cola AAA" tiene habilitado el feature de impedir transferencias y devoluciones a colas sin agentes

    Regla: sin agentes en una cola los agentes no podran transferirle mensajes
        Escenario: agente no logra transferir un mensaje a una cola sin agentes logueados
            Dado que en la cola no se encuentran agentes logueados
            Cuando un agente con un mensaje asignado desde la cola "Cola BBB" intenta transferir a la cola "Cola AAA"
            Entonces se vera impedido de realizar la transferencia del mensaje
            Y sera informado que no puede transferir a esa cola al no haber agentes logueados

        Escenario: agente transfiere mensaje a la cola al haber mas de un agente logueado
            Dado dado que en la cola se encuentra logueado el Agente A
            Cuando un Agente B con un mensaje asignado de la cola "Cola BBB" intenta transferir a la cola "Cola AAA"
            Entonces el mensaje sera correctamente transferido
    
    Regla: sin agentes en una cola los supervisores no podran transferirle mensajes
        Escenario: supervisor no logra transferir un mensaje a una cola sin agentes logueados
            Dado que en la cola no se encuentran agentes logueados
            Cuando un supervisor intenta transferir un mensaje de la cola "Cola BBB" hacia "Cola AAA"
            Entonces no podra realizar la transferencia del mensaje a la cola
            Y sera informado de que no puede transferir a una cola al no haber agentes logueados

        Escenario: supervisor transfiere mensaje a la cola al haber mas de un agente logueado
            Dado que en la cola se encuentra logueado un agente
            Cuando un supervisor intenta transferir un mensaje de la cola "Cola BBB" hacia "Cola AAA"
            Entonces el mensaje sera correctamente transferido
            
    Regla: se puede configurar la excepción a la limitacion para los supervisores
        Escenario: supervisor transfiere un mensaje a una cola sin agentes logueados
            Dado que en la configuracion de la cola se encuentra habilitado la excepcion a supervisores
            Y dado que en la cola no se encuentran agentes logueados
            Cuando un supervisor intenta transferir un mensaje de la cola "Cola BBB" hacia "Cola AAA" 
            Entonces el mensaje sera correctamente transferido 

    Regla: sin agentes en una cola un Service Level no transferirle mensajes
        Antecedentes:
            Dado que la cola "Cola BBB" posee la siguiente configuracion:
                |atributo                           |valor                                                                  |
                |accion de "Service Level"          |transferencia a cola "Cola AAA","Aplicar etiqueta prueba/2/3"          |

        Escenario:  Service Level no logra transferir a una cola sin agentes logueados
            Dado que en la cola "Cola AAA" no hay agentes logueados
            Cuando un mensaje encolado en "Cola BBB" vence el tiempo de Service Level
            Entonces la accion de transferencia del Service Level no se debe ejecutar 
            Y el mensaje debe continuar en la cola "Cola BBB"

        Escenario: Service Level no detiene todas sus acciones al impedirse la transferencia a una cola sin agentes logueados
            Dado que en la cola "Cola AAA" no hay agentes logueados
            Cuando la cola "Cola BBB" ejecuta sus acciones de Service Level sobre un mensaje
            Y no logra realizar la transferencia del mensaje 
            Entonces el caso del mensaje debe contener la etiqueta "prueba/2/3"

        Escenario: Service Level transfiere un mensaje a una cola que posee agentes logueados
            Dado que en la cola "Cola AAA" hay un agente logueado
            Cuando un mensaje encolado en "Cola BBB" vence el tiempo de Service Level
            Entonces el mensaje sera correctamente transferido a la cola "Cola AAA"

    Regla: sin agentes agentes Vencimiento de Cola no podran transferirle mensajes
        Antecedentes:
            Dado que la cola "Cola BBB" posee la siguiente configuracion:}
                |atributo                           |valor                                                                  |
                |accion de "Vencimiento en Cola"    |transferencia a cola "Cola AAA","Aplicar etiqueta Cobranzas/Deudas"    |

        Escenario: Vencimiento en Cola no logra transferir a una cola sin agentes logueados
            Dado que en la cola "Cola AAA" no hay agentes logueados
            Cuando un mensaje encolado en "Cola BBB" vence el tiempo de Vencimiento en Cola
            Entonces la accion de transferencia del Vencimiento en Cola no se debe ejecutar 
            Y el mensaje debe continuar en la cola "Cola BBB"

        Escenario: Vencimiento en Cola no detiene todas sus acciones al impedirse la transferencia a cola sin agentes logueados
            Dado que en la cola "Cola AAA" no hay agentes logueados
            Cuando la cola "Cola BBB" ejecuta sus acciones de Vencimiento en Cola sobre un mensaje
            Y no logra realizar la transferencia del mensaje 
            Entonces el caso del mensaje debe contener la etiqueta "Cobranzas/Deudas"

        Escenario: Vencimiento en Cola transfiere un mensaje a una cola que esta dentro del horario habilitado
            Dado que en la cola "Cola AAA" hay un agente logueado
            Cuando un mensaje encolado en "Cola BBB" vence el tiempo de Vencimiento en Cola 
            Entonces el mensaje sera correctamente transferido a la cola "Cola AAA"

    Regla: se puede configurar la excepción a la limitacion para Service Level / Vencimiento en Cola
        Antecedentes:
            Dado que en la configuracion de la cola se encuentra habilitado la excepcion a Service Level y Vencimiento en Cola
                
        Escenario: Service Level transfiere un mensaje a una cola que esta fuera del horario habilitado
            Dado que la cola "Cola BBB" posee la siguiente configuracion:
                | atributo                  | valor                           |
                | accion de "Service Level" | transferencia a cola "Cola AAA" |
            Dado que en la cola "Cola AAA" no hay agentes logueados
            Cuando un mensaje encolado en "Cola BBB" vence el tiempo de Service Level
            Entonces el mensaje sera correctamente transferido a la cola "Cola AAA"

        Escenario: Vencimiento en Cola transfiere un mensaje a una cola que esta fuera del horario habilitado
            Dado que la cola "Cola BBB" posee la siguiente configuracion:
                | atributo                        | valor                           |
                | accion de "Vencimiento en Cola" | transferencia a cola "Cola AAA" |
            Dado que en la cola "Cola AAA" no hay agentes logueados
            Cuando un mensaje encolado en "Cola BBB" vence el tiempo de Vencimiento en Cola 
            Entonces el mensaje sera correctamente transferido a la cola "Cola AAA"