#language: es
@us:7985
Característica: Tener la posibilidad de ver que listas de perfiles tiene asignadas un usuario
    Como Administrador/Supervisor
    Quiero poder ver que listas de perfiles tiene asignadas un usuario supervisor
    Para asi poder ver con facilidad a que listas de perfiles tienen permisos

    Regla de negocio: Un administrador/supervisor puede ver a que listas tienen permisos los usuarios
 
        @tc:8557
        Escenario: administrador verifica las listas de pefiles que tiene asignada un usuario
            Dado un supervisor que se encuentra en usuarios
            Y abre la informacion adicional del usuario "PEPE" 
            Cuando abra la pestaña Lista de perfiles de usuario
            Entonces podra ver las listas que tiene asignadas ese usuario