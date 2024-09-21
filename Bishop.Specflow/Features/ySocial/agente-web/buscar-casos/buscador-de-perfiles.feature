#language: es
@us:4385
Característica: Un buscador para encontrar usuarios y perfiles de usuarios


    Regla de negocio: Se podra utilizar un dato que referencie a una cuenta o perfil para tratar de ubicarlo en ySocial
        
        Escenario: agente busca un usuario que se contacto con ySocial
            Dado un usuario de una RRSS ya tuvo contacto con ySocial
            Cuando un agente ingresa ese nombre de usuario en el buscador
            Y el buscador finaliza la busqueda
            Entonces en los resultados aparecera dicho usuario

        @tc:5745
        Esquema del escenario: un agente visualiza una animacion que le informa que el buscador se encuentra trabajando
            Dado un agente que se encuentra visualizando el buscador de Buscar Casos
            Y que ingreso un usuario que <contacto previo> contacto previo con ySocial
            Y que comenzo una animacion de busqueda
            Cuando el buscador finaliza de procesar la busqueda
            Entonces se detendra la animacion indicando al agente que ya finalizo de procesar

            Ejemplos: 
                | contacto previo |
                | tuvo            |
                | no tuvo         |