#language: es
Característica: incluir codigos de caso
    Como supervisor de ySocial
    Quiero que al detallado de chat se le pueda agregar una columna con codigo de casos
    Para no tener que entrar caso por caso para enterarme de estos codigos

    Antecedentes:
        Dado el siguiente caso gestionado el día 18/01/2023:
            | codigo de chat | codigos de mensaje | codigo de caso |
            | 526            | 2970               | 1677           |
    @tc:5183
    Escenario: se abre modal de datos del caso desde enlace en el codigo de caso
        Dado que un supervisor solicito un reporte detallado de chats del día 18/01/2023
        Y en los resultados de la columna caso se encontraba el caso 1677
        Cuando el supervisor hace click en el enlace del codigo de caso
        Entonces se debe abrir un modal mostrando los datos del caso 1677