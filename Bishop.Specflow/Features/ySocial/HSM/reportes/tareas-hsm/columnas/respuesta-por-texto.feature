#language: es 
Característica: Una columna "respuesta por texto" para indicar cuantos mensajes del masivo obtuvieron respuesta de texto
	se desea que se contabilice cuantos HSM de una tarea fueron respondidos utilizando un texto

	Regla de negocio:  Las columna contabiliza en tiempo real las respuestas que generan los usuarios 
		
		 @tc:5781
		 Esquema del escenario: La columna analiza cuantas respuestas del masivo son respondidas por texto
			Dado un usuario de Whatsapp recibe un mensaje de plantilla enviada por una tarea masiva
			Cuando el usuario <respuesta> mientras el caso del mensaje que recibió está en estado <estado>  
			Entonces la columna "Respuestas por texto" del reporte se comportara: <resultado>

			Ejemplos:	
				| respuesta           | estado  | resultado        |
				| tipea respuesta     | abierto | se actualiza n+1 |
				| tipea respuesta     | cerrado | no se actualiza  |
				| selecciona un boton | abierto | no se actualiza  |
				| envia un adjunto    | abierto | no se actualiza  |
				| envia un sticker    | abierto | no se actualiza  |

	Regla de negocio: la columna estara siempre visible determinados reportes

		@tc:5782
		Escenario: supervisor visualiza la columna "Total respondidos por texto" en el reporte online de "Tareas de HSM masivo"
			Dado que un supervisor se encuentra en el formulario del reporte "Tareas de HSM masivo"
			Cuando solicita el reporte
			Entonces vera la columna "Total respondidos por texto"

		@tc:5783
		Esquema del escenario: supervisor visualiza la columna "Total respondidos por texto" al exportar manualmente el reporte de "Tareas de HSM masivo"
			Dado un supervisor que que se encuentra visualizando un reporte de "Tareas de HSM masivo"
			Y que el reporte se encuentra <paginacion>
			Cuando el supervisor descargue el reporte desde <opcion>
			Entonces en el archivo vera la columna "Total respondidos por texto"

			Ejemplos: Al descargar un reporte con mucha informacion esta se pagina 
				| paginacion     | opcion            |
				| con paginacion | exportar visible  |
				| con paginacion | exportar completo |
				| sin paginacion | exportar          |