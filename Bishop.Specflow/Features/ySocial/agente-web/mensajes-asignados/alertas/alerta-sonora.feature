#language: es 
@us:5092
Característica: escuchar una alerta sonora al recibir mensaje en modo chat
	Se desea que todo caso asignado que provenga de un servicio con modo chat realice una alerta sonora cuando cae un mensaje nuevo y el agente no estaba observando.


	Antecedentes: 
		Dado que Adrian es un agente que posee asignado de un servicio configurado con modo chat los casos 730 y 1020
		Y que en la configuracion de su sesion estan habilitados los sonidos
	
	@tc:5455
	Esquema del escenario: alerta sonora cuando agente no posee la pestaña activa
		Dado que Adrian no posee activa la pestaña de la web del agente
		Y la conversacion seleccionada en la sesion es el caso <casoActivo> 
		Cuando el usuario del caso 1020 envia un nuevo mensaje
		Entonces la web del agente debera reproducir una alerta sonora

			Ejemplos:	
				| casoActivo |
				| ninguno    |
				| 730        |
				| 1020       |
	
	@tc:5456
	Esquema del escenario: alerta sonora cuando agente no posee la conversacion en primer plano
		Dado que Adrian posee la pestaña de la web del agente activa
		Y la conversacion seleccionada en la sesion es el caso <casoActivo> 
		Cuando el usuario del caso 1020 envia un nuevo mensaje
		Entonces la web del agente debera reproducir una alerta sonora

			Ejemplos:	
				| casoActivo |
				| ninguno    |
				| 730        |
	@tc:5457
	Escenario: alerta sonora cuando la web del agente se encuentra tapada en su totalidad
		Dado que la pestaña donde se encuentra activa la web del agente esta tapada en su totalidad
		Cuando el usuario del caso 1020 envia un nuevo mensaje
		Entonces la web del agente debera reproducir una alerta sonora