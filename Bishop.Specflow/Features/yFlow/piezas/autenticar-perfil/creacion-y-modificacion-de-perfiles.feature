#language: es 
Característica: Creación y modificación de perfiles con pieza autenticar perfil


Regla de negocio: El campo código de cliente debe completarse obligatoriamente. Los otros campos son optativos
    
    @tc:6424
    Esquema del escenario: Se valida campo código de cliente
        Dado un usuario que interactua con el servicio de chat
        Y no tiene un perfil creado en ySocial
        Cuando pasa por la pieza auntenticar el id guarda el dato <id de usuario>
        Entonces en lista de perfiles de ySocial deberia <resultado obtenido> ese usuario

        Ejemplos:
            | id de usuario    | resultado obtenido |
            | 123456789        | visualizarse       |
            | asdfgh           | no visualizarse    |
            | null             | no visualizarse    |

    #cómo es un id valido? había encontrado que era hasta 16 caracteres numéricos

Regla de negocio: El campo nombre y mail no tienen ninguna validación. Si el teléfono tiene caracteres alfabeticos o vacío se invalidan todos los datos basicos. 
   
   @tc:6425
   Esquema del escenario: Se valida campos nombre, mail y telefono
        Dado que en ySocial existe un perfil con id un usuario que interactua con el servicio de chat
        Y no tiene un perfil creado en ySocial
        Cuando pasa por la pieza auntenticar se guarda su id 12345
        Y sus datos basicos:
            | nombre de perfil | mail de perfil | telefono de perfil |
            | <nombre>         | <mail>         | <telefono>         |
        Entonces en lista de perfiles de ySocial deberia <resultado obtenido> el perfil de ese usuario 12345

        Ejemplos: 
            | nombre | mail          | telefono   | resultado obtenido          |
            | pepe   | null          | null       | no editarse                 |
            | pepe   | mail@mail.com | no lo se   | editarse con telefono vacio |
            | null   | null          | no lo se   | editarse con telefono vacio |
            | null   | mail@mail.com | 1158888888 | editarse                    |
            | null   | mail@mail.com | null       | editarse con telefono vacio |
            | pepe   | null          | 1158888888 | editarse                    |
            | pepe   | mail@mail.com | 1158888888 | editarse                    |

Regla de negocio: Al pasar por la pieza autenticar, si un usuario no es preexistente, se crea un nuevo perfil
    
    @tc:6426
    Escenario: Se crea perfil nuevo
        Dado usuario que interactua con el servicio de chat
        Y no tiene un perfil creado en ySocial
        Cuando la pieza autenticar perfil anonimo recolecta sus datos:
            | cod de cliente | nombre | mail          | telefono   |
            | 33333333       | pepe   | pepe@pepe.com | 1111111111 |
        Entonces se crea un nuevo perfil en la lista de perfiles de ySocial con los mismos datos
    
    @tc:6427
    Escenario: Datos válidos en pieza actualizar y datos inválidos en la pieza autenticar
   
        Dado usuario que interactua con el servicio de chat
        Y no tiene un perfil creado en ySocial
        Cuando la pieza actualizar guarda datos validos
        Y la pieza autenticar guarda los siguientes datos:
            | cod de cliente | nombre | mail | telefono |
            | abcd           | null   | null | efgh     |
        Entonces no deberia crearse un nuevo perfil en ySocial

    @tc:6428
    Escenario: Datos inválidos en pieza actualizar y datos válidos en pieza autenticar
        Dado usuario que interactua con el servicio de chat
        Y no tiene un perfil creado en ySocial
        Cuando la pieza autenticar guarda datos validos
        Y la pieza actualizar guarda los siguientes datos:
            | segmento de datos | tipo de dato | dato invalido |
            | basicos           | telefono     | null          |
        Entonces deberia crearse un perfil con los datos de la pieza autenticar

Regla de negocio: Si un usuario es preexistente (ya tiene un id de usuario), al pasar por la pieza autenticar, se actualiza el perfil que tenia en ysocial
    
    @tc:6429
    Escenario: Se actualizan datos base de usuario preexistente
        Dado un usuario con id 1234 en la lista de perfiles de ySocial
        Cuando este usuario interactua con el bot
        Y la pieza autenticar perfil anonimo recolecta sus datos base
        Entonces sus datos base se sobreescribiran en el perfil del id 1234

    @tc:6430
    Esquema del escenario: Se actualiza datos base, de negocio y campos adicionales de usuario preexistente
        Dado un usuario con id 1240 en la lista de perfiles de ySocial
        Cuando este usuario interactua con el bot
        Y la pieza actualizar perfil recolecta sus datos <tipo de dato>
        Y pasa por la pieza autenticar perfil anonimo
        Entonces sus datos se sobreescribiran en el perfil del id 1240

        Ejemplos:
            | tipo de dato       |
            | base               |
            | de negocio         |
            | campos adicionales |
            | todos              |

    @tc:6431
    Esquema del escenario: Pieza Actualizar perfil se completa con campos inválidos
        Dado un usuario con id 1241 escribe al bot
        Cuando la pieza actualizar perfil recupera datos <tipo de dato> invalidos
        Y el resto de los segmentos de datos de la pieza actualizar son validos
        Y pasa por la pieza autenticar perfil anonimo
        Entonces <resultado obtenido>

        Ejemplos:
            | tipo de dato    | resultado obtenido                               |
            | base (telefono) | no actualiza ningun dato de la pieza actualizar  |
            | de negocio      | se actualizan los datos basicos y los extendidos |
            | extendidos      | se actualizan todos los datos                    |
    
    @tc:6433
    Esquema del escenario: Pieza Autenticar perfil se completa con campos inválidos y hace que la pieza Actualizar no genere cambios

        Dado un usuario con id 1242 en la lista de perfiles de ySocial
        Cuando este usuario interactua con el bot
        Y la pieza actualizar perfil recupera datos validos
        Y la pieza autenticar recupera como dato invalidos <dato> en el campo <tipo de dato> 
        Entonces <resultado obtenido>

        Ejemplos:
            | tipo de dato   | dato   | resultado obtenido                           |
            | cod de cliente | "abcd" | no se modificaran los datos del cliente 1242 |
            | telefono       | "efgh" | no se modificaran los datos del cliente 1242 |
    
    @tc:6434
    Escenario: Usuario nuevo con id preexistente en ySocial
        Dado un usuario Pepe con id 123456
        Y un usuario nuevo Moni sin perfil en ysocial
        Cuando Moni se comunica con el bot
        Y ingresa su id 123456
        Y se autentica
        Entonces sus datos van a sobreescribir en el perfil de pepe con id 123456
