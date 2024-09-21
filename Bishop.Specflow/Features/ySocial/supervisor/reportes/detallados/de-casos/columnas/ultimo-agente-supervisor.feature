#language: es
Característica: Mostrar el ultimo Agente o Supervisor que haya estado en el caso
	
	Como administrador 
	Quiero tener una columna con el ultimo agente/supervisor que interactuó con el caso
	Para no tener que revisar en detalle cada caso

	Regla de negocio: La columna "ultimo agente/supervisor" debere mostrar el ultimo agente o supervisor que haya estado en el caso

		@tc:8371
		Esquema del escenario: Columna Ultimo agente/supervisor muestra nombres del último usuario que gestionó el caso
			Dado que un supervisor se encuentra visualizando un reporte detallado de casos
			Y un caso del reporte fue gestionado por última vez por
				| tipo de usuario | nombres   | username |
				| <tipo-usuario>  | <nombres> | username |
			Cuando el supervisor ve la columna "Ultimo Agente/Supervisor" de dicho caso
			Entonces vera en su contenido "<nombres> (<username>)"

			Ejemplos: 
				| tipo-usuario | nombres    | username |
				| agente       | Bob Patiño | patino   |
				| supervisor   | QA admin   | qadmin   |
