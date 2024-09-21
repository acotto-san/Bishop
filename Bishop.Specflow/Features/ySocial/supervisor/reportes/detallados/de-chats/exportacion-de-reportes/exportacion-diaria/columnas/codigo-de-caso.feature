#language: es
Característica: incluir codigo de caso en la exportacion visible del reporte
    Como supervisor de ySocial
    Quiero que los reportes detallados de chat diarios contengan una columna con el codigo de caso si estaba habilitado en el filtro
    Para poder tener la columna como la tenía al realizar el reporte en la web

    Antecedentes:
        Dado el siguiente caso gestionado el día 18/01/2023:
            | codigo de chat | codigos de mensaje | codigo de caso |
            | 526            | 2970               | 1677           |  
        
    @tc:5186
    Escenario: supervisor exporta reporte diario que contiene la columna caso
        Dado que el sistema genero el reporte detallado de chat diario para el dia 18/01/2023
        Cuando un supervisor accede a dicho deporte
        Entonces el reporte debe contener la columna "caso" 
        Y en el reporte debe encontrarse un registro con el numero de caso 1677 en la columna "caso"
