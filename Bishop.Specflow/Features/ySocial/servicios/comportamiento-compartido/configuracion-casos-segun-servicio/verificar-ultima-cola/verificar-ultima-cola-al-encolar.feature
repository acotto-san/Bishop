# language: es
Característica:  Verificar ultima cola al encolar
    Como supervisor
    Quiero configurar a nivel de servicio que los mensajes se encolen en la cola de la ultima gestionó
    Para que siga su gestion en la cola donde fue derivado por ultima vez

    Regla: solamente se van a encolar en otra cola diferente a la default los mensajes que sean de un caso ya abierto y que su ultima atencion haya sido en otra cola
        Antecedentes:
            Dado que el servicio "Itchy and Scratchy Messenger" posee configurada "Cola A" como cola default
            Y que en la configuracion de casos se tiene habilitado "Verificar última cola"

        Escenario: se encola mensaje un caso transferido a otra cola por un agente
            Dado un mensaje del servicio "Itchy and Scratchy Messenger" que es transferido por un agente a la cola "Cola B"
            Y el mensaje es respondido desde esa cola por un agente
            Cuando un nuevo mensaje del caso ingrese al sistema
            Entonces el mensaje debe ser encolado en "Cola B"

        Escenario: se encola mensaje un caso transferido a otra cola por un supervisor
            Dado un mensaje del servicio "Itchy and Scratchy Messenger" ques es transferido de la cola default del servicio por un supervisor hacia la cola "Cola B"
            Y el mensaje es respondido desde esa cola por un agente
            Cuando un nuevo mensaje del caso ingrese al sistema
            Entonces el mensaje debe ser encolado en "Cola B"

        Escenario: se encola mensaje un caso transferido a otra cola por accion de un service level
            Dado un mensaje del servicio "Itchy and Scratchy Messenger" que es transferido de la cola default del servicio por service level hacia la cola "Cola B"
            Y el mensaje es respondido desde esa cola por un agente
            Cuando un nuevo mensaje del caso ingrese al sistema
            Entonces el mensaje debe ser encolado en "Cola B"

        Escenario: se encola mensaje un caso transferido a otra cola por accion de un filtro 
            Dado un mensaje del servicio "Itchy and Scratchy Messenger" que da match con un filtro
            Y el filtro posee la acción de transferir a la cola "Cola B"
            Y el mensaje es respondido desde esa cola por un agente
            Cuando un nuevo mensaje del caso ingrese al sistema
            Entonces el mensaje debe ser encolado en "Cola B"      

        Escenario: se encola mensaje un caso transferido a otra cola por derivacion de yflow
           Dado un mensaje del servicio "Itchy and Scratchy Messenger" que es transferido desde yFlow a la cola "Cola B" mediante clave de derivacion
            Y el mensaje es respondido desde esa cola por un agente
            Cuando un nuevo mensaje del caso ingrese al sistema
            Entonces el mensaje debe ser encolado en "Cola B"
