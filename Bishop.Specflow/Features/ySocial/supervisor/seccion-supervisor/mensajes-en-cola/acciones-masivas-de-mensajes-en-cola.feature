#language: es
@us:8541
Característica: Realizar acciones masivas con los mensajes encolados, seleccionando si solo los visibles o todos los mensjes
    Como supervisor
    quiero tener una opcion de poder seleccionar los mensajes visibles o todos los mensajes encolados
    para poder aplicar la accion que quiera a los mensajes deseados

	Regla de negocio: Se podra tildar para trabajar solo visibles o todos los mensajes
        
        @tc:8940
        Escenario: Supervisor selecciona todos los mensajes encolados
            Dado un supervisor selecciona todos los mensajes
            Cuando ejecute la accion que necesite
            Entonces esa accion se debera aplicar a todos los mensajes en cola

        @tc:8941
        Escenario: Supervisor selecciona solo los mensajes visibles
            Dado un supervisor selecciona solo los mensajes visibles
            Cuando ejecute la accion que necesite
            Entonces esa accion se debera aplicar a todos los mensajes que esten visibles en la lista

	Regla de negocio: Se podran ejecutar las acciones a los mensajes seleccionados
        
        @tc:8942
        Esquema del escenario: Supervisor ejecuta una accion sobre todos los mensajes encolados
            Dado un supervisor selecciona todos los mensajes encolados
            Cuando seleccione la accion <Accion>
            Entonces se deberan <Respuesta>

            Ejemplos:
                | Accion                                | Respuesta                                            |
                | Aplicar etiquetas al caso del mensaje | aplicar las etiquetas a todos los mensajes           |
                | Descartar mensaje                     | descartar todos los mensajes encolados               |
                | Marcar mensaje como VIM               | marcar todos los mensajes encolados como VIM         |
                | Mover mensaje de cola                 | mover todos los mensajes encolados a otra cola       |
                | Liberar mensaje de un agente          | liberar todos los mensajes encolados de un agente    |
                | Reservar mensaje a un agente          | reservar un agente para todos los mensajes encolados |
                | Responder a todos                     | responder a todos los mensajes encolados             |

        @tc:8943
        Esquema del escenario: supervisor ejecuta una accion sobre los mensajes visibles
            Dado un supervisor selecciona solo los mensajes visibles 
            Cuando seleccione la accion <Accion>
            Entonces se deberan <Respuesta>

            Ejemplos: 
                | Accion                                | Respuesta                                           |
                | Aplicar etiquetas al caso del mensaje | aplicar las etiquetas a todos los mensajes visibles |
                | Descartar mensaje                     | descartar todos los mensajes visibles               |
                | Marcar mensaje como VIM               | marcar todos los mensajes visibles como VIM         |
                | Mover mensaje de cola                 | mover todos los mensajes visibles a otra cola       |
                | Liberar mensaje de un agente          | liberar todos los mensajes visibles de un agente    |
                | Reservar mensaje a un agente          | reservar un agente para todos los mensajes visibles |
                | Responder a todos                     | responder a todos los mensajes visibles             |

    Regla de negocio: La cantidad de mensajes no genera el paginado y no se ve el desplegable de "Todos" y "Visibles"
        
        @tc:8944
        Escenario: la cantidad de mensajes no es suficiente para generar el paginado
            Dado un supervisor ingresa a mensajes en cola
            Y la cantidad de mensajes no es la suficiente para que se haga el paginado
            Cuando seleccione el check para marcar todos los mensajes
            Entonces no se debera abrir el desplegable 