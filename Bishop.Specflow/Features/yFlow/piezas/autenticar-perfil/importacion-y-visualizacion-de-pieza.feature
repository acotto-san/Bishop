#language: es 
Característica: Importación y visualización de pieza autenticar perfil

Regla de negocio: la pieza autenticar perfil es exclusiva de canal chat
    
    @tc:6435
    Esquema del escenario: La pieza solo se visualiza en canal chat
       Dado un bot de canal <tipo de servicio>
       Cuando busco la pieza autenticar chat
       Entonces deberia <visualizacion> la pieza

        Ejemplos:
        | tipo de servicio   | visualizacion   |
        | facebook messenger | no visualizarse |
        | chat               | visualizarse    |
        | instagram          | no visualizarse |
        | twitter            | no visualizarse |
        | whatsapp           | no visualizarse |
        | skype              | no visualizarse |
        | mercado libre      | no visualizarse |
        | telegram           | no visualizarse |
        | google rbm         | no visualizarse |
        | apple              | no visualizarse |
    
    @tc:6436
    Esquema del escenario: Importación de json con la pieza autenticar chat
        Dado un json de un flow de chat que contiene la pieza autenticar
        Cuando un supervisor lo importa en un flujo de <tipo de servicio>
        Entonces deberia <visualizacion> la misma configuracion

        Ejemplos:
        | tipo de servicio   | visualizacion   |
        | facebook messenger | no visualizarse |
        | chat               | visualizarse    |
        | instagram          | no visualizarse |
        | twitter            | no visualizarse |
        | whatsapp           | no visualizarse |
        | skype              | no visualizarse |
        | mercado libre      | no visualizarse |
        | telegram           | no visualizarse |
        | google rbm         | no visualizarse |
        | apple              | no visualizarse |
    
    @tc:6437
    Esquema del escenario: Importación de bloque con la pieza autenticar chat
        Dado un supervisor que configura un bot de <tipo de servicio>
        Cuando importa un bloque de un flow de chat que contiene la pieza autenticar
        Entonces deberia <visualizacion> la pieza con la misma configuracion

        Ejemplos:
        | tipo de servicio   | visualizacion   |
        | facebook messenger | no visualizarse |
        | chat               | visualizarse    |
        | instagram          | no visualizarse |
        | twitter            | no visualizarse |
        | whatsapp           | no visualizarse |
        | skype              | no visualizarse |
        | mercado libre      | no visualizarse |
        | telegram           | no visualizarse |
        | google rbm         | no visualizarse |
        | apple              | no visualizarse |