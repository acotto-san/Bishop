#language: es
Característica: Configuracion de reapertura de casos a nivel global
    Como supervisor 
    Quiero tener una configuracion global para la reapertura de casos
    Asi todos los servicios permiten la apertura de casos

    Antecedentes:
        Dado que en parametros del sistema se encuentran las siguientes configuraciones:
            | atributo                     | valor      |
            | reapertura de casos          | habilitado |
            | minutos para reabrir el caso | 120        |

    Regla: los agentes van a poder reabrir casos si estan dadas las condiciones

        Antecedentes:
            Dado que el caso "50" del usuario "Yzn QA" se cerro hace menos de 120 minutos
            Y el caso posee menos de dos reaperturas
            Y dado que el usuario final escribe al mismo servicio generando el caso posterior "100"
        
        Esquema del escenario: agente puede reabrir un caso cerrado por un agente/supervisor
            Dado que el caso "50" fue cerrado por un <@usuarioQueCierra>
            Cuando un agente recibe la asignacion del caso "100"
            Entonces se le debera presentar la posibilidad de reabrir el caso "50"
        
            Ejemplos:
                | <@usuarioQueCierra> |
                | agente              |
                | supervisor          |

        Escenario: agente puede reabrir un caso cerrado que tuvo comunicacion con yFlow y con un agente/supervisor
            Dado que el caso "50" fue derivado a yflow por un agente
            Y fue cerrado por yflow
            Cuando un agente recibe la asignacion del caso "100"
            Entonces se le debera presentar la posibilidad de reabrir el caso "50"

        Escenario: agente puede reabrir un caso cerrado por un filtro
            Dado que el caso "50" fue cerrado por accion de un filtro
            Cuando un agente recibe la asignacion del caso "100"
            Entonces se le debera presentar la posibilidad de reabrir el caso "50"

        Escenario: agente puede reabrir un caso que fue transferido a otra cola
            Dado que el caso "50" se cerro en la cola "Cola B"
            Cuando un agente recibe la asignacion del caso "100" mediante la cola "Cola A"
            Entonces se le debera presentar la posibilidad de reabrir el caso "50"

    Regla: al realizar la reapertura el mensaje nuevo se mueve al caso previo y el caso nuevo se elimina

        Antecedentes:
            Dado que el caso "50" del usuario "Yzn QA" se cerro hace menos de 120 minutos
            Y el caso posee menos de dos reaperturas
            Y dado que el usuario final escribe de nuevo generando el caso "100"

        Escenario: mensaje que se utiliza para la reapertura se mueve al caso reabierto
            Dado que al agente poochie se le asigna un mensaje que inicio el caso "100"
            Cuando el agente reabre el caso "50"
            Entonces el mensaje ahora pertenecera al caso "50"

        Escenario: caso nuevo deja de existir luego de la reapertura
            Dado que al agente poochie se le asigna el caso "100"
            Cuando el agente reabre el caso "50"
            Entonces el caso "100" no debe existir en la plataforma
            Y no debe de obtenerse resultados si se realiza un reporte Detallado de Casos filtrando con el numero de caso

        Escenario: el caso previo se cerro en una cola diferente
            Dado que el mensaje del caso "100" se encolo en la cola "Cola A"
            Y el caso "50" se cerro en la cola "Cola B"
            Cuando el agente reabre el caso previo
            Entonces el caso "50" debera estar ubicado en la cola "Cola A"
    
    Regla: el agente puede elegir no reabrir el caso
        Antecedentes:
            Dado que el caso "50" del usuario "Yzn QA" se cerro hace menos de 120 minutos
            Y el caso posee menos de dos reaperturas
            Y dado que el usuario final escribe de nuevo generando el caso "100"

        Escenario: agente decide no reabrir un caso
            Dado que al agente poochie se le asigna el caso "100"
            Cuando rechaza reabrir el caso "50"
            Entonces continuara con el caso "100" en pantalla
            Y podra continuar con su gestion


    Regla: hay escenarios donde no se esta en condiciones de reabrir el caso anterior

        Antecedentes:
            Dado que el caso "50" del usuario "Yzn QA" se encuentra cerrado
            Y que el usuario final escribe de nuevo generando el caso posterior "100"

        Escenario: no se muestra modal de reapertura si el caso previo se reabrio dos veces
            Dado que el caso "50" fue reabierto dos veces
            Cuando el caso "100" es asignado al agente poochie
            Entonces no vera la opcion de reabrir el caso "50"

        Escenario: no se muestra modal de reapertura si el caso previo supero su tiempo de reapertura
            Dado que el caso "50" se cerro hace mas de 120 segundos
            Cuando el caso "100" es asignado al agente poochie
            Entonces no vera la opcion de reabrir el caso "50"

        Escenario: no se muestra modal de reapertura si el caso previo fue cerrado por el cierre automatico por inactividad
            Dado que el caso "50" se cerro por inactividad 
            Cuando el caso "100" es asignado al agente poochie
            Entonces no vera la opcion de reabrir el caso "50"

        Escenario: no se muestra modal de reapertura si el caso previo fue cerrado por service level
            Dado que el caso "50" fue cerrado por accion de service level
            Cuando el caso "100" es asignado al agente poochie
            Entonces no vera la opcion de reabrir el caso "50"

        Escenario: no se muestra modal de reapertura si el caso previo solo tiene mensajes de yflow
            Dado que el caso "50" se gestiono solo en yflow
            Y  nunca fue derivado a una cola
            Cuando el caso "100" es asignado al agente poochie
            Entonces no vera la opcion de reabrir el caso "50"

        Escenario: no se muestra modal de reapertura si el caso previo ya fue encuestado
            Dado que el sistema ya envio un mensaje con enlace de encuesta correspondiente al caso "50"
            Cuando el caso "100" es asignado al agente poochie
            Entonces no vera la opcion de reabrir el caso "50"

        Esquema del escenario: no se muestra modal de reapertura si el caso nuevo tiene un mensaje descartado
            Dado que el mensaje del caso "100" es descartado por un <@usuarioQueDescarta>
            Y el usuario final envia un nuevo mensaje
            Cuando el nuevo mensaje del caso "100" es asignado al agente poochie
            Entonces no vera la opcion de reabrir el caso "50"

            Ejemplos:
                | @usuarioQueDescarta |
                | agente              |
                | supervisor          |

        Esquema del escenario: no se muestra modal de reapertura si el caso nuevo tiene un mensaje respondido
            Dado que el mensaje del caso "100" es respondido por un <@usuarioQueResponde>
            Y el usuario final envia un nuevo mensaje
            Cuando el nuevo mensaje del caso "100" es asignado al agente poochie
            Entonces no vera la opcion de reabrir el caso "50"

            Ejemplos:
                    | @usuarioQueResponde |
                    | agente              |
                    | supervisor          |

    Regla: no se puede reabrir un caso de un servicio diferente a la que el usuario escribio 
        Escenario: se cierra un caso en un servicio y usuario inicia un nuevo caso en otro servicio
            Dado que el ultimo caso de un usuario con el servicio "Itchy and scratchy messenger" esta cerrado
            Y el caso esta en condiciones de ser reabierto
            Cuando el usuario final genera un nuevo caso contactandose al servicio "paddys pub messenger"
            Y se asigne a un agente
            Entonces el agente no debe ver la opcion de reabrir el ultimo caso del usuario con el servicio "Itchy and scratchy messenger"