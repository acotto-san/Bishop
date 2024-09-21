#language: es
Característica: cierre de casos automatico por inactividad en yFlow
    Como supervisor de ySocial
    Quiero que los casos de yFlow se cierren si los usuarios dejan de responder
    Para no tener casos abiertos en la plataforma que acumulan mucho tiempo de inactividad

    Antecedentes: 
        Dado la siguiente configuracion en parametros de sistema:
			| funcionalidad                                                            | configuracion |
			| Minutos para cierre automático de un caso atendido únicamente por yFlow  | 15 minutos    |
        Y dado que el servicio "Itchy and Scratchy Messenger" no sobreescribe la configuracion de casos del sistema

    Regla: los escenarios donde se da la inactividad es cuando una pieza solicita algo al usuario y el mismo no reponde 
        
        @tc:7480
        Escenario: se cierra por inactividad en el bot un caso que se detuvo en pieza menu
            Dado que yFlow ejecuta la pieza menu
            Y el usuario no responde
            Cuando pasan 15 minutos desde que yFlow ejecutó la pieza
            Entonces el caso debe cerrarse automáticamente

        @tc:7481
        Escenario: se cierra por inactividad en el bot un caso que se detuvo en pieza adjunto
            Dado que yFlow ejecuta la pieza adjunto
            Y el usuario no responde
            Cuando pasan 15 minutos desde que yFlow ejecutó la pieza
            Entonces el caso debe cerrarse automáticamente

        @tc:7482
        Escenario: un caso que inicio por HSM es cerrado en el bot
            Dado un caso que inicia por el envio de un HSM
            Y el usuario respondio el mensaje
            Y hubo interaccion con el bot hasta que el caso quedo detenido en una pieza ingreso de datos
            Cuando pase el tiempo suficiente para cerrar el caso por inactividad en yFlow
            Entonces el caso se debe cerrar correctamente

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
