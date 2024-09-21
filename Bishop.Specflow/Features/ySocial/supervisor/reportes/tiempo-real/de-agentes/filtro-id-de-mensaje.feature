#language: es
Característica:Reporte en tiempo real de agentes - Poder filtrar por agente que tenga un mensaje específico
    Como supervisor 
    Quiero filtrar en el reporte en tiempo real de agentes por el código de mensaje 
    Para ver que agente lo tiene asignado.

    @tc:5540
    Escenario: Supervisor filtra por un mensaje asignado.
        Dado Sandra es una supervisora que se encuentra en el reporte "tiempo real de agentes"
        Y el agente "Alan" esta en estado "disponible"
        Y se le asigna un mensaje con codigo "174967"
        Cuando Sandra filtra el reporte por el codigo de mensaje "174967"
        Entonces el agente "Alan" estara visible en la lista de agentes
        

    @tc:5541
    Escenario: No se filtra la lista si el mensaje ya fue respondido.
        Dado Sandra es una supervisora que se encuentra en el reporte "tiempo real de agentes"
        Y el agente "Alan" responde el mensaje "174967"
        Cuando Sandra filtra el reporte por el codigo de mensaje "174967"
        Entonces el agente "Alan" no estara visible en la lista de agentes

    @tc:5542
    Escenario: No se filtra la lista si el mensaje es asignado a otro agente.
        Dado Sandra es una supervisora que se encuentra en el reporte "tiempo real de agentes"
        Y que se encuentran logueados los siguientes agentes
            | nombre | estado     |
            | Alan   | disponible |
            | Andrea | disponible |
        Y al agente "Andrea" se le asigna un mensaje con codigo "174967"
        Cuando Sandra filtra el reporte por el codigo de mensaje "174967"
        Entonces el agente "Alan" no estara visible en la lista de agentes

    @tc:5543
    Esquema del escenario: No se filtra la lista si el mensaje está en cola.
        Dado Sandra es una supervisora que se encuentra en el reporte "tiempo real de agentes"
        Y se encuentra logueado el siguiente agente
            | nombre | estado   | cola   |
            | Alan   | auxiliar | Cola A |
        Y el mensaje "174967" queda encolado en "Cola A"
        Y el mensaje encolado tiene prioridad en la cola <prioridad en cola>
        Cuando Sandra filtra el reporte por el codigo de mensaje "174967"
        Entonces el agente "Alan" no estara visible en la lista de agentes

        Ejemplos: 
            | prioridad en cola |
            | normal            |
            | reservado         |
            | VIM               |
