# language: es
Característica: Editar datos de negocio de un usuario al enviar masivo de HSM
    Al enviar un masivo de HSM se desea modificar los datos de negocio al perfil que se le envió el mensaje HSM
    # Los parametros dentro de un csv van a estar separados por comas
    # Test data para estos escenarios: para body-con-parametros se puede usar "saludo_de_bienvenida" y para botones-quick-reply se puede usar la plantilla "test_valmotors"

    Antecedentes:
      Dado que en parametros de sistema hay configurado como datos de negocio 1 solo campo de tipo texto 

    Regla: se pueden eliminar los datos de negocio de un usuario
      
      Esquema del escenario: envio masivo intenta eliminar todos los datos de negocio de un usuario
        #Dado el usuario con el tel <@telPrincipal> que posee los siguientes datos de negocio "<@businessDataInicial>"
        #Y que este tel esta en un registro de un csv con parametros configurados para una plantilla con "<@contenidosEnLaPlantilla>"
        #Y dado que en el registro luego de los parámetros de la plantilla posee el parametro "1"
        #Cuando se envía la tarea masiva HSM
        #Entonces el usuario recibe el HSM
        #Y sus datos de negocio son los siguientes "<@businessDataResultante>"

        Dado el usuario con el tel <@telPrincipal> que posee los siguientes datos de negocio "<@businessDataInicial>"
        Y que este tel esta en un registro de un csv con parametros configurados para una plantilla con "<@contenidosEnLaPlantilla>"
        Y dado que en el registro luego de los parámetros de la plantilla posee el parametro "1"
        Cuando se envía la tarea masiva HSM
        Entonces el usuario recibe el HSM
        Y sus datos de negocio son los siguientes "<@businessDataResultante>"

      Ejemplos:
        | @telPrincipal | @businessDataInicial | @contenidosEnLaPlantilla | @businessDataResultante |
        | 5491173677135 | null                 | "body-con-parametros"    | null                    |
        | 5491173677135 | "data1"              | "body-con-parametros"    | null                    |
        | 5491173677135 | "data1,dataA"        | "body-con-parametros"    | null                    |
        | 5491173677135 | null                 | "botones-quick-reply"    | null                    |
        | 5491173677135 | "data1"              | "botones-quick-reply"    | null                    |
        | 5491173677135 | "data1,dataA"        | "botones-quick-reply"    | null                    |

    

    Regla: se pueden reemplazar los datos de negocio del usuario por los que contenga el csv
      
      Esquema del escenario: envio masivo intenta reemplazar todos los datos de negocio de un usuario
        Dado el usuario con el tel <@telPrincipal> que posee los siguientes datos de negocio "<@businessDataInicial>"
        Y que este tel esta en un registro de un csv con parametros configurados para una plantilla con "<@contenidosEnLaPlantilla>"
        Y dado que en el registro luego de los parámetros de la plantilla posee el parametro "2" y luego "<@businessDataPayload>"
        Cuando se envía la tarea masiva HSM
        Entonces el usuario recibe el HSM
        Y sus datos de negocio son los siguientes "<@businessDataResultante>"

      Ejemplos:
        | @telPrincipal | @businessDataInicial | @contenidosEnLaPlantilla | @businessDataPayload | @businessDataResultante |
        | 5491173677135 | null                 | "body-con-parametros"    | "dataZ"              | "dataZ"                 |
        | 5491173677135 | "data1"              | "body-con-parametros"    | "dataZ"              | "dataZ"                 |
        | 5491173677135 | "data1,dataA"        | "body-con-parametros"    | "dataZ"              | "dataZ"                 |
          # |5491173677135  | null                  | "botones-quick-reply"     | "dataZ"               | "dataZ"                   |
          # |5491173677135  | "data1"               | "botones-quick-reply"     | "dataZ"               | "dataZ"                   |
          # |5491173677135  | "data1,dataA"         | "botones-quick-reply"     | "dataZ"               | "dataZ"                   |

    Regla: se pueden concatenar los datos de negocio del usuario por los que contenga el csv
      
      Esquema del escenario: envio masivo intenta concatenar todos los datos de negocio de un usuario
        Dado el usuario con el tel <@telPrincipal> que posee los siguientes datos de negocio "<@businessDataInicial>"
        Y que este tel esta en un registro de un csv con parametros configurados para una plantilla con "<@contenidosEnLaPlantilla>"
        Y dado que en el registro luego de los parámetros de la plantilla posee el parametro "3" y luego "<@businessDataPayload>"
        Cuando se envía la tarea masiva HSM
        Entonces el usuario recibe el HSM
        Y sus datos de negocio son los siguientes "<@businessDataResultante>"

      Ejemplos:
        | @telPrincipal | @businessDataInicial | @contenidosEnLaPlantilla | @businessDataPayload | @businessDataResultante |
        | 5491173677135 | null                 | "body-con-parametros"    | "dataZ"              | "dataZ"                 |
        | 5491173677135 | "data1"              | "body-con-parametros"    | "dataZ"              | "data1,dataZ"           |
        | 5491173677135 | "data1,dataA"        | "body-con-parametros"    | "dataZ"              | "data1,dataA,dataZ"     |
          # |5491173677135  | null                  | "botones-quick-reply"     | "dataZ"               | "dataZ"                  |
          # |5491173677135  | "data1"               | "botones-quick-reply"     | "dataZ"               | "data1,dataZ"            |
          # |5491173677135  | "data1,dataA"         | "botones-quick-reply"     | "dataZ"               | "data1,dataA,dataZ"      |

    Regla: se eliminar un dato de todos los datos de negocio del usuario por los que contenga el csv  
      
      Esquema del escenario: envio masivo intenta eliminar un solo dato de negocio de todos los datos de negocio de un usuario
        Dado el usuario con el tel <@telPrincipal> que posee los siguientes datos de negocio "<@businessDataInicial>"
        Y que este tel esta en un registro de un csv con parametros configurados para una plantilla con "<@contenidosEnLaPlantilla>"
        Y dado que en el registro luego de los parámetros de la plantilla posee el parametro "4" y luego "<@businessDataPayload>"
        Cuando se envía la tarea masiva HSM
        Entonces el usuario recibe el HSM
        Y sus datos de negocio son los siguientes "<@businessDataResultante>"

      Ejemplos:
        | @telPrincipal | @businessDataInicial | @contenidosEnLaPlantilla | @businessDataPayload | @businessDataResultante |
        | 5491173677135 | null                 | "body-con-parametros"    | "dataZ"              | null                    |
        | 5491173677135 | "dataZ"              | "body-con-parametros"    | "dataZ"              | null                    |
        | 5491173677135 | "dataZ,dataA"        | "body-con-parametros"    | "dataZ"              | "dataA"                 |
          # |5491173677135  | null                  | "botones-quick-reply"     | "dataZ"               | null                    |
          # |5491173677135  | "dataZ"               | "botones-quick-reply"     | "dataZ"               | null                    |
          # |5491173677135  | "dataZ,dataA"         | "botones-quick-reply"     | "dataZ"               | "dataA"                 |


    Regla: tener un numero para el campo de accion que no haga nada y te permita omitir el campo de payload
