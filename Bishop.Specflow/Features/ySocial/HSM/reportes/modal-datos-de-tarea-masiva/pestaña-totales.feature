#language: es
Característica: tener una pestaña que muestre contadores totales de la tarea

	@tc:5779
	Escenario: contador de cantidad de respuestas por texto
		Dado que un supervisor se encuentra en el reporte de tareas HSM
		Y en el reporte hay una tarea que tuvo 2 respuestas por texto
		Cuando el supervisor ingrese a la pestaña "total" dentro del modal de la tarea
		Entonces debe haber una metrica "respuestas por texto"
		Y su contador debe tener un 2 

	@tc:5780
	Escenario: contador de cantidad de respuestas por boton
		Dado que un supervisor se encuentra en el reporte de tareas HSM
		Y en el reporte hay una tarea que tuvo 2 respuestas por boton
		Cuando el supervisor ingrese a la pestaña "total" dentro del modal de la tarea
		Entonces debe haber una metrica "respuestas por boton"
		Y su contador debe tener un 2 