#language: es
Característica: Poder importar en un bot la definicio de un flujo
	Como chatbot trainer que creo un flujo en un ambiente y poseo la definicion en json
	Quiero poder insertarlo en otro flujo
	Para no tener que volver a armarlo todo desde cero cada vez que cambio de canal o ambiente

	Escenario: Chatbot trainer importa en un flujo la definicion de uno 
		Dado que Charly es un chatbot trainer que posee la definición de un flujo que armó
		Y dado que acaba de crear un nuevo flujo de cero
		Cuando importa la definicion del viejo en el nuevo
		Entonces el nuevo tendra la misma organizacion de bloques y piezas