# language: es
Característica: tiempo total del operador
    Como supervisor 
    Quiero tener una columna de tiempo de tiempo total del operador
    Para saber cuanto tiempo estan los agentes trabajando en sus mensajes

    Regla: Es la suma de tiempos Tiempo sin leer, de lectura y de trabajo

        @tc:7293
        Esquema del escenario: se suman los tiempos sin leer, de lectura y de trabajo
            Esto tuvo un bug en modo chat, si el mensaje era agrupado en agente luego de tener una respuesta 
            Pasaba que el tiempo de operador del mensaje en cuestion no iba a ser considerado para la suma de estos tiempos
            que compone "tiempo trabajando" a nivel caso (detallado de casos>columna tiempo trabajado / modal datos del caso)
            Dado un mensaje con los siguientes tiempos:
                | modo   | tiempo sin leer | tiempo de lectura | tiempo de trabajo |
                | <modo> | 00:00:30        | 00:01:00          | 00:00:30          |
            Cuando el supervisor verifica los tiempos en el detallado de mensajes
            Entonces el tiempo total del operador debera ser "00:02:00.ms"

            Ejemplos: 
                | modo   |
                | chat   |
                | normal |

        @tc:7294
        Escenario: Los agrupamientos tiempos de mensajes agrupados en agente son considerados para la metrica
            Dado que a las 12:00 se asigna el mensaje 1 de un caso a un agente
            Y a las 12:01 se asigna un mensaje 2 que agrupa en agente al mensaje 1
            Y a las 12:02 se asigna un mensaje 3 que agrupa en agente al mensaje 2
            Y a las 12:03 el mensaje 3 es descartado
            Entonces el tiempo de operador de los mensajes quedara:
                | nro | tiempo operador |
                | 1   |0:01:00          |
                | 2   |0:01:00          |
                | 3   |0:01:00          |

    Regla: Mensaje puede no tener tiempo de operador

        @tc:7295 @deudatecnica
        Escenario: Mensaje queda sin tiempo de operador por haber sido agrupado en la cola
            Dado que a las 12:00 se asigna el mensaje 1 de un caso a un agente
            Y a las 12:01 ingresa un mensaje 2 que espera en cola a ser agrupado
            Y a las 12:02 ingresa un mensaje 3 que agrupa al mensaje 2
            Y a las 12:03 el mensaje 3 es asignado
            Cuando el mensaje 3 es respondido a las 12:04
            Entonces el tiempo de operador de los mensajes quedara:
                | nro             | tiempo operador   |
                | 1               | 0:03:00           |
                | 2               | 0:00:00           |
                | 3               | 0:01:00           |