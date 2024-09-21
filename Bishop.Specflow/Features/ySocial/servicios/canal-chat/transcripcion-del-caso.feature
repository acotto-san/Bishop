#language: es
Característica: transcripcion de un chat
    En el servicio se configura la posibilidad de que el usuario ingrese su mail para que ySocial le envie la transcripción de su caso.
    En caso de enviarse, Se desea poder configurar en el servicio de chat si la transcripción que será enviada contendrá solamente el segmento de charla con el agente 
    o poder enviar segmento de bot + segmento del agente.
  
   
    Antecedentes: 
        Dado un servicio de chat con el check de "enviar transcripción de chat" habilitado
        
    Regla: Se pueden configurar los segmentos que se van a transcribir de la conversación. Siempre tiene que estar uno de los checks habilitados.
        
        @tc:6695
        Esquema del escenario: transcripcion de yFlow y agente habilitadas
            Dado el check de enviar conversacion de yFlow 
            Y el check de enviar conversacion de agente habilitados
            Y un usuario que interactua con el <segmentos>
            Cuando recibe la transcripcion de su chat por mail
            Entonces podra ver la transcripcion de su conversacion con el <segmentos>
    
            Ejemplos: 
                | segmentos    |
                | bot          |
                | bot y agente |
                | agente       |
            
         @tc:6696
         Esquema del escenario: transcripcion de yFlow deshabilitada
            Dado el check de transcribir conversacion completa de yFlow deshabilitado 
            Y el check de enviar conversacion de agente habilitado
            Y un usuario que interactua con el <segmentos>
            Cuando recibe la transcripcion de su chat por mail
            Entonces podra ver la transcripcion de su conversacion con el <transcripcion>
    
            Ejemplos: 
                | segmentos    | transcripcion |
                | bot          | ninguna       |
                | bot y agente | agente        |
                | agente       | agente        |
            
         @tc:6697
         Esquema del escenario: transcripcion de agente deshabilitada
            Dado el check de transcribir conversacion completa de yFlow habilitado 
            Y el check de enviar conversacion de agente deshabilitado
            Y un usuario que interactua con el <segmentos>
            Cuando recibe la transcripcion de su chat por mail
            Entonces podra ver la transcripcion de su conversacion con el <transcripcion>

            Ejemplos: 
                | segmentos    | transcripcion |
                | bot          | bot           |
                | bot y agente | bot           |
                | agente       | ninguna       |

         @tc:6830
         Esquema del escenario: uno de los checks debe estar habilitado
         Dado que un supervisor tiene el check de <check inactivo 1> deshabilitado
         Cuando quiere deshabilitar el <check inactivo 2>
         Entonces no podra tener ambos checks deshabilitados

            Ejemplos: 
            | check inactivo 1                           | check inactivo 2                           |
            | transcribir conversacion completa de yFlow | enviar conversacion de agente              |
            | enviar conversacion de agente              | transcribir conversacion completa de yFlow |

    Regla: Cuando la conversación contiene imagenes o videos entre otros componentes, se visualizaran en la transcripcion como "mensaje estructurado"

         @tc:6417
         Escenario: se visualiza "mensaje estructurado" en la transcripcion de la conversacion
            Dado una conversacion que contiene <componentes>
            Cuando el usuario recibe la conversacion completa por mail
            Entonces lo visualiza como "mensaje estructurado"

            Ejemplos:
                | componentes         |
                | galeria de imagenes |
                | video               |