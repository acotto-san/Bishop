#language: es
Característica: Tener una pestaña que muestre los mensajes del caso
    Como supervisor que se encuentra revisando un caso
    quiero tener visualizacion de los mensajes del caso
    para enterarme de lo hablado dentro del mismo

	Regla de negocio: El supervisor puede ver el cuerpo de los mensajes
        
        @tc5816
        Escenario: Un supervisor ve un mensaje con guiones en el modal de datos del caso
            Dado un mensaje que contiene el siguiente texto "uriel_marino_prueba@hotmail.com"
            Cuando el supervisor ingrese al modal de datos del caso
            Y visualize el mismo mensaje desde la pestaña mensajes
            Entonces debera ver los caracteres especiales en los mensajes

    Regla de negocio: El supervisor puede descargar los mensajes que componen el caso 
        
        @tc5820
        Escenario: Supervisor descarga el caso como imagen
            Dado que dentro del modal de datos del caso se puede descargar la conversacion
            Cuando el supervisor descargue la imagen de la conversacion
            Y haya un mensaje con el siguiente texto "uriel_marino_prueba@hotmail.com"
            Entonces al descargar la imagen debera verse ese testo
        
        @tc5819
        Escenario: Supervisor descarga el caso como excel
            Dado que dentro del modal de datos del caso se puede descargar la conversacion
            Cuando el supervisor descargue el excel de la conversacion
            Y haya un mensaje con el siguiente texto "uriel_marino_prueba@hotmail.com"
            Entonces al descargar la imagen debera verse ese testo
