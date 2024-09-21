#language: es
@us:5371
Característica: Mostrar totales en reportes consolidados
    Como administrador 
    Quiero poder configurar totales o promedios en los reportes consolidados
    Para poder visualizar en los reportes un promedio o total de cada columna

    Regla de negocio: los totales solo seran visibles desde la vista online
        No aplica a exportable o reporte diario    

        @tc:5738
        Esquema del escenario: Un administrador quiere visualizar en los reportes consolidados el total o promedio de cada columna del reporte
            Cuando el administrador ingrese al <consolidado>
            Y vea el reporte desde la vista online
            Entonces debera ver el promedio o total al final de cada columna 

            Ejemplos:
                | consolidado              |
                | consolidado de agentes   |
                | consolidado de colas     |
                | consolidado de servicios |
                | consolidado de casos     |
                | consolidados de encuestas|

    Regla de negocio: Al exportar el reporte no se veran los totales
        
        @tc:5834
        Esquema del escenario: Supervisor descarga un reporte y no visualiza los totales
            Dado que un supervisor accede al reporte exportado de <consolidado> 
            Y el reporte fue exportado mediante <metodo de exportacion>
            Cuando visualice el contenido del reporte
            Entonces no vera los totales al pie de cada columna

            Ejemplos: exportacion manual
                | consolidado               | metodo de exportacion |
                | consolidado de agentes    | exportacion manual    |
                | consolidado de colas      | exportacion manual    |
                | consolidado de servicios  | exportacion manual    |
                | consolidado de casos      | exportacion manual    |
                | consolidados de encuestas | exportacion manual    |

            Ejemplos: exportacion diaria
                | consolidado               | metodo de exportacion |
                | consolidado de agentes    | exportacion diaria    |
                | consolidado de colas      | exportacion diaria    |
                | consolidado de servicios  | exportacion diaria    |
                | consolidado de casos      | exportacion diaria    |
                | consolidados de encuestas | exportacion diaria    |

            Ejemplos: exportacion programada
                | consolidado               | metodo de exportacion  |
                | consolidado de agentes    | exportacion programada |
                | consolidado de colas      | exportacion programada |
                | consolidado de servicios  | exportacion programada |
                | consolidado de casos      | exportacion programada |
                | consolidados de encuestas | exportacion programada |