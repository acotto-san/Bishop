#language: es
Característica: reabrir casos que fueron encuestados
    Como supervisor 
    Quiero habilitar la reapertura de casos encuestados
    Para que el feature de reabrir casos considere a un caso de este tipo como apto para la reapertura

    Antecedentes:
        Dado que en parametros del sistema se encuentran las siguientes configuraciones:
            | atributo                                    | valor      |
            | reapertura de casos                         | habilitado |
            | reapertura de casos cerrados por el sistema | habilitado |
            | minutos para reabrir el caso                | 120        |
        Y que el caso "50" del usuario "Yzn QA" se cerro hace menos de 120 minutos
        Y se reabrio menos de 2 veces
        
    Escenario: agente se le ofrece reabrir un caso encuestado
        Dado que el sistema ya envio el enlace de encuesta para el caso "50" del usuario "Yzn QA"
        Cuando el usuario final escribe de nuevo generando el caso posterior "100"
        Y el caso le es asignado al agente poochie
        Y el agente abre el mensaje
        Entonces se le debera presentar la posibilidad de reabrir el caso "50"