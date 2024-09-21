#language: es
Característica: Ver las cargas masivas realizadas previamente

Regla de negocio: las cargas masivas que se veran listadas seran solo las que creo el mismo usuario que ingresa a la vista

    Escenario: Supervisor visualiza solo su carga masiva
        Dado que dos supervisores realizan una carga masiva en simultaneo
        Cuando el supervisor A ingresa a la pestaña "Importados" dentro de la pagina de Carga Masiva de Perfiles
        Entonces solo vera la carga masiva de perfiles solicitada por el

    @tc:6092
    Escenario: En la descripcion de la importacion se debe ver el nombre ingresado anteriormente
       Dado que en la carga masiva de perfiles el administrador le pone nombre a la tarea
       Cuando se posicione en la ventana de importados
       Entonces debera ver en la columna descripcion el nombre de la tarea


    @tc:5980
    Escenario: descargar el csv importado de forma exitosa
        Dado que un supervisor realiza la carga del siguiente csv:
            """
                2,5491158638852,romipruebatc5980,rgroisman@yoizen.com,5491158638852,1,0,0,0
                2,5491173677135,santiagopruebatc5980,sacostaottonelli@yoizen.com,5491177336677,1,1,1,1
            """                      
        Cuando un supervisor lo importa 
        Y agrega los usuarios de forma exitosa
        Entonces en la solapa de importados vera el archivo cargado

    Escenario: descargar el csv importado de forma fallida
        Dado el siguiente csv:
             """
                5491158638852,2,romi,rgroisman@yoizen.com,5491158638852,1,0,0,0
                jcontento@yoizen.com,2,juan,jcontento@yoizen.com,5491126333583,0,0,1,0
                groismanromina@gmail.com,2,usuario prueba,groismanromina@gmail.com,5491152222222,1,0,0,1
            """          
        Cuando un supervisor lo importa 
        Y el proceso finalizo con una falla
        Entonces en la solapa de importados vera el archivo cargado
        #Y el motivo de fallo?