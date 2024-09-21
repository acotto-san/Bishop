# language: es
Característica: permitir encuestas
    Como supervisor 
    Quiero que cada servicio tenga configurable el uso de encuestas
    Para decidir por cada servicio si van a enviar o no la encuesta que tiene configurada la cola

    Escenario: servicio envia encuestas de la cola
        Dado que el servicio "itchy and scratchy messenger" esta en una cola que posee encuesta
        Y que el servicio permite el envio de encuestas
        Cuando un caso se cierra en condiciones de ser encuestado
        Y el proceso de encuestas releva los casos cerrados
        Entonces se debe enviarle al usuario una encuesta por dicho caso cerrado

    Escenario: servicio no envia encuestas de la cola
        Dado que el servicio "itchy and scratchy messenger" esta en una cola que posee encuesta
        Y que el servicio no permite el envio de encuestas
        Cuando un caso se cierra en condiciones de ser encuestado
        Y el proceso de encuestas releva los casos cerrados
        Entonces se debe enviarle al usuario una encuesta por dicho caso cerrado