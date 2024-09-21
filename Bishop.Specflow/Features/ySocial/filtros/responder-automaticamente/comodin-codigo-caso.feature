#language: es
Característica: Comodin de codigo de caso para respuesta automatica de filtro

    @tc:5622
    Esquema del escenario: Supervisor utiliza comodin de id de caso la respuesta automatica de un filtro
        Dado un filtro de servicio <servicio> que posee como accion una respuesta automatica
        Cuando un supervisor edita el filtro 
        Y deja como respuesta automatica:
            """
                Ya te atendemos, tu numero de caso es @@CASO@@
            """
        Entonces se le debera permitir el guardado de la edicion
        Ejemplos:
            | servicio                    |
            | Apple Messages for Business |
            | Facebook                    |
            | Facebook Messenger          |
            | Google Play                 |
            | Google RCS Busines Messaging|
            | Instagram                   |
            | LinkedIn                    |
            | Mail                        |
            | Skype                       |
            | Telegram                    |
            | Twitter                     |
            | Whatsapp                    |
            | Youtube                     |

    @tc:5623
    Esquema del escenario: Usuario recibe una respuesta automatica de filtro que posee un comodin de codigo de caso
        Dado un filtro de servicio <servicio>
        Y el filtro posee como respuesta automatica el siguiente mensaje:
            """
                Ya te atendemos, tu numero de caso es @@CASO@@
            """
        Cuando un mensaje del caso con codigo 12345 ejecuta el filtro
        Entonces el usuario final recibir el mensaje:
            """
                Ya te atendemos, tu numero de caso es 12345
            """
        
        Ejemplos:
            | servicio                    |
            | Apple Messages for Business |
            | Facebook                    |
            | Facebook Messenger          |
            | Google Play                 |
            | Google RCS Busines Messaging|
            | Instagram                   |
            | LinkedIn                    |
            | Mail                        |
            | Skype                       |
            | Telegram                    |
            | Twitter                     |
            | Whatsapp                    |
            | Youtube                     |