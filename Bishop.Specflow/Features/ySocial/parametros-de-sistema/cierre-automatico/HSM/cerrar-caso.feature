#language: es
@us:4399
Característica: finalizacion de un caso HSM al cumplir el tiempo configurado
	Se desea setear un timer que contabiliza desde la ultima actualizacion del caso y una vez cumplido lo cierra al mismo.
	Solo aplica a casos de canal Whatsapp que poseen mensajes HSM.

	Regla: los casos se cierran unicamente si contienen mensajes HSM
		
		@tc:5044
		Esquema del escenario: caso es cerrado por contener unicamente HSM
			Dado la siguiente configuracion en parametros de sistema:
				| funcionalidad                                  | configuracion |
				| Minutos para el cierre automatico de casos HSM | 60            | 
			Y un caso de un servicio de whatsapp posee <@cantidadHsm> mensajes HSM
			Y no posee otro tipo de mensaje
			Cuando pasan "60" minutos desde el ultimo mensaje enviado del caso
			Entonces el caso sera cerrado

			Ejemplos: 
				| @cantidadHsm |
				| 1            |
				| 2            |
		
		@tc:5045
        Esquema del escenario: caso no es cerrado por contener mensajes diferentes a los HSM
			Dado la siguiente configuracion en parametros de sistema:
				| funcionalidad                                  | configuracion |
				| Minutos para el cierre automatico de casos HSM | 60            |
            Y un caso de un servicio de whatsapp inicio con el envio de un HSM
            Y un nuevo mensaje fue agregado al caso por <autor de mensaje>
            Cuando transcurren 60 minutos desde el mensaje del <autor de mensaje>
			Entonces el caso no es cerrado por el cierre automatico de HSM

			Ejemplos: 
				| autor de mensaje |
				| agente           |
				| usuario          |
				| sistema          |
		
		@tc:5052
		Escenario: Caso iniciado por agente mediante mensaje normal no es alcanzado por el cierre automatico de HSM
			Dado la siguiente configuracion en parametros de sistema:
				| funcionalidad                                  | configuracion |
				| Minutos para el cierre automatico de casos HSM | 60            |
			Y un agente que inicia un caso de whatsapp con un mensaje normal
			Cuando transcurren "60" minutos desde el envio del mensaje
			Entonces el caso no es cerrado por el cierre automatico de HSM

	Regla: la configuración se puede realizar en diferentes lugares
		
		@tc:7485
		Escenario: Un supervisor accede a la configuracion de cierre de casos hsm desde parametros de sistema
			Cuando un supervisor ingresa a la configuracion de casos en parametros de sistema
			Entonces vera la configuracion de cierre de casos HSM para todos los servicios del entorno

		@tc:7486
		Escenario: Un supervisor accede a la configuracion de cierre de casos hsm desde la configuracion del servicio
			Dado un servicio que sobreescribe la configuracion de casos de parametros del sistema
			Cuando un supervisor ingresa a la pestaña casos de dicho servicio
			Entonces vera la configuracion de cierre de casos HSM para dicho servicio

	Regla: el tiempo es configurable por el supervisor
		
		@tc:7483
		Escenario: Se despliega un ambiente nuevo y la funcionalidad tiene preseteado su maximo tiempo
			Dado un ambiente que se acaba de desplegar
			Cuando un supervisor ingresa a la configuracion de casos en parametros de sistema
			Entonces vera que el tiempo configurado es 1444 minutos

		@tc:7484
		Esquema del escenario: Un supervisor no puede superar los limites de tiempo configurable
			Dado que un supervisor se encuentra configurando el tiempo de cierre de casos HSM 
			Cuando intente setear un valor <limites>
			Entonces se le informara que es una configuracion invalida

		Ejemplos:	
			| limites      |
			| mayor a 1444 |
			| menor a 1    |

	Regla: para darle tiempo al usuario a responder el timer se va a reiniciar cada vez que se le envia un nuevo HSM.

		@tc:5047
	    Escenario: segundo HSM del caso reinicia el timer de inactividad
			Dado la siguiente configuracion en parametros de sistema:
				| funcionalidad                                  | configuracion |
				| Minutos para el cierre automatico de casos HSM | 60            |
			Y dado que un caso de un servicio de whatsapp inicio a las 1200 horas por envio de HSM
			Y a las 1215 horas se le envio un segundo HSM al usuario
			Cuando sean las 1315 
			Entonces el caso sera cerrado automaticamente 

	Regla: no se va a enviar el mensaje proactivo que haya configurado en el servicio
	
		@tc:5053
		Escenario: caso es cerrado por cierre automatico HSM y no se le envia mensaje proactivo
			Dado la siguiente configuracion en parametros de sistema:
				| funcionalidad                                  | configuracion |
				| Minutos para el cierre automatico de casos HSM | 60            |
			Y un servicio de whatsapp que posee la siguiente configuracion de mensaje proactivo antes del cierre automatico
				| mensaje                      | minutos antes del cierre |
				| este es el mensaje proactivo | 10                       |
			Cuando un caso que va a ser cerrado por el cierre automatico HSM acumula "50" minutos desde el envio del ultimo mensaje
			Entonces el mensaje proactivo del servicio no debe ser enviado