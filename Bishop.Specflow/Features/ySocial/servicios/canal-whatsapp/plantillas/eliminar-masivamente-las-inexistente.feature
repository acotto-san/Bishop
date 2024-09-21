#language: es
@us:5170
Característica: Eliminar masivamente las plantillas que la linea no posee realmente
	Como supervisor 
	Quiero tener una manera de borrar rapidamente las plantillas inexistentes
	Para que algun usuario no las utilice al verlas en un desplegable de plantillas

	Regla de negocio: un administrador del servicio puede acceder a la funcionalidad si la linea es de yoizen

		@tc:6304
		Escenario: Supevisor visualiza boton de eliminar plantillas
			Dado que un supervisor se encuentra editando un servicio de whatsapp
			Y la linea del servicio es provista por Yoizen
			Cuando se dirija a la lista de plantillas
			Entonces vera un boton para eliminar plantillas inexistentes de manera masiva

		@tc:6305
		Escenario: Supervisor no visualiza boton de eliminar plantillas al ser una linea de otro broker
			Dado que un supervisor se encuentra editando un servicio de whatsapp
			Y la linea del servicio es provista por un broker externo
			Cuando se dirija a la lista de plantillas
			Entonces no podra ver el boton para eliminar plantillas inexistentes de manera masiva			

	Regla de negocio: se puede quitar masivamente de la lista de plantillas las que sean inexistentes

		@tc:6306
		Escenario: Supervisor elimina masivamente plantillas inexistentes
			Dado que un supevisor se encuentra editando un servicio de whatsapp
			Y el servicio posee creadas plantillas que son inexistentes en la linea
			Cuando el supervisor presiona el boton "Eliminar" al final de la lista de plantillas
			Entonces las plantillas inexistentes quedaran eliminadas de la lista
		
		@tc:6307
		Escenario: Supervisor utiliza feature de eliminar masivamente plantillas inexistentes en un servicio que no las posee
			Dado que un supevisor se encuentra editando un servicio de whatsapp
			Y el servicio no posee creadas plantillas que son inexistentes en la linea
			Cuando el supervisor presiona el boton "Eliminar" al final de la lista de plantillas
			Entonces se le informara que ninguna plantilla fue eliminada

	Regla de negocio: no accionara en caso de no tener certeza sobre la existencia de una plantilla

		@tc:6308
		Escenario: No se eliminan plantillas al no poder corroborar su estado
			Dado que un supervisor se encuentra editando un servicio de whatsapp
			Y el servicio no puede validar la existencia de plantillas
			Cuando el supervisor presiona el boton "Eliminar" al final de la lista de plantillas
			Entonces se le informara que hubo un fallo al obtener la lista de plantillas