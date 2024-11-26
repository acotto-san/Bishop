#language: es
Característica: ABM de casillas para alertas del sistema

    Se traslada la configuración de la casilla de mail configurada en Parametros del Sistema - Solapa Global 
    a una nueva sección en Configuración - Sistema. Aquí se permite el alta de una o varias cuentas de mail, 
    las cuales podrán ser elegidas luego en las diferentes secciones del sistema donde se puede configurar una notificación/alerta por mail. 
    Por ejemplo, notificaciones de inactividad del servicio, generación de reportes, falla en el envío de un mensaje, etc.

Regla: El acceso a la sección configuración > sistema > mail está limitada por permisos

    @tc:6877
    Escenario: administrador accede a la nueva sección de configuración de mail
        Antes toda la configuración estaba en parámetros del sistema. Ahora se agregó una nueva sección para incorporar más casillas.
        Dado un administrador que posee permiso para editar casillas de mail para alertas
        Cuando busca en el menu de configuracion > sistema
        Entonces vera la seccion de conexiones de mail
        Y podra ingresar a la misma

    @tc:6878
    Escenario: supervisor no tiene permiso de acceso
        Dado un administrador que no posee permiso para editar casillas de mail para alertas
        Cuando busca en el menu de configuracion > sistema
        Entonces no vera la seccion de conexiones de mail

Regla: la casilla que estaba en global pasa a ser la default en la nueva seccion

    @tc:6879
    Escenario: Cuando se implementa un nuevo ambiente no tendra casilla preconfigurada
        Dado un ambiente que acaba de ser implementado
        Cuando ingresa a parametros del sistema para ver su conexion por default
        Entonces tendra la opcion "Ninguna" seleccionada automaticamente

    @tc:6880
    Escenario: Implementacion con version previa tendra migrado el su mail preexistente
        Dado un ambiente que posee configurada la casilla prueyoizen2@gmail.com en parametros del sistema
        Cuando se implementa la nueva version que contiene esta funcionalidad
        Entonces en la misma casilla sera la unica cargada en conexiones de mail
        Y estara configurada como casilla default

Regla: La opción seleccionada en parámetros del sistema queda configurada como casilla default. Se puede elegir la opción "Ninguna".
    
    @tc:6881
    Escenario: se edita casilla default
        Dado un admin que tiene la casilla prueyoizen2@gmail.com como default
        Cuando crea otra casilla nueva prueyoizen3@gmail.com
        Y la selecciona como default en parametros de sistema>global
        Entonces la nueva casilla default es prueyoizen3@gmail.com
    
    @tc:6882
    Escenario: se intenta eliminar casilla default
        Dado un admin que tiene la casilla prueyoizen2@gmail.com como default
        Cuando intenta eliminarla
        Entonces aparece una alerta avisando que esa casilla esta en uso

    @tc:6930
    Escenario: se elige la opción "Ninguna" como casilla default
        Dado que un admin no quiere configurar alertas con una casilla por defecto
        Cuando elige la opcion "Ninguna" en parametros del sistema>global
        Entonces no tendra ninguna opcion con el check de casilla por defecto en sus conexiones de correo

Regla: se puede agregar más de una casilla

    @tc:6883
    Escenario: se crean nuevas conexiones
        Dado un admin que quiere crear nuevas conexiones
        Cuando crea 10 casillas de mails nuevas
        Entonces las visualiza correctamente en su listado de conexiones
    
Regla: Se pueden editar y eliminar todas las casillas 

    @tc:6884
    Escenario: se intenta eliminar casilla en uso
        Dado un admin que tiene en uso la casilla prueyoizen3@gmail.com para notificar el usuario molesto
        Cuando intenta eliminar esa casilla de sus conexiones
        Entonces aparece un popup de aviso de uso en Parametros del sistema
        Y no podra ser eliminada hasta que deje de estar en uso

    @tc:6885
    Escenario: se eliminan casillas que no están en uso
        Dado un admin tiene 5 casillas en conexiones 
        Y 3 de ellas no estan siendo usadas
        Cuando las elimina
        Entonces no las visualiza en su lista de conexiones

    @tc:6886
    Escenario: se elimina una casilla luego de que deja de estar en uso
        Dado un admin que tiene la casilla prueyoizen3@gmail.com en uso en parametros de sistema
        Y que no puede eliminarse
        Cuando el admin quita su seleccion en parametros del sistema
        Entonces puede eliminar la casilla prueyoizen3@gmail.com con exito

    @tc:6887
    Escenario: se edita una conexion en uso
        Dado un admin que tiene en uso la casilla prueyoizen3@gmail.com para notificar el usuario molesto
        Cuando edita la casilla por prueyoizen4@gmail.com en conexiones
        Entonces se sigue utilizando la casilla con los nuevos cambios

    @tc:6931
    Escenario: la conexion default deja de ser usada
        Dado se tiene la casilla prueyoizen@gmail.com como casilla default
        Cuando un admin selecciona la opcion "Ninguna" en parametros del sistema
        Entonces en la lista de conexiones no hay ninguno correo marcado como default

    @tc:6932
    Escenario: se intenta eliminar casilla en uso en servicio deshabilitado
        Dado que la casilla prueyoizen@gmail.com esta siendo usada en un servicio deshabilitado
        Cuando quiero eliminar esta conexion
        Entonces aparece un popup de aviso de uso en ese servicio
        Y no se podra eliminar

Regla: Se soportan diferentes métodos de conexión
    
    @tc:6888
    Esquema del escenario: creacion de mails con diferentes métodos de conexión
        Dado un admin que quiere agregar un nuevo mail
        Cuando abre el desplegable de Protocolo 
        Y configura con el <metodo>
        Entonces la crea con éxito

            Ejemplos:
            | metodo    |
            | ews       |
            | smtp      |

Regla: Cada casilla tiene su formulario 
    
    @tc:6889
    Esquema del escenario: envio mail de prueba exitoso
        Dado que un admin tiene una casilla con conexion <metodo>
        Cuando utiliza el boton de prueba
        Entonces ve el popup de envio exitoso 
        Y le llega el mail al correo

            Ejemplos:
            | metodo    |
            | ews       |
            | smtp      |
    
    @tc:6890
    Escenario: fallo en el envio mail de prueba
        Dado que un admin tiene una casilla de mail nueva
        Cuando utiliza el boton de prueba
        Y tiene un error
        Entonces recibe el aviso por popup
        Y guarda un registro en el log del error ocurrido