

#									REFORMULAR POR PARAMETROS EN EL BACKGROUND


##language: es
#Característica: comentario al iniciar un caso
#    Como usuario final
#    Quiero que al abrir un chat pueda mandar un mensaje inicial por adelantado
#    Para no tener que esperar hasta que se termine de derivar el caso para recien ahí comenzar a tipear mi motivo de contacto
#    
#    Antecedentes:
#        Dado un  servicio de chat que tiene configurado <@tipoDeAutenticacion>
#        Ejemplos:
#            |<@tipoDeAutenticacion> |
#            |anonimo                |
#            |autenticado            |
#
#    Regla: la configuracion del feature se realiza desde la edicion del servicio
#        Escenario: supervisor habilita el uso de comentarios al iniciar un caso de chat
#            Dado que un supervisor se encuentra en la edicion de un serivico de chat
#            Cuando se dirige a la pestaña "configuracion avanzada"
#            Y habilita el feature de comentario inicial
#            Entonces los usuarios finales al utilizar el servicio deberan ver un campo de comentario antes de iniciar el chat
#            
#        Escenario: supervisor deshabilita el uso de comentarios al iniciar un caso de chat
#            Dado que un supervisor se encuentra en la edicion de un serivico de chat
#            Cuando se dirige a la pestaña "configuracion avanzada"
#            Y deshabilita el feature de comentario inicial
#            Entonces los usuarios finales al utilizar el servicio no deberan ver el campo de comentario
#
#    Regla: el usuario final tendra esta opcion dependiendo de si esta configurado el feature en el servicio
#        Escenario: usuario final puede ver el campo de comentario inicial
#            Dado que el servicio posee habilitado el comentario inicial
#            Cuando un usuario final abre una ventana de chat
#            Entonces debera ver el campo "Comentario"
#
#        Escenario: usuario final no puede ver el campo de comentario inicial
#            Dado que el servicio posee deshabilitado el comentario inicial
#            Cuando un usuario final abre una ventana de chat
#            Entonces no debera ver el campo "Comentario"
#
#    Regla: no es obligatorio escribir un mensaje para iniciar el caso
#        Antecedentes:
#            Dado que el servicio posee habilitado el comentario inicial
#
#        Escenario: usuario final inicia caso utilizando el comentario inicial
#            Dado que el usuario escribio "quiero hacer una consulta" en el campo de comentario inicial
#            Y hace click en el boton para iniciar el chat
#            Entonces en la plataforma debera crearse un nuevo caso que contiene como primer mensaje "quiero hacer una consulta"
#
#        Escenario: usuario final inicia caso sin utilizar el comentario inicial
#            Dado que el usuario no escribio un texto en el campo de comentario inicial
#            Y hace click en el boton para iniciar el chat
#            Entonces en la plataforma debera crearse un nuevo caso que aun no contendra mensajes
#
#    Regla: el comentario inicial debe sera visualizado como primer mensaje del caso
#        Antecedentes:
#            Dado que un usuario inicio un caso de chat con el comentario "quiero hacer una consulta"
#
#        Escenario: a un agente se le asigna un caso con comentario inicial
#            Cuando un agente recibe la asignacion de dicho caso
#            Entonces debera ver que el primer mensaje del caso es el texto "quiero hacer una consulta"
#
#        Escenario: supervisor ve el caso desde la seccion de mensaje en cola
#            Cuando un supervisor visualiza el caso desde la seccion "mensajes en cola"
#            Entonces debera ver que el primer mensaje del caso es el texto "quiero hacer una consulta"
#
#    Regla: el feature no aplica a un caso que se gestiona mediante yflow
#        Escenario: servicio posee yflow vinculado
#            Dado un servicio que posee el feature de comentario inicial habilitado
#            Cuando un supervisor se encuentra en la edicion del servicio
#            Y habilita el uso de yflow en el servicio
#            Entonces en la pestaña "configuracion avanzada" no estara presente la configuracion del feature de comentario inicial
#
#    Regla: el mensaje inicial no se verá desde el extremo del cliente
#        Escenario: usuario final no visualiza su propio mensaje inicial
#            Dado que un usuario ingreso "quiero hacer una consulta" en el campo de comentario
#            E hizo click en el boton para iniciar el chat
#            Cuando un agente reciba la asignacion del caso
#            Y se active la visualizacion de los mensajes en el extremo del usuario final
#            Entonces no vera como primer mensaje el comentario que escribio al iniciar el chat
#    
#    Regla: no siempre se le mostrara al usuario el campo comentario
#        Escenario: usuario final inicia un nuevo caso de chat utilizando el boton "iniciar nueva conversacion"
#            Dado que un usuario finalizo una conversacion de chat
#            Y tiene en pantalla la opcion de iniciar una nueva conversacion
#            Cuando le hace click al boton
#            Entonces no se le mostrara el campo comentario para que rellene
#            E iniciara un nuevo caso que se encolara en ysocial