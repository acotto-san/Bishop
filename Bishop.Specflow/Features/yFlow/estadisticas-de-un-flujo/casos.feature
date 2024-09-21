#language: es 
Característica: casos
    Como supervisor
    quiero que las estadísticas de casos relevados por yFlow sean consistentes con los relevados en ySocial
    para que no haya errores en las métricas

    Antecedentes:
            Dado que en la configuracion del servicio esta habilitado el check "Guardar conversacion completa con yFlow"
            Y el check de "Guardar conversación completa con yFlow de chats abandonados" habilitado

Regla: Se cuenta un caso en las métricas desde que el usuario ingresa a la conversación hasta su cierre. La actualización de la pestaña o si se abre otra ventana con la misma url, no genera un caso nuevo.

    @tc:6920
    Esquema del escenario: usuario inicia y se cierra conversacion
        Dado la siguiente configuracion del servicio de chat <tipo de servicio> en layout:
            | Botón   | check Boton empezar |
            | <boton> | <check>             |
        Cuando un usuario inicia la conversacion 
        Y luego se cierra
        Entonces se sumara un caso en la metrica de casos de ySocial y de yFlow

            Ejemplos: de chat anonimo
            | tipo de servicio | boton | check    |
            | anonimo          | si    | inactivo |
            | anonimo          | no    | activo   |

            Ejemplos: de chat autenticado 
            | tipo de servicio | boton | check    |
            | autenticado      | si    | inactivo |
            | autenticado      | no    | activo   |

    @tc:6921
    Esquema del escenario: usuario realiza ctrl f5 en un caso de chat y no cambia la metrica de casos
        Dado la siguiente configuracion del servicio de chat <tipo de servicio> en layout:
            | Botón   | check Boton empezar |
            | <boton> | <check>             |
        Cuando un usuario realiza ctrl f5 en una conversacion iniciada
        Y vuelve a la conversacion activa
        Y luego se cierra
        Entonces no se modifica la metrica de casos ni mensajes en ySocial o yFlow

            Ejemplos: de chat anonimo
            | tipo de servicio | boton | check    |
            | anonimo          | si    | inactivo |
            | anonimo          | no    | activo   |

             Ejemplos: de chat autenticado 
            | tipo de servicio | boton | check    |
            | autenticado      | si    | inactivo |
            | autenticado      | no    | activo   |

    @tc:6922
    Esquema del escenario: usuario abre otra pestaña en un caso de chat y no cambia la metrica de casos
        Dado la siguiente configuracion del servicio de chat <tipo de servicio> en layout:
            | Botón   | check Boton empezar |
            | <boton> | <check>             |
        Cuando un usuario abre otra pestaña en su ventana con el chat iniciado
        Y continua el chat en la nueva pestaña
        Y luego lo abandona
        Entonces no se modifica la metrica de casos en ySocial ni yFlow

             Ejemplos: de chat anonimo
            | tipo de servicio | boton | check    |
            | anonimo          | si    | inactivo |
            | anonimo          | no    | activo   |

             Ejemplos: de chat autenticado 
            | tipo de servicio | boton | check    |
            | autenticado      | si    | inactivo |
            | autenticado      | no    | activo   |

