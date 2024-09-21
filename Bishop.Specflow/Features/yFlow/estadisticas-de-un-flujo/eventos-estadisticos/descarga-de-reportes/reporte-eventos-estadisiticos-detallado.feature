#language: es
@us:5208
Característica: descargar un reporte detallado de los eventos estadisticos
	
	@tc:5485
	Esquema del escenario: supervisor descarga un reporte detallado de eventos estadisticos
		Dado que un bot posee los siguientes eventos
			| nombre de evento   |
			| eventoTexto        |
			| eventoEstructurado |
		Y que un supervisor se encuentra en la pagina de estadisticas de eventos
		Cuando selecciona el/los evento/s <nombre de los eventos>
		Y descarga el reporte detallado
		Entonces dentro del archivo descargado se encontraran los siguientes archivos

		Ejemplos: 
			| nombre de los eventos            | nombre archivos                            |
			| eventoTexto                      | eventoTexto.xsls                           |
			| eventoTexto y eventoEstructurado | eventoTexto.xsls y eventoEstructurado.xsls |
			| ninguno                          | eventoTexto.xsls y eventoEstructurado.xsls |
