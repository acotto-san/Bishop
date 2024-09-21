#language: es
Característica: notificaciones-y-alertas

    Se traslada la configuración de la casilla de mail configurada en Parametros del Sitema - Solapa Global a 
    una nueva sección en Configuración - Sistema. Aquí se permite el alta de una o varias cuentas de mail, 
    las cuales podrán ser elegidas luego en las diferentes secciones del sistema donde se puede configurar una notificación/alerta por mail. 
    Por ejemplo, notificaciones de inactividad del servicio, generación de reportes, falla en el envío de un mensaje, etc.

Regla: Todos los desplegables sin configurar se autocompletan con la casilla default

    @tc:6891
    Esquema del escenario: con el upgrade se autocompletan todas las secciones con la casilla default
        Se colocaron algunos ejemplos de secciones a modo exploratorio.
        Dado que un admin realiza el upgrade de la configuracion de mail
        Cuando visualiza la seccion <seccion>
        Entonces los desplegables estaran autocompletados con la casilla default

        Ejemplos:
            | seccion                                            |
            | Solapa "Notificacion por mail" de los servicios    |
            | Solapa "Comportamiento" en servicio de chat        |
            | Solapa "Alertas" en parametros del sistema         |
            | Solapa "Filtros" en parametros del sistema         |
            | Solapa "Otros servicios" en parametros del sistema |

    @tc:6933
    Esquema del escenario: sin casilla default preexistente se autocompletan las secciones con "Ninguna"
        Se colocaron algunos ejemplos de secciones a modo exploratorio.
        Dado que un admin no tenia una casilla configurada en sus parametros de sistema
        Cuando realiza el upgrade con las nuevas conexiones
        Y visualiza la seccion <seccion>
        Entonces los desplegables estaran autocompletados con la opcion casilla default (Ninguna)
         
        Ejemplos:
            | seccion                                            |
            | Solapa "Notificacion por mail" de los servicios    |
            | Solapa "Comportamiento" en servicio de chat        |
            | Solapa "Alertas" en parametros del sistema         |
            | Solapa "Filtros" en parametros del sistema         |
            | Solapa "Otros servicios" en parametros del sistema |

Regla: Se puede optar no tener casillas cargadas
    
    @tc:6892
    Escenario: no se cargan nuevas casillas
        Se colocaron algunos ejemplos de secciones a modo exploratorio.
        Dado un administrador que tiene solo una casilla default en conexiones
        Cuando opta por no crear nuevas conexiones
        Entonces en desplegable de <seccion> solo visualizara la casilla default para seleccionar

            Ejemplos:
            | seccion                                            |
            | Solapa "Notificacion por mail" de los servicios    |
            | Solapa "Comportamiento" en servicio de chat        |
            | Solapa "Alertas" en parametros del sistema         |
            | Solapa "Filtros" en parametros del sistema         |
            | Solapa "Otros servicios" en parametros del sistema |

Regla: En todas las secciones aparece un desplegable con las conexiones creadas
    
    @tc:6893
    Esquema del escenario: desplegable con conexiones a utilizar
        Se colocaron algunos ejemplos de secciones a modo exploratorio.
        Dado un admin que tiene 5 conexiones de mail configuradas
        Cuando ingresa a la seccion <seccion>
        Y abre el desplegable en la conexion a utilizar
        Entonces visualizara las 5 conexiones de mail configuradas

        Ejemplos:
            | seccion                                            |
            | Solapa "Notificacion por mail" de los servicios    |
            | Solapa "Comportamiento" en servicio de chat        |
            | Solapa "Alertas" en parametros del sistema         |
            | Solapa "Filtros" en parametros del sistema         |
            | Solapa "Otros servicios" en parametros del sistema |
    
Regla: En la solapa notificaciones por mail de un servicio se puede elegir una nueva conexión

    @tc:6894
    Esquema del escenario: verificar notificaciones por mail de problemas de autenticacion en servicio
        Dado que se agrego una nueva casilla por smtp para notificar por mail los problemas de autenticacion en servicio de <tipo de servicio>
        Cuando hay un problema de autenticacion
        Entonces se recibe el mail de notificacion de esa casilla

        Ejemplos:
            | tipo de servicio |
            | FB messenger     |
            | Instagram        |
            | Whatsapp         |
            | FB               |

    @tc:6895
    Esquema del escenario: verificar notificaciones por mail de los minutos de inactividad en servicio
        Dado que se agrego una nueva casilla por ews para notificar por mail los minutos con inactividad en servicio de <tipo de servicio>
        Cuando pasaron cierta cantidad de minutos con inactividad 
        Entonces se recibe el mail de notificacion de esa casilla

        Ejemplos:   
            | tipo de servicio   |
            | Mail               |
            | Chat (autenticado) |
            | Twitter            |
            | Telegram           |

Regla: En un servicio de chat, solapa comportamiento - envio transcripción- se puede elegir una nueva conexión
    
    @tc:6896
    Escenario: verificar envio de transcripcion de chat - servicio de chat
        Dado que se agrego una nueva casilla por smtp para la configuracion de cierre en un servicio de chat
        Cuando el usuario solicite la transcripcion de su chat
        Entonces recibira un mail de esa casilla

Regla:Alertas -en parámetros del sistema- se puede elegir una nueva conexión
    
    @tc:6897
    Escenario: verificar notificaciones por mail de mensajes que no pudieron ser enviados - alertas
        Dado que se agrego una nueva casilla por ews para notificar por mail los mensajes que no pudieron ser enviados
        Cuando hubo mensajes que no pudieron ser enviados
        Entonces se recibe la alerta de esa casilla.

    @tc:6898
    Escenario: verificar notificaciones por mail de acciones por usuario molesto - alertas
        Dado que se agrego una nueva casilla por smtp para notificar por mail las acciones por usuario molesto
        Cuando hubo mensajes de usuario molesto
        Entonces se recibe la alerta de esa casilla

    @tc:6899
    Escenario: verificar notificaciones por mail de informacion de login de agente - alertas
        Dado que se agrego una nueva casilla por ews para notificar por mail la informacion del login de un agente creado
        Cuando se crea un agente en ysocial
        Entonces se recibe la alerta de esa casilla

    @tc:6900
    Escenario: verificar notificaciones por mail de cambio de contraseña de agente - alertas
        Dado que se agrego una nueva casilla por smtp para notificar por mail el cambio de contraseña de un agente
        Cuando un agente cambia su contraseña
        Entonces se recibe la alerta de esa casilla

    @tc:6901
    Escenario: verificar notificaciones por mail de licencia expirada - alertas
        Dado que se agrego una nueva casilla ews para notificar por mail la expiracion de la licencia
        Cuando caduca la licencia de ySocial
        Entonces se recibe la alerta de esa casilla

    @tc:6902
    Escenario: verificar notificaciones por mail de poco espacio en disco para archivos adjuntos - alertas
        Dado que se agrego una nueva casilla smtp para notificar que queda poco espacio en disco para archivos adjuntos
        Cuando el espacio libre es inferior al configurado en las alertas
        Entonces se recibe la alerta de esa casilla

    @tc:6903
    Escenario: verificar notificaciones por mail de problemas con la base de datos - alertas
        Dado que se agrego una nueva casilla ews para notificar problemas con la base de datos
        Cuando hay problemas de espacio en disco o errores criticos
        Entonces se recibe la alerta de esa casilla

    @tc:6904
    Escenario: verificar notificaciones por mail de problemas con memoria en el servidor - alertas
        Dado que se agrego una nueva casilla smtp para notificar los problemas con memoria en el servidor
        Cuando el servidor se está quedando sin memoria disponible para seguir ejecutando los procesos
        Entonces se recibe la alerta de esa casilla

Regla:En filtros se puede elegir una nueva conexión

    @tc:6905
    Escenario: se configura una conexion de mail en el filtro
        Dado que un supervisor configura como accion de un filtro "Enviar mail"
        Cuando elige la conexion de mail prueyoizenfiltro@gmail.com
        Y se ejecuta ese filtro
        Entonces se recibe un mail de la casilla prueyoizenfiltro@gmail.com

    #@tc:6906
    #Escenario: verificar notificacion por mail de uso de filtro - parametros del sistema
    #    Dado que se agrego una nueva casilla por ews para notificar el uso de determinado filtro
    #   Cuando se ejecuta ese filtro
    #  Entonces se recibe la alerta de esa casilla

#se definió que esta solapa se va a ocultar ya que no es usada por los clientes y se generan errores con su uso. 
# reemplazo por un escenario para verificar su ocultamiento o me lo anoto como exploratorio?

Regla: En parámetros del sistema - otros servicios - relacionados a yFlow se puede elegir una nueva conexión

    @tc:6907
    Escenario: verificar notificacion por error autenticando contra yFlow - parametros del sistema
        Dado que se agrego una nueva casilla por smtp para notificar que hubo un error autenticando contra yFlow
        Cuando hay un error de autenticacion contra yFlow
        Entonces se recibe la alerta de esa casilla

    @tc:6908
    Escenario: verificar notificacion por fallo de invocación a yFlow - parametros del sistema
        Dado que se agrego una nueva casilla por ews para notificar por mail que fallo una invocacion al servicio de yFlow.
        Cuando hay una falla de invocacion al servicio de yFlow
        Entonces se recibe la alerta de esa casilla

Regla: Todas las notificaciones de reportes generados se enviaran desde la casilla default (no se podrá configurar otra casilla para este feature)
    
    @tc:6909
    Escenario: verificar envío de reportes generados a la casilla default
        Dado un supervisor genera un reporte exportado 
        Y como tiene muchos datos se le enviara por mail al finalizar la generacion
        Cuando termina de generarse el reporte
        Entonces le llega un mail de la casilla default con el reporte solicitado

    @tc:6910
    Escenario: se modifica la casilla default y se envian reportes generados
        Dado que un supervisor tiene la conexion prueyoizen3@gmail.com como default
        Y cambia la default por prueyoizen4@gmail.com
        Cuando genera un reporte exportado con muchos datos
        Y se le envia por mail
        Entonces le llega un mail de la casilla prueyoizen4@gmail.com con el reporte solicitado

Regla: En Envío masivo de plantillas de mensajes se puede elegir una nueva conexión

    @tc:6911
    Escenario: verificar notificación al finalizar una tarea masiva HSM
        Dado que un supervisor configura el envio masivo de una tarea
        Y selecciona la conexion prueyoizen4@gmail.com para notificar cuando finalice el proceso
        Cuando el proceso es finalizado
        Entonces llega un mail de prueyoizen4@gmail.com la tarea finalizada 

Regla: Se selecciona la casilla default en varias secciones
    Probar con múltiples secciones con conexion a correo a modo exploratorio
    @tc:6912
    Esquema del escenario: administrador selecciona la casilla default en sus conexiones
        Dado que un administrador tiene como casilla default <casilla default>
        Cuando la selecciona en el desplegable de conexiones en una seccion con conexiones
        Y se genera la alerta o notificacion determinada en la seccion
        Entonces <resultado obtenido>

        Ejemplos:
            | casilla default       | resultado obtenido                    |
            | prueyoizen4@gmail.com | llegaran notificaciones de ese correo |
            | Ninguna               | no llegara ningun mail                |
            