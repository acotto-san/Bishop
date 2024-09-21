#language: es
@us:6540
Característica: Al desasociar y volver a asociar un servicio que tiene configurado yFlow se mantienen las configuraciones
	Como administrador
	Quiero que al desasociar y volver a asociar un servicio que tiene configurado yflow se mantengan las configuraciones
	Para no tener que volver a configurarlas

	Antecedentes: 
		Dado un servicio con yFlow asociado
		Y dada la siguiente configuracion avanzada:
			| funcionalidad                                           | Configuracion  |
			| mapeo para transferencia a distintas colas              | Clave A Cola A |
			| compartir mensajes encolados de las siguientes colas    | Cola B         |
			| Compartir agentes conectados de las siguientes colas    | Cola C         |
			| minutos para no invocar a yFlow luego de cerrar el caso | 10 minutos     |
			| permitir a agente devolver mensaje a yFlow              | habilitado     |
			| habilitar envio de encuestas                            | habilitado     |

	Regla de negocio: Al volver a asociar un servicio el cual se le desasocio yflow se deben mantener las configuraciones que tenia

		@tc:6824
		Escenario: Supervisor desasocia y vuelve a asociar yFlow a un servicio
			Dado un supervisor desasocia yflow del servicio
			Cuando vuelva a asociarlo
			Entonces se veran las configuraciones que tenia antes de que fuera desasociado
	
	Regla de negocio: Las configuraciones dentro de "configuracion avanzada" deberan ser las mismas que eran cuando se desasocio yflow 

		@tc:6826
		Escenario: supervisor revisa el mapeo para tranferencia a distintas colas
			Dado un supervisor vuelve a asociar yFlow al servicio
			Cuando vea el mapeo para transferencia a distintas colas
			Entonces debera ver "clave A cola A"

		@tc:6828
		Escenario: supervisor revisa otras configuraciones 
			Dado un supervisor vuelve a asociar yFlow al servicio
			Cuando vea otras configuraciones
			Entonces debera ver las configuraciones previas a desasociar

		@tc:6829
		Escenario: supervisor revisa encuestas
			Dado un supervisor vuelve a asociar yFlow al servicio
			Cuando vea encuestas
			Entonces debera ver habilitado el envio de encuestas