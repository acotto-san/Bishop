#language: es
@us:4912
Característica: ofuscar datos procesados por pieza ingresar datos
	Se desea que el valor del mensaje que procesa la pieza "ingresar datos" no pueda ser leído por cualquier tipo de usuario en ySocial.
	en test el mensaje id: 177887 del caso id: 36811 fue ofuscado el 09/03/2023 9:25:06

	Regla de negocio: el mensaje ofuscado debe verse oculto desde todas las vistas accesibles por la web del supervisor

		@tc:5060
		Escenario: supervisor visualiza mensaje ofuscado en "Mensajes en Cola"
			Dado un supervisor que se encuentra en Mensajes en Cola
			Y un mensaje de messenger que es ofuscado por la pieza Ingreso de Datos
			Cuando el mensaje se encola 
			Y el supervisor desde Mensajes en Cola ubica el mensaje
			Entonces en la columna "Contenido" dira "Mensaje oculto"

		@tc:5061
		Escenario: supervisor visualiza mensaje ofuscado en el "Detallado de Mensajes"
			Dado un mensaje de messenger que es ofuscado por la pieza Ingreso de Datos
			Y un supervisor ubico el mensaje en el reporte Detallado de Mensajes
			Y el reporte posee habilitado el campo "Incluir Cuerpo del mensaje"
			Entonces en la columna "Contenido" dira "Mensaje oculto"

		@tc:5514
		Escenario: supervisor visualiza el mensaje ofuscado desde la pestaña principal del modal Datos del Mensaje
			Dado un mensaje de messenger que es ofuscado por la pieza Ingreso de Datos
			Cuando un supervisor ingresa al modal Datos del Mensaje de dicho caso
			Entonces vera en la pestaña Informacion del Mensaje que el campo "Contenido" dira "Mensaje oculto"

		@tc:5515
		Escenario: supervisor visualiza el mensaje ofuscado desde la pestaña Caso del modal Datos del Mensaje
			Dado un mensaje de messenger que es ofuscado por la pieza Ingreso de Datos
			Cuando un supervisor ingresa al modal Datos del Mensaje de dicho caso
			Y selecciona la pestaña Caso
			Entonces ve que el cuerpo del mensaje se encuentra ofuscado

	Regla de negocio: el mensaje ofuscado debe verse oculto desde todos los metodos de descarga a los que accede el supervisor

		@tc:5516
		Escenario: supervisor visualiza mensaje ofuscado desde el caso descargado en formato imagen
			Dado un mensaje de messenger que es ofuscado por la pieza Ingreso de Datos
			Cuando un supervisor descarga la imagen del caso desde el modal Datos del Caso > pestaña Mensajes
			Entonces ve que el cuerpo del mensaje se encuentra ofuscado

		@tc:5517
		Escenario: supervisor visualiza mensaje ofuscado desde el caso descargado en formato excel
			Dado un mensaje de messenger que es ofuscado por la pieza Ingreso de Datos
			Cuando un supervisor descarga el excel del caso desde el modal Datos del Caso > pestaña Mensajes
			Y ubica la fila del mensaje dentro del excel
			Entonces en la columna "Contenido" dira "Mensaje Oculto"
			
		@tc:5518
		Esquema del escenario: supervisor visualiza mensaje ofuscado en la exportacion visible del Detallado de Mensajes 
			Dado que un supervisor descarga un reporte Detallado de Mensajes mediante la opcion "<opcion de descarga>"
			Y en el reporte se encontraba un mensaje ofuscado por la pieza Ingreso de Datos
			Cuando ubica la fila del mensaje dentro del excel
			Entonces en la columna "Contenido" dira "Mensaje Oculto"

			Ejemplos: 
				| opcion de descarga |
				| exportar visible   |
				| exportar completo  |

		@tc:5519
		Escenario: supervisor visualiza mensaje ofuscado en la exportacion diaria del Detallado de Mensajes 
			Dado un supervisor que descarga un reporte Detallado de Mensajes desde la seccion Reportes Diarios
			Y en el reporte se encontraba un mensaje ofuscado por la pieza Ingreso de Datos
			Cuando ubica la fila del mensaje dentro del excel
			Entonces en la columna "Contenido" dira "Mensaje Oculto"
			
	Regla de negocio: el mensaje ofuscado debe verse oculto desde todas las vistas accesibles por la web del agente

		@tc:5520
		Escenario: agente visualiza mensaje ofuscado en un caso asignado
			Dado un mensaje de messenger que es ofuscado por la pieza Ingreso de Datos
			Cuando el mensaje es asignado a un agente
			Entonces ve que el cuerpo del mensaje se encuentra ofuscado

		@tc:5521
		Escenario: agente visualiza mensaje ofuscado en un caso que ubico desde Buscar Casos
			Dado un mensaje de messenger que es ofuscado por la pieza Ingreso de Datos
			Cuando un agente ubica el caso del mensaje desde Buscar Casos
			Y visualiza el contenido de la conversacion
			Entonces ve que el cuerpo del mensaje se encuentra ofuscado


	Regla de negocio: el mensaje ofuscado debe verse oculto desde todos los metodos de descarga a los que accede el supervisor
		
		@tc:5522
		Escenario: agente visualiza mensaje ofuscado desde el caso descargado en formato excel
			Dado un mensaje de messenger que es ofuscado por la pieza Ingreso de Datos
			Y el mensaje es asignado a un agente
			Cuando el agente descarga el caso asignado como excel
			Y ubica la fila del mensaje dentro del excel
			Entonces en la columna "Contenido" dira "Mensaje Oculto"