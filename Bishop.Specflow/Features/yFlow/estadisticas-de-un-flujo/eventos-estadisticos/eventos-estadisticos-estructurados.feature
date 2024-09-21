#language: es
@us:4378
#TODO: moverlo de lugar ya que es logica de la pieza y no de la seccion de reportes estadisticos
Característica: eventos estadisticos estructurados
    Como supervisor de yFlow
    Quiero tener un tipo de eventos estaditicos de tipo estructurado con campos clave-valor
    Para que la informacion que almacenen los eventos estadisticos este mas estandarizado

    Antes los eventos estadisticos guardaban un texto plano simple que se completaba con el uso de variables.
    Ahora se quiere tener una nueva opcion para que los eventos estadisticos guarden la informacion bajo una organizacion mas fija. Por eso un evento estadistico estructurado es como un formulario de campos donde solamente se pueden rellenar los campos con algun dato.

    Regla: lo que se haya configurado en el evento desde ajustes debera verse en la pieza

        @tc:5492
        Escenario: se visualiza la descripcion de un campo desde la pieza
            Dado el siguiente evento estadistico estructurado:
                | atributo                    | valor                                      |
                | nombre del evento           | evento inicial                             |
                | nombre del unico encabezado | Encabezado A                               |
                | descripcion del encabezado  | este es el Encabezado A del evento inicial |         
            Y que un supervisor selecciona el evento "evento inicial" en una pieza de evento estadistico
            Cuando posiciona el mouse arriba del signo de interrogacion del Encabezado A
            Entonces debera ver un tooltip que diga "este es el Encabezado A del evento inicial"

    Regla: los encabezados son configurables desde ajustes
        Antecedentes:


        @tc:5493
        Escenario: se agrega un nuevo campo a un evento estadistico estructurado
            Dado un bot que posee un evento estadistico estructurado con 2 campos creados
            Y el evento esta seleccionado en una pieza de evento estadistico en un bloque
            Cuando un supervisor agrega un tercer campo al evento estadistico
            Entonces en la pieza debe hacerse visible el nuevo campo
            Y el valor de dicho campo debe encontrarse vacio

        @tc:5494
        Escenario: se edita un campo de un evento estructurado
            Dado un flujo que contiene el siguiente evento estadisto estructurado:
                | atributo                   | valor                                      |
                | nombre del evento          | evento inicial                             |
                | encabezados                | "Encabezado A" y "Encabezado B"            |
                | descripcion del encabezado | este es el Encabezado A del evento inicial |
            Y dado que el evento ya esta configurado en una pieza de eventos estadisticos
            Y que un supervisor se encuentra en la seccion de eventos estadisticos en los ajustes de un flujo
            Cuando edita el nombre del encabezado "Encabezado B" renombrandolo a "Encabezado Y"
            Entonces en la pieza que tiene seleccionado el evento debe verse "Encabezado A" y "Encabezado Y"

        @tc:5495
        Escenario: se elimina un campo de un evento estructurado
            Dado un flujo que contiene el siguiente evento estadisto estructurado:
                | atributo                   | valor                                      |
                | nombre del evento          | evento inicial                             |
                | encabezados                | "Encabezado A" y "Encabezado B"            |
                | descripcion del encabezado | este es el Encabezado A del evento inicial |
            Y dado que el evento ya esta configurado en una pieza de eventos estadisticos
            Y que un supervisor se encuentra en la seccion de eventos estadisticos en los ajustes de un flujo
            Cuando elimina el encabezado "Encabezado B"
            Entonces en la pieza que tiene seleccionado el evento debe verse unicamente "Encabezado A"
    
    Regla: si se ejecuta una pieza de eventos estadisticos utilizando un evento estructurado se graban datos en el filesystem del servidor
        
        @tc:4714
        Esquema del escenario: ejecucion de un evento estadistico estructurado genera un json en el servidor
                 el intervalo presente se tiene que calcular en el utc del servidor en vez de utc:-3 
                 el intervalo se tiene que redondear en la media hora que este a futuro
                 ej: hago una accion ahora que son la 16:20 utc: -3. entonces voy a buscar la carpeta del intervalo 1930 porque el servidor esta en utc 0
            Dado un evento estadistico con los encabezados "Encabezado A" y "Encabezado B"
            Cuando una pieza de evento estadistico se ejecuta con este evento en el flujo id <id del bot> el dia 25-11-2022 a las 13:53 del servidor
            Y la pieza tenia configurados los siguientes valores en texto fijo:
                    |encabezado     |valor      |
                    |Encabezado A   |"dato 1"   |
                    |Encabezado B   |"dato 2"   |
            Entonces en la carpeta del servidor E:\Social\Test\StorageYflow\detailedInfo\<id del bot>\stadistic_event\<dia de la ejecucion>\<intervalo de ejecucion> debera crearse un nuevo archivo json
            Y dentro del archivo json debera haber un campo llamado "structuredData" y su contenido sera: '["dato 1","dato 2"]'

            Ejemplos:
                | id del bot | dia de la ejecucion | intervalo de ejecucion |
                | 593        | 08/03/2023          | 1000                   |
        
        @tc:5491
        Escenario: se guardan datos estructurados en un json utilizando variables en la pieza de eventos estadisticos
            Dado un caso con los siguientes datos:
                    |atributo                           |valor              |
                    |id del caso                        |33620              |
                    |id del usuario que crea el caso    |4033580033345346   | 
            Y que en el flujo donde esta el caso se tiene una pieza de eventos estadisticos con la siguiente configuracion:
                    |encabezado     |valor          |
                    |Encabezado A   |"{{caseId}}"   |
                    |Encabezado B   |"{{userId}}"   |
            Cuando se ejecuta la pieza
            Y se genera el archivo json correspondiente a la ejecucion 
            Entonces el mismo debera contener en el campo "structuredData" el siguiente contenido: '["33,620","4033580033345346"]'

    Regla: se pueden bajar los registros de eventos estadisticos desde diferentes lugares

        @tc:4715
        Esquema del escenario: contenido de un reporte de evento estadistico estructurado
            Dado que se ejecuto en un intervalo una pieza de evento estadistico
            Y el evento de la pieza estaba configurado de la siguiente manera
                | clave        | valor    |
                | Encabezado A | "dato 1" |
                | Encabezado B | "dato 2" |
            Cuando un supervisor descargue desde <metodologia de exportacion> un reporte que contenga dicha ejecucion
            Entonces en las ultimas columnas del reporte deberan estar las columnas llamadas "Encabezado A" y "Encabezado B"
            Y los valores en la fila correspondientes a dichas columnas deben ser "dato 1" y "dato 2"

            Ejemplos: 
                | metodologia de exportacion    |
                | la seccion de estadisticas    |
                | la exportacion diaria por ftp |