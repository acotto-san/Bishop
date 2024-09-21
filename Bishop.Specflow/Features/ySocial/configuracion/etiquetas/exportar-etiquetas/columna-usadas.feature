#language: es
Característica: Usadas
Como: el usuario que exportó todas las etiquetas del sistema.
Quiero: tener una columna que las diferencie
Para: al exportar las etiquetas en un excel tener una columna que indique si estan usadas SI o NO,
en orden de poder diferenciar que etiquetas en un excel con muchos registros.
  

    Regla de negocio: Una etiqueta tiene un SI o NO Usada.
        
        @tc:8734
        Escenario: La etiqueta tiene un SI en columna Usada.
            Dado que una etiqueta fue usada para etiquetar un caso.
            Cuando un supervisor/administrador exporta la lista de etiquetas.
            Entonces el valor de la celda "usada" sera SI.

        @tc:8735
        Escenario: La etiqueta tiene un NO en columna usada.
            Dado que una etiqueta no esta usada para etiquetar un caso.
            Cuando un supervisor/administrador exporta la lista de etiquetas.
            Entonces el valor de la celda "usada" sera NO.

    Regla de negocio: Los textos de las columanas usado tiene el lenguaje esperado.

        @tc:8736
        Escenario: Columna Usado segun idioma del sistema
            Dado que el sistema esté en el lenguaje configurado.
            Cuando la columana usado se encuentra en el lenguaje esperado.
            Entonces el sistema se presenta con el lenguaje esperado en la columna usado.

        @tc:8737
        Escenario: Valor de la celda "Usado" segun idioma del sistema.
            Dado que el sistema esté en el lenguaje configurado.
            Cuando la columna usada se encuentra en el lenguaje esperado.    
            Entonces el valor de la celda se presenta con el lenguaje esperado      

