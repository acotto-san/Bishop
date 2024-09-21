#language: es
Característica: servicio realiza responder al cerrar automaticamente por inactividad
    Como supevisor 
    Quiero poder mandarle un mensaje prestablecido a los casos que van a ser cerrados por inactividad
    Para notificarlos del cierre/pedirles que se vuelvan a contactar nuevamente/etc

    Antecedentes:
        Dado que en "Parámetros del sistema" se tiene configurado el cierre automatico con las siguientes configuraciones:
            | atributo                       | valor                        |B
            | cierre automatico              | 15 minutos                   |
            | responder en cierre automatico | habilitado                   |
            | cuerpo del mensaje             | "Este caso se esta cerrando" |
        Y dado que el servicio "Itchy and Scratchy Messenger" no sobreescribe la configuracion de casos del sistema
        Y que un caso del servicio "Itchy and Scratchy Messenger" alcanzo 15 minutos de inactividad posterior a una respuesta de un agente

    Escenario: se envia mensaje automatico al cerrarse caso
        Cuando el caso se cierra automaticamente por inactividad
        Entonces el usuario final debe recibir un mensaje que diga "Este caso se esta cerrando"

    Escenario: caso ignora la respuesta por cierre automatico configurado en parametros del sistema
        Dado que en parametros del sistema se tiene una respuesta en caso de cierre con el cuerpo "Mensaje de cierre desde params del sistema"
        Cuando el caso se cierra automaticamente por inactividad
        Entonces el usuario final debe recibir un mensaje que diga "Este caso se esta cerrando"
    
    Regla: al momento de correr el proceso para chequear que mensajes se pueden responder antes de cerrar se guardan datos en el log
    Escenario: caso se responde automaticamente al cerrar automaticamente por inactividad
        Dado que el caso "33305" tiene las condiciones para ser cerrado automaticamente por inactividad
        Cuando la plataforma cierra el caso automaticamente por inactividad
        Entonces en el log de la web se imprime:
            """
                [hh:mm:ss]Se procesará los casos que puedan ser respondidos antes de cerrarse del servicio -QA · Itchy and Scratchy Twitter Episode II-
                [hh:mm:ss]Se obtuvieron 1 casos que podrían ser respondidos antes de cerrarse del servicio -QA · Itchy and Scratchy Twitter Episode II-
                [hh:mm:ss]Se está agregando un mensaje al caso 33305
                [hh:mm:ss]Se agregó el mensaje 153783 del caso 33305
                [hh:mm:ss]Se enviará el mensaje "153785 - Este es el mensaje p" a través del servicio -QA · Itchy and Scratchy Twitter Episode II-
                [hh:mm:ss]Enviando el mensaje 153785 - "153785 - Este es el mensaje p"
            """