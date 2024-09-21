#language: es
Característica: descartar un mensaje encolado

    Regla: se puede descartar el mensaje encolado
        Escenario: supervisor descarta mensaje de chat
            Dado que en la cola "Cola AAA" se encuentra encolado un mensaje de un servicio de chat
            Y dado que el supervisor "yoizenadmin" se encuentra visualizando dicha cola desde la seccion "mensajes en cola"
            Cuando el supervisor descarta el mensaje de chat
            Entonces el mensaje no debe encontrarse mas en estado encolado
            Y el caso estara cerrado
            
        Escenario: supervisor descarta mensaje de chat integrado
            Dado que en la cola "Cola AAA" se encuentra encolado un mensaje de un servicio de chat integrado
            Y dado que el supervisor "yoizenadmin" se encuentra visualizando dicha cola desde la seccion "mensajes en cola"
            Cuando el supervisor descarta el mensaje de chat
            Entonces el mensaje no debe encontrarse mas en estado encolado
            Y el caso estara cerrado

    Regla: se puede optar por cerrar el caso al mismo tiempo que se descarta el mensaje
        
        Escenario: supervisor descarta mensaje y cierra caso de chat
            Dado que en la cola "Cola AAA" se encuentra encolado un mensaje de un servicio de chat
            Y dado que el supervisor "yoizenadmin" se encuentra visualizando dicha cola desde la seccion "mensajes en cola"
            Cuando el supervisor descarta el mensaje de chat y cierra caso
            Entonces el mensaje no debe encontrarse mas en estado encolado
            Y el caso estara cerrado
            
        Escenario: supervisor descarta mensaje y cierra caso de chat integrado
            Dado que en la cola "Cola AAA" se encuentra encolado un mensaje de un servicio de chat integrado
            Y dado que el supervisor "yoizenadmin" se encuentra visualizando dicha cola desde la seccion "mensajes en cola"
            Cuando el supervisor descarta el mensaje de chat y cierra caso
            Entonces el mensaje no debe encontrarse mas en estado encolado
            Y el caso estara cerrado
