#language: es
Característica: Enviar encuesta si el caso fue cerrado en determinada cola
    Como supervisor de ySocial
    Quiero poder configurar en el servicio de chat en cuales colas debe cerrarse un caso para ser encuestado
    Para no tener encuestas para el 100% de los casos sino solo los de las colas que prefiero


    Esquema del escenario: se envia encuesta porque caso cumple con la condicion de caso cerrado en cola
        Dado que el servicio posee vinculadas las siguiente encuesta: 
            | encuesta  | Colas donde finalizó el chat: | Finalizado por: |
            | a-tercero | <@colaConfigurada>            | Indistinto      |
        Y que un caso de chat creado en el servicio se encola en "Cola A"
        Y el caso es asignado a un agente
        Cuando el agente finaliza el caso
        Entonces el caso sera encuestado con la encuesta "a-tercero"

        Ejemplos:
            |<@colaConfigurada>|
            |Cola A|
            |Indistinto|

    Escenario: no se envia encuesta porque caso no cumple con la condicion de caso cerrado en cola
        Dado que el servicio posee vinculadas las siguiente encuesta:
            | encuesta  | Colas donde finalizó el chat: | Finalizado por: |
            | a-tercero | Cola A                        | Indistinto      |
        Y que un caso de chat creado en el servicio se encola en "Cola B"
        Y el caso es asignado a un agente
        Cuando el agente finaliza el caso
        Entonces el caso no sera encuestado