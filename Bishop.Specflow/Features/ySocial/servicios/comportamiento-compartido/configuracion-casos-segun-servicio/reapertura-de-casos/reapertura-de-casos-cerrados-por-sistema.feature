#language: es
Característica: reabrir casos cerrados automaticamente por sistema
    Como supervisor 
    Quiero habilitar la reapertura de casos cerrados automaticamente por inactividad
    Para que el feature de reabrir casos considere a un caso de este tipo como apto para la reapertura


    Antecedentes:
        Dado que en la pestaña Casos de un servicio se encuentran las siguientes configuraciones:
            | atributo                                 | valor      |
            | cierre automatico                        | 2hs        |
            | cierre automatico de casos HSM           | 1hs        |
            | reapertura de casos                      | habilitado |
            | reapertura de casos cerrados por sistema | habilitado |
        
    Escenario: agente se le ofrece reabrir un caso encuestado
        Dado que un caso del servicio fue recientemente cerrado por el cierre automatico 
        Cuando el usuario final escribe de nuevo generando el caso posterior "100"
        Y el caso le es asignado al agente poochie
        Y el agente abre el mensaje
        Entonces se le debera presentar la posibilidad de reabrir el caso "50"

    Escenario: agente se le ofrece reabrir un caso cerrado por inactividad
        Dado que el caso "50" fue cerrado automaticamente por inactividad
        Cuando el usuario final escribe de nuevo generando el caso posterior "100"
        Y el caso le es asignado al agente poochie
        Y el agente abre el mensaje
        Entonces se le debera presentar la posibilidad de reabrir el caso "50"