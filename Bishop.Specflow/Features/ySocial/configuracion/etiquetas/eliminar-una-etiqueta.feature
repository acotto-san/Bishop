#language: es
Característica: Eliminar una etiqueta
	Para poder descartar etiquetas que no estan en usio
	Como supervisor de la plataforma
	Quiero eliminar etiquetas

	Regla de negocio: La etiqueta no debe contener etiquetas hijas

		@tc:8624
		Escenario: Etiqueta pierde posibilidad de ser borrada al crearle una etiqueta hija
			Dada una etiqueta que no posee hijas
			Cuando se le cree una etiqueta hija
			Entonces ya no se podra eliminar la etiqueta

	Regla de negocio: La etiqueta no debe estar en uso

		@tc:8625
		Escenario: Se impide la eliminacion de una etiqueta al usarse para cierre por inactividad de ySocial
			puede ser en params de sistema o en un servicio que sobreescribe dicho comportamiento
			Dada una etiqueta se utiliza para etiquetar casos que se cierran en ySocial por inactividad
			Cuando se intente eliminar la etiqueta
			Entonces se impedira proceder con la eliminacion de la etiqueta

		@tc:8626
		Escenario: Se impide la eliminacion de una etiqueta al usarse para cierre de casos HSM
			puede ser en params de sistema o en un servicio que sobreescribe dicho comportamiento
			Dada una etiqueta se utiliza para el cierre automatico de casos iniciador por HSM
			Cuando se intente eliminar la etiqueta
			Entonces se impedira proceder con la eliminacion de la etiqueta

		@tc:8627
		Escenario: Se impide la eliminación de una etiqueta que se utiliza para registrar fallas de invocacion a yFlow
			Dada una etiqueta se utiliza para etiquetar casos cuando falla la invocacion a yFlow
			Cuando se intente eliminar la etiqueta
			Entonces se impedira proceder con la eliminacion de la etiqueta

		@tc:8628
		Escenario: Se impide la eliminación de una etiqueta que se utiliza para registrar que un invocacion a yFlow dio timeout
			Dada una etiqueta se utiliza para etiquetar los casos que demoraron demasiado al invocar a yFlow
			Cuando se intente eliminar la etiqueta
			Entonces se impedira proceder con la eliminacion de la etiqueta

		@tc:8629
		Escenario: Se impide la eliminacion de una etiqueta debido a que ya genero registros en una DB
			Dado que se utilizo una etiqueta 
			Y se generaron registros de su uso en la Base de Datos 
			Cuando se intente eliminar la etiqueta
			Entonces se impedira proceder con la eliminacion de la etiqueta