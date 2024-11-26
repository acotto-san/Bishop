Característica: Tener una vista detallada sobre columna VIM
    Como Supervisor/Administrador
    Quiero Poder visualizar los mensajes de una cola que solo sean VIM
    Para Gestionar específicamente sobre los mensajes marcados como importantes


    Regla de negocio: el supervisor/administrador identifica mensajes VIM en una cola 

        @tc:9261
        Escenario: el supervisor dentro de la columna VIM hace click en el icono estrella 
            Dada que en Reportes-Tiempo real- Colas
            Cuando una cola posee mensajes VIM 
            Entonces el supervisor cliquea en la estrella en la columna VIM

        @tc:9262
        Escenario: exiten mensajes VIM y se accede a traves del icono estrella
            Dada que un usuario ingrese al reporte de tiempo real de colas
            Y hace click en el icono estrella
            Cuando una cola posee mensajes VIM
            Entonces debe abrir un modal con las características de cada campo: 
                | detalles del mensaje   |
                | Ícono de lupa          |
                | Código                 |
                | Caso                   |
                | Fecha Original         |
                | Fecha Ingreso          |
                | Servicio               |
                | Privado                |
                | Agrupa                 |
                | Usuario                |
                | Se asignará a          |
                | Contenido              |
                | Archivos Adjuntos      |
                | Retornado              |
                | Atención dentro del SL |
                | Respuesta rápida       |
                | Call to action cerrar  |

        @tc:9263
        Escenario: en el mensaje VIM se muestra el tool-tip
            Dada que la cola tiene dos mensajes VIM
            Cuando el supervisor acerca el mouse sobre esa columna VIM 
            Entonces se muestra el tool-tip con el mensaje "Ver mensajes en cola"

    Regla de negocio: el supervisor/administrador observa que NO existen mensajes VIM en una cola 

        @tc:9264
        Escenario: el supervisor dentro de la columna VIM no podra ver el icono estrella
            Dada que en Reportes-Tiempo real- Colas
            Cuando una cola no posee mensajes VIM 
            Entonces el supervisor no observa una estrella en la columna VIM

        @tc:9265
        Escenario: un mensaje NO VIM un supervisor lo marcara como VIM
            Dada que un mensaje NO es VIM
            Cuando el supervisor lo ponga como VIM 
            Entonces en el reporte de tiempo real se muestra como mensaje VIM

    Regla de negocio: la columna Contenido Contraer o mostrar el mensaje

        @tc:9266
        Escenario: la columna Contenido mostrara el Contenido del mensaje
            Dada que el supervisor observa los mensajes VIM de la cola
            Cuando una cola posee mensajes VIM 
            Entonces la columana Contenido muestra el contenido completo del mensaje

        @tc:9267
        Escenario: el mensaje VIM tiene en la columna Contenido un mensaje Largo finalizando con puntos suspensivos
            Dada que un supervisor observa el contenido del mensaje VIM  
            Cuando una cola posee mensajes VIM 
            Entonces el supervisor hace click en la estrella y observa el mensaje completo en el contenido del mensaje. 

        @tc:9268
        Escenario: el mensaje VIM  tiene en la columna Contenido un mensaje corto
            Dada que el supervisor observa el contenido mensajes VIM 
            Cuando una cola posee mensajes VIM 
            Entonces el supervisor observa el mensaje completo en la columna Contenido