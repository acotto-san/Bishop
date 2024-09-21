#language: es
Característica: servicio realiza cierre de casos automatico por inactividad en yFlow
    Como supervisor de ySocial
    Quiero que los casos de yFlow se cierren si los usuarios dejan de responder
    Para no tener casos abiertos en la plataforma que acumulan mucho tiempo de inactividad

    Antecedentes: 
        Dado que en "Parámetros del sistema" se tiene configurado el cierre automatico por inactividad de yFlow en 15 minutos
        Y dado que el servicio "Itchy and Scratchy Messenger" no sobreescribe la configuracion de casos del sistema

    Regla: los escenarios donde se da la inactividad es cuando una pieza solicita algo al usuario y el mismo no reponde 
        Escenario: yFlow imprime pieza menu y usuario no responde
            #TODO: agregar este escenario
        Escenario: yFlow solicita adjuntar archivo y usuario no responde
        Dado que yFlow ejecuta la pieza adjunto
        Y el usuario no responde
        Cuando pasan 15 minutos desde que yFlow ejecutó la pieza
        Entonces el caso debe cerrarse automáticamente

    Regla: Cada vez que el proceso de cierre corre imprime datos en el log
        Escenario: El proceso se ejecuta y un caso aun no acumulo el tiempo para ser cerrado
            Dado el caso "33322" del servicio "Itchy and Scratchy Messenger"
            Y que todavia no transcurrieron 15 minutos desde que yFlow ejecuto la pieza menu
            Cuando el proceso corre
            Entonces en el log de la web se imprime "No corresponde cerrar el caso 33322 porque todavía no transcurrieron los minutos configurados desde que se cerró"
            
        Escenario: se graba informacion en el log cuando el caso se cierra
            Dado el caso "33352" del servicio "Itchy and Scratchy Messenger"
            Y que transcurrieron 15 minutos desde que yFlow ejecuto la pieza menu
            Cuando el proceso corre
            Entonces en el log de la web se imprime:
                """
                    [hh:mm:ss] Se cerrarán los casos que no hayan tenido interacciones en los últimos 3 minutos
                    [hh:mm:ss] Se cerrarán los casos de yFlow que no hayan tenido interacciones en los últimos 2 minutos
                    [hh:mm:ss] Se obtuvieron 1 casos que podrían ser cerrados
                    [hh:mm:ss] Se realizará la invocación a yFlow para avisar del caso abandonado del flow 594
                    [hh:mm:ss] Invocando a yFlow del aviso de caso abandonado del flow 594
                    [hh:mm:ss] Invocación a yFlow del aviso de caso abandonado del flow 594
                    [hh:mm:ss] Se cerrará el caso 33352
                    [hh:mm:ss] Cambió los datos de tiempo real del servicio -QA · Itchy & Scratchy Messenger- por cambio de intervalo
                    [hh:mm:ss] Se cerró automáticamente el caso 33352 que contiene únicamente respuestas de yFlow
                """