#language: es
Característica::Columnas de service level en el reporte de tiempo real de colas
    Como supervisor que posee un reporte para las gestiones que realizan la cola en el dia
    Quiero tener columnas relacionadas a service Level
    Para ver como está yendo el performance de dichas colas con respecto a esta metrica

    Antecedentes:
        Dado que la Cola "AAA" tiene configurado SL de 2 minutos
    
    Regla: El supervisor puede tener configurado visualizar en la columna "SL" los mensajes vencidos
    
        Antecedentes:
            Dado que el supervisor se encuentra en el reporte de tiempo real de colas
            Y que para la columna "SL" tiene configurado visualizar los mensajes que estan encolados y vencidos
            Y la cola "AAA" tiene los siguientes mensajes
                |atributo                           |valor  |
                |mensajes encolados                 |3      |
                |mensajes encolados dentro de SL    |1      |
                |mensajes encolados fuera de SL     |2      |

        Escenario: Columna "SL" contabiliza mensajes encolados que tienen SL vencido
            Cuando el supervisor visualice el reporte
            Entonces en la columna "SL" de la Cola "AAA" vera "2(aca va un porcentaje)"
        
        Escenario: Se descarta uno de los mensajes encolados con SL vencido
            Cuando uno de los mensajes vencidos se descartan
            Entonces en la columna "SL" de la Cola "AAA" vera "1(50%)"

        Escenario: Se asigna uno de los mensajes encolados con SL vencido
            Cuando uno de los mensajes vencidos se asigna a un agente
            Entonces en la columna "SL" de la Cola "AAA" vera "1(50%)"
        
        Escenario: Se vence uno de los mensajes encolados
            Cuando el mensaje que no estaba vencido se vence
            Entonces en la columna "SL" de la cola "AAA" vera "3(100%)"

        Escenario: Un agente retorna un mensaje con SL vencido a la cola
            Cuando un agente devuelve a la cola un mensaje
            Y el mensaje tiene su SL vencido
            Entonces en la columna "SL" de la cola "AAA" vera "3(75%)"

        Escenario: Un agente retorna un mensaje que no vencio su SL
            Cuando un agente devuelve a la cola un mensaje
            Y el mensaje esta dentro del SL
            Entonces en la columna "SL" de la cola "AAA" vera "2(50%)"

    Regla: El supervisor puede tener configurado visualizar en la columna "SL" los mensajes que estan dentro de SL
    
            Antecedentes:
            Dado que el supervisor tiene configurado visualizar los mensajes que aún no vencieron
            Y que se encuentra en el reporte de tiempo real de colas
            Y la cola "AAA" tiene los siguientes mensajes
                |atributo                           |valor  |
                |mensajes encolados                 |3      |
                |mensajes encolados dentro de SL    |1      |
                |mensajes encolados fuera de SL     |2      |
        @checkear
        Escenario: Columna "SL" contabiliza mensajes encolados que tienen SL vencido.
            Cuando el supervisor visualice el reporte
            Entonces en la columna "SL" de la Cola "AAA" vera "1(33%)"
        @checkear       
        Escenario: Se descarta uno de los mensajes encolados con SL vencido.
            Cuando uno de los mensajes vencidos se descartan
            Entonces en la columna "SL" de la Cola "AAA" vera "1(50%)"
        @checkear
        Escenario: Se asigna uno de los mensajes encolados con SL vencido.
            Cuando uno de los mensajes vencidos se asigna a un agente
            Entonces en la columna "SL" de la Cola "AAA" vera "1(50%)"
        @checkear        
        Escenario: Se vence uno de los mensajes encolados.
            Cuando el mensaje que no estaba vencido se vence
            Entonces en la columna "SL" de la cola "AAA" vera "0"
        @checkear
        Escenario: Un agente retorna un mensaje con SL vencido a la cola.
            Cuando un agente devuelve a la cola un mensaje
            Y el mensaje tiene su SL vencido
            Entonces en la columna "SL" de la cola "AAA" vera "1(25%)"
        @checkear
        Escenario: Un agente retorna un mensaje que no vencio su SL.
            Cuando un agente devuelve a la cola un mensaje
            Y el mensaje esta dentro del SL
            Entonces en la columna "SL" de la cola "AAA" vera "2(50%)"
    
