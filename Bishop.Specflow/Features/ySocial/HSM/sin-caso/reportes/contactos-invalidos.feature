#language:es
@us:6453
Característica: contactos inválidos
    La columna contactos inválidos registra aquellos contactos que tienen alguna invalidez en el csv cargado, una vez creada la tarea

        La tarea no se crea cuando se registra un error en el csv. Esta columna tiene que ver con registros procesados, un csv que fue cargado con algún error pero de todas formas se creó la tarea.
        De forma exploratoria buscar más variantes que apliquen a esta columna.

            No se crea la tarea cuando en el csv existe:
            -un parámetro ausente en un registro
            -un parámetro en otro renglón, enter entre parametros
            -un body con una frase que contiene una coma 
            -con parámetros vacios
            -con punto y coma como separador si se configura con coma
            -un espacio antes del nro de telefono
            -un espacio desp de nro de tel y antes de la coma
            -con encabezado
            -en una plantilla sin parametros, el csv contiene parametros

Regla: Al momento de ponerlo en el service bus, por reglas de negocio se invalida.

    @tc:7110
    Escenario: se registra contacto invalido por error en un parametro.
        Dado un supervisor carga el siguiente csv
        Y usa la plantilla "saludo bienvenida":
            """
                5491126333583, body body.
                5491158638852,,body
            """
        Cuando se termina de ejecutar la tarea
        Entonces el segundo registro sera invalido
        Y el numero 5491158638852 no recibira el hsm

    @tc:7111
    Escenario: se registra contacto invalido por parametro con muchos espacios extras
        Dado un supervisor carga el siguiente csv
        Y usa la plantilla "yoizen_templates_con_variables":
            """
                5491126333583,header,            1          ,2
                5491158638852,header,1,2
            """
        Cuando se termina de ejecutar la tarea
        Entonces el primer registro sera invalido
        Y el numero 5491126333583 no recibira el hsm

    @tc:7112
    Escenario: se registra contacto valido con un espacio extra en parametro
        Dado un supervisor carga el siguiente csv con un 
        Y usa la plantilla "aviso_factura_2":
            """
                5491126333583,header,def1,def2
                5491158638852, header,def1,def2
            """
        Cuando se termina de ejecutar la tarea
        Entonces los contactos seran enviados a Meta

    @tc:7113    
    Escenario: se registran contactos validos con un espacio extra entre ellos
        Dado un supervisor carga el siguiente csv
        Y usa la plantilla "confirmacion_cita_button":
            """
                5491126333583,juan,hoy,boton1,boton2,boton3

                5491158638852,romi,hoy,boton1,boton2,boton3
            """
        Cuando se termina de ejecutar la tarea
        Entonces los contactos seran enviados a Meta

Regla: cuando se invalida un registro subido, se suma 1 en la columna de contactos inválidos en el reporte de tareas hsm sin caso
    
    @tc:7114
    Escenario: la columna contactos invalidos suma uno
        Dado un supervisor completa el csv con un registro invalido
        Cuando se termina de ejecutar la tarea
        Entonces en el reporte online debera aparecer +1 en la columna de contactos invalidos 

    @tc:7115
    Escenario: la columna contactos invalidos no suma registros
        Dado un supervisor carga una tarea con 10 registros en su csv
        Y no tiene ningun registro con contacto invalido
        Cuando se termina de ejecutar la tarea
        Entonces esa columna debera quedar en 0 

Regla: En el reporte completo y diario los registros invalidos aparecen como no enviados a Meta
    
    @tc:7116
    Esquema del escenario: se reporta que un registro invalido no fue enviado a Meta
        Dado un supervisor carga una tarea de 10 registros en su csv
        Y 5 contactos fueron invalidos
        Cuando se genera el reporte <tipo de reporte> de esa tarea
        Entonces los 5 registros invalidos apareceran como "No enviados a Meta"

            Ejemplos:
                | tipo de reporte    |
                | diario             |
                | exportado completo |
