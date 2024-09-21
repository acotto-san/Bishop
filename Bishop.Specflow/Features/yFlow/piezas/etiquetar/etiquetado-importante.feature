Característica: yFlow - Etiqueta Importante
    Como implementador de chatbots
    Quiero tener una pieza que aplique una etiqueta importante
    Para que todo caso que haya ejecutado la pieza tenga como importante la etiqueta configurada en la misma

    Regla de negocio: Agrega la etiqueta descripta en la clave como importante

        @tc:8908
        Escenario: Pieza Etiquetar aplica etiqueta importante
            Dada una pieza Etiquetar configurada con la clave de una etiqueta
            Y posee habilitado el etiquetado importante
            Cuando un usuario final ejecuta la pieza
            Entonces el caso donde se ejecuto la pieza tendra como dicha etiqueta como normal y como importante

        @tc:8909
        Escenario: Pieza Etiquetar no aplica etiqueta importante
            Dada una pieza Etiquetar configurada con la clave de una etiqueta
            Y posee deshabilitado el etiquetado importante
            Cuando un usuario final ejecuta la pieza
            Entonces el caso donde se ejecuto la pieza tendra como dicha etiqueta como normal

    Regla de negocio: la pieza puede ser ejecutada multiples veces en un caso

        @tc:8910
        Escenario: Se ejecuta una pieza Etiquetar con clave incorrecta
            Dado un caso que ejecuto exitosamente una pieza Etiquetar con check de etiqueta importante habilitado
            Y una pieza Etiquetar que posee una clave erronea
            Cuando un usuario final ejecuta la pieza
            Entonces el caso permanece con la etiqueta normal e importante de la ultima ejecucion exitosa
            
        @tc:8911
        Escenario: Caso ejecuta multiples piezas Etiquetar y permanece como importante la ultima ejecutada
            Dado dos piezas Etiquetar configuradas con check de etiqueta importante habilitado
            Y ambas tienen dos claves diferentes
            Cuando un usuario final ejecuta las dos piezas
            Entonces el caso quedara con ambas etiquetas como normales
            Y la clave de la ultima pieza ejecutada sera la etiqueta importante del caso