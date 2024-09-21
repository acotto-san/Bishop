#language: es
@us:7890
Característica: Columna que indique si se solicito la transcripcion del chat
	
	Como supervisor de ySocial 
	Quiero tener una columna que si la transcripcion del chat fue solicitada
	Para saber si se pidio la transcripcion o no

Recordartorio: El tilde de la columna debera estar siempre y cuando el usuario haya solicitado la transcripcion, haya sido enviada o no por un error.

Regla de negocio: La columna debe mostrar si la transcripcion del chat fue solicitada

        @tc:8366
        Esquema del escenario: El supervisor ingresa al reporte "Detallado de chat"
			Dado que un usuario solicita la transcripcion y <desenlace>
			Cuando un supervisor en Detallado de Chats vea la columna "solicitar transcripcion" de dicho mensaje 
			Entonces debera ver un tilde 

			Ejemplos: 
				| desenlace              |
				| se envia correctamente |
				| falla el envio         |

		@tc:
		Escenario: Supervisor verifica que chats no solicitaron transcripcion
			Dado que un usuario no solicita la transcripcion
			Cuando un supervisor en Detallado de Chats vea la columna "solicitar transcripcion" de dicho mensaje 
			Entonces no debera ver nada en la celda

		@tc:8367
		Esquema del escenario: Supervisor descarga reporte detallado de chat y ve en el archivo si se solicito transcripcion
			Dado que un supervisor descarga un reporte "detallado de chat" exportado <metodo-exportacion>
			Cuando vea la columna "solicitar transcripcion" de un caso donde el cliente <estado-solicitud> la transcripcion
			Entonces vera un "<contenido-celda" en la celda

			Ejemplos: 
				| metodo-exportacion | estado-solicitud | contenido-celda |
				| manual visible     | solicito         | si              |
				| manual visible     | no solicito      | no              |
				| manual completo    | solicito         | si              |
				| manual completo    | no solicito      | no              |
				| diario             | solicito         | si              |
				| diario             | no solicito      | no              |
				| programado         | solicito         | si              |
				| programado         | no solicito      | no              |
