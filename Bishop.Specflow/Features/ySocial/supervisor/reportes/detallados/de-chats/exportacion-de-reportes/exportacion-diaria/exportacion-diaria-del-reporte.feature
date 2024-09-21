#language: es 
@us:6085

Característica: Poder progamar la generacion diaria del reporte 
    Como supervisor de ySocial
    Quiero que el reporte detallado de chat se puedan exportar diariamente
    Para tener el reporte generado todos los dias

	Antecedentes: Se encuentra configurado la generacion diaria del reporte "detallado de chats"

	Regla de negocio: El reporte debe generarse todos los dias
	
	
	@tc:7889
	Escenario: Supervisor visualiza el reporte diario generado
		Dado que un supervisor ingresa a reportes generados
		Cuando ingrese a reportes diarios
		Entonces debera ver el reporte generado diariamente