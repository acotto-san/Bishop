#language: es
Característica: eventos estadisticos en texto plano
    Como supervisor de yFlow
    Quiero tener un evento estadistico que registre datos en texto plano
    Para que al ejecutar una pieza de evento estadistico se guarde los datos que en la misma se hayan escrito

    La idea es setear un evento en una pieza y guardar un dato en texto plano. Se pueden tener diferentes eventos estadisticos y guardarse lo que se desee en ellos. Se pondrian estrategicamente en los bloques que se deseen del flujo. Su uso podría ser para tener una trazabilidad de los bloques que visita el usuario y de datos que se generan en dichas visitas.

@tc:4711
Esquema del escenario: Ejecucion de un evento estadistico (normal) genera un json en el servidor
     el intervalo presente se tiene que calcular en utc:0 en vez de utc:-3 
     el intervalo se tiene que redondear en la media hora que este a futuro
     ej: hago una accion ahora que son la 16:20 utc: -3. entonces voy a buscar la carpeta del intervalo 1930
    
    Dada una pieza con un evento estadístico en un flujo con <@id>
    Y la pieza tiene configurado el siguiente texto <@textoPlaceholder>
    Cuando se ejecute la pieza en un caso
    Entonces en la carpeta E:\Social\Test\StorageYflow\detailedInfo\<@id>\stadistic_event\<@diaDeLaEjecucion>\<@intervaloCuandoFueEjecutado> debera crearse un nuevo archivo json
    Y en la propiedad data dentro del json debera haber una pareja de clave valor que indique "texts": [<@textoPlaceholder>]

    Ejemplos: 
        | @id | @textoPlaceholder                                                                     | @diaDeLaEjecucion | @intervaloCuandoFueEjecutado |
        | 329 | El numero de caso es: {{caseId}}. El ultimo texto del usuario es: {{inputDelUsuario}} | 06/03/2023        | 1230                         |

@tc:4712
Esquema del escenario: Se descarga un reporte eventos con un evento estadistico de texto plano
    Dado se ejecuto en un intervalo una pieza de evento estadistico
    Y la pieza contenia configurado el siguiente texto "<texto en pieza>"
    Cuando se descargue reporte de mensajes en las estadisticas de eventos del flujo
    Entonces debe estar presente en el reporte un registro que en la columna "Frase" contenga <texto en pieza>

    Ejemplos: 
        | @textoPlaceholder                                                                     | 
        | El numero de caso es: {{caseId}}. El ultimo texto del usuario es: {{inputDelUsuario}} | 