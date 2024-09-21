#language:es
@us6636

Característica: Tener la posibilidad de eliminar una pieza

Regla de negocio: Todas las piezas deben tener las opciones de "eliminar"
	
	@tc6693
	Esquema del escenario: supervisor elimina una pieza
		Dado que un supervisor se encuentra posicionado en una pieza
		Cuando clickea el boton de eliminar
		Y clickea eliminar en el modal de eliminacion
		Entonces se debera eliminar la pieza