#language: es 
@us:6500

Característica: mensajes interactivos 
	Como implementador de un bot
	Quiero tener la ocion de poder habilitar o no los mensajes interactivos
	Para poder utilizarlos luego en el flujo que arme

	Regla de negocio: Al crear un nuevo flujo la funcionalidad " mensajes interactivos " debe estar habilitada
		
		@tc:6619
		Escenario: Al crear un nuevo flujo el check de "mensajes interactivos" estara activo
			Dado un implementador que se encuentra creando un nuevo flujo
			Cuando ingrese a "ajustes"
			Entonces debera ver ya habilitada la funcionalidad " mensajes interactivos " 