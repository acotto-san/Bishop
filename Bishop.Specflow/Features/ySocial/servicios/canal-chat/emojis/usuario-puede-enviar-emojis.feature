#language: es
Característica: usuario final puede enviar emojis
    Como usuario final
    Quiero poder enviar emojis
    Para agregar a la conversación cuando desee

    Escenario: usuario agrega emoji
        Dado que un usuario se encuentra en un caso de chat con un agente asignado
        Cuando el usuario hace click en el icono de emojis
        Y hace click en alguno de los emojis de la lista
        Entonces el emoji se ubicara en el textarea del mensaje
        Y el usuario podra enviarlo 

    Escenario: usuario envia emoji
        Dado que un usuario se encuentra en un caso de chat con un agente asignado
        Y el usuario agrego un emoji al textarea del mensaje
        Cuando envia el mensaje
        Entonces el emoji aparecera en la conversacion como enviado por él
    
    Escenario: agente recibe un emoji enviado por el usuario
        Dado que un usuario se encuentra en un caso de chat con un agente asignado
        Y el usuario envio un mensaje con un emoji
        Cuando el agente recibe el mensaje
        Entonces vera que es el emoji enviado por el usuario 