#language: es
Característica: no se permiten devoluciones a cola sin agentes logueados 

    Antecedentes: 
        Dado que la cola "Cola AAA" tiene habilitado el feature de impedir transferencias y devoluciones a colas sin agentes


    Escenario: agente no puede devolver mensaje a la cola por se el unico en la misma
        Dado que en la cola solo se encuentra un agente logueados
        Cuando el agente intenta devolver un mensaje a la cola
        Entonces se vera impedido de realizar la devolucion del mensaje a la cola
        Y sera informado que no puede devolver a una cola sin agentes logueados

    Escenario: agente devuelve mensaje a la cola al haber mas de un agente conectado
        Dado que en la cola se encuentran dos agentes logueados
        Cuando uno de los agentes intenta devolver un mensaje a la cola
        Entonces el mensaje sera correctamente devuelto a la cola