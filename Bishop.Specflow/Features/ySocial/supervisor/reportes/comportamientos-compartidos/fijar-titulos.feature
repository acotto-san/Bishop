#language: es
@us:5280
Característica: Fijar los titulos de los reportes para que se deslicen hacia abajo

Como administrador al ver algun reporte de la sección reportes
Quiero que los titulos queden fijados y se deslicen hacia abajo
Para asi no perder los cabezales de las columnas si el reporte tiene mucha info

	Regla de negocio: Los titulos fijos aplica a los Detallados y Consolidados web
	
		@tc:8351
		Esquema del escenario: Supervisor pide un reporte
			Dado un supervisor ingresa un reporte web de <reporte>
			Cuando haga scroll para abajo dentro del reporte
			Entonces los titulos del reporte continuaran visibles

			Ejemplos:
				| reporte                                       |
				| Consolidado de Agentes                        |
				| Consolidado de Colas                          |
				| Consolidado de Servicios                      |
				| Consolidado de Casos                          |
				| Consolidado de Encuestas                      |
				| Detallado de Mensajes                         |
				| Detallado de Casos                            |
				| Detallado de Usuarios                         |
				| Detallado de Perfiles                         |
				| Detallado de Chats                            |
				| Detallado de Encuestas                        |
				| Detallado de Login/Logout                     |
				| Detallado de Adherencia                       |
				| Detallado de Transferencias                   |
				| Detallado de Reaperturas de caso              |
				| Detallado de Segmentos de Tiempos de Mensajes |
				| Detallado de Eventos                          |
				| Detallado de Login/Logout de Usuarios         |
