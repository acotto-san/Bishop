# language: es
Característica:  Ignorar ultima cola si fue transferido por service level
    Como supervisor
    Quiero configurar a nivel global que los mensajes transferidos por service level no sean enviados a la ultima cola
    Para dejar a dichos mensajes por fuera del alcance del feature "verificar ultima cola"

    Escenario: ignorar cuando ultima cola fue por movimiento de service level
        Dado que en la configuracion de casos se tiene habilitado "Verificar última cola" y "Ignorar última cola si el último mensaje entrante fue movido por SL"
        Y que un mensaje del servicio "Itchy and Scratchy Messenger " fue transferido de la cola default del servicio por service level hacia la cola "Cola B"
        Y fue respondido en dicha cola
        Cuando un nuevo mensaje del caso ingrese al sistema
        Entonces el mensaje debe ser encolado en "Cola A"