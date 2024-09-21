#language: es
Característica: bloques públicos y privados
    Como supervisor
    Quiero convertir bloques públicos a privados
    Para que no se pueda saltar a esos bloques en ciertas partes del flow

        Exploratorio: Verificar en las siguientes piezas y secciones el salto correcto a los bloques privados o publicos.
        Piezas a otro bloque:
        -Acciones
        -Calendario
        -Condición
        -Condición sobre una variable
        -Firma digital
        -Galería
        -Geocoder
        -Multimedia
        -Ingreso de datos
        -Integración
        -Invocar bloque
        -Ir a bloque
        -Menu
        -Pasarela de pagos
        -Respuestas rápidas
        -Salto condicional
        -Validar dorso de dni
        -Validar frente de dni
        -Mensaje interactivo de lista (pieza de WA)
        -Apple Pay (pieza de Apple - es un canal en poco uso)
        -Autenticación (pieza de Apple - es un canal en poco uso)

        Secciones desde Master:
        -Ajustes
        -Comandos
        -Cognitividad + añadir datos extendidos


Regla: Al crear un bloque este sera publico

    @tc:6187 
    Esquema del escenario: Se crea un bloque publico 
        Dado un supervisor en un modulo <tipo de modulo>
        Cuando ingresa un bloque al flow
        Entonces se visualiza un candado abierto en el titulo del bloque
    
        Ejemplos:
        | tipo de modulo |
        | master         |
        | child          |

Regla: Un bloque privado se obtiene al convertir uno público

    @tc:6188
    Esquema del escenario: Se crea un bloque privado
        Dado un bloque publico en un modulo <tipo de modulo>
        Cuando un supervisor lo convierte a privado
        Entonces se visualiza un candado cerrado en el bloque
    
        Ejemplos:
        | tipo de modulo |
        | master         |
        | child          |   

Regla: El estado de un bloque puede ser modificado en cualquier momento

    @tc:6189
    Esquema del escenario: un bloque cambia a su estado opuesto
        Dado un bloque <estado> en un modulo <tipo de modulo>
        Cuando un supervisor lo convierte a <estado opuesto>
        Entonces se visualiza un candado <candado correcto> en el bloque, desde master y desde child

        Ejemplos: de Master
        | tipo de modulo | estado | estado opuesto | candado correcto |
        | master         | publico| privado        | cerrado          |
        | master         | privado| publico        | abierto          |

        Ejemplos: de Child
        | tipo de modulo | estado | estado opuesto | candado correcto |
        | child          | publico| privado        | cerrado          |
        | child          | privado| publico        | abierto          |

    @tc:6190 
    Esquema del escenario: un salto a otro bloque publico cambia a privado
        Dado que modulo <tipo de modulo> tiene en una pieza un salto de bloque que apunta a un bloque publico de otro modulo
        Y ese otro modulo es de tipo <tipo de modulo destino>  
        Cuando el bloque en el <tipo de modulo destino> es cambiado a privado
        Entonces la configuracion de la pieza que contiene el salto de bloque estara vacia
        Y tambien la pieza sera invalida 

        Ejemplos:
        | tipo de modulo | tipo de modulo destino |
        | master         | child                  |
        | child          | master                 |
        | child 1        | child 2                |

    @tc:6191
    Esquema del escenario: bloque cambia a publico y se visualiza en un salto de bloque
        Dado que modulo <tipo de modulo> tiene en una pieza un salto de bloque vacio
        Y otro modulo <tipo de modulo destino> tiene un bloque privado
        Cuando el bloque en el <tipo de modulo destino> es cambiado a publico
        Entonces se visualizara ese bloque en la pieza de salto de bloque del modulo <tipo de modulo>

        Ejemplos:
        | tipo de modulo | tipo de modulo destino |
        | master         | child                  |
        | child          | master                 |
        | child A        | child B                |

    @tc:6192 
    Escenario: Se elimina bloque y queda salto a bloque vacio
        Dado que en el modulo master una pieza de un bloque default hace salto a un bloque de un child
        Y el child elimino dicho bloque y guardo - no publicar -
        Cuando desde el child se visualice el bloque default
        Entonces deberia verse la pieza vacia invalida 
        Y permitir guardar pero no publicar

        #hay que testearlo en todos los lugares que tengan un salto de bloque 

Regla: La lista filtra los privados ajenos de otros modulos

    @tc:6193
    Esquema del escenario: Se filtran los bloques privados de otros modulos
        Dada la siguiente configuracion de un flow:
        | Modulo | bloque | estado |
        | master | 1      | privado|
        | master | 2      | publico|
        | child A| 3      | privado|
        | child A| 4      | publico|
        | child B| 5      | privado|
        | child B| 6      | publico|
        Cuando un supervisor agrega una pieza que salta a otro bloque en el modulo <modulo>
        Entonces en el desplegable de la lista deberian filtrarse los bloque <bloques filtrados>
    
        Ejemplos: 
        | modulo | bloques filtrados |
        | master | 1-2-4-6           |
        | child A| 2-3-4-6           |
        | child B| 2-4-5-6           |

Regla: Solo se puede modificar el estado de un bloque desde su mismo modulo

    @tc:6194
    Esquema del escenario: supervisor intenta modificar bloque de otro modulo
        Dado un bloque <estado> en un modulo <modulo de bloque>
        Cuando un supervisor configura el modulo <modulo de supervisor>  
        Y intenta convertir el bloque a <estado opuesto>
        Entonces no se permite realizar esta accion

        Ejemplos:
        | estado | modulo de bloque | modulo de supervisor | estado opuesto |
        | publico| master           | child A              | privado        |
        | privado| child A          | master               | publico        |
        | publico| child A          | child B              | privado        |

Regla: Se puede eliminar un bloque privado/publico

    @tc:6195
    Esquema del escenario: se elimina un bloque privado o publico del flujo
        Dado un bloque <estado> en un modulo <modulo de bloque>
        Cuando un supervisor elimina el bloque
        Entonces no se visualiza el bloque en el modulo
        
        Ejemplos:
        | estado | modulo de bloque |
        | publico| master           |
        | privado| master           |
        | publico| child            |
        | privado| child            |

Regla: Se puede clonar un bloque privado/publico. Respetara el estado original
    
    @tc:6196
    Esquema del escenario: se clona un bloque privado o publico del flujo
        Dado un bloque <estado> en un modulo <modulo de bloque>
        Cuando un supervisor clona el bloque
        Entonces se visualiza el bloque con las misma configuraciones

        Ejemplos:
        | estado | modulo de bloque |
        | publico| master           |
        | privado| master           |
        | publico| child            |
        | privado| child            |

Regla: Se puede importar un bloque privado de otro flow. Respetara la misma configuracion

    @tc:6197  
    Esquema del escenario: se importa un bloque privado/publico de otro flow
        Dado la siguiente configuracion de un grupo de bloques del flow A:
          | grupo de bloques | estado |
          | bloque 1         | privado|
          | bloque 2         | publico|

        Cuando un supervisor importa <importacion mediante> a otro flow B nuevo
        Entonces se visualiza el bloque con las mismas configuraciones

        Ejemplos:
        | importacion mediante |
        | bloque 1             |
        | bloque 2             |
        | grupo de bloques     |

Regla: Se puede importar un json de otro flow master sin la configuracion de estados o de uno tradicional. Deberian aparecer todos los bloques publicos.

    @tc:6198
    Esquema del escenario: se importa un json de otro flow de distinta configuracion
        Dado un json de flow <tipos de flow>
        Cuando un supervisor lo importa en un flow modularizado con la configuracion de estados de bloques
        Entonces los bloques importados deberian aparecer como publicos

        Ejemplos:
        | tipos de flow                       |
        | master sin configuracion de estados |
        | child sin configuracion de estados  |
        | tradicional                         |
        
Regla: Se puede importar un json de un master con configuracion de estados a otro de misma configuracion

    @tc:6199
    Esquema del escenario: se importa un json de otro flow con misma configuracion
        Dado el json de flow Test 1 con la siguiente configuracion:
        | modulo | bloque   | estado |
        | master | bloque 1 | privado|
        | child A| bloque 2 | publico|
        | child B| bloque 3 | privado|

        Cuando un supervisor importa el json del <modulo> en otro flujo Test 2 modularizado con la configuracion de estado de bloques
        Entonces el estado del bloque deberia ser identico al flow test 1

        Ejemplos:
        | modulo   |
        | master   |
        | child A  |
        | child  B |

Regla: Desde modulo master, en el listado de bloques, se visualiza el nombre de cada grupo con el modulo del que proviene.

    @tc:6200 
    Escenario: Se visualiza el grupo de bloques y el modulo del que proviene
    Dado que en el modulo master una pieza de un bloque default hace salto a otro bloque
    Cuando un supervisor despliega la lista de bloques
    Entonces deberia visualizar los bloques correspondientes y el modulo del que provienen

Regla: La clasificación de bloques públicos y privados solo se visualiza en los flows modularizados

    @tc:6352
    Esquema del escenario: Un flujo no modularizado no tiene clasificación de bloques
    Dado que un supervisor esta configurando un flujo <tipo de flujo>
    Cuando agrega bloques a su flujo
    Entonces deberian <estado> los candados de bloques privados o publicos

    Ejemplos: 
        | tipo de flujo | estado      |
        | tradicional   | no aparecer |
        | lite          | no aparecer |
        | modularizado  | aparecer    |
