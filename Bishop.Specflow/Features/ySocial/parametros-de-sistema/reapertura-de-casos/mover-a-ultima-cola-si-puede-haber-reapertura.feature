#language: es
Característica: mover a ultima cola si el ultimo caso puede ser reabierto
    Como supervisor 
    Quiero que los casos nuevos que pueden reabrir el caso anterior se encolen en la cola de ese 
    Para que el feature de reabrir casos considere a un caso de este tipo como apto para la reapertura

    Escenario: caso nuevo es encolado en la ultima cola que fue gestionado el perfil en esa red social
        Dado que el servicio "Itchy and Scratchy Messenger" posee como cola default la cola "Cola A"
        Y dado que el ultimo caso de un usuario con este servicio se cerro en la cola "Cola B"
        Y el caso esta en condiciones de ser reabierto
        Cuando el usuario final genera un nuevo caso contactandose al servicio "Itchy and Scratchy Messenger" 
        Entonces el mensaje se debe encolar en "Cola B" 
        Y al agente que se le asigna el caso se le debe presentar la posibilidad de reabrie el caso previo

    Regla: hay escenarios en donde no se va a cumplir la regla
        Escenario: usuario inicia un nuevo caso en otro servicio
            Dado que el servicio "paddys pub messenger" posee como cola default la cola "Cola A"
            Y dado que el ultimo caso de un usuario con el servicio "Itchy and Scratchy Messenger" se cerro en la cola "Cola B"
            Y el caso esta en condiciones de ser reabierto
            Cuando el usuario final genera un nuevo caso contactadose al servicio "paddys pub messenger"
            Entonces el mensaje se debe encolar en "Cola A"
            Y al agente no se le presentara la opcion de reabrir el caso previo
        
        Escenario: supervisor es quien cierra el caso en una cola diferente a la default del servicio
            Dado que el servicio "Itchy and Scratchy Messenger" posee como cola default la cola "Cola A"
            Y dado que el ultimo caso de un usuario con el servicio se cerro en la cola "Cola B" por accion de un supervisor
            Cuando el usuario final genere un nuevo caso contactandose al mismo servicio
            Entonces el mensaje se debe encolar en "Cola A"
        
        Escenario: mensaje entrante ejecuta filtro con transferencia de cola
            Dado que el servicio "Itchy and Scratchy Messenger" posee como cola default la cola "Cola A"
            Y el ultimo caso de un usuario con este servicio se cerro en "Cola B"
            Y que el filtro "transferencia a C" tiene como accion una transferencia hacia la cola "Cola C"
            Cuando el usuario genera un nuevo caso contactandose al mismo servicio
            Y el mensaje ejecuta el filtro
            Entonces el mensaje se debe encolar en "Cola C"

        
    Regla: cuando el caso previo ya no puede ser abierto entonces no tiene que haber derivacion

        Escenario: el caso previo ya fue reabierto dos veces
            Dado que el servicio "Itchy and Scratchy Messenger" posee como cola default la cola "Cola A"
            Y el ultimo caso de un usuario con este servicio fue reabierto dos veces
            Y se cerro por ultima vez en "Cola B"
            Cuando el usuario genera un nuevo caso contactandose al mismo servicio
            Entonces el mensaje se debe encolar en "Cola A"
