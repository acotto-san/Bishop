#language: es 
Característica: Una columna "respuesta por boton" para indicar de que manera fue respondido un mensaje HSM
	se desea que se contabilice cuantos HSM de una tarea fueron respondidos mediante un boton de la misma plantilla HSM

	Regla de negocio:  Las columna contabiliza en tiempo real las respuestas que generan los usuarios 
		
		@tc:5711
		Esquema del escenario: La columna analiza cuantas respuestas del masivo son respondidas por boton
			Dado un usuario de Whatsapp recibe un mensaje de plantilla enviada por una tarea masiva
			Cuando el usuario <respuesta> mientras el caso del mensaje que recibió está en estado <estado>  
			Entonces la columna "Respuestas por boton" del reporte se comportara: <resultado>

			Ejemplos:	
				| respuesta           | estado  | resultado        |
				| selecciona un boton | abierto | se actualiza n+1 |
				| selecciona un boton | cerrado | no se actualiza  |
				| envia un adjunto    | abierto | no se actualiza  |
				| envia un sticker    | abierto | no se actualiza  |
				| tipea respuesta     | abierto | no se actualiza  |

	Regla de negocio: la columna estara siempre visible determinados reportes
		
		@tc:5712
		Escenario: supervisor visualiza la columna "respuesta por boton" en el reporte online de "Tareas de HSM masivo"
			Dado que un supervisor se encuentra en el formulario del reporte "Tareas de HSM masivo"
			Cuando solicita el reporte
			Entonces vera la columna "Respuesta por boton"

		@tc:5713
		Esquema del escenario: supervisor visualiza la columna "respuesta por boton" al exportar manualmente el reporte de "Tareas de HSM masivo"
			Dado un supervisor que que se encuentra visualizando un reporte de "Tareas de HSM masivo"
			Y que el reporte se encuentra <paginacion>
			Cuando el supervisor descargue el reporte desde <opcion>
			Entonces en el archivo vera la columna "Respuesta por boton"

			Ejemplos: Al descargar un reporte con mucha informacion esta se pagina 
				| paginacion     | opcion            |
				| con paginacion | exportar visible  |
				| con paginacion | exportar completo |
				| sin paginacion | exportar          |