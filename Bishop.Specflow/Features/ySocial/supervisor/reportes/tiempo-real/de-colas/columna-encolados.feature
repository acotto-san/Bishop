#language: es 
Característica: Tener una columna con los encolados por la cola
	Como supervisor que controla el reporte en tiempo real de colas
	Quiero tener una columna donde indique los encolados del día
	Para poder controlar el total de encolamientos que ocurrieron

	
	@tc:7727
	Escenario: Caso se encola y es reflejado en la metrica
		Dada una cola que en el TR de colas indica 0 en la columna de encolados
		Cuando un mensaje de un usuario final ingresa a la cola directamente
		Entonces la columna del reporte indicara 1

	@tc:7728
	Escenario: Caso se encola por derivacion del bot y es reflejado en la metrica
		Dada una cola que en el TR de colas indica 0 en la columna de encolados
		Cuando un mensaje de un usuario final es derivado por el bot a la cola
		Entonces la columna del reporte indicara 1

	@tc:7729
	Escenario: Metrica no cambia porque el nuevo encolado va agrupar otro previo
		Dada una cola que en el TR de colas indica 1 en la columna de encolados
		Y en la cola continua encolado el unico mensaje que se encolo
		Cuando el usuario final que envio el primer mensaje envia otro
		Y el nuevo mensaje agrupa en la cola al primero
		Entonces la columna del reporte indicara 1