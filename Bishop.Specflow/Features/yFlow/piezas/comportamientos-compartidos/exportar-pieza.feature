#language: es
@us:6636
Característica: Exportar una pieza de un flujo hacia otro bloque del mismo

    Regla: Se puede exportar la pieza a otro bloque

        @tc:6172 @tc:6692
        Esquema del escenario: Supervisor exporta una pieza a otro bloque
            Dado un supervisor que tiene una pieza <pieza> en su flow
            Cuando ejecuta la accion exportar sobre la pieza
            Entonces la pieza aparece en el bloque elegido con el mismo contenido

            Ejemplos: 
            | pieza             |
            | comentario        |
            | autenticar perfil |