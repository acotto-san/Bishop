#language: es
Característica: Condición de contiene exactamente 
    Como administrador
    Quiero poder tener una condición que sea la opción intermedia entre "igual" y "contiene". Algo como "contiene exactamente".
    Para evitar que pase este tipo de situaciones: 
    El problema que reportó Metrogas es que en los comandos tienen incluidas palabras como "olor" que disparan una alerta de emergencia cuando la usuaria que escribe se llama "Dolores" u otros casos similares.

    Regla: Si el input del usuario contiene exactamente esa palabra va a hacer el salto de bloque indicado en el comando.

    @tc:6309
    Esquema del escenario: usuario ingresa mensaje y se evalua la condicion del comando
    Dado un comando con condicion contiene exactamente:"olor"
    Cuando el usuario ingresa <tipo de input>
    Entonces el bot <resultado obtenido>

    Ejemplos:
    | tipo de input           | resultado obtenido                    |
    | olor                    | salta a bloque configurado en comando |
    | dolor                   | no valida comando                     |
    | hay olor a gas          | salta a bloque configurado en comando |
    | olor.                   | salta a bloque configurado en comando |
    | **olor**                | salto de bloque                       |
    | _olor_                  | salto de bloque                       |
    | el gas coloreo la pared | no valida comando                     |
    | olores                  | no valida comando                     |
