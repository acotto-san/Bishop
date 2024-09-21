# language: es
Característica: Casos por servicio -  Ignorar ultima cola si fue transferido por service level
    Como supervisor
    Quiero configurar a nivel de servicio que los mensajes transferidos por service level no sean enviados a la ultima cola
    Para dejar a dichos mensajes por fuera del alcance del feature "verificar ultima cola"

    Escenario: ignorar cuando ultima cola fue por movimiento de service level
        Dado que un mensaje del servicio "Itchy and Scratchy Messenger " fue transferido de la cola default del servicio por service level hacia la cola "Cola B"
        Y que en la configuracion de casos se tiene habilitado "Verificar última cola" e "Ignorar última cola si el último mensaje entrante fue movido por SL" 
        Y que el mensaje fue respondido en la cola "Cola B"
        Cuando un nuevo mensaje del caso ingrese al sistema
        Entonces el mensaje debe ser encolado en "Cola A"