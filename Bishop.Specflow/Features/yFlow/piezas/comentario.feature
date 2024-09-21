#language: es 
@us:6108

Característica: pieza comentario
    Como implementador de un flow
    Quiero poder agregar una pieza
    Para dejar los comentarios de lo que voy construyendo en el flow.

    Acciones exploratorias: efectuar accion y verificar que continua existiendo ok la pieza y su contenido
        -exportar pieza
        -clonar pieza
        -clonar bloque que lo contiene
        -importar bloque que lo contiene
        -drag and drop el bloque que lo contiene
        -importar grupo de bloques que lo contiene
        -importar json que lo contiene
        -publicar flujo
        -volver atras una version del flujo
        -clonar el bot (entero)


    Regla: Esta pieza no tiene limitaciones de tipo de flujo o canal

        @tc:6286
        Esquema del escenario: Pieza disponible en todo tipo de bot
            Dado que me encuentro en la edicion de un bot de tipo <tipo de bot>
            Cuando veo la lista de piezas en el <vista de piezas>
            Entonces voy a encontrar en la lista la pieza comentario

            Ejemplos: al final de un bloque
                | tipo de bot   | vista de piezas  |
                | bot           | final del bloque |
                | lite          | final del bloque |
                | modulo master | final del bloque |
                | modulo child  | final del bloque |

            Ejemplos: en el modal emergente de piezas
                | tipo de bot   | vista de piezas           |
                | bot           | modal emergente de piezas |
                | lite          | modal emergente de piezas |
                | modulo master | modal emergente de piezas |
                | modulo child  | modal emergente de piezas |

        @tc:6287
        Esquema del escenario: Pieza disponible en todo tipo de canal
            Dado que me encuentro en la edicion de un bot de canal <tipo de canal>
            Cuando veo la lista de piezas en el <vista de piezas>
            Entonces voy a encontrar en la lista la pieza comentario

            Ejemplos: al final de un bloque
                | tipo de canal | vista de piezas  |
                | chat          | final del bloque |
                | messenger     | final del bloque |
                | instagram     | final del bloque |
                | twitter       | final del bloque |
                | whatsapp      | final del bloque |
                | skype         | final del bloque |
                | mercado libre | final del bloque |
                | telegram      | final del bloque |
                | generic       | final del bloque |
                | google rbm    | final del bloque |
                | apple         | final del bloque |

            Ejemplos: en el modal emergente de piezas
                | tipo de canal | vista de piezas           |
                | chat          | modal emergente de piezas |
                | messenger     | modal emergente de piezas |
                | instagram     | modal emergente de piezas |
                | twitter       | modal emergente de piezas |
                | whatsapp      | modal emergente de piezas |
                | skype         | modal emergente de piezas |
                | mercado libre | modal emergente de piezas |
                | telegram      | modal emergente de piezas |
                | generic       | modal emergente de piezas |
                | google rbm    | modal emergente de piezas |
                | apple         | modal emergente de piezas |

    Regla: Contiene un campo alfanumérico que permite infinitos caracteres

        @tc:6175
        Esquema del escenario: Supervisor intenta ingresar texto o archivos en la pieza
            Dado un supervisor que agrega una pieza comentario en su flow
            Cuando ingresa <tipo de dato>
            Entonces <estado> en la pieza

            Ejemplos:
            | tipo de dato                                | estado             |
            | contenido alfanumerico corto (exploratorio) | el mensaje aparece |
            | contenido alfanumerico largo (exploratorio) | el mensaje aparece |
            | imagen                                      | no se adjunta      |
            | pdf                                         | no se adjunta      |

    Regla: la pieza comentario nunca va a estar mal configurada

        @tc:6176
        Escenario: Supervisor deja vacía la pieza
            Dado un supervisor que agrega una pieza comentario en su flow
            Cuando no ingresa ningun comentario
            Y guarda cambios y publica
            Entonces se aceptan con exito los cambios

    Regla: los comentarios que se dejan en el flow no se imprimen en el bot.

        @tc:6177
        Escenario: los usuarios no visualizan los comentarios de la pieza
            Dado un flow que contiene comentarios de supervisores
            Cuando un usuario interactua con ese flow
            Entonces no visualiza los comentarios de esas piezas

    Regla: se puede insertar esta pieza en el flow infinitas veces
        @tc:6178
        Escenario: Supervisor utiliza varias veces la pieza
            Dado un flow con varios bloques y piezas configuradas
            Cuando el supervisor coloca comentarios entre cada pieza que configura
            Entonces no se encuentra con ningun impedimento para usar la pieza comentario
