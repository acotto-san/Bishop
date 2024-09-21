#language: es
Característica: incluir codigo de caso en la exportacion visible del reporte
    Como supervisor de ySocial
    Quiero que los reportes detallados de chat exportados visibles contengan columna con el codigo de caso si estaba habilitado en el filtro
    Para poder tener la columna como la tenía al realizar el reporte en la web

    Antecedentes:
        Dado el siguiente caso gestionado el día 18/01/2023:
            | codigo de chat | codigos de mensaje | codigo de caso |
            | 526            | 2970               | 1677           |  
    
    @tc:5187
    Escenario: supervisor exporta reporte visible que contiene la columna caso
        Dado que un supervisor solicito un reporte detallado de chats para el dia 18/01/2023
        Y que en los filtros tenia habilitado el check de incluir codigos
        Y que cargo registros hasta visualizar el caso 1677
        Cuando exporte el reporte visible
        Entonces el reporte debe contener la columna "caso" 
        Y en el reporte debe encontrarse un registro con el numero de caso 1677 en la columna "caso"

    @tc:5188
    Escenario: supervisor exporta reporte visible que no contiene la columna caso
        #TODO: hay que pulir las condiciones para que se presente el boton Exportar Visible
        Dado que un supervisor solicito un reporte detallado de chats para el dia 18/01/2023
        Y que en los filtros tenia deshabilitado el check de incluir codigos
        Cuando exporte el reporte visible
        Entonces el reporte no contendra la columna "caso"