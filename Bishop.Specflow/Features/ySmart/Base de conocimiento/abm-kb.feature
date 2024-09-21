#language: es
Característica: alta, baja y modificación de una kb

 En esta sección se pueden incorporar archivos de distinto tipo como bases de conocimiento para que las consultas a ysmart peguen a esa kb.
 Las piezas de yflow que acceden a la kb son: base de conocimiento, ejecutar servicio de cognitividad. También se puede consultar a la kb a través de la sección de pruebas de ysmart

	Regla: Alta de kb - Se pueden incorporar archivos de tipo word, html, txt, pdf, csv y excel.

		@tc:7970
		Esquema del escenario: Se carga un archivo a la kb
		Exploratorio: probar con archivos de distintas extensiones
			Dado que se crea la categoría Horarios
			Cuando se sube un archivo de tipo <tipo> asociado a esa categoria
			Entonces el archivo es cargado con exito
			Y el bot realiza con exito la consulta al archivo

		Ejemplos:
			| tipo  |
			| word  |
			| html  |
			| txt   |
			| pdf   |
			| csv   |
			| excel |

		@tc:7971
		Escenario: Se carga más de un archivo a la kb
		Existe un ranking limit de la cantidad de archivos que se consultan para obtener chunks por proyecto, va a ser configurable
			Dado que se crea la categoría Horarios
			Cuando se sube mas de un archivo de tipo <tipo> asociado a esa categoria
			Entonces los archivos son subidos con exito
			Y el bot realiza con exito la consulta a los archivos

	Regla: Baja de kb - se puede eliminar un archivo

		@tc:7972
		Esquema del escenario: Se elimina un archivo
			Dado un archivo cargado de tipo <tipo>
			Cuando se elimina ese archivo de la lista
			Entonces es eliminado con exito
			Y el bot ya no obtiene respuesta de ese archivo

		Ejemplos:
			| tipo  |
			| word  |
			| html  |
			| txt   |
			| pdf   |
			| csv   |
			| excel |

	Regla: Baja de kb - Una categoría se puede eliminar cuando se haya eliminado la intención que la tiene en uso

		@tc:7973
		Escenario: se elimina una categoria que está en uso
			Dado que una intencion usa la categoria "Horarios"
			Cuando se elimina la categoria "Horarios"
			Entonces aparecera un mensaje de error alertando que esa kb esta en uso

		@tc:7974
		Escenario: se elimina una categoría que no está en uso
			Dado que una intencion usa la categoria "Horarios"
			Y esa intencion es eliminada
			Cuando se elimina la categoria "Horarios"
			Entonces la categoria es eliminada con exito
			Y categoria no aparecera en el listado de la pieza Base de conocimiento

	Regla: Modificacion de kb - se puede modificar un archivo y volver a subir a la categoria

		@tc:7975
		Escenario:se modifica la información de un archivo
			Dado que se tiene un archivo "A" cargado
			Y se elimina el archivo "A"
			Cuando se agrega informacion al archivo
			Y se vuelve a cargar como archivo "A" en la misma categoria
			Entonces el archivo se sube con exito
			Y el bot consulta la nueva informacion cargada