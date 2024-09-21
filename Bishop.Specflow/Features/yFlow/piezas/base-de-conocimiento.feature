#language: es
Característica: Base de conocimiento

Se crea la pieza base de conocimiento para mandar a procesar frases a la kb elegida según el listado de categorías cargadas en el proyecto de ysmart.

Ejecutar los casos de "comportamiento compartido" de todas las piezas de yflow: abm, clonar, exportar.

	Regla: Se puede elegir una categoría para que la pieza consulte a los archivos que la contienen

		@tc:7976
		Escenario: se consulta a los archivos de la categoria seleccionada en la pieza
			Dado un flujo con la pieza base de conocimiento
			Y la categoria Previaje seleccionada
			Cuando un usuario pasa por esa pieza
			Entonces se generara una respuesta segun los archivos de esa categoria Previaje

		@tc:7977
		Escenario: se consulta a una categoria que no tiene archivos
			Dado una categoria "Horarios" creada sin archivos asociados
			Y una pieza base de datos con la kb "Horarios" seleccionada
			Cuando se mande a procesar una frase
			Entonces el bot respondera que no sabe la respuesta

	Regla: Se actualiza la pieza cuando se produce un cambio en la base de conocimiento de ysmart

		@tc:7978
		Escenario: se elimina una kb del desplegable de la pieza
			Dado un flujo con la pieza base de conocimiento
			Y la categoria Horarios elegida
			Cuando seelimina la categoría Horarios en ySmart
			Entonces la categoria Horarios no se encontrara en el listado de la pieza base de conocimiento

		@tc:7979
		Escenario: se agrega una kb al desplegable de la pieza
			Dado un proyecto de ysmart con 5 categorias creadas
			Cuando se crea una 6
			Entonces esa 6ta categoria aparecera en el listado de la pieza base de conocimiento