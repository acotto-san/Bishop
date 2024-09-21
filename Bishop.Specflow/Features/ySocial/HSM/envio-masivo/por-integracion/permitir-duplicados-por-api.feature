# language: es
@us:5171
Característica: Permitir numeros duplicados en el envio de hsm por api
La variable para habilitar/deshabilitar el check es "sendDuplicateRecordsAnyways"

    Como supervisor
    Quiero tener una variable por api
    Para decidir si enviar por mas que el archivo tenga numeros duplicados

    Regla de negocio: Se puede habilitar el envío de duplicados con el uso de una key en true

        @tc:8347
        Escenario: Se envia un masivo por API habilitando el envío a numeros duplicados
            Dado que un supervisor configura la variable "sendDuplicateRecordsAnyways:true"
            Cuando envie un masivo hsm por api
            Y el archivo seleccionado contenga numeros iguales
            Entonces se deberan enviar todos los mensajes que tenga el archivo por mas que el numero este repetido


    Regla de negocio: Se puede impedir el envío de duplicados de manera implícita y explícita

        @tc:8346
        Escenario: Se envia un masivo por API deshabilitando explicitamente el envío a numeros duplicados
            Dado que un supervisor configura la variable "sendDuplicateRecordsAnyways:false"
            Cuando envie un masivo hsm por api
            Y el archivo seleccionado contenga numeros iguales
            Entonces se debera enviar solo el primer contenido de la primera linea que contenga el numero

        @tc:pendiente
        Escenario: Se envia un masivo por API deshabilitando implicitamente el envío a numeros duplicados
            Dado que un supervisor no establece la variable "sendDuplicateRecordsAnyways" en la request a la api de envio masivo
            Cuando envie un masivo hsm por api
            Y el archivo seleccionado contenga numeros iguales
            Entonces se debera enviar solo el primer contenido de la primera linea que contenga el numero