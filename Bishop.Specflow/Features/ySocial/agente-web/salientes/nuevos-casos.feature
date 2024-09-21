#language: es
Característica: Crear un nuevo caso desde salientes

    Regla: En la mayoria de los servicios al generar saliente crea si o si un nuevo caso
        
        @tc:6202
        Esquema del escenario: Al hacer un saliente se crea un caso obligatoriamente
            Dado un agente redacta un saliente de un servicio de <tipo de servicio>
            Cuando el agente envia el saliente
            Entonces se crea un caso nuevo 

            Ejemplos:
                | tipo de servicio      |
                | mail - gmail          |
                | mail - outlook        |
                | twitter               |
                | whatsapp - msg normal |
                | instagram             |
                | telegram              |
                | messenger             |


    Regla: Cuando un usuario responde a un saliente se crea un caso nuevo, las respuestas se van encadenando a este ultimo y los mensajes se agrupan
        
        @tc:6203
        Esquema del escenario: Respuestas a saliente se agrupan en un caso
            Dado el caso 12034 creado por un saliente del servicio <tipo de servicio>
            Cuando el usuario final responde al saliente del caso 12034
            Y la respuesta inicia el caso 12035
            Y el agente responde a ese mensaje
            Entonces los mensajes entrantes y de respuesta se encadenan y se deben agrupar en el caso 12035

            Ejemplos:
                | tipo de servicio      |
                | mail - gmail          |
                | mail - outlook        |
                | twitter               |
                | whatsapp - msg normal |
                | instagram             |
                | telegram              |
                | messenger             |