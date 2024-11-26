# language: es
Característica: editar business data al enviar hsm unitario via api
    Como supervisor
    Quiero que al enviar un hsm unitario via api se pueda editarle los business data 
    Para poder modificar los códigos del cliente con el envío

    La api soportara dos nuevos parametros:
            replaceBusinessData: Boolean
            businessData: String

Regla: el parámetro replaceBusinessData está en FALSE, por lo tanto no se reemplazarán los datos del usuario

    @tc:9442
    Esquema del escenario: se envia hsm con replaceBusinessData en false
        Dado que se envia un hsm unitario por API
        Y se le agregan los siguientes parametros en el body:
            | parametros                    |
            | "replaceBusinessData": false, |
            | "businessData": <bd>          |
        Cuando el usuario recibe el hsm
        Entonces el perfil del usuario no tiene modificaciones en su business data

            Ejemplos: 
            | bd                                  |
            | ""                                  |
            | "primero#7777" (dato válido)        |
            | "primero#7777#6666" (dato inválido) |

Regla: Dado que replaceBusinessData sea true, cuando el valor de businessData está vacío, se borrarán todos los códigos de cliente que tenía el usuario

    @tc:9443
    Esquema del escenario: se envia hsm con parámetro businessData vacío
        Dado un usuario con la siguiente business data:
                | business data |
                | <bd cliente>  |
        Y se le envia un hsm unitario por api con los siguientes parametros en el body:
              | parametros                   |
              | "replaceBusinessData": true, |
              | "businessData": ""           |
        Cuando recibe el hsm
        Entonces los datos <bd cliente> fueron borrados en su perfil

        Ejemplos: 
            | bd cliente          |
            | text1#123           |
            | text1#123,text2#234 |

Regla: Si se envía un bussiness data válido se sobreescriben todos los códigos de clientes por el enviado.
    
    @tc:9444
    Escenario: se sobreescribe un business data a un usuario que no tenía ningún código
        Dado un usuario que no tiene datos de negocio
        Y se le envia un hsm unitario por api con los siguientes parametros en el body:
              | parametros                     |
              | "replaceBusinessData": true,   |
              | "businessData": "primero#7777" |
        Cuando recibe el hsm
        Entonces su perfil tendra el dato de negocio "primero#7777"
    
    @tc:9445
    Esquema del escenario: se sobreescribe un business data a un usuario que ya tenía código de cliente
        Dado un usuario con la siguiente business data:
                | business data |
                | <bd cliente>  |
        Y se le envia un hsm unitario por api con los siguientes parametros en el body:
              | parametros                     |
              | "replaceBusinessData": true,   |
              | "businessData": <parametro bd> |
        Cuando recibe el hsm
        Entonces su perfil tendra el dato de negocio <parametro bd>

        Ejemplos: 
            | bd cliente          | parametro bd                 |
            | text1#123           | "hsm1#111"                   |
            | text1#123,text2#234 | "hsm1#111,hsm2#222,hsm3#333" |

Regla: Si se ingresa un bussiness data inválido en el parámetro, no se va a enviar el hsm
    
    @tc:9446
    Escenario:se intenta enviar un hsm unitario por api con un dato de business data inválido
        Dado un hsm unitario con los siguientes parametros en el body:
                  | "replaceBusinessData": true,       |
                  | "businessData": "primero#7777#asd" |
        Y el dato de businessData es invalido segun la configuracion de parametros de servicio
        Cuando se realiza el envio por api
        Entonces se produce un error en el envio

Regla: Los parámetros para reemplazar el business data son optativos en el envio de hsm unitario

    @tc:9447
    Escenario: envio exitoso de hsm sin los parametros de replaceBusinessData
        Dado un envio de hsm unitario por api
        Y que su body no tiene los siguientes parametros:
             | parametros            |
             | "replaceBusinessData" |
             | "businessData"        |
        Cuando se realiza el envio
        Entonces el hsm debera enviarse exitosamente