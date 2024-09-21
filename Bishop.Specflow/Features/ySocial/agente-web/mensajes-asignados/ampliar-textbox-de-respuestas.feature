#language: es 
@us:5169
Característica: Ampliar textbox de escritura de respuestas
    Como administrador
    Quiero ver que el textarea de las respuestas a los mensajes se vaya ampliando, similar a como funciona en whatsapp web (con un máximo de 5 o 6 renglones, luego si el scroll)
    Para evitar tener que scrollear

    @tc:5749
    Esquema del escenario: Respuesta con max 5/6 renglones
        Dado que un agente se encuentra en <vista de la web> 
        Y tiene asignado un mensaje de tipo <tipo de mensaje> 
        Cuando redacta una respuesta de 1 a 5/6 renglones
        Entonces se amplia el textarea de la respuesta
        Y puede ver su mensaje sin scrolear.
        
            Ejemplos: desde mensajes asignados
                | vista de la web | tipo de mensaje           |
                | mensaje asignado| twitter (mensaje publico) |
                | mensaje asignado| twitter (mensaje privado) |
                | mensaje asignado| whatsapp (modo normal)    |
                | mensaje asignado| messenger (modo chat)     |
                | mensaje asignado| mail                      |
                | mensaje asignado| generar saliente (mail)   |
                | mensaje asignado| chat                      |

            Ejemplos: desde Salientes
                | vista de la web | tipo de mensaje                 |
                | mensaje saliente| whatsapp (mensaje normal)       |
                | mensaje saliente| mail                            |
                | mensaje saliente| twitter                         |
                | mensaje saliente| messenger (va a existir pronto) |

            Ejemplos: desde Búsqueda de casos
                | vista de la web   | tipo de mensaje           |
                | búsqueda de casos | twitter (mensaje publico) |
                | búsqueda de casos | twitter (mensaje privado) |
                | búsqueda de casos | whatsapp (modo normal)    |
                | búsqueda de casos | mail                      |

            Ejemplos: desde Mis Casos Pendientes
                | vista de la web      | tipo de mensaje           |
                | mis casos pendientes | twitter (mensaje publico) |
                | mis casos pendientes | twitter (mensaje privado) |
                | mis casos pendientes | whatsapp (modo normal)    |
                | mis casos pendientes | mail                      |

    @tc:5750
    Esquema del escenario: Respuesta con mas de 6 renglones
        Dado que un agente se encuentra en <vista de la web> 
        Y tiene asignado un mensaje de tipo <tipo de mensaje> 
        Cuando redacta una respuesta de mas de 6 renglones
        Entonces debera scrolear para ver el renglon 7 y los siguientes.
    
            Ejemplos: desde mensajes asignados
                | vista de la web | tipo de mensaje           |
                | mensaje asignado| twitter (mensaje publico) |
                | mensaje asignado| twitter (mensaje privado) |
                | mensaje asignado| whatsapp (modo normal)    |
                | mensaje asignado| messenger (modo chat)     |
                | mensaje asignado| mail                      |
                | mensaje asignado| generar saliente (mail)   |
                | mensaje asignado| chat                      |

            Ejemplos: desde Salientes
                | vista de la web | tipo de mensaje                 |
                | mensaje saliente| whatsapp (mensaje normal)       |
                | mensaje saliente| mail                            |
                | mensaje saliente| twitter                         |
                | mensaje saliente| messenger (va a existir pronto) |

            Ejemplos: desde Busqueda de casos
                | vista de la web   | tipo de mensaje           |
                | busqueda de casos | twitter (mensaje publico) |
                | busqueda de casos | twitter (mensaje privado) |
                | busqueda de casos | whatsapp (modo normal)    |
                | busqueda de casos | mail                      |

            Ejemplos: desde Mis Casos Pendientes
                | vista de la web      | tipo de mensaje           |
                | mis casos pendientes | twitter (mensaje publico) |
                | mis casos pendientes | twitter (mensaje privado) |
                | mis casos pendientes | whatsapp (modo normal)    |
                | mis casos pendientes | mail                      |