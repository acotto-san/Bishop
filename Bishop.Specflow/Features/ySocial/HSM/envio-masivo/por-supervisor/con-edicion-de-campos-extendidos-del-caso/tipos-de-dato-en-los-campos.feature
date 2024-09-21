# language: es
Característica: campos poseen tipos de datos
    Como supervisor
    Quiero que los campos que se editan respeten el tipo de dato configurado en ySocial
    Para que no manden informacion que no corresponde a un campo que esta pensado para cierto tipo de dato (ej: un campo de fecha)

    Antecedentes:
        Dado que en parametros de sistema hay configurados los siguientes campos extendidos de caso:
            |nombre de campo    | Descripcion                     | tipo de dato      | validacion                                      |
            |nombresDelUsr      | nombres del usuario             | texto             | dos palabras separadas por un espacio(\w+\s\w+) |
            |nroDeTransaccion   | numero de transaccion           | numero            | entre 10 y 99                                   |
            |pagoRealizado      | se realizo un pago              | si/no             | implicita                                       |
            |balanceDeuda       | deuda actual                    | decimal           | entre 10.99 y 99.00                             |
            |estadoCliente      | estado de cuenta                | lista             | 0 (cliente no activo) o 1 (cliente activo)      |
            |fechaNacimiento    | fecha de nacimiento             | fecha             | entre 29/01/1900 y el día @@HOY@@               |

    Escenario: se editan todos los tipos de campos al mismo tiempo
        Dado que el usuario 1511111111 no tiene un caso abierto
        Y dado el siguiente csv:
            """
            1511111111,parametro del body del hsm,1,"{'nombresDelUsr':'cosme fulanito','nroDeTransaccion':'55','pagoRealizado':true,'balanceDeuda':'50.10','estadoCliente':'1','fechaNacimiento':'2000/10/20'}"
            """
        Cuando se envia un masivo usando el csv y la plantilla "saludo_de_bienvenida" 
        Entonces el nuevo caso del usuairo 1511111111 tendra los siguientes datos
        Ejemplos:
            |nombre de campo    |valores          |
            |nombresDelUsr      |cosme fulanito   | 
            |nroDeTransaccion   |55               |
            |pagoRealizado      |Sin              |
            |balanceDeuda       |50.10            |
            |estadoCliente      |cliente activo   |
            |fechaNacimiento    |20/10/2000       |


    Regla: hay un tipo de dato de texto

        Escenario: campo de tipo texto cumple la validacion
            Dado que el usuario 1511111111 no tiene un caso abierto
            Y dado el siguiente csv:
                """
                1511111111,parametro del body del hsm,1,"{'nombresDelUsr':'cosme fulanito'}"
                """
            Cuando se envia un masivo usando el csv y la plantilla "saludo_de_bienvenida" 
            Entonces el nuevo caso del usuairo 1511111111 tendra los siguientes datos
            Ejemplos: 
                |nombre de campo    |valores            |      
                |nombresDelUsr      |cosme fulanito     | 
                |nroDeTransaccion   |--Sin datos--      |  
                |pagoRealizado      |--Sin datos--      |  
                |balanceDeuda       |--Sin datos--      |  
                |estadoCliente      |--Sin datos--      |  
                |fechaNacimiento    |--Sin datos--      |  

        Escenario: campo de tipo texto incumple la validacion
            Dado que el usuario 1511111111 no tiene un caso abierto
            Y dado el siguiente csv:
                """
                1511111111,parametro del body del hsm,1,"{'nombresDelUsr':true}"
                """
            Cuando se intenta enviar un masivo hsm usando el csv y la plantilla "saludo_de_bienvenida" 
            Entonces se vera un aviso indicando que el csv posee un error en la linea 1

        
        Escenario: dentro del csv un campo de tipo texto contiene un tipo de dato incorrecto
        #todo
    

    Regla: hay un tipo de dato numerico entero

        Escenario: campo de tipo numero cumple la validacion
        #todo

        Esquema del escenario: campo de tipo numero incumple la validacion
            Dado que en parametros de sistema el campo nroDeTransaccion valida que el valor este entre 10  y 99
            Y dado el siguiente csv:
                """
                    1511111111,parametro del body del hsm,1,"{'nroDeTransaccion':'<@nroDeTransaccion>'}"
                """
            Cuando se intenta enviar un masivo HSM con dicho csv
            Entonces se impedira la carga del masivo con un mensaje que indique:
                """
                Ocurrió un error intentando enviar la plantilla de mensaje, dado que el contenido del archivo es inválido (línea 1)
                """
            Ejemplos:
                |<@nroDeTransaccion>|
                |9                  |
                |100                |

        Escenario: dentro del csv un campo de tipo numero contiene un tipo de dato incorrecto
        #todo


    Regla: hay un tipo de dato booleano (verdadero-falso / si-no) 

        Escenario: campo de tipo booleano cumple la validacion
        #todo

        
        Escenario: campo de tipo booleano incumple la validacion
        #todo

        


    Regla: hay un tipo de dato numerico decimal   

        Escenario: campo de tipo decimal cumple la validacion
        #todo

            
        Escenario: campo de tipo decimal incumple la validacion
        #todo
        
        Escenario: dentro del csv un campo de tipo decimal contiene un tipo de dato incorrecto
        #todo


    Regla: hay un tipo de dato lista    
        Escenario: campo de tipo lista cumple la validacion
        #todo

        
        Escenario: campo de tipo lista incumple la validacion
        #todo
        
        Escenario: dentro del csv un campo de tipo lista contiene un tipo de dato incorrecto
        #todoB


    Regla: hay un tipo de dato fecha   
        Escenario: campo de tipo fecha cumple la validacion
        #todo

        
        Escenario: campo de tipo fecha incumple la validacion
        #todo

        
        Escenario: dentro del csv un campo de tipo fecha contiene un tipo de dato incorrecto
        #todo

      