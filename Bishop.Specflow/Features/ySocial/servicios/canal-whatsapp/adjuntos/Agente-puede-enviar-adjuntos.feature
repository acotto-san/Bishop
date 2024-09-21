# language: es
Característica: Agente puede enviar adjuntos
    Como usuario agente
    Quiero poder enviar adjuntos
    Para que el usuario final reciba un archivo que necesito enviarle.

    Regla: Un agente puede enviar adjuntos al usuario final. En canales de tipo Whatsapp no debe estar obligado a elegir adjuntos de a uno. Se le debe dar la opción de elegir en bloque y enviarlos en la misma acción.
    
        Antecedentes: 
            Dado El servicio a utilizar tiene habilitado el uso de todos los tipos de archivos.
            Y que un agente tiene asignada una conversación

        Escenario: Agente agrega adjunto/s seleccionandolos con el explorador de windows
            Y tiene en pantalla el modal del explorador de windows para elegir cuales archivos adjuntar
            Cuando selecciona <@cantidadDeArchivos> archivos al mismo tiempo
            Y confirma el modal
            Entonces en el botón de adjuntos deberá agregarse el texto "(<@cantidadDeArchivos>)"
            Ejemplos:
                |<@cantidadDeArchivos>  |
                |1                      |
                |2                      |        

        Escenario: Agente adjunta más de un archivo utilizando el portapapeles
            Y tiene copiado en el portapeles <@cantidadDeArchivos> archivos
            Cuando hace click en el text area para responder 
            Y presiona la combinacion de teclas Control + V 
            Entonces en el botón de adjuntos deberá agregarse el texto "(<@cantidadDeArchivos>)"
            Ejemplos:
                |<@cantidadDeArchivos>  |
                |1                      |
                |2                      |
        
        Escenario: Agente envía una foto que tiene copiada en el portapapeles
            Dado que un agente tiene asignada una conversación
            Y que en el portapeles copió una foto (ej: captura de pantalla. NO debe ser un archivo)
            Cuando hace click en el text area para responder 
            Y presiona la combinacion de teclas Control + V
            Entonces en el botón de adjuntos deberá agregarse el texto "(1)"
        
    Regla: El agente solo puede enviar tipos de archivos que esten permitidos en la configuración del servicio
        Antecedentes: 
            Dado El servicio a utilizar no tiene habilitado el check de "Todos los archivos" en la lista de tipos de archivos permitidos.
        
        Escenario: Agente intenta enviar un archivo que no está permitido
            Dado que el servicio de whatsapp "Whatsapp Yoizen (2014)" no tiene permitido el envío de <@tipoDeArchivo>
            Y dado que un agente posee un caso asignado de este servicio
            Cuando el agente intenta agregar como adjunto un archivo de extensión <@extensionDeArchivo>
            Entonces deberá aparecer una alerta indicando que no esta permitido adjuntar el tipo de archivo

            Ejemplos:
                |tipoDeArchivo          |extensionDeArchivo |
                |videos                 |mkv                |
                |videos                 |mp4                |
                |videos                 |wmv                |
                |videos                 |mov                |
                |imagenes               |jpg                |
                |imagenes               |jpeg               |
                |imagenes               |png                |    
                |audios                 |mp3                |
                |audios                 |wav                |
                |pdf                    |pdf                |
                |word                   |doc                |
                |word                   |docx               |
                |texto                  |txt                |
                |excel                  |xls                |
                |excel                  |xlsx               |
                |powerpoint             |ppt                |
                |powerpoint             |pptx               |
                |comprimidos            |zip                |
                |comprimidos            |rar                |