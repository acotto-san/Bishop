#language: es
Característica: descartar un mensaje cuando el mismo incumpla el service level de la cola


    Regla: los mensajes se descartan cuando vencen su service level

    Regla: en caso de estar habilitado se podra cerrar el caso al mismo tiempo que se descarta el mensaje

    Regla: el proceso al ejecutarse registra datos en el log con los resultados 

        Escenario: proceso de service level se ejecuto y encontro un mensaje para descartar
            Dado que el mensaje "154079" supero el tiempo configurado  en el service level mientras estaba encolado
            Cuando el proceso de service level se ejecuta 
            Y encuentra al mensaje que vencio su service level
            Entonces en el log de la web se imprime:
                """
                    [hh:mm:ss] Se marcó el mensaje "154079 - kionda" para descartar por acción de ServiceLevel
                    [hh:mm:ss] El sistema está descartando el mensaje "154079 - kionda"
                    [hh:mm:ss] Se terminó de trabajar el mensaje "154079 - kionda" por el sistema
                    [hh:mm:ss] El sistema descartó el mensaje "154079 - kionda"
                """
        
        Escenario: proceso de service level descarto un mensaje y cerro el caso
            #TODO

    Regla: hay canales donde no va a funcionar el feature
        Escenario: mensaje de chat incumple un service level que contiene "descartar" como accion
            Dado que una cola posee un service level configurado
            Y como acción posee habilitado "descartar"
            Cuando un mensaje de chat incumple el service level de esta cola
            Entonces el mensaje no sera descartado

        Escenario: mensaje de chat incumple un service level que contiene "descartar" y "cerrar caso" como accion
            Dado que una cola posee un service level configurado
            Y como acción posee habilitado "descartar" y "cerrar caso"
            Cuando un mensaje de chat incumple el service level de esta cola
            Entonces el mensaje no sera descartado
            Y el caso debe continuar abierto