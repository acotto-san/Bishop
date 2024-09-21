#language: es
Característica: csv modelo para solicitar abm de usuarios de forma masiva
    Como administrador
    Quiero poder configurar mi solicitud y descargar un csv modelo
    poder saber cómo cargar/modificar/eliminar masivamente usuarios de redes sociales.

Regla: Dependiendo las opciones configuradas por el administrador, debera poder bajar un csv modelo para que sepa como completar los archivos.

    @tc:5948 
    Esquema del escenario: se visualizan los campos configurados en el csv modelo.
        Dada la siguiente configuracion de usuarios de <tipoRed> 
            | checks           |
            | <checks activos> |

        Cuando el supervisor se descarga el csv modelo
        Entonces en el csv estara <estado columna> la columna del dato correspondiente

        Ejemplos: de WA
            | tipoRed | checks activos | estado columna |
            | WA      | businessData   | presente       |
            | WA      | datosExtendidos| presente       |
            | WA      | todos          | presente       |
            | WA      | ninguno        | ausente        | testeo primero esta

        Ejemplos: de Mail
            | tipoRed | checks activos | estado columna |
            | mail    | businessData   | presente       |
            | mail    | datosExtendidos| presente       |
            | mail    | todos          | presente       |
            | mail    | ninguno        | ausente        |

    @tc:5949
    Escenario: administrador descarga y edita el csv modelo.
        Dado que un administrador agrega usuarios de WA de forma masiva con la siguiente configuración:
            | check            | status   |
            | businessData     | activo   |
            | Datos extendidos | inactivo |
        Cuando descarga el cvs modelo
        Entonces no deberia poder editar el campo de "businessData" por "Datos extendidos" en la nomenclatura de la columna del csv
