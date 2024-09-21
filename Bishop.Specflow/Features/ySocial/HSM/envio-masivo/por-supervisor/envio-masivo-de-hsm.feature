# language: es
Característica: envio masivo de mensajes hsm de whatsapp
    Como supervisor
    Quiero poder enviar muchos HSM al mismo tiempo
    Para no tener que andar perdiendo tiempo al enviarlos de a uno


    Escenario: supervisor envia masivo de hsm de una plantilla con un parametro en el cuerpo
        Dada la plantilla "saludo_de_bienvenida"
        Y dado un csv para dicha plantilla que posee los siguientes registros
            """
            5491173677135,santiago
            5492227521316,nati
            """
        Cuando un supervisor genera un envio masivo de dicha plantilla utilizando el csv provisto
        Entonces el telefono 5491173677135 debe recibir un mensaje que diga 
            """
            	Hola santiago. Hemos recibido tu solicitud. En los próximos días te contactaremos nuevamente para activar la cuenta. Puedes escribirnos por aqui ante cualquier duda, Saludos!
            """
        Y el telefono 5492227521316 debe recibir un mensaje que diga
            """
                Hola nati. Hemos recibido tu solicitud. En los próximos días te contactaremos nuevamente para activar la cuenta. Puedes escribirnos por aqui ante cualquier duda, Saludos!
            """
    
    Regla: si al momento de enviar el HSM no hay un caso abierto, se crea uno nuevo

    Regla: si al momento de enviar el HSM hay un caso abierto, el mensaje HSM se inserta en el caso preexistente