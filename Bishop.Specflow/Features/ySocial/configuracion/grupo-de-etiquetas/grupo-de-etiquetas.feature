#language: es
Característica: Tener grupos de etiquetas para vincularlas masivamente a colas
    Como administrador o supervisor con los permisos necesarios
    quiero crear o modificar grupos de etiquetas
    para poder armar grupos de etiquetas 

    Regla de negocio: Se deberan tener permisos para ingresar a la vista que permita ABM de grupos de etiquetas

        @tc:5699
        Esquema del escenario: Un administrador quiere modificar permisos a un supervisor para crear grupos de etiquetas
            Dado un supervisor que posee permisos <estado actual> para administrar grupos de etiquetas
            Cuando el administrador ingresa a la edicion de permisos de dicho supervisor
            Entonces el administrador podra <cambio estado>
            Y el supervisor <accion final> realizar acciones de ABM sobre los grupos de etiquetas

            Ejemplos:
                | estado actual | cambio estado  | accion final |
                | habilitados   | deshabilitar   | no podra     |
                | deshabilitados| habilitar      | podra        |
        
        @tc:5707
        Escenario: Un supervisor sin permisos no podra interactuar con los grupos de etiquetas
            Dado un supervisor que posee permisos deshabilitados para administrar grupos de etiquetas
            Cuando ingrese a la pagina de grupos de etiquetas
            Entonces no podra interactuar con los grupos de etiquetas
    
    Regla de negocio: Se deberan tener permisos para ingresar a la vista que permita vincular los grupos de etiquetas a una cola 

        @tc:5700
        Esquema del escenario: Un administrador quiere modificar permisos a un supervisor para vincular grupos de etiquetas desde una cola
            Dado un supervisor que posee permisos <estado actual> para administrar grupos de etiquetas en colas
            Cuando el administrador ingresa a la edicion de permisos de dicho supervisor
            Entonces el administrador podra <cambio estado>
            Y el supervisor <accion final> modificar la vinculacion entre grupos de etiquetas y colas al editar una cola

            Ejemplos:
                | estado actual | cambio estado  | accion final |
                | habilitados   | deshabilitar   | no podra     |
                | deshabilitados| habilitar      | podra        |   
	
    Regla de negocio: Los grupos de etiquetas son cofigurados por los supervisores

		 @tc:5701
        Escenario: Un supervisor podra selecionar las etiquetas que desee dentro del grupo que cree
            Dado un supervisor que se encuentra en la creacion de un grupo de etiquetas
            Cuando selecciona las siguientes etiquetas
                | nombre etiqueta |
                | Etiqueta A      |
                | Etiqueta B      |
            Y guarda cambios
            Entonces el nuevo grupo de etiquetas estara compuesto por las siguientes etiquetas
                | etiquetas del grupo |
                | Etiqueta A          |
                | Etiqueta B          |  

        @tc:5704
        Escenario: Un supervisor podra asignar los grupos de etiquetas a las colas
            Dado un supervisor que se encuentra en la creacion de un grupo de etiquetas
            Cuando vincule el grupo de etiquetas a la cola "Cola 1"
            Y guarda cambios
            Entonces todas las etiquetas del grupo estaran asociadas a "Cola 1"
            Y podran ser utilizadas por agentes o el sistema

    Regla de negocio: Un supervisor puede editar un grupo de etiquetas ya creado

        @tc:5702
        Escenario: Un supervisor podra cambiar las etiquetas del grupo 
            Dado un grupo de etiquetas que posee la siguiente configuracion
                | etiquetas               | colas asociadas |
                | Etiqueta A y Etiqueta B | Cola 1 y Cola 2 |
            Cuando agrega al grupo de etiquetas la Etiqueta C
            Entonces la lista total de etiquetas del grupo sera
                | etiquetas del grupo |
                | Etiqueta A          |
                | Etiqueta B          |
                | Etiqueta C          |
            Y todas deberan de estar vinculadas a las
                | colas vinculadas |
                | Cola 1           |
                | Cola 2           |

        @tc:5705
        Escenario: Un supervisor podra cambiar el nombre al grupo de etiquetas
            Dado que una cola posee asociado al grupo de etiquetas "GRUPO PRUEBA"
            Cuando un supervisor modifica el nombre del grupo por "GRUPO NUEVO"
            E ingresa a la edicion de la cola
            Entonces vera que la misma posee asociado el grupo de etiquetas "GRUPO NUEVO"

    Regla de negocio: Un supervisor puede eliminar un grupo de etiquetas ya creado
        
        
        @tc:5703
        Escenario: Un supervisor podra eliminar un grupo de etiquetas
            Dado un grupo de etiquetas que se encuentra asociado a una cola
            Cuando un supervisor elimina el grupo de etiquetas
            Entonces este debe desaparecer de la pagina de grupos de etiquetas
            Y de la lista de grupos al editar una cola

    Regla de negocio: Los grupos de etiquetas se vinculan a las colas para que sean utilizadas por agentes o el sistema

    	@tc:5708
        Esquema del escenario: Un supervisor intenta vincular un grupo de etiquetas desde la edicion de una cola
            Dado un grupo de etiquetas que posee la siguiente configuracion
                | etiquetas seleccionadas | colas asociadas |
                | Etiqueta A              | Cola 1          |
                | Etiqueta B              | Cola 2          |
            Cuando el supervisor <estado> la cola "Cola 3"
            Y asocia el grupo de etiquetas
            Entonces la cola tendra asociadas las etiquetas Etiqueta A y Etiqueta B
            Y en la edicion del grupo se vera que se ecuentra asociada la cola "Cola 3"

            Ejemplos:
                | estado |
                | Cree   |
                | Edite  |

        @tc:5706
        Escenario: Un agente utiliza una etiqueta que fue vinculada a una cola mediante un grupo de etiquetas
            Dado que un supervisor vinculo el siguiente grupo de etiquetas a la cola "Cola AAA"
                | nombre de grupo | etiquetas vinculadas |
                | Grupo Nuevo     | Viriviri/AAA         |
            Cuando un agente tenga asignado un caso que fue encolado en la cola "Cola AAA"
            E intente etiquetar el caso
            Entonces en la lista de etiquetas debera estar presente la etiqueta "Viriviri/AAA"
