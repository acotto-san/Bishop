# language: es
Característica: historial de versiones de un flujo
	Como implementador quiero guardar los cambios realizados y publicados en el historial para tener la posibilidad de volver a restaurar una version previa.

Regla: los cambios realizados y publicados se guardan en el historial de versiones

	@tc:7374
	Esquema del escenario: se visualiza la versión de un flujo guardada y publicada en el historial
		Dado que un implementador realiza los primeros cambios en el flujo
		Cuando <accion> sus cambios
		Entonces visualiza la version 1 con sus cambios en el historial

			Ejemplos: 
			| accion           |
			| guarda           |
			| guarda y publica |

Regla: se puede restaurar una versión anterior
	
	@tc:7375
	Escenario: se restaura una versión anterior de un flujo
		Dado que un flujo tiene 5 versiones
		Cuando un implementador restaura la version 1
		Entonces se visualizan la configuracion de la version 1 en el flujo

Regla: se puede descargar una versión guardada
	
	@tc:7376
	Escenario: se descarga una versión del historial
		Dado que un flujo tiene 5 versiones
		Cuando un implementador descarga la version 2
		Entonces recibe un json con la configuracion del flujo de la version 2

Regla: se puede  previsualizar los detalles de la versión guardada

	@tc:7377
	Escenario: se previsualiza los cambios de una versión
	Exploratorio: version con bloques importados, verificar que se previsualiza
		Dado que un flujo tiene 4 versiones
		Cuando un implementador selecciona la version 3 en el historial
		Entonces puede previsualizar los cambios realizados en la version 3

Regla: se pueden dejar comentarios sobre la versión guardada

	@tc:7378
	Escenario: se visualiza el comentario en una columna del historial de versiones
	Exploratorio: comentario extenso, con emojis, intentar ingresar adjunto.
		Dado que un implementador quiere guardar los cambios de su flujo
		Cuando deja un comentario sobre la version a guardar
		Entonces visualiza su comentario en una columna del historial de versiones

	@tc:7379
	Escenario: comentario vacío al guardar la versión
		Dado que un implementador quiere guardar los cambios de su flujo
		Cuando no deja ningun comentario en el textarea
		Y guarda sus cambios
		Entonces visualiza vacia la columna de comentarios en el historial de versiones

	@tc:7380
	Escenario: el implementador realiza otras acciones y el comentario queda guardado
		Dado que un implementador tiene una version guardada con comentarios
		Cuando se dirige al dashboard
		Y vuelve a entrar al historial de su flujo
		Entonces visualiza su comentario en la columna correspondiente
