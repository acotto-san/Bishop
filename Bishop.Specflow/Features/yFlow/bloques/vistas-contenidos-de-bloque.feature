#language: es
Característica: Tener una vista para visualizar las piezas que contiene determinado bloque

	Regla de negocio: Las piezas que contiene pueden ser reorganizadas 
	
	@tc:6174
    Esquema del escenario: Supervisor mueve la posicion de una pieza preexistente en el bloque
        Dado un supervisor que tiene una pieza <pieza> en su flow
        Cuando ejecuta la accion <accion> sobre la pieza
        Entonces la pieza <resultado obtenido>

        Ejemplos: de pieza comentario
       | pieza      | accion            | resultado obtenido            |   
       | comentario | mover hacia abajo | se mueve un lugar hacia abajo |
       | comentario | mover hacia arriba| se mueve un lugar hacia arriba|

		Escenario: Supervisor no posee la funcionalidad al estar visualizando el bloque desde un flujo productivo