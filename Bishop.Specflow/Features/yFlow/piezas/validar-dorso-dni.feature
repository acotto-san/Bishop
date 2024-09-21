#language: es
Característica: Pieza validar dorso de DNI
    Como implementador quiero configurar la pieza de dni para hacer la validación

    @tc5600
    Esquema del escenario: Configurar pieza de validación de dni sin ingresar texto en mensaje de error.
        Dado que un bot posee la pieza "Validar dorso de DNI"
        Y el campo <@campoVacio> se en encuentra vacio
        Cuando el implementador intenta publicar el bot
        Entonces no se le permitira la publicacion
        Y el campo <@campoVacio> debera quedar remarcado en rojo para alertar al implementador

        Ejemplos: 
            | @campoVacio                |
            | Mensaje de error           |
            | Reintentos                 |
            | Continuar en caso de error |

        