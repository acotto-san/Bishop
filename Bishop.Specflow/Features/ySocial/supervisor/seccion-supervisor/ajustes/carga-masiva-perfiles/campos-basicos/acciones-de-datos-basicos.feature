#language: es
Característica: agregar o editar datos basicos de usuarios

    Regla de negocio: se posee una accion que agrega nuevos perfiles

        @tc:5957
        Esquema del escenario: se agrega un nuevo perfil con sus datos basicos
            Dado el usuario con el id de RRSS <id> nunca se contacto con ySocial
            Y un csv para carga masiva de perfiles que posee el siguiente registro:
                """
                    1,<id>,romi,rgroisman@yoizen.com,5491158638852,1,0,1,1
                """
            Cuando un supervisor utiliza el csv para una carga masiva de perfiles
            Entonces al ubicar en ySocial al perfil mediante su id se vera que posee los siguientes campos basicos
                | id   | nombre | mail                 | telefono      | lista vip | lista bloq | lista no contactar | lista tester |
                | <id> | romi   | rgroisman@yoizen.com | 5491158638852 | si        | no         | si                 | si           |

            Ejemplos: de WA        
                | tipo de servicio | id            |
                | WA               | 5491158638852 |

            Ejemplos: de email
                | tipo de servicio | id                   |
                | email            | rgroisman@yoizen.com |

        @tc:5959
        Escenario: se agregan multiples registros de datos básicos de usuarios nuevos
            Dado que nunca se contactaron con ySocial los siguientes usuarios:
                | id                       |
                | jcontento@yoizen.com     |
                | groismanromina@gmail.com |
            Y un csv para carga masiva de perfiles que posee el siguiente registro:
                """
                    1,jcontento@yoizen.com,juan,jcontento@yoizen.com,5491126333583,0,0,1,0
                    1,groismanromina@gmail.com,usuario prueba,groismanromina@gmail.com,5491152222222,1,0,0,1
                """
            Cuando un supervisor utiliza el csv para una carga masiva de perfiles
            Entonces en ySocial se encontraran creados los nuevos perfiles al buscarlos por su id:
                | id                       | nombre         | mail                     | tel           | vip | bloq | no contactar | tester |
                | jcontento@yoizen.com     | juan           | jcontento@yoizen.com     | 5491126333583 | no  | no   | si           | no     |
                | groismanromina@gmail.com | usuario prueba | groismanromina@gmail.com | 5491152222222 | si  | no   | no           | si     |

        @tc:6047
        Escenario: en accion de agregar perfil se dejan campos en blanco para no definirles un valor
            Dado el usuario con el id de RRSS increiblecasilladecorreo@gmail.com nunca se contacto con ySocial
            Y un csv para carga masiva de perfiles que posee el siguiente registro:
                """
                    1,increiblecasilladecorreo@gmail.com,Cosme Fulanito,,,,,,
                """
            Cuando un supervisor utiliza el csv para una carga masiva de perfiles
            Entonces al ubicar en ySocial al perfil mediante su id se vera que posee los siguientes campos basicos
                | id                             | nombre         | mail | telefono | lista vip | lista bloq | lista no contactar | lista tester |
                | increiblecasilladecorreo@gmail | Cosme Fulanito |      |          | no        | no         | no                 | no           |

        @tc:6050
        Escenario: Se ignora el registro del csv por intentar crear un perfil que ya existe
            Dado el usuario con el id de RRSS jcontento@yoizen.com que ya posee un perfil en ySocial
            Y un csv para carga masiva de perfiles que posee el siguiente registro:
                """
                    1,jcontento@yoizen.com,nombre nuevo,mail-nuevo@yoizen.com,5491100000000,1,1,1,1
                """
            Cuando un supervisor utiliza el csv para una carga masiva de perfiles
            Entonces el registro en cuestion sera ignorado
            Y no se le aplicaran cambios a los datos del perfil

        @tc:6351
        Esquema del escenario: Al crear un perfil aparecera en reporteria
            Dado que un supervisor creo un perfil mediante la carga masiva de perfiles
            Cuando se genere un reporte "<reporte>" del mismo día de la carga
            Entonces entre los registros estara presente dicho usuario/perfil

            Ejemplos: 
                | reporte               |
                | detallado de usuarios |
                | detallado de perfiles |

    Regla de negocio: se posee una accion que sobreescribe perfiles preexistentes

        @tc:5958
        Escenario: sobreescritura de datos basicos de un perfil preexistente
            Dado que la linea 5491158638852 ya se contacto alguna vez con la plataforma
            Y su perfil se encuentra con los siguientes datos:
                | id            | nombre | mail | telefono | lista vip | lista bloq | lista no contactar | lista tester |
                | 5491158638852 | -      | -    | -        | no        | no         | no                 | no           |
            Y un csv para carga masiva de perfiles que posee el siguiente registro:
                """
                    2,5491158638852,romi,rgroisman@yoizen.com,5491158638852,1,0,1,1
                """
            Cuando un supervisor genera una carga masiva de perfiles utilizando el csv provisto
            Entonces al ubicar en ySocial al perfil mediante su id se lo encontrara con los siguientes datos:
                | id            | nombre | mail                 | telefono      | lista vip | lista bloq | lista no contactar | lista tester |
                | 5491158638852 | romi   | rgroisman@yoizen.com | 5491158638852 | si        | no         | si                 | si           |

        @tc:5960
        Escenario: se sobreescriben todos los campos basicos de un perfil existente
            Dado que en el perfil del usuario hay configurados los siguientes datos basicos:
                | id            | nombre | mail                 | telefono      | lista vip | lista bloq | lista no contactar | lista tester |
                | 5491158638852 | romi   | rgroisman@yoizen.com | 5491158638852 | no        | si         | si                 | si           |
              Y un csv para carga masiva de perfiles que posee el siguiente registro:
                """
                    2,5491158638852,romina groisman,nuevoMAIL@gmail.com,5491111111111,1,0,0,0
                """
            Cuando un supervisor genera una carga masiva de perfiles de whatsapp utilizando el csv provisto
            Entonces al ubicar en ySocial al perfil mediante su id se lo encontrara con los siguientes datos:
                | id            | nombre          | mail                | telefono      | lista vip | lista bloq | lista no contactar | lista tester |
                | 5491158638852 | romina groisman | nuevoMAIL@gmail.com | 5491111111111 | si        | no         | no                 | no           |
           
        @tc:5961    
        Escenario: en accion de sobreescribir perfil se dejan campos en blanco para no sobreescribirlo
            Dado que en el perfil del usuario hay configurados los siguientes datos basicos:
                | id            | nombre | mail                 | telefono      | lista vip | lista bloq | lista no contactar | lista tester |
                | 5491158638852 | romi   | rgroisman@yoizen.com | 5491158638852 | si        | no         | no                 | si           |
            Y un csv para carga masiva de perfiles que posee el siguiente registro:
                """
                    2,5491158638852,romina groisman,,,,,,
                """
            Cuando un supervisor genera una carga masiva de perfiles de whatsapp utilizando el csv provisto
            Entonces al ubicar en ySocial al perfil mediante su id se vera que solo habra cambiado el valor del campo nombre

        @tc:5962
        Escenario: se sobreescriben multiples datos basicos de perfiles preexistentes
            Dado los siguientes perfiles que poseen en sus campos:
                | id                          | nombre         | mail                  | telefono      | lista vip | lista bloq | lista no contactar | lista tester |
                | groismanromina@gmail.com    | romi           | viejomail1@yoizen.com | 5491111111111 | si        | no         | no                 | si           |
                | jcontento@yoizen.com        | juan           | viejomail2@yoizen.com | 5491122222222 | no        | no         | si                 | no           |
                | sacostaottonelli@yoizen.com | usuario prueba | viejomail3@yoizen.com | 5491133333333 | si        | no         | no                 | si           |
            Y un csv para carga masiva de perfiles que posee los siguientes registros:
                """
                    2,groismanromina@gmail.com,romi sobreescribe,nuevomail@gmail.com,5491158638852,0,1,1,1
                    2,jcontento@yoizen.com,juan contento,test@test.com,5491126333583,1,0,1,0
                    2,sacostaottonelli@yoizen.com,usuario gmail,123_nuevo_mail@gmail.com,5491152222222,1,0,0,1
                """
            Cuando un supervisor utiliza el csv para una carga masiva de perfiles
            Entonces al ubicar en ySocial los perfiles mediante su id se encontraran con los siguientes campos basicos:
                | id                          | nombre            | mail                     | tel           | vip | bloq | no contactar | tester |
                | groismanromina@gmail.com    | romi sobreescribe | nuevomail@gmail.com      | 5491158638852 | no  | si   | si           | si     |
                | jcontento@yoizen.com        | juan contento     | test@test.com            | 5491126333583 | si  | no   | si           | no     |
                | sacostaottonelli@yoizen.com | usuario gmail     | 123_nuevo_mail@gmail.com | 5491152222222 | si  | no   | no           | si     |

        @tc:6046
        Escenario: se intenta utilizar la accion sobreescribir con un perfil que no existe
            Dado el usuario con el id de RRSS pepesilvia@gmail.com nunca se contacto con ySocial
            Y un csv para carga masiva de perfiles que posee el siguiente registro:
                """
                    2,pepesilvia@gmail.com,pepe silvia,unmailpersonal@gmail.com,5491122223333,1,0,0,0
                """
            Cuando un supervisor utiliza el csv para una carga masiva de perfiles
            Entonces el registro en cuestion sera ignorado
            Y no se debera ver creado un perfil al buscarlo por el id

    Regla de negocio: se posee una accion que no realiza cambios sobre datos basicos

        @tc:5963
        Escenario: se intenta modificar un perfil preexistente sin modificar datos basicos
            Dado el usuario con el id de RRSS 5491158638852 que posee los siguientes datos en su perfil:
                | id            | nombre | mail                 | telefono      | lista vip | lista bloq | lista no contactar | lista tester | datos de negocio |
                | 5491158638852 | romi   | rgroisman@yoizen.com | 5491158638852 | si        | no         | no                 | si           | saraza#1234            |
            Y un csv para carga masiva de perfiles que posee el siguiente registro:
                """
                    0,5491158638852,1
                """
            Cuando un supervisor utiliza el csv para una carga masiva de perfiles con datos de negocio
            Entonces al ubicar en ySocial al perfil mediante su id se vera que sus campos basicos continuan teniendo los mismos valores

    Regla de negocio: un csv puede contener acciones combinadas

        @tc:5964
        Escenario: se ultiliza las 3 acciones de datos basicos en un mismo csv
            Dado los siguientes perfiles que poseen en sus campos:
                | id                          | nombre | mail                   | telefono      | lista vip | lista bloq | lista no contactar | lista tester | datos de negocio |
                | sacostaottonelli@yoizen.com | santi  | miviejomail@yoizen.com | 5491111111111 | si        | no         | no                 | si           |                  |
                | jcontento@yoizen.com        | juan   | jcontento@yoizen.com   | 5491126333583 | no        | no         | si                 | no           |                  |
            Y un csv para carga masiva de perfiles que posee el siguiente registro:
                """
                    0,sacostaottonelli@yoizen.com,2,aaa#111
                    2,jcontento@yoizen.com,juan contento,test@test.com,5491122222222,1,1,0,0,2,bbb#222
                    1,groismanromina@gmail.com,usuario gmail,rgroisman@yoizen.com,5491133333333,1,0,0,1,2,ccc#333
                """
            Cuando un supervisor utiliza el csv para una carga masiva de perfiles con datos de negocio
            Entonces al ubicar en ySocial los perfiles mediante su id se encontraran con los siguientes campos basicos:
                | id                          | nombre        | mail                   | tel           | vip | bloq | no contactar | tester |
                | sacostaottonelli@yoizen.com | santi         | miviejomail@yoizen.com | 5491111111111 | si  | no   | no           | si     |
                | jcontento@yoizen.com        | juan contento | test@test.com          | 5491122222222 | si  | si   | no           | no     |
                | groismanromina@gmail.com    | usuario gmail | rgroisman@yoizen.com   | 5491133333333 | si  | no   | no           | si     |


        @tc:5965
        Escenario: agregar datos basicos de usuarios nuevos con un dato invalido
            esto se encuentra abordado por otros TC reutilizar work item para otro escenario
            Dado un csv que posee los siguientes registros:
                """
                    rgroisman@yoizen,com,2,romi,rgroisman@yoizen.com,5491158638852,1,0,0,0
                """
            Cuando un supervisor genera una carga masiva utilizando el csv provisto
            Entonces debera aparecer un mensaje de error en la linea 1.
 