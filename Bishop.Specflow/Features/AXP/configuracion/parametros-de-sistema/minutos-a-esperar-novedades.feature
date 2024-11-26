#language: es
Característica: Hacer configurable el valor "Minutos a esperar por novedades" en la configuración del Gateway de AXP

    Como Administrador del sistema
    Quiero Poder gestionar el máximo configurable desde un apartado de configuración
    Para Establecer los minutos de espera por novedades en la configuración del Gateway de AXP

    Se crea una nueva seccion para configurar el límite máximo de tiempo: ySocial 🡪 Sistema 🡪 Parámetros de sistema 🡪 Solapa Casos 🡪 [Gateway]

    Regla: En el nuevo input a configurar en parámetros del sistema se permite ingresar un valor mayor o igual a 1 y menor o igual a 1440 minutos.

        @tc:10049
        Escenario: El valor por default es 120 minutos
            Dado que un supervisor ingresa al sistema por primera vez luego de la actualizacion
            Cuando ingrese a la seccion de Parametros de sistema > Solapa Casos > [Gateway]
            Y a la seccion Gateway>Editar>Configuracion Avanzada
            Entonces se observara el valor 120 minutos por defecto

        @tc:10050
        Escenario: El valor mínimo es mayor o igual a 1
            Dado que un supervisor ingresa a la seccion de Parametros de sistema > Solapa Casos > [Gateway]
            Cuando coloca el valor <valor>
            Entonces <resultado> guardar los cambios de la configuracion

            Ejemplos:
                | valor | resultado |
                | 0     | no logra  |
                | vacio | no logra  |
                | 1     | logra     |
        
        @tc:10051
        Escenario: El valor máximo es menor o igual a 1440
            Dado que un supervisor ingresa a la seccion de Parametros de sistema > Solapa Casos > [Gateway]
            Cuando coloca el valor <valor>
            Entonces <resultado> guardar los cambios de la configuracion

              Ejemplos:
                | valor | resultado |
                | 1441  | no logra  |
                | 1440  | no logra  |

    
    Regla: El valor configurado en el gateway no puede ser mayor al configurado en parámetros del sistema

        @tc:10052 
        Escenario: Supervisor intenta guardar un valor mayor al configurador en parámetros del sistema
            Dado que limite maximo de minutos a esperar configurado en parametros del sistema es de 120 minutos
            Y que un supervisor ingresa a la seccion de Gateway>Editar>Configuracion Avanzada
            Cuando coloca el valor 121
            Entonces no logra guardar los cambios

        @tc:10053 
        Escenario: se supera el máximo y el sistema toma el menor valor
            Dado que limite maximo de minutos a esperar configurado en parametros del sistema es de 100 minutos
            Y el tiempo configurado en el Gateway es de 90 minutos
            Cuando un supervisor modifica el limite en parametros del sistema a 80 minutos
            Entonces el sistema toma el menor valor entre ambos -80 minutos- 
            Y el supervisor no recibe ninguna alerta

        @tc:10054
        Escenario: El valor mínimo del gateway es mayor o igual a 1
            Dado que un supervisor ingresa a la seccion de Gateway>Editar>Configuracion Avanzada
            Cuando coloca el valor <valor>
            Entonces <resultado> guardar los cambios de la configuracion

            Ejemplos:
                | valor | resultado |
                | 0     | no logra  |
                | vacio | no logra  |
                | 1     | logra     |


    Regla: Desde la configuración del Gateway se deberá mostrar siempre el valor máximo configurado en parámetros de sistema.

        @tc:10055
        Escenario: El límite máximo de minutos a esperar queda aclarado en el gateway
            Dado que limite maximo de minutos a esperar configurado en parametros del sistema es de 130 minutos
            Cuando un supervisor ingrese a la seccion de Gateway>Editar>Configuracion Avanzada
            Entonces debera verse 130 aclarado entre parentesis

    
        @tc:10056
        Escenario: El límite máximo de minutos a esperar se actualiza en el gateway
            Dado que limite maximo de minutos a esperar configurado en parametros del sistema es de 130 minutos
            Y que un supervisor lo modifica a 120 minutos
            Cuando un supervisor ingrese a la seccion de Gateway>Editar>Configuracion Avanzada
            Entonces debera verse 120 actualizado entre parentesis

    Regla: El servicio espera los minutos configurados por novedades, si no las obtiene realiza una acción
        
        @tc:10057
        Escenario: no se reciben novedades y se ejecuta la acción configurada
            Dado que el tiempo configurado a esperar novedades en el Gateway es de 2 minutos
            Cuando pasa mas de 2 minutos
            Entonces se ejecuta la accion <accion> configurada en el gateway

            Ejemplos:
                | accion                  |
                | responder               |
                | descartar y cerrar caso |
