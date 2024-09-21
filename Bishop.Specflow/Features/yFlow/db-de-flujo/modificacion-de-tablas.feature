#language: es
@us:6218
Característica: Poder eliminar bases de datos ya cargadas en el flujo de un bot o poder cambiar si una columna es index o no
	Como supervisor
	Quiero podes eliminar bases de datos ya cargadas en un flujo
	Y tambien poder cambiar si una columa es index o no
	Para poder filtrarla

	Regla de negocio: Supervisor puede actualizar las tablas ya existentes
	
		@tc:6311
		Esquema del escenario: Supervisor actualiza una tabla de un flujo
			Dado un flujo que posee configurada una tabla
			Cuando el supervisor intenta actualizar dicha tabla utilizando un archivo con los mismos campos 
			Y <cantidad> cantidad de registros que el original
			Entonces la tabla debera quedar actualizada
			
			Ejemplos: 
				| cantidad |
				| igual    |
				| mayor    |
				| menor    |

	Regla de negocio: Supervisor puede cambiar los index de una tabla
	
		@tc:6312
		Escenario: Supervisor convierte un campo en index
			Dado un flujo que posee una tabla con el siguiente estado
				| campos  | indice |
				| campo A | si     |
				| campo B | no     |
			Cuando el supervisor configura el campo B como indice
			Entonces en la pieza "consultar base de datos" se veran ambos campos indice en el desplegable

		@tc:6319
		Escenario: Supervisor quitar funcion de index a un campo
			Dado un flujo que posee una tabla con el siguiente estado
				| campos  | indice |
				| campo A | si     |
				| campo B | si     |
			Cuando el supervisor quita la configuracion del campo A como indice
			Entonces en la pieza "consultar base de datos" se vera solo el campo B en el desplegable

		@tc:6313
		Escenario: Supervisor intenta dejar sin ningun index una tabla
			Dado un flujo que posee una tabla con el siguiente estado
				| campos  | indice |
				| campo A | no     |
				| campo B | si     |
			Cuando deshabilite opcion de index en el campo B 
			E intente guardar cambios
			Entonces se le debera informar que la configuracion no es valida

	Regla de negocio: Supervisor pude eliminar las tablas

		@tc:6314
		Escenario: Supervisor elimina una tabla de un flujo
			Dado un flujo que posee una tabla
			Cuando el supervisor elimine la tabla
			Entonces no sera mas visible desde la pieza "consultar base de datos"

		@tc:6320
		Escenario: Al eliminar una tabla de un flujo esta se elimina en la base de datos
			Dado que en la base de datos de un ambiente de yFlow hay una tabla creada para un flujo
			Cuando un supervisor elimine la tabla desde el flujo
			Entonces en la base de datos tambien debe quedar eliminada la tabla

		@tc:6315
		Escenario: Supervisor elimina una tabla con error en el estado de subida
			Dado un flujo que posee una tabla marcada con error en el estado de subida
			Cuando un supervisor intente eliminar la tabla
			Entonces la tabla debe ser correctamente eliminada

		@tc:6316
		Esquema del escenario: Supervisor intenta eliminar una tabla que esta en proceso de subida
			Dado que un flujo posee una tabla en procesamiento por <accion>
			Cuando un supervisor intenta eliminar la tabla en procesamiento
			Entonces no debera poder eliminar la tabla hasta que termine el proceso

			Ejemplos: 
				| accion        |
				| alta          |
				| actualizacion |