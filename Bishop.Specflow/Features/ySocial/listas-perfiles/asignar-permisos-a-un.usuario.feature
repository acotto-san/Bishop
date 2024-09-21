#language: es
@us:7985
Característica: Tener la posibilidad de asignar a un usuario permisos para editar listas de perfiles
    Como Administrador/Supervisor
    Quiero poder darle permisos a un usuario
    Para que asi pueda editar la lista de perfiles que tenga asignada

    - El usuario podra editar las listas de perfiles pero no podra borrarlas ni cambiarles la clave

    Regla de negocio: Administrador/supervisor puede darle permisos a usuarios para que trabajen con listas de perfiles
 
        @tc:8558
        Escenario: administrador asigna permisos a un usuario para una lista de perfiles
            Dado un administrador ingresa a la lista de perfiles "LISTA1"
            Y en "Selección de Usuario" selecciona al usuario "PEPE"
            Cuando acepte los cambios
            Entonces el usuario "PEPE" debera tener permisos para modificar la lista de perfiles "LISTA1"

    Regla de negocio: Un usuario que tiene acceso a la lista no le puede permitir permisos de acceso a otro usuario

        @tc:8582
        Escenario: Un usuario con permisos intenta darle permisos a otro usuario 
            Dado un usuario con permisos se encuentra en la lista de pefiles asignada
            Cuando intente dar permisos a otro usuario
            Entonces no debera ver las opciones para dar permisos

    Regla de negocio: El usuario solo podra ver las listas de perfiles que se le asignen
        
        @tc:8583
        Escenario: Un usuario mira la lista de perfiles que tiene asignadas
            Dado un usuario que tiene asignada "Lista1"
            Cuando ingrese a "lista de perfiles"
            Entonces vera solo "Lista1"

        @tc:8584
        Escenario: Un usuario mira las diferentes listas de perfiles que tiene asignadas
            Dado un usuario que tiene asignada 2 listas de perfiles
            Y en el sistema existen 3
            Cuando ingrese a "lista de perfiles"
            Entonces vera solo las 2 que posee asignadas

    Regla de negocio: El usuario con permiso a la lista de perfiles no podra utilizar algunas funcionalidades 

        @tc:8585
        Escenario: Usuario intenta eliminar una lista de perfiles
            Dado un usuario que tiene permisos para editar "Lista1"
            Cuando ingrese a lista de perfiles
            E intenta eliminar una lista de perfiles 
            Entonces no debera ver el icono para eliminar la lista

        @tc:8586
        Esquema del escenario: Usuario agrega/elimina perfiles de una lista de perfiles que administra
            Dado un usuario que tiene asignadas listas de perfiles
            Y no tiene el permiso de "Listas de usuarios"
            Cuando ingrese a la edicion de una lista de perfil asignada
            Entonces dar de <accion> a un perfil en la lista
                
            Ejemplos:   
                | accion |
                | alta   |
                | baja   |

        @tc:8587
        Escenario: Usuario intenta modificar la clave de la lista de perfiles
            Dado un usuario con permisos se encuentra en una lista de perfiles 
            Cuando intente modificar la clave de la lista
            Entonces no debera poder hacerlo