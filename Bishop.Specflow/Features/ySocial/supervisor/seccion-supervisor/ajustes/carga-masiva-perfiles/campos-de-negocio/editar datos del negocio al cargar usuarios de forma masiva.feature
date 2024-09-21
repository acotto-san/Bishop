#language: es
Característica: editar datos del negocio al cargar usuarios de forma masiva

Antecedentes: 
    Dado datos que en Parametros del Sistema de ySocial se encuentran configurados los siguientes "Datos de negocio"
        | nombre   | descripcion            | tipo   | validacion                                |
        | BDcampo1 | dato de negocio texto  | texto  | ".*"(regex para permitir cualquier texto) |
        | BDcampo2 | dato de negocio numero | entero | 0 a 999999                                |

    Regla: Se pueden eliminar los datos de negocio de usuarios

        @tc:5967
        Esquema del escenario: supervisor elimina todos los datos de negocio de un usuario
            Dado el usuario con el id de RRSS 5491158638852 que posee los siguientes datos en su perfil:
                | datos de negocio previos |
                | "<businessDataInicial>"  |
            Y un csv para carga masiva de perfiles que posee el siguiente registro:
                """
                    0,5491158638852,1
                """
            Cuando un supervisor utiliza el csv para una carga masiva de perfiles con datos de negocio
            Entonces al ubicar en ySocial al perfil mediante su id se vera que no posee datos de negocio

            Ejemplos:
                | businessDataInicial |
                |                     |
                | "aaa#111"           |
                | "aaa#111,bbb#222"   |

    Regla: Se pueden reemplazar los datos de negocio del usuario por los que contenga el csv

        @tc:5968      
        Esquema del escenario: supervisor reemplazar todos los datos de negocio de un usuario
            Dado el usuario con el id de RRSS 5491158638852 que posee los siguientes datos en su perfil:
                | datos de negocio previos |
                | "<businessDataInicial>"  |
            Y un csv para carga masiva de perfiles que posee el siguiente registro:
                """
                    0,5491158638852,2,<businessDataPayload> 
                """
            Cuando un supervisor utiliza el csv para una carga masiva de perfiles con datos de negocio
            Entonces al ubicar en ySocial al perfil mediante su id se vera que posee los siguientes datos de negocio:
                | datos de negocio resultantes |
                | <businessDataResultante>     |

            Ejemplos:
                | @businessDataInicial | @businessDataPayload | @businessDataResultante |
                |                      | zzz#999              | zzz#999                 |
                | aaa#111              | zzz#999              | zzz#999                 |
                | aaa#111,bbb#222      | zzz#999              | zzz#999                 |

    Regla: se pueden concatenar los datos de negocio del usuario por los que contenga el csv

        @tc:5969      
        Esquema del escenario: supervisor intenta concatenar todos los datos de negocio de un usuario
            Dado el usuario con el id de RRSS 5491158638852 que posee los siguientes datos en su perfil:
                | datos de negocio previos |
                | "<businessDataInicial>"  |
            Y un csv para carga masiva de perfiles que posee el siguiente registro:
                """
                    0,5491158638852,3,<businessDataPayload> 
                """
            Cuando un supervisor utiliza el csv para una carga masiva de perfiles con datos de negocio
            Entonces al ubicar en ySocial al perfil mediante su id se vera que posee los siguientes datos de negocio:
                | datos de negocio resultantes |
                | <businessDataResultante>     |

            Ejemplos:
                | @businessDataInicial | @businessDataPayload | @businessDataResultante |
                |                      | zzz#999              | zzz#999                 |
                | aaa#111              | zzz#999              | aaa#111,zzz#999         |
                | aaa#111,bbb#222      | zzz#999              | aaa#111,bbb#222,zzz#999 |

    Regla: se puede eliminar un dato de todos los datos de negocio del usuario por los que contenga el csv  

        @tc:5970 
        Esquema del escenario: supervisor intenta eliminar un solo dato de negocio de todos los datos de negocio de un usuario
            Dado el usuario con el id de RRSS 5491158638852 que posee los siguientes datos en su perfil:
                | datos de negocio previos |
                | "<businessDataInicial>"  |
            Y un csv para carga masiva de perfiles que posee el siguiente registro:
                """
                    0,5491158638852,4,<businessDataPayload> 
                """
            Cuando un supervisor utiliza el csv para una carga masiva de perfiles con datos de negocio
            Entonces al ubicar en ySocial al perfil mediante su id se vera que posee los siguientes datos de negocio:
                | datos de negocio resultantes |
                | <businessDataResultante>     |

            Ejemplos:
                | @businessDataInicial    | @businessDataPayload | @businessDataResultante |
                |                         | zzz#999              |                         |
                | aaa#111                 | zzz#999              | aaa#111                 |
                | zzz#999                 | zzz#999              |                         |
                | aaa#111,zzz#999         | zzz#999              | aaa#111                 |
                | aaa#111,zzz#999,bbb#222 | zzz#999              | aaa#111,bbb#222         |

    Regla: se puede no realizar ninguna accion sobre los datos de negocio que esten en el csv

        @tc:5971
        Escenario:supervisor no hace ninguna accion sobre los datos de negocio de usuarios
            Dado el usuario con el id de RRSS 5491158638852 que posee los siguientes datos en su perfil:
                | id            | nombre | mail                 | telefono      | lista vip | datos de negocio |
                | 5491158638852 | romi   | rgroisman@yoizen.com | 5491111111111 | no        | aaa#111          |
            Y un csv para carga masiva de perfiles que posee el siguiente registro:
                """
                    2,5491158638852,Romina Groisman,minuevo-mail@gmail.com,5491122222222,0
                """
            Cuando un supervisor utiliza el csv para una carga masiva de perfiles con datos de negocio
            Entonces al ubicar en ySocial al perfil mediante su id se vera que sus datos de negocio permanecen con los mismos valores

        @tc:5972
        Esquema del escenario: supervisor realiza todas las acciones en un mismo csv de datos de negocio de usuarios
            Dado el usuario con el id de RRSS <id> que posee los siguientes datos en su perfil:
                | datos de negocio previos |
                | "<businessDataInicial>"  |
            Y un csv para carga masiva de perfiles que posee los siguientes registros:
                """
                    0,mailuser1@dominio.com,0
                    0,mailuser2@dominio.com,1
                    0,mailuser3@dominio.com,2,"<businessDataPayload>" 
                    0,mailuser4@dominio.com,3,<businessDataPayload> 
                    0,mailuser5@dominio.com,4,<businessDataPayload> 
                """
            Cuando un supervisor utiliza el csv para una carga masiva de perfiles con datos de negocio
            Entonces al ubicar en ySocial al perfil mediante su id se vera que posee los siguientes datos de negocio:
                | datos de negocio resultantes |
                | <businessDataResultante>     |


            Ejemplos:
                | id                    | businessDataInicial | businessDataPayload | businessDataResultante |
                | mailuserAAA@dominio.com | aaa#111             | n/a                 | aaa#111                |
                | mailuserBBB@dominio.com | aaa#111             | n/a                 | null                   |
                | mailuserCCC@dominio.com | aaa#111             | zzz#999             | zzz#999                |
                | mailuserDDD@dominio.com | aaa#111             | zzz#999             | aaa#111,zzz#999        |
                | mailuserEEE@dominio.com | aaa#111             | zzz#999             | aaa#111                |