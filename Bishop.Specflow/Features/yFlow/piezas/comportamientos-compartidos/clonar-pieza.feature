#language: es
@us:6636
Característica: Poder clonar una pieza que un flujo contiene ya configurada

    Regla: Se puede clonar la pieza
  
        @tc:6173 @tc:6691
        Esquema del escenario: Supervisor clona una pieza
            Dado un supervidor que tiene una pieza <pieza> en su flow
            Cuando ejecuta la accion clonar sobre la pieza
            Entonces la pieza aparece clonada debajo de aquella, con el mismo contenido

            Ejemplos: 
            | pieza             |
            | comentario        |
            | autenticar perfil |