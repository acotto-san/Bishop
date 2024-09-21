#language: es
@us:6216
Característica: comandos-regex
    Como administador
    Quiero que por default aparezca con los comados activados al no cumplirse la validacion, 
    y revisar que cuando se agregan tildes a la validación por lista falla la validación 
    (por ej, si pones "sí" en la validación y el usuario escribe "sí").

    Regla: Cuando se crea la pieza, por default en la configuración de los comandos debe aparecer que se evalúen al no cumplirse la validación del regex
        
        @tc:6289
        Escenario: comandos activados al no cumplirse la validacion
            Dado un administrador configurando un yflow
            Cuando crea una pieza de ingreso de datos en su flujo
            Entonces por default visualizara activado la evaluacion de los comando al no cumplirse la validacion del regex.

    Regla:Si la expresión regular tiene tilde, se valida la palabra con y sin tilde

        @tc:6290
        Esquema del escenario: expresion regular con tilde
            Dado que la pieza ingreso de datos tiene configurada como regex <tipo de regex>
            Y el bot guarda los datos validos del usuario en una variable
            Cuando el usuario ingresa <input de usuario>
            Entonces la respuesta del bot sera <respuesta del bot>

            Ejemplos:
            | tipo de regex | input de usuario | respuesta del bot     |
            | cerrá         | cerra            | guardaremos tus datos |
            | cerra         | cerrá            | guardaremos tus datos |
            | cerrá         | encerrado        | guardaremos tus datos |
            | cerra         | hola             | mensaje de error      |
        
