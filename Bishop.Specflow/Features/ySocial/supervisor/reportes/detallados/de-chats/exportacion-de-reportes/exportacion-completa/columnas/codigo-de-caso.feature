#language: es
Característica: incluir codigo de caso en la exportacion completa del reporte
    Como supervisor de ySocial
    Quiero que los reportes detallados de chat exportados completos contengan columna con el codigo de caso si estaba habilitado en el filtro
    Para poder tener la columna como la tenía al realizar el reporte en la web

    Antecedentes:
        Dado el siguiente caso gestionado el día 18/01/2023:
            | codigo de chat | codigos de mensaje | codigo de caso |
            | 526            | 2970               | 1677           |
        
    @tc:5184
    Escenario: supervisor exporta reporte completo con columna caso
        Dado que un supervisor solicito un reporte detallado de chats para el dia 18/01/2023
        Y que en los filtros tenia habilitado el check de incluir codigos
        Cuando exporte el reporte completo
        Entonces el reporte debe contener la columna "caso" 
        Y en el reporte debe encontrarse un registro con el numero de caso 1677 en la columna "caso"
    @tc:5185
    Escenario: supervisor exporta reporte completo sin columna caso
        Dado que un supervisor solicito un reporte detallado de chats para el dia 18/01/2023
        Y que en los filtros tenia deshabilitado el check de incluir codigos
        Cuando exporte el reporte completo
        Entonces el reporte no contendra la columna "caso"