#language: es
Característica: editar datos extendidos al cargar usuarios de forma masiva

    Antecedentes:	
        Dado que en parametros de sistema hay configurados los siguientes campos adicionales para el perfil del usuario:
            | nombre de campo   | Descripcion          | tipo de dato | validacion                                 |
            | campoTipoTexto    | 1er campo (texto)    | texto        | .* (permite todo tipo de texto)            |
            | campoTipoNumero   | 2do campo (numero)   | numero       | entre 1 y 10000                            |
            | campoTipoBooleano | 3er campo (booleano) | si/no        | implicita                                  |
            | campoTipoDecimal  | 4to campo (decimal)  | decimal      | entre 10.99 y 9999.99                      |
            | campoTipoLista    | 5to campo (lista)    | lista        | 0 (cliente no activo) o 1 (cliente activo) |
            | campoTipoFecha    | 6to campo (fecha)    | fecha        | entre 29/01/1900 y el día @@HOY@@          |

    Regla: se pueden agregar datos a un perfil sin eliminar los viejos
   
        @tc:5973
        Escenario: se utiliza la accion de agregar campos extendidos al mismo tiempo que se crea el perfil
            Dado el usuario con el id de RRSS 5491158638852 nunca se contacto con ySocial
            Y un csv para carga masiva de perfiles que posee el siguiente registro:
                """
                    1,5491158638852,parametros de datos basicos,2,"{'campoTipoTexto':'usuariofulanito','campoTipoNumero':'2','campoTipoBooleano':true,'campoTipoLista':'1','campoTipoFecha':'2000/10/20','campoTipoDecimal':'11,1'}"
                """
            Cuando un supervisor utiliza el csv para una carga masiva de perfiles con campos extendidos
            Entonces al ubicar en ySocial al perfil mediante su id se vera que posee los siguientes campos extendidos:
                | nombre de campo      | valores         |
                | 1er campo (texto)    | usuariofulanito |
                | 2do campo (numero)   | 2               |
                | 3er campo (booleano) | si              |
                | 4to campo (decimal)  | 11,1            |
                | 5to campo (lista)    | activo          |
                | 6to campo (fecha)    | 2000/10/20      |

        @tc:5974
        Escenario:se agrega dato a un campo que esta vacio
            Dado el usuario con el id de RRSS 5491158638852 que posee los siguientes campos extendidos en su perfil:
                | nombre de campo      | valores         |
                | 1er campo (texto)    | usuariofulanito |
                | 2do campo (numero)   | 2               |
                | 3er campo (booleano) | --sin datos--   |
            Y un csv para carga masiva de perfiles que posee el siguiente registro:
                """
                    2,5491158638852,parametros de datos basicos,2,"{'campoTipoBooleano':true}"
                """
            Cuando un supervisor utiliza el csv para una carga masiva de perfiles con campos extendidos
            Entonces al ubicar en ySocial al perfil mediante su id se vera que posee los siguientes campos extendidos:
                | nombre de campo      | valores         |
                | 1er campo (texto)    | usuariofulanito |
                | 2do campo (numero)   | 2               |
                | 3er campo (booleano) | si              |
                
    Regla: se pueden reemplazar datos

        @tc:5975
        Escenario: se sobreescriben todos los campos de un usuario con nueva data
            Dado el usuario con el id de RRSS 5491158638852 que posee los siguientes campos extendidos en su perfil:
                | nombre de campo      | valores         |
                | 1er campo (texto)    | usuariofulanito |
                | 2do campo (numero)   | 2               |
                | 3er campo (booleano) | si              |
                | 4to campo (decimal)  | 11,1            |
                | 5to campo (lista)    | activo          |
                | 6to campo (fecha)    | 2000/10/20      |
            Y un csv para carga masiva de perfiles que posee el siguiente registro:
                """   
                    2,5491158638852,parametro de datos basicos,1,"{'campoTipoTexto':'usuarioromi','campoTipoNumero':'3','campoTipoBooleano':false,'campoTipoDecimal':'20,20','campoTipoLista':'1','campoTipoFecha':'2022/10/20'}"
                """ 
            Cuando un supervisor utiliza el csv para una carga masiva de perfiles con campos extendidos
            Entonces al ubicar en ySocial al perfil mediante su id se vera que posee los siguientes campos extendidos:
                | nombre de campo      | valores        |
                | 1er campo (texto)    | usuarioromi    |
                | 2do campo (numero)   | 3              |
                | 3er campo (booleano) | no             |
                | 4to campo (decimal)  | 20,20          |
                | 5to campo (lista)    | cliente activo |
                | 6to campo (fecha)    | 2020/10/20     |

        @tc:5976
        Escenario:se sobreescribe un campo de un usuario - algunos quedan vacios
            Dado el usuario con el id de RRSS 5491158638852 que posee los siguientes campos extendidos en su perfil:
                | nombre de campo      | valores |
                | 1er campo (texto)    | cosme   |
                | 2do campo (numero)   |         |
                | 3er campo (booleano) |         |
                | 4to campo (decimal)  |         |
                | 5to campo (lista)    |         |
                | 6to campo (fecha)    |         |
            Y un csv para carga masiva de perfiles que posee el siguiente registro:
                """   
                    2,5491158638852,parametro de datos basicos,1,"{'campoTipoTexto':'usuarioromi'}"
                """ 
            Cuando un supervisor utiliza el csv para una carga masiva de perfiles con campos extendidos
            Entonces al ubicar en ySocial al perfil mediante su id se vera que posee los siguientes campos extendidos:
                | nombre de campo      | valores     |
                | 1er campo (texto)    | usuarioromi |
                | 2do campo (numero)   |             |
                | 3er campo (booleano) |             |
                | 4to campo (decimal)  |             |
                | 5to campo (lista)    |             |
                | 6to campo (fecha)    |             |

    Regla: puede no hacerse ninguna accion sobre estos datos

        @tc:5977
        Escenario: no se realiza ninguna accion sobre los campos adicionales del usuario
            Dado el usuario con el id de RRSS 5491158638852 que posee los siguientes campos extendidos en su perfil:
                | nombre de campo   | valores         |
                | campoTipoTexto    | usuariofulanito |
                | campoTipoNumero   | 2               |
                | campoTipoBooleano | si              |
                | campoTipoLista    | activo          |
                | campoTipoFecha    | 2000/10/20      |
                | campoTipoDecimal  | 10,1            |
            Y un csv para carga masiva de perfiles que posee el siguiente registro:
                """   
                    2,5491158638852,parametro de datos basicos,0
                """ 
            Cuando un supervisor utiliza el csv para una carga masiva de perfiles con campos extendidos
            Entonces al ubicar en ySocial al perfil mediante su id se vera que sus campos extendidos continuan teniendo los mismos valores