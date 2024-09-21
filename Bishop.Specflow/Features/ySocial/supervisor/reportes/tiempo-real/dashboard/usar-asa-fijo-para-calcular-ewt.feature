#language: es
Característica: Tener un ASA Base-Fijo cuando no hay valor de AHT y tampoco de ASA Diario
Como Administrador del sistema
Quiero Poder establecer un valor de ASA Base
Para Que el sistema pueda calcular el EWT las veces que no cuente con un ASA calculable

Regla: Se puede decidir si poner en funcionamiento o deshabilitar el feature.

@tc:8818
Esquema del escenario: El sistema deberá permitir configurar un ASA Base.
- Globalmente.
- En una cola en particular. 
Dado Un supervisor configura el ASA Base
Cuando lo configura desde <lugar>
Entonces El sistema deberá permitir configurar un ASA Base

Ejemplos:
| lugar       |
| Globalmente |
| En una cola |

@tc:8819
Esquema del escenario: Se sobreescribe la configuración en la cola y no se usa el ASA Base configurado globalmente.
Dado Un supervisor configura el ASA Base en 30 segundos en Parametros del sistema
Cuando sobreescribe la configuracion de la cola Test
Y abre la opcion de personalizar el Asa Base
Entonces debera aparecerle una replica de la configuracion editada en Parametros del sistema
Y podra modificar el tiempo para esa cola

Regla:Se puede definir el valor de ASA Base dentro de limites.

@tc:8820
Escenario: Valor de ASA Base menor a 30 segundos
Dado Un supervisor que configura el ASA Base en <lugar>
Cuando pone 29 segundos 
Entonces no deberia guardar cambios 
                
Ejemplos:
| lugar              |
| params de sistema  |
| cola en particular |

@tc:8821
Escenario: Valor de ASA Base no debe superar los 3600 segundos en la edición de la cola.
Dado Un supervisor no debe poder ingresar un numero mayor a 3600 de ASA Base.
Cuando Se intenta configurar un ASA Base de una cola con un numero superior.
Entonces El sistema no permite guardar cambios

@tc:8822
Escenario: Valor de ASA Base puede superar los 3600 segundos en parametros de sistemas.
Dado Un supervisor debe poder ingresar un numero mayor a 3600 de ASA Base.
Cuando Se configura un ASA Base con un numero superior en parametros del sistema
Entonces El sistema permite guardar cambios

Regla: Una vez que una cola tiene ASA Diario el ASA Base NO se puede vuelver a utilizar.

@tc:8823
Escenario: El EWT se estuvo computando utilizando ASA Base.
Dado que no habian ingresado mensajes en la cola
Y se estuvo usando el ASA Base configurado
Cuando ingresa el primer mensaje del dia en la cola 
Entonces se empieza a usar el ASA Diario o el AHT para computar el EWT
        
        

