#language: es
Característica: Deshabilitar emojis en la web del agente
    Como administrador
    Quiero que los agentes no tengan posibilidad de mandar emojis
    Para que no quede informal la conversación.

    Para exploratorio:
    -Insertar emoji haciendo clic derecho
    -Ver que ocurre cuando se hace una respuesta de mail que adjunta el hilo de la conversación y hay un emoji en ese hilo

    Regla: La visibilidad del botón de emojis dependerá del permiso del agente o grupo de agentes para enviar emojis.

        @tc:5719
        Esquema del escenario: agente envía respuesta con emojis
            Dado que un agente posee el permiso para enviar emojis
            Y se encuentra en <vista de la web> 
            Cuando redacta un mensaje de tipo <tipo de mensaje> con un emoji
            Y envía el mensaje
            Entonces su mensaje será enviado correctamente

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


        @tc:5720
        Esquema del escenario: agente no visualiza botón de emojis
        Para exploratorio: 
                -deshabilitar el permiso editando a un agente
                -deshabilitar el permiso editando a un grupo de agentes

            Dado que un agente no posee el permiso para enviar emojis
            Y se encuentra en <vista de la web> 
            Cuando redacta un mensaje de tipo <tipo de mensaje> con un emoji
            Entonces no deberá visualizar el botón de emojis

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


    Regla: La posibilidad de responder un mensaje con emojis escritos como texto dependerá del permiso del agente o grupo de agentes para enviar emojis.

        @tc:5721
        Esquema del escenario: agente envía emojis como texto
            Dado que un agente posee el permiso para enviar emojis
            Y se encuentra en <vista de la web> 
            Cuando redacta un mensaje de tipo <tipo de mensaje> con un emoji escrito como texto
            Y envía el mensaje
            Entonces su mensaje será enviado correctamente

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

        @tc:5722
        Esquema del escenario: agente no puede enviar emojis como texto
            Dado que un agente no posee el permiso para enviar emojis
            Y se encuentra en <vista de la web> 
            Cuando redacta un mensaje de tipo <tipo de mensaje> con un emoji escrito como texto
            Y envía el mensaje
            Entonces tendrá restringido el envío de ese mensaje

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
