# language: es
Característica:  cantidad de casos por usuario 
    Previamente un usuario no podia tener mas de un caso activo. Si tenia un caso iniciado con un servicio A 
    y luego le escribia a un servicio B entonces los mensajes enviados al ultimo se agrupaban en el caso con servicio A.

    Escenario: mismo usuario que escribe a dos servicio genera dos casos separados
        Dado el usuario usuario de whatsapp con tel 5491173677135 no tiene casos abiertos en ysocial
        Cuando le escribe un mensaje al servicio "Whastapp 2014" 
        Y le escribe un mensaje al servicio "Whatsapp 5930"
        Entonces en ysocial deberan crearse dos casos separados

    Escenario: mensajes de cuentas unificadas genera dos casos separados
        Dado que la cuenta de facebook Messenger "Yzn Qa Trentaytres"  se encuentra unificada bajo el perfil "Santiago"
        Y que la cuenta de whatsapp con la linea 5491173677135 tambien se encuentra unificada bajo el perfil "Santiago"
        Cuando se envia un mensaje desde "Yzn QA trentaytres" a un servicio de messenger
        Y se envia un mensaje desde la linea 5491173677135 a un servicio de whatsapp
        Entonces en ysocial deberan crearse dos casos separados