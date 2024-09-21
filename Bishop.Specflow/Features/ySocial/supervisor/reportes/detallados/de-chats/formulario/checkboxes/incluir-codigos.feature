#language: es
Característica: incluir codigos del chat
    Como supervisor de ySocial
    Quiero que se pueda agregar los codigos relacionados al caso de chat
    Para no tener que entrar caso por caso para enterarme de estos codigos

    Antecedentes:
        Dado el siguiente caso gestionado el día 18/01/2023:
            | codigo de chat | codigos de mensaje | codigo de caso |  
            | 526            | 2970               | 1677           |
        Y que el supervisor se encuentra en el formulario del reporte detallado de chats
        Cuando habilita el check "incluir codigos"
        Y filtra por el dia 18/01/2023

    Regla: habilitar el check agrega una columna con códigos de chat

        @tc:5181
        Escenario: se visualiza columna "codigo de chat" en el reporte 
            Entonces el reporte debe contener la columna "codigo de chat" 
            Y en el reporte debe encontrarse un registro con codigo de chat 526 en la columna "codigo de chat"
        
    Regla: habilitar el check agrega una columna con codigos de mensaje

        @tc:5182
        Escenario: se visualiza columna "codigos de mensaje" en el reporte 
            Entonces el reporte debe contener la columna "codigos de mensaje" 
            Y en el reporte debe encontrarse un registro con codigo de mensaje 2970 en la columna "codigos de mensaje"

    Regla: habilitar el check agrega una columna con codigos de caso

        @tc:5179
        Escenario: se visualiza columna "caso" en el reporte 
            Entonces el reporte debe contener la columna "caso" 
            Y en el reporte debe encontrarse un registro con el numero de caso 1677 en la columna "caso"


    