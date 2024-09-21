#language:es
@us:4993
Característica: filtro de tareas masivas HSM
	Se desea poder utilizar el nombre de una tarea masiva para obetener en el reporte solamente los mensajes que hayan sido enviados en dicha tarea.

	 Antecedentes: 
		Dados los siguientes mensajes HSM:
			| id de mensaje | fecha enviado       | metodo de envio | nombre tarea |
			| 163985        | 21/12/2022 11:03:04 | individual      | N/A          |
			| 164342        | 22/12/2022 12:34:15 | tarea masiva    | pepe         |
			| 164368        | 22/12/2022 15:34:43 | tarea masiva    | pepe2        |

	@tc:5278
	Escenario: filtrar por nombre de tarea trae los mensajes que la misma haya enviado
		Dado que Sandra es una supervisora que se encuentra en la pagina del detallado de mensajes de whatsapp
		Cuando selecciona los siguientes filtros:
			| atributo                   | valor            |
			| Fecha desde                | 21/12/2022 00:00 |
			| Fecha hasta                | 22/12/2022 23:30 |
			| Tareas                     | pepe             |
			| Incluir Código del mensaje | habilitado       |
		Y confirma el formulario de busqueda 
		Entonces en el reporte vera el mensaje 164342

	@tc:5396
	Escenario: filtrar utilizando dos tareas al mismo tiempo trae mensajes de ambos envios
		Dado que Sandra es una supervisora que se encuentra en la pagina del detallado de mensajes de whatsapp
		Cuando selecciona los siguientes filtros:
			| atributo                   | valor            |
			| Fecha desde                | 21/12/2022 00:00 |
			| Fecha hasta                | 22/12/2022 23:30 |
			| Tareas                     | pepe,pepe2       |
			| Incluir Código del mensaje | habilitado       |
		Y confirma el formulario de busqueda 
		Entonces en el reporte vera los mensajes 164342 y 164368

	@tc:5397
	Escenario: al usar una tarea que no envio mensajes en el intervalo seleccionado no trae resultados
		Dado el siguiente mensaje HSM enviado por una tarea masiva:
			| id de mensaje | fecha enviado       | metodo de envio | nombre tarea |
			| 174197        | 24/02/2023 16:10:06 | tarea masiva    | @tarea-B!    |
		Y que Sandra es una supervisora que se encuentra en la pagina del detallado de mensajes de whatsapp
		Cuando selecciona los siguientes filtros:
			| atributo                   | valor            |
			| Fecha desde                | 21/12/2022 00:00 |
			| Fecha hasta                | 22/12/2022 23:30 |
			| Tareas                     | @tarea-B!        |
			| Incluir Código del mensaje | habilitado       |
		Y confirma el formulario de busqueda 
		Entonces en el reporte vera 0 mensajes