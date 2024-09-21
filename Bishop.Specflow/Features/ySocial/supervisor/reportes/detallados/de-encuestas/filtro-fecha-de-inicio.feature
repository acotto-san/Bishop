#language:es
Característica:	Tener un filtro que solo traiga los casos encuestados que iniciaron en determinada fecha
	Como supervisor que visualiza encuestas enviadas
	Quiero un filtro que me muestre solamente encuestas que se enviarion a casos iniciados en determinada fecha/s
	Para encontrar mas rapido encuestas basandome en ese dato que poseo

	Regla de negocio: Al setear la franja de inicio se muestran los casos encuestados que iniciaron en dicha franja 
			
		@tc:6247
		Escenario: Supervisor visualiza casos que iniciarion y se encuestaron dentro de la franja seleccionada
			Dado un caso que inicio el dia martes
			Y a dicho caso le fue enviada la encuesta el martes
			Cuando un supervisor solicita el reporte detallado de casos filtrando utilizando como fecha de inicio el dia martes
			Entonces en el reporte vera dicho caso
				
		@tc:6248
		Escenario: Supervisor visualiza casos que iniciaron dentro de la franja seleccionada pero tuvieron su encuesta posteriormente
			Dado un caso que inicio el dia martes
			Y a dicho caso le fue enviada la encuesta el miercoles
			Cuando un supervisor solicita el reporte detallado de casos filtrando utilizando como fecha de inicio el dia martes
			Y sin filtrar por fecha de envio de encuesta
			Entonces en el reporte vera dicho caso

		@tc:6249
		Escenario: Supervisor no visualiza casos encuestados dentro de la franja por haber sido creados con antelacion
			Dado un caso que inicio el dia lunes
			Y a dicho caso le fue enviada la encuesta el martes
			Cuando un supervisor solicita el reporte detallado de casos filtrando utilizando como fecha de inicio el dia martes
			Entonces en el reporte no estara presente el caso


