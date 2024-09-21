#language: es
Característica: Permiso de acceso a las vistas de reportes programados

	Regla de negocio: El permiso concedera acceso a la vista para programar los reportes

		@tc:5677
		Esquema del escenario: Supervisor puede ingresar a la lista de reportes programados al tener el permiso
			Dado que un supervisor posee <estado permiso> el permiso "Administracion de reportes programados"
			Y dado que se encuentra en la pagina principal de ySocial
			Cuando visualiza la seccion de reportes en la barra vertical de navegacion
			Entonces <visualizacion> el acceso a "Reportes Programados" 

			Ejemplos: 
				| estado permiso | visualizacion |
				| habilitado     | visualiza     |
				| deshabilitado  | no visualiza  |


	Regla de negocio: El permiso concedera acceso a la vista para descargar reportes ya generados
		
		@tc:5678
		Esquema del escenario: Supervisor puede ingresar a la lista de reportes programados dentro de Reportes Generados al tener el permiso
			Dado que un supervisor posee <estado permiso> el permiso "Administracion de reportes programados"
			Cuando ingresa a la pagina de Reportes Generados
			Entonces <visualizacion> la pestaña "Reportes Programados"

			Ejemplos: 
				| estado permiso | visualizacion |
				| habilitado     | visualiza     |
				| deshabilitado  | no visualiza  |