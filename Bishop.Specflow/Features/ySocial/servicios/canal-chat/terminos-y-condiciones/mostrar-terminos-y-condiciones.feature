#language: es
Característica: mostrar al usuario terminos y condiciones
    Como supervisor de ySocial
    Quiero que el usuario tenga acceso a terminos y condiciones
    Para que al momento de haber comenzado el chat haya tenido posibilidad de leerlos

    Regla: el servicio es configurable en la edicion de un servicio de chat

        Escenario: supervisor habilita feature en un chat anonimo
            Dado el servcicio "QA chat anonimo" de chat configurado como anonimo
            Cuando el supervisor ingresa a la pestaña "Configuracion Avanzada" dentro de la edicion del servcicio
            Entonces debe ver el feature de terminos y condiciones
            Y debe contener un dropdown con las siguientes opciones:
            Ejemplos:
                | opciones                         |
                | No solicitar                     |
                | Mostrar sin necesidad de aceptar |
                | Mostrar y requerir aceptar       |

    Regla: el feature no se encuentra habilitado para todos los chats

        Escenario: no se visualiza feature en un chat autenticado
            Dado el servicio "QA chat autenticado" de chat configurado como autenticado
            Cuando el supervisor ingresa a la pestaña "Configuracion Avanzada" dentro de la edicion del servcicio
            Entonces no debe ver el feature de terminos y condiciones

        Escenario: no se visualiza feature en un chat con yflow
            Dado el servicio "QA chat anonimo" de chat configurado como anonimo
            Y el mismo posee yFlow habilitado
            Cuando el supervisor ingresa a la pestaña "Configuracion Avanzada" dentro de la edicion del servcicio
            Entonces no debe ver el feature de terminos y condiciones

    Regla: la obligatoriedad de aceptar los terminos y condiciones es configurable

        Antecedentes:
            Dado un servicio de chat anonimo configurado con terminos y condiciones

        Escenario: usuario no puede continuar con el inicio del chat hasta no aceptar terminos y condiciones
            Y el feature esta configurado para requerir la aceptacion de los mismos
            Cuando un usuario intenta iniciar el chat
            Pero no marco el check para aceptar los terminos y condiciones
            Entonces se le debe informar que no puede continuar hasta que los acepte

        Escenario: usuario inicia un chat luego de aceptar terminos y condiciones
            Y el feature esta configurado para requerir la aceptacion de los mismos
            Cuando un usuario marca el check para aceptar los terminos y condiciones
            Y luego intenta iniciar el chat
            Entonces podra iniciar el chat normalmente

        Escenario: usuario no se ve obligado a aceptar los terminos y condiciones
            Y el feature esta configurado para solo mostrar los mismos pero no requerir su aceptacion
            Cuando un usuario intenta iniciar el chat
            Entonces podra iniciar el chat normalmente

    Regla: los textos son configurables

        Escenario: usuario visualiza texto que invita a aceptar terminos y condiciones
            Dado un servicio de chat anonimo 
            Y dado que tiene las siguientes configuraciones para terminos y condiciones con aceptar obligatorio:
                | atributo           | valor                    |
                | Texto para aceptar | "Acepto los siguientes " |
            Cuando un usuario ingresa al formulario de inicio de un chat
            Entonces debera visualizar arriba del boton para iniciar el chat el siguiente mensaje "Acepto los siguientes"

        Escenario: usuario visualiza texto que invita a visualizar terminos y condiciones
            Dado un servicio de chat anonimo 
            Y dado que tiene las siguientes configuraciones para terminos y condiciones como no obligatorios:
                | atributo       | valor                        |
                | Texto para ver | "Aqui puede visualizar los " |
            Cuando un usuario ingresa al formulario de inicio de un chat
            Entonces debera visualizar arriba del boton para iniciar el chat el siguiente mensaje "Aqui puede visualizar los"

        Escenario: usuario visualiza texto del enlace a los terminos y condiciones
            Dado un servicio de chat anonimo 
            Y dado que tiene las siguientes configuraciones para terminos y condiciones con aceptar obligatorio: 
                | atributo                | valor                    |
                | Texto para hypervínculo | "terminos y condiciones" |
            Cuando un usuario ingresa al formulario de inicio de un chat
            Entonces debera visualizar arriba del boton para iniciar el chat el siguiente enlace "terminos y condiciones"
            Y el mismo debe ser clickeable
    
    Regla: el enlace es configurable

        Escenario: navegador ingresa a la url configurada cuando usuario hace click en el enlace
            Dado un servicio de chat anonimo 
            Y dado que tiene las siguientes configuraciones para terminos y condiciones con aceptar obligatorio:
                | atributo              | valor                     |
                | Url para hypervínculo | "https://www.ole.com.ar/" |
            Cuando un usuario ingresa al formulario de inicio de un chat
            Y hace click al enlace que se encuentra arriba del boton para iniciar 
            Entonces el navegador debe cargar la pagina "https://www.ole.com.ar/"

    Regla: el comportamiento al clickear el enlace es configurable

        Escenario: clickear el enlace abre una nueva pestaña
            Dado un servicio de chat anonimo 
            Y dado que tiene las siguientes configuraciones para terminos y condiciones con aceptar obligatorio: 
                | atributo                       | valor                     |
                | Url para hypervínculo          | "https://www.ole.com.ar/" |
                | Abrir hypervínculo en un popup | deshabilitado             |
            Cuando un usuario ingresa al formulario de inicio de un chat
            Y hace click al enlace que se encuentra arriba del boton para iniciar
            Entonces la pagina debe ser cargada en una nueva pestaña

        Escenario: clickear el enlace abre un popup dentro del chat
            Dado un servicio de chat anonimo 
            Y dado que tiene las siguientes configuraciones para terminos y condiciones con aceptar obligatorio: 
                | atributo                       | valor                     |
                | Url para hypervínculo          | "https://www.ole.com.ar/" |
                | Abrir hypervínculo en un popup | habilitado                |
            Cuando un usuario ingresa al formulario de inicio de un chat
            Y hace click al enlace que se encuentra arriba del boton para iniciar
            Entonces la pagina debe ser cargada en un popup dentro del mismo chat