#language: es
Característica: invocar a yFlow al cerrar automaticamente por inactividad
    Como supervisor de ySocial
    Quiero que los casos de yFlow que se tengan que cerrar vuelvan a un bloque de cierre de yFlow
    Para aprovechar la posibilidad de ejecutar algunos bloques antes del cierre

    Hay un nuevo bloque default en cada flujo que se llama "Cierre por inactividad" que es a donde salta el bloque cuando la plataforma identifica que alcanzó el tiempo de inactividad configurado.
    Al haber una pieza cerrar caso dentro del bloque, el mismo queda cerrado a nombre de yFlow, si no esta dicha pieza entonces es ySocial quien cierra el caso.

    Antecedentes: 
        Dado que en "Parámetros del sistema" se tiene configurado el cierre automatico por inactividad de yFlow en 15 minutos
        Y que se encuentra habilitado el feature "Invocar a yFlow al momento de cerrar el caso"
        Y dado que el servicio "Itchy and Scratchy Messenger" no sobreescribe la configuracion de casos del sistema
        Y que el servicio posee un flujo de yFlow vinculado
        Y dado que un caso de dicho servicio cumplio 15 minutos de inactividad

    Regla: al saltar al bloque "Cierre por inactividad" se ejecutan todas las piezas de dentro y luego el caso debe ser cerrado automaticamente

        Escenario: caso que cumplio su tiempo de inactividad salta al bloque "Cierre por inactividad" y ejecuta piezas
            Dado que en el bloque "Cierre por inactividad" del flujo hay una pieza mensaje con el texto "El caso se va a cerrar desde yflow"
            Cuando la plataforma intenta procesar el caso para su cierre
            Y haga que el caso atraviese el bloque "Cierre por inactividad"
            Entonces el usuario final debe recibiri el mensaje "El caso se va a cerrar desde yflow"
        
        Escenario: finaliza la ejecucion de pieza en el bloque "Cierre por inactividad" y el caso se cierra
            Cuando la plataforma intenta procesar el caso para su cierre
            Y finalice la ejecucion de las piezas del bloque "Cierre por inactividad"
            Entonces el caso quedara en estado cerrado

    Regla: el autor del cierre va a depender segun el contenido del bloque Cierre por inactividad

        Escenario: bloque "Cierre por inactividad" posee pieza cerrar caso
            Dado que el bloque "Cierre por inactividad" posee la pieza "cerrar caso"
            Cuando el caso se cierre luego de ejecutar el bloque
            Entonces el caso estará cerrado a nombre de yFlow

        Escenario: bloque "Cierre por inactividad" no posee pieza cerrar caso
            Dado que el bloque "Cierre por inactividad" no posee la pieza "cerrar caso"
            Cuando el caso se cierre luego de ejecutar el bloque
            Entonces el caso estará cerrado a nombre de ySocial