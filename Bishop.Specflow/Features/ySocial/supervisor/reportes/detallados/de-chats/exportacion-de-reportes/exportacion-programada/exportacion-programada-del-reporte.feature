#language: es 
@us:6085

Característica: Poder progamar la generacion del reporte 
    Como supervisor de ySocial
    Quiero poder progamar la exportacion del reporte
    Para que se genere automaticamente

	Antecedentes: Se encuentra programado el reporte "detallado de chats"

	Regla de negocio: El reporte debe generarse segun lo programado
	
	
	@tc:7892
	Escenario: Supervisor visualiza el reporte programado
		Dado que un supervisor ingresa a los reportes generados
		Cuando ingrese a reportes programados
		Entonces debera ver el reporte segun la periodicidad configurada