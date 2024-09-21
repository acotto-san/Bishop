#language: es
Característica: Poder buscar más días para atrás desde Buscar Casos
Como Agente de ySocial.
Quiero poder buscar casos que gestioné hasta 30 días previos.    
Para poder tener una lista de esos casos.
    
Regla de negocio: Se puede buscar casos por "Cantidad de días" hasta un máximo de 30 días.

    @tc:8835
    Esquema del escenario: Busqueda de casos por cantidad de 30 días
        Dado que un agente gestiono casos durante los ultimos 30 dias
        Cuando selecciona <buscar> en buscar casos
        Y en estado selecciona <estado>
        Entonces La busqueda realizada mostrara los casos dentro de esos 30 días     

        Ejemplos: 
            | buscar                 | estado     |
            | Cantidad de días  = 30 | abierto    |
            | Cantidad de días  = 30 | cerrado    |
            | Cantidad de días  = 30 | indistinto |
            

    @tc:8836
    Esquema del escenario: Busqueda de casos por Cantidad de días mayor a 30 días
        Dado que un agente gestiono casos durante los ultimos 31 dias
        Cuando selecciona <buscar> en buscar casos
        Y en estado selecciona <estado>
        Entonces Presenta al agente un mensaje informando que solamente puede ver casos de hasta 30 días     

        Ejemplos: 
            | buscar                 | estado     |
            | Cantidad de días  = 31 | abierto    |
            | Cantidad de días  = 31 | cerrado    |
            | Cantidad de días  = 31 | indistinto |

    @tc:8837
    Esquema del escenario: Busqueda de casos por Cantidad de días menor a 1 día
        Dado que un agente gestiono casos durante los ultimos dias
        Cuando selecciona <buscar> en buscar casos
        Y en estado selecciona <estado>
        Entonces Presenta al agente un mensaje informando que solamente puede ver casos de hasta 30 días     

        Ejemplos: 
            | buscar                | estado     |
            | Cantidad de días  = 0 | abierto    |
            | Cantidad de días  = 0 | cerrado    |
            | Cantidad de días  = 0 | indistinto |

    @tc:8838
    Escenario: Cantidad de días por defecto es 1
        Dado Un agente selecciona la opcion de Buscar casos
        Cuando selecciona la opcion de filtro
        Y se abre el modal de busqueda
        Entonces en campo de "cantidad de días" el valor por defecto debe ser 1     
        