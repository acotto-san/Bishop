#language: es
Característica: Habilitadas
Como: el usuario que exportó todas las etiquetas del sistema.
Quiero: tener una columna que las diferencie
Para: al exportar las etiquetas en un excel tener una columna que indique si estan habilitadas SI, NO o VACIO,
en orden de poder diferenciar que etiquetas en un excel con muchos registros.

    Regla de negocio: Un etiqueta debe tener un SI, NO o VACIO habilitado.

        
        @tc:8724        
        Escenario: La etiqueta tiene un SI en la columna habilitado.
            Dado que una etiqueta esta habilitada.
            Cuando un supervisor/administrador exporta la lista de etiquetas.
            Entonces el valor de la celda "habilitada" sera SI.
        
        @tc:8726
        Escenario: La etiqueta tiene un NO en la columna habilitado.
            Dado que una etiqueta esta deshabilitada.
            Cuando un supervisor/administrador exporta la lista de etiquetas.
            Entonces el valor de la celda "habilitada" sera NO.
        
        @tc:8727
        Escenario: la etiqueta contenedora tiene VACIO en la columna habilitado. 
            Dado una etiqueta que no puede ser habilitada por ser contenedora de otra
            Cuando un supervisor/administrador exporta la lista de etiquetas.
            Entonces el valor de la celda habilitado es VACIO.

    Regla de negocio: Los textos de las columanas Habilitado tiene el lenguaje esperado.
        
        @tc:8728
        Escenario: Titulo de columna Habilitado segun idioma del sistema
            Dado que el sistema esté en el lenguaje configurado.
            Cuando la columana habilitado se encuentra en el lenguaje esperado.
            Entonces el sistema se presenta con el lenguaje esperado en la columna habilitado.
        
        @tc:8729
        Escenario: Valor de la celda "Habilitada" segun idioma del sistema.
            Dado que el sistema esté en el lenguaje configurado.
            Cuando la columana habilitado se encuentra en el lenguaje esperado.    
            Entonces el valor de la celda se presenta con el lenguaje esperado       