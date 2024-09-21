# language: es
Característica: editar campos extendidos al enviar un masivo de hsm desde la web del supervisor
    Como supervisor
    Quiero que al enviar masivos hsm se pueda editarle los campos extendidos al caso
    Para poder modificar los campos de los casos que entran dentro de un envio masivo
    # borrador:
    # |nombre de campo    |valores            |      
    # |nombresDelUsr      |--Sin datos--      |  
    # |nroDeTransaccion   |--Sin datos--      |  
    # |pagoRealizado      |--Sin datos--      |  
    # |balanceDeuda       |--Sin datos--      |  
    # |estadoCliente      |--Sin datos--      |  
    # |fechaNacimiento    |--Sin datos--      |  

    #objeto con todos los campos completos
    #"{'nombresDelUsr':'cosme fulanito','nroDeTransaccion':'55','pagoRealizado':true,'balanceDeuda':'50.10','estadoCliente':'1','fechaNacimiento':'2000/10/20'}"

Antecedentes:
  Dado que en parametros de sistema hay configurados los siguientes campos extendidos de caso:
    |nombre de campo    | Descripcion                     | tipo de dato      | validacion                                      |
    |nombresDelUsr      | nombres del usuario             | texto             | dos palabras separadas por un espacio(\w+\s\w+) |
    |nroDeTransaccion   | numero de transaccion           | numero            | entre 10 y 99                                   |
    |pagoRealizado      | se realizo un pago              | si/no             | implicita                                       |
    |balanceDeuda       | deuda actual                    | decimal           | entre 10.99 y 99.00                             |
    |estadoCliente      | estado de cuenta                | lista             | 0 (cliente no activo) o 1 (cliente activo)      |
    |fechaNacimiento    | fecha de nacimiento             | fecha             | entre 29/01/1900 y el día @@HOY@@               |

  Regla: se puede omitir editar los campos utilizando un  0 como accion
    Escenario: registro de csv omite enviar payload al usar 0 como accion
      Dado que el usuario 1511111111 tiene un caso abierto con los siguientes datos
        |atributo             |valor            |
        |nro de caso          |33456            |  
        |nombresDelUsr        |'cosme fulanito' |
        |nroDeTransaccion     |223322           |
        |pagoRealizado        |si               |
      Y dado el siguiente csv:
          """
              1511111111,parametro del body del hsm,0
          """
      Cuando se envie el csv en una tarea masiva
      Entonces el caso 33456 continuara teniendo los mismo campos extendidos


  Regla: se puede sobreescribir todos los campos utilizando un 1 como accion

    Escenario: se sobreescriben todos los campos de un caso con nueva data
      Dado que el usuario 1511111111 tiene un caso abierto con los siguientes datos
        |atributo             |valor            |
        |nro de caso          |33456            |  
        |nombresDelUsr        |'cosme fulanito' |
        |nroDeTransaccion     |223322           |
        |pagoRealizado        |si               |
      Y dado el siguiente csv:
          """
              1511111111,parametro del body del hsm,1,"{'nombresDelUsr':'pepe','nroDeTransaccion':'9999','pagoRealizado':false}"
          """
      Cuando se envie el csv en una tarea masiva
      Entonces el caso 33456 tendra los siguientes campos extendidos
        |atributo             |valor            |
        |nombresDelUsr        |'pepe'           |
        |nroDeTransaccion     |9999             |
        |pagoRealizado        |no               |

    Escenario: se sobreescriben todos los campos de un caso algunos quedan vacios
      Dado que el usuario 1511111111 tiene un caso abierto con los siguientes datos
        |atributo             |valor            |
        |nro de caso          |33456            |  
        |nombresDelUsr        |'cosme fulanito' |
        |nroDeTransaccion     |223322           |
        |pagoRealizado        |si               |
      Y dado el siguiente csv:
          """
              1511111111,parametro del body del hsm,1,"{'nombresDelUsr':'pepe'}"
          """
      Cuando se envie el csv en una tarea masiva
      Entonces el caso 33456 tendra los siguientes campos extendidos
        |atributo             |valor            |
        |nombresDelUsr        |'pepe'           |
        |nroDeTransaccion     |--Sin datos--    |
        |pagoRealizado        |--Sin datos--    |

    Escenario: se agrega dato a un campo que esta vacio
      Dado que el usuario 1511111111 tiene un caso abierto con los siguientes datos
        |atributo             |valor            |
        |nro de caso          |33456            |  
        |nombresDelUsr        |--Sin datos--    |
        |nroDeTransaccion     |--Sin datos--    |
        |pagoRealizado        |--Sin datos--    |
      Y dado el siguiente csv:
          """
              1511111111,parametro del body del hsm,1,"{'nombresDelUsr':'pepe'}"
          """
      Cuando se envie el csv en una tarea masiva
      Entonces el caso 33456 tendra los siguientes campos extendidos
        |atributo             |valor            |
        |nombresDelUsr        |'pepe'           |
        |nroDeTransaccion     |--Sin datos--    |
        |pagoRealizado        |--Sin datos--    |

    Escenario: se agregan datos a campos de un caso que se crea con el masivo
      Dado que el usuario 1511111111 no tiene un caso abierto
      Y dado el siguiente csv:
          """
              1511111111,parametro del body del hsm,1,"{'nombresDelUsr':'cosme fulanito'}"
          """
      Cuando se envie el csv en una tarea masiva
      Y se cree el nuevo caso del usuario 
      Entonces el caso 33456 tendra los siguientes campos extendidos
        |atributo             |valor            |
        |nombresDelUsr        |'cosme fulanito' |
        |nroDeTransaccion     |--Sin datos--    |
        |pagoRealizado        |--Sin datos--    | 

    Escenario: se envia un objeto vacio para reemplazar todo y dejarlo vacio
            Dado que el usuario 1511111111 tiene un caso abierto con los siguientes datos
        |atributo             |valor            |
        |nro de caso          |33456            |  
        |nombresDelUsr        |'cosme fulanito' |
        |nroDeTransaccion     |223322           |
        |pagoRealizado        |si               |
      Y dado el siguiente csv:
          """
              1511111111,parametro del body del hsm,1,"{}"
          """
      Cuando se envie el csv en una tarea masiva
      Entonces el caso 33456 tendra los siguientes campos extendidos
        |atributo             |valor            |
        |nombresDelUsr        |--Sin datos--    |
        |nroDeTransaccion     |--Sin datos--    |
        |pagoRealizado        |--Sin datos--    |


  Regla: se pueden agregar datos a un caso sin perder lo preexistente con 2 como accion

    Escenario: se agregan campos a un caso con datos preexistentes
      Dado que el usuario 1511111111 tiene un caso abierto con los siguientes datos
        |atributo             |valor            |
        |nro de caso          |33456            |  
        |nombresDelUsr        |'cosme fulanito' |
        |nroDeTransaccion     |--Sin datos--    |
        |pagoRealizado        |--Sin datos--    |
      Y dado el siguiente csv:
          """
              1511111111,parametro del body del hsm,2,"{'nroDeTransaccion':'223322','pagoRealizado':true}"
          """
      Cuando se envie el csv en una tarea masiva
      Entonces el caso 33456 tendra los siguientes campos extendidos
        |atributo             |valor            |
        |nombresDelUsr        |'cosme fulanito' |
        |nroDeTransaccion     |223322           |
        |pagoRealizado        |si               |

    Escenario: caso ya tiene datos y al agregar se sobreescribe uno
          Dado que el usuario 1511111111 tiene un caso abierto con los siguientes datos
        |atributo             |valor            |
        |nro de caso          |33456            |  
        |nombresDelUsr        |'cosme fulanito' |
        |nroDeTransaccion     |--Sin datos--    |
        |pagoRealizado        |--Sin datos--    |
      Y dado el siguiente csv:
          """
              1511111111,parametro del body del hsm,2,"{'nombresDelUsr':'la pulga','pagoRealizado':true}"
          """
      Cuando se envie el csv en una tarea masiva
      Entonces el caso 33456 tendra los siguientes campos extendidos
        |atributo             |valor            |
        |nombresDelUsr        |'la pulga'       |
        |nroDeTransaccion     |--Sin datos--    |
        |pagoRealizado        |si               |

    Escenario: se agrega un campo a un caso sin datos preexistentes
      Dado que el usuario 1511111111 tiene un caso abierto con los siguientes datos
        |atributo             |valor          |
        |nro de caso          |33456          |  
        |nombresDelUsr        |--Sin datos--  |
        |nroDeTransaccion     |--Sin datos--  |
        |pagoRealizado        |no             |
      Y dado el siguiente csv:
          """
              1511111111,parametro del body del hsm,2,"{'nombresDelUsr':'cosme fulanito'}"
          """
      Cuando se envie el csv en una tarea masiva
      Entonces el caso 33456 tendra los siguientes campos extendidos
        |atributo             |valor            |
        |nombresDelUsr        |'cosme fulanito' |
        |nroDeTransaccion     |--Sin datos--    |
        |pagoRealizado        |no               |
    
    Escenario: se crea un caso y se utiliza la accion "2" para agregar campos
      Dado que el usuario 1511111111 no tiene un caso abierto
      Y dado el siguiente csv:
          """
              1511111111,parametro del body del hsm,2,"{'nombresDelUsr':'cosme fulanito'}"
          """
      Cuando se envie el csv en una tarea masiva
      Y se cree el nuevo caso del usuario 
      Entonces el caso 33456 tendra los siguientes campos extendidos
        |atributo             |valor            |
        |nombresDelUsr        |'cosme fulanito' |
        |nroDeTransaccion     |--Sin datos--    |
        |pagoRealizado        |--Sin datos--    | 
        
    Escenario: se envian multiples registros que agregan campos
      Dado el siguiente csv:
          """
              1511111111,parametro del body del hsm,2,"{'nombresDelUsr':'cosme UNO'}"
              1522222222,parametro del body del hsm,2,"{'nombresDelUsr':'cosme DOS'}"
              1533333333,parametro del body del hsm,2,"{'nombresDelUsr':'cosme TRES'}"
          """
      Cuando se envia un masivo de HSM utilizando dicho csv
      Entonces el ultimo caso de cada usuario debe contener el siguiente dato en el campo extendido:
        |ultimo caso de usuario |valor de campo "nombres del usuario |
        |1511111111             |cosme UNO                           |
        |1522222222             |cosme DOS                           |
        |1533333333             |cosme TRES                          |
      

  Regla: los registros con campos invalidos deben considerarse invalidos
    Escenario: se utilizan las 3 acciones en un mismo csv para el masivo
      # El registro dos del csv seria invalido ya que el campo nroDeTransaccion es de tipo numero
      # Por lo tanto ese registro no se debe concretar en la tarea masiva (tanto HSM no debe salir, como campos extendidos deben ser sobreescritos)
      Dado el siguiente csv:
          """
              1511111111,parametro del body del hsm,1,"{'nroDeTransaccion':'1111'}"
              1522222222,parametro del body del hsm,1,"{'nroDeTransaccion':'pepe'}"
              1533333333,parametro del body del hsm,2,"{'nroDeTransaccion':'9999'}"
          """
      Y dado que cada usuario tenia un caso abierto con los siguientes campos extendidos
        |usuario    |valor de campo "nombres del usuario  |valor de campo "numero de transaccion" |valor de campo "se realizo un pago" |
        |1511111111 |cosme UNO                            |--Sin datos--                          |--Sin datos--                       |
        |1522222222 |cosme DOS                            |--Sin datos--                          |--Sin datos--                       |
        |1533333333 |cosme TRES                           |--Sin datos--                          |--Sin datos--                       |
      Cuando se envia un masivo HSM con dicho archivo csv
      Entonces los ultimos casos de cada usuario deben tener los siguientes campos extendidos
        |usuario    |valor de campo "nombres del usuario  |valor de campo "numero de transaccion" |valor de campo "se realizo un pago" |
        |1511111111 |--Sin datos--                        |1111                                   |--Sin datos--                       |
        |1522222222 |cosme DOS                            |--Sin datos--                          |--Sin datos--                       |
        |1533333333 |cosme TRES                           |9999                                   |--Sin datos--                       |


  Regla: se debe poder utilizar multiples acciones en un mismo masivo
    Escenario: se utilizan las 3 acciones en un mismo csv para el masivo-reformular
      Dado el siguiente csv:
          """
              1511111111,parametro del body del hsm,1,"{'nroDeTransaccion':'1111'}"
              1522222222,parametro del body del hsm,0
              1533333333,parametro del body del hsm,2,"{'nroDeTransaccion':'9999'}"
          """
      Y dado que cada usuario tenia un caso abierto con los siguientes campos extendidos
        |usuario    |valor de campo "nombres del usuario  |valor de campo "numero de transaccion" |valor de campo "se realizo un pago" |
        |1511111111 |cosme UNO                            |--Sin datos--                          |--Sin datos--                       |
        |1522222222 |cosme DOS                            |--Sin datos--                          |--Sin datos--                       |
        |1533333333 |cosme TRES                           |--Sin datos--                          |--Sin datos--                       |
      Cuando se envia un masivo HSM con dicho archivo csv
      Entonces los ultimos casos de cada usuario deben tener los siguientes campos extendidos
        |usuario    |valor de campo "nombres del usuario  |valor de campo "numero de transaccion" |valor de campo "se realizo un pago" |
        |1511111111 |--Sin datos--                        |1111                                   |--Sin datos--                       |
        |1522222222 |cosme DOS                            |--Sin datos--                          |--Sin datos--                       |
        |1533333333 |cosme TRES                           |9999                                   |--Sin datos--                       |

 
  Regla: los registros invalidos no seran procesados
    Escenario: columna de payload no existe cuando deberia
      Dado el siguiente csv:
        """
          1511111111,parametro del body del hsm,1
        """
      Cuando se intenta enviar un masivo HSM
      Entonces se impedira la carga del masivo

    Escenario: columna de payload esta vacia cuando deberia tener un objeto
      Dado el siguiente csv:
        """
          1511111111,parametro del body del hsm,1,
        """
      Cuando se intenta enviar un masivo HSM
      Entonces se agenda el masivo
      Pero no se logra enviar correctamente el HSM del registro
      Y en el caso se duplica 10 veces el mensaje por cada uno de los reintentos de envio
    
    Escenario: campo de payload no respeta tipo de dato
      Dado el siguiente csv:
        """
          1511111111,parametro del body del hsm,1,"{'nroDeTransaccion':'esto es un texto'}"
        """
      Cuando se intenta enviar un masivo HSM con dicho csv
      Entonces se impedira la carga del masivo con un mensaje que indique:
        """
          Ocurrió un error intentando enviar la plantilla de mensaje, dado que el contenido del archivo es inválido (línea 1)
        """
  
  Regla: el feature debe funcionar con todo tipo de plantilla
    
    Escenario: se editan campos extendidos enviando plantilla con header multimedia
      #todo

    Escenario: se editan campos extendidos enviando plantilla con quick reply
      Dado que el usuario 1511111111 no tiene un caso abierto
      Y dado el siguiente csv:
        """
          1511111111,payloadBoton1,payloadBoton2,payloadBoton3,1,"{'nombresDelUsr':'cosme fulanito','nroDeTransaccion':'55','pagoRealizado':true,'balanceDeuda':'50.10','estadoCliente':'1','fechaNacimiento':'2000/10/20'}"
        """
      Cuando se envia un masivo usando el csv y la plantilla "test_valmotors" 
      Entonces el nuevo caso del usuairo 1511111111 tendra los siguientes datos
        |nombre de campo    |valores          |
        |nombresDelUsr      |cosme fulanito   | 
        |nroDeTransaccion   |55               |
        |pagoRealizado      |Sin              |
        |balanceDeuda       |50.10            |
        |estadoCliente      |cliente activo   |
        |fechaNacimiento    |20/10/2000       |


 