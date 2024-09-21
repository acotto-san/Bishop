#language: es 
Característica: Pieza actualizar perfil en chat 
    Como administrador
    Quiero contar con una pieza que autentique los usuarios de chat anónimo
    Para poder agregar sus datos de perfil en ySocial

    La pieza actualizar perfil (en chat) se incorpora junto con este feature.

    Mapa: https://wbd.ms/share/v2/aHR0cHM6Ly93aGl0ZWJvYXJkLm1pY3Jvc29mdC5jb20vYXBpL3YxLjAvd2hpdGVib2FyZHMvcmVkZWVtLzIyYTllOTlkNTVhMDQ3ODZiMTBlNjA2NjJjMzhkOTE2X0JCQTcxNzYyLTEyRTAtNDJFMS1CMzI0LTVCMTMxRjQyNEUzRF9hMmUyZGI0Mi0zNTVjLTQwMTYtYWQxNS0yZGI0ODIwMWEyNTQ=

    La pieza tiene las propiedades básicas de cualquier pieza. Realizar pruebas de regresión:tc 6172, 6173, 6171 y 6170 

Regla de negocio: Se actualiza el perfil solo si se autentica el usuario. La evaluación de la pieza autenticar se realiza cuando se encola o se cierra el caso.

    @tc:6422
    Esquema del escenario: Caso es autenticado por el bot al haber una pieza Autenticar Perfil Anonimo
        Dado que un Flow tiene la siguiente configuracion de piezas con datos validos:
            | piezas               |
            | <piezas habilitadas> |
        Cuando un usuario interactua con el bot
        Y <instancia de evaluacion>
        Entonces los datos del perfil deberian <actualizacion> en ySocial

        Ejemplos:
            | piezas habilitadas                            | instancia de evaluacion | actualizacion   |
            | actualizar perfil                             | se encola el caso       | no visualizarse |
            | actualizar perfil                             | se cierra el caso       | no visualizarse |
            | actualizar perfil y autenticar perfil anonimo | se encola el caso       | visualizarse    |
            | autenticar perfil anonimo                     | se cierra el caso       | visualizarse    |

Regla de negocio: Los datos de la pieza actualizar perfil siempre van a pisar los de la pieza autenticar (el orden de las piezas en la implementacion no influye)

    @tc:6423
    Esquema del escenario: Al encolar o cerrar caso el perfil queda con los datos de la pieza Actualizar Perfil
        Dado un flow configurado con la pieza actualizar perfil y la de autenticar chat anonimo
        Cuando un usuario interactua con el bot
        Y se guardan el dato base <dato base> en la pieza <primera pieza> con el input <dato pieza 1>
        Y al pasar por la pieza <segunda pieza> se guarda el <dato base> con el <dato pieza 2>
        Entonces deberia guardarse en el perfil del usuario el dato base de la pieza actualizar
        
        Ejemplos:
            | dato base | primera pieza | segunda pieza | dato pieza 1      | dato pieza 2      |
            | nombre    | actualizar    | autenticar    | leonel            | julian            |
            | nombre    | autenticar    | actualizar    | leonel            | julian            |
            | mail      | actualizar    | autenticar    | leonel@leonel.com | julian@julian.com |
            | mail      | autenticar    | actualizar    | leonel@leonel.com | julian@julian.com |
            | telefono  | actualizar    | autenticar    | 1234567891        | 1987654321        |
            | telefono  | autenticar    | actualizar    | 1234567891        | 1987654321        |

Regla de negocio: Si la pieza falla salta al bloque "respuesta en caso de error"

    @tc6817
    Escenario: Al fallar la pieza autenticar perfil salta al bloque "respuesta en caso de error"
        Dado un flow configurado con la pieza autenticar perfil
        Cuando un usuario interactua con el bot 
        E ingresa un dato no valido para la pieza
        Entonces debera saltar al bloque de "respuesta en caso de error"
        
    @tc6821
    Escenario: Al fallar la pieza actualizar perfil salta al bloque "respuesta en caso de error"
        Dado un flow configurado con la pieza actualizar perfil
        Cuando un usuario interactua con el bot 
        E ingresa un dato no valido para la pieza
        Entonces debera saltar al bloque de "respuesta en caso de error"