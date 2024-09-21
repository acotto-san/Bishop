#language: es
Característica: Poder realizar abm con piezas de un flujo

    Regla: Una pieza que se puede agregar, eliminar y modificar dentro de un flujo.
   
        @tc:6170
        Esquema del escenario: Supervisor agrega una pieza a su flow
            Dado que un supervisor configura su flow
            Cuando agrega la pieza <pieza>
            Entonces esa pieza aparece en el bloque para ser configurada

            Ejemplos:
            | pieza             |
            | comentario        |
            | autenticar perfil |

        @tc:6171
        Esquema del escenario: Supervisor elimina o modifica una pieza
            Dado un supervisor que tiene una pieza <pieza> en su flow
            Cuando modifica la pieza
            Entonces su contenido se modifica

            Ejemplos: de pieza comentario
           | pieza             |
           | comentario        |
           | autenticar perfil |
       
        @tc:6693
	    Esquema del escenario: supervisor elimina una pieza
		    Dado que un supervisor se encuentra posicionado en una pieza
		    Cuando clickea el boton de eliminar
		    Y clickea eliminar en el modal de eliminacion
		    Entonces se debera eliminar la pieza

    Regla: Las acciones de ABM pueden estar bloqueadas a veces
        
        @tc:pendiente
        Escenario: Supervisor no logra hacer abm de piezas en un flujo productivo
            Dado que un supervisor se encuentra en un flujo productivo
            Entonces no puede agregar, eliminar o modificar piezas