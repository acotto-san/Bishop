#language: es
Característica: descartar un mensaje cuando el mismo incumpla el vencimiento de cola

    Regla: los mensajes se descartan cuando incumplem el vencimiento de cola

    Regla: en caso de estar habilitado se podra cerrar el caso al mismo tiempo que se descarta el mensaje

    Regla: el proceso al ejecutarse registra datos en el log con los resultados 

        #INVESTIGAR ESCENARIO:
        #Escenario: proceso de vencimiento de cola se ejecuto y encontro un mensaje para descartar
        #    Dado que el mensaje "154079" supero el tiempo configurado en el vencimiento de cola mientras estaba encolado
        #    Cuando el proceso de vencimiento de cola se ejecuta 
        #    Y encuentra al mensaje que vencio su vencimiento de cola
        #    Entonces en el log de la web se imprime:
        #        """
        #        """
        
        Escenario: proceso de vencimiento de cola descarto un mensaje y cerro el caso
            #TODO

    Regla: hay canales donde no va a funcionar el feature

        Escenario: mensaje de chat incumple vencimiento de cola que contiene "descartar" como accion
            Dado que una cola posee un vencimiento de cola configurado
            Y como acción posee habilitado "descartar"
            Cuando un mensaje de chat incumple el vencimiento de cola
            Entonces el mensaje no sera descartado

        Escenario: mensaje de chat incumple vencimiento de cola que contiene "descartar" y "cerrar caso" como accion
            Dado que una cola posee un vencimiento de cola configurado
            Y como acción posee habilitado "descartar" y "cerrar caso"
            Cuando un mensaje de chat incumple el vencimiento de cola
            Entonces el mensaje no sera descartado
            Y el caso debe continuar abierto