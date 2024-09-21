#language: es
Característica: etiquetado en cierre automatico por inactividad
    Como supervisor de ySocial
    Quiero que los casos que se cierran automaticamente por inactividad
    Para poder tener trazabilidad de los casos que son cerrados automaticamente por inactividad

    Antecedentes:
        Dado dado que el servicio "Itchy and Scratchy Messenger" no sobreescribe la configuracion de casos del sistema
        Y en "Parámetros del sistema" se tiene configurado:
            | atributo            | valor           |
            | cierre automatico   | 15 minutos      |
            | etiquetas al cerrar | "Viriviri/AAA"  |
            | cuerpo del mensaje  | "Cierre global" |
        Y que un caso del servicio "Itchy and Scratchy Messenger" alcanzo 15 minutos de inactividad posterior a una respuesta de un agente

    Escenario: se etiqueta un caso al cerrarse por inactividad
        Cuando el caso se cierra automaticamente por inactividad
        Entonces el caso debe poseer la etiqueta "Viriviri/AAA"

    Escenario: caso ignora etiqueta configurada en parametros del sistema
        Dado que en parametros del sistema se tiene se tiene configurar aplica la etiqueta "Viriviri/BBB" en los casos cerrados automaticamente por inactividad
        Cuando el caso se cierra automaticamente por inactividad
        Entonces el caso debe poseer la etiqueta "Viriviri/AAA"
    Regla: Cada vez que el proceso de cierre corre imprime datos en el log
    Escenario: se graba informacion en el log cuando un caso que se debe cerrar por inactividad es etiquetado automaticamente
        Dado que el caso "33305" tiene las condiciones para ser cerrado automaticamente por inactividad
        Cuando la plataforma cierra el caso automaticamente por inactividad
        Entonces en el log de la web se imprime:
            """
                [hh:mm:ss]Se están aplicando las etiquetas al caso 33305
                [hh:mm:ss]Se aplicó la etiqueta con ID: 10262 en el caso: 33305
            """