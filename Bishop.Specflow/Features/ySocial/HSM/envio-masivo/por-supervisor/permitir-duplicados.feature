# language: es
@us:5171
Característica: Permitir numeros duplicados en el envio de hsm
    Como supervisor
    Quiero tener una opcion
    Para decidir si enviar por mas que el archivo tenga numeros duplicados

    Regla de negocio: En envios masivos (con caso) el supervisor podra decidir si se permitiran los envíos a numeros duplicados

        @tc:8344
        Escenario: Supervisor envia un masivo HSM desde la web inhabilitando el envio a duplicados
            Dado que un supervisor deja el check apagado de "Habilitar envío a números duplicados"
            Cuando envie un masivo hsm 
            Y el archivo seleccionado contenga numeros iguales
            Entonces se debera enviar solo el primer contenido de la primera linea que contenga el numero

        @tc:8345
        Escenario: Supervisor envia un masivo HSM desde la web permitiendo el envio a duplicados
            Dado que un supervisor habilita el chek de "Habilitar envío a números duplicados"
            Cuando envie un masivo hsm
            Y el archivo seleccionado contenga numeros iguales
            Entonces se deberan enviar todos los mensajes que tenga el archivo por mas que el numero este repetido

    Regla de negocio: En envios masivos SIN caso el comportamiento default seguira siendo el no permitirlo

        @tc:pendiente
        Escenario: Supervisor envia un masivo HSM sin caso con un csv que posee duplicados
            Dado que un supervisor esta en la vista de envío masivo de HSM sin caso
            Y en el csv hay registros que repiten el mismo numero de telefono
            Cuando la campaña masiva se ejecute
            Entonces se debera enviar solo el primer contenido de la primera linea que contenga el numero
