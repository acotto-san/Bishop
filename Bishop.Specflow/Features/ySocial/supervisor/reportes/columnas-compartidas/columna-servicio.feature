#language: es
Característica: columna servicio
    Como supervisor, 
    quiero visualizar el serivicio utilizado en la tarea masiva HSM 
    ya que actualmente no se desde cual se generó dicha tarea.

    Realizar pruebas exploratorias con distintos tipos de envios hsm - individual/masivo- por agente,supervisor y api.

    Regla: La columna aparece en el exportable visible/completo, diario y programado.

        @tc:6687
        Escenario: verificar columna de servicio de hsm
            Dado que se realiza un envio de hsm desde un servicio de wa
            Cuando un supervisor verifica el reporte <tipo de reporte> <tipo de vista>
            Entonces deberia ver el nombre del servicio que uso en la columna servicio

                Ejemplos: de detallado de mensajes/plantillas
                | tipo de reporte                  | tipo de vista      |
                | detallado de mensajes/plantillas | online             |
                | detallado de mensajes/plantillas | exportado visible  |
                | detallado de mensajes/plantillas | exportado completo |
                | detallado de mensajes/plantillas | diario             |
                | detallado de mensajes/plantillas | programado         |

                Ejemplos: de detallado de tareas de envio masivo
                | tipo de reporte                     | tipo de vista     |
                | detallado de tareas de envio masivo | online            |
                | detallado de tareas de envio masivo | exportado visible |
                | detallado de tareas de envio masivo | exportado completo|
            
                Ejemplos: de consolidado de plantillas
                | tipo de reporte           | tipo de vista |
                | consolidado de plantillas | online        |
                | consolidado de plantillas | exportado     |

         
  
