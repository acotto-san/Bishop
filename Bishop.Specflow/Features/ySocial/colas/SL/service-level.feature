#language: es
Característica: Service level de una cola
    Como sup 
    Quiero que los mensajes encolados tengan un tiempo de atencion configurable
    Para poder medir los que son atendidos por fuera de la métrica

    # Los mensajes se pueden vencer en la cola 
    # Los mensajes se pueden vencer en el agente
    # Los mensajes nunca se vencen si son gestionados en yFlow
    # Los mensajes dejan de contabilizar su Service Level si son descartados
    # Los mensajes dejan de contabilizar su Service Level si son agrupados
     