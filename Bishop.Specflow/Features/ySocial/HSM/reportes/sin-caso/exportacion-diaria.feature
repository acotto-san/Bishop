#language:es
@us:6875
Característica: exportacion diaria de campaña sin trazabilidad

	Para los clientes que tengan habilitado en la liciencia HSM SIN CASO (CLARO), se requiere exportar diariamente al SFTP el reporte 
	"Detalle de mensajes de tarea masiva sin caso", el cual se obtiene actualmente haciendo click en la flecha marcada en amarillo.

	En la web del supervisor solo se agrega un check que habilita la generación de los reportes, pero no se van exportar desde ysocial.

	Antecedentes: 
		Dado que se tiene habilitada la licencia de HSM sin caso

	Regla: En parámetros del sistema se puede solicitar el reporte diario de campaña de hsm sin caso

		@tc:7156
		Escenario: se habilita la generación de reportes diarios de campañas sin caso 
			Verificar logs para revisar la generación de reportes
			Dado que un supervisor quiere obtener un reporte diario de sus campañas sin caso
			Cuando habilita el check correspondiente en parametros del sistema>global
			Entonces se activa la generacion de reportes diarios de campañas sin caso 

		@tc:7157
		Escenario: se deshabilita la generación de reportes diarios de campañas sin caso
			Verificar logs para revisar la detención de los reportes
			Dado que un supervisor tenia habilitado el check de reporte diario de campañas sin caso
			Cuando deshabilita el check en parametros del sistema>global
			Entonces deja de recibir los reportes diarios de campañas sin caso en su sistema

	Regla: El reporte diario es el mismo que se genera cuando se solicita el exportado completo. Es una foto de los datos de las 24hs que pasaron.

		@tc:7158
		Escenario: se genera un reporte diario con sus registros por cada campaña creada
			Verificar logs para revisar la reportes generados
			Dado que un supervisor crea 3 campañas con 10 registros cada una el dia de ayer
			Cuando se generan los reportes diarios el dia de hoy
			Entonces encontrara 3 reportes con 10 registros cada uno en su propio sistema
		

		@tc:7159
		Escenario:el reporte diario recupera los datos de las 24hs de la campaña
			Verificar logs para corroborar los reportes generados
			Dado que un supervisor crea una campaña el dia Miercoles
			Cuando solicita un reporte completo de la campaña el dia viernes
			Entonces recibira un reporte similar al reporte diario del miercoles en su propio sistema
			Y sera diferente en aquellas estadisticas recuperadas pasadas las 24hs