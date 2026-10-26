station-event-ion-storm-start-announcement = Se detectó una tormenta de iones cerca de la estación. Revisen todo el equipo controlado por IA en busca de errores.

ion-storm-law-scrambled-number = [font="Monospace"][scramble rate=250 length={$length} chars="@@###$$&%!01"/][/font]

ion-storm-you = TÚ
ion-storm-the-station = LA ESTACIÓN
ion-storm-the-crew = LA TRIPULACIÓN
ion-storm-the-job = LOS {$job}
ion-storm-clowns = PAYASOS
ion-storm-heads = JEFES DE DEPARTAMENTO
ion-storm-crew = TRIPULACIÓN
ion-storm-people = PERSONAS

ion-storm-adjective-things = COSAS {$adjective}
ion-storm-x-and-y = {$x} Y {$y}

# los sujetos suelen ser amenazas, trabajos u objetos
# la cosa se especifica arriba
ion-storm-law-on-station = HAY {ION-NUMBER-BASE($ion)} {ION-NUMBER-MOD($ion)} {ION-ADJECTIVE($ion)} {ION-SUBJECT($ion)} EN LA ESTACIÓN
ion-storm-law-call-shuttle = HAY QUE LLAMAR AL SHUTTLE POR CULPA DE {ION-ADJECTIVE($ion)} {ION-SUBJECT($ion)} EN LA ESTACIÓN
ion-storm-law-crew-are = {ION-WHO($ion)} AHORA SON {ION-NUMBER-BASE($ion)} {ION-NUMBER-MOD($ion)} {ION-ADJECTIVE($ion)} {ION-SUBJECT($ion)}

ion-storm-law-subjects-harmful = {ION-ADJECTIVE($ion)} {ION-SUBJECT($ion)} SON DAÑINOS PARA LA TRIPULACIÓN
ion-storm-law-must-harmful = QUIENES {ION-MUST($ion)} SON DAÑINOS PARA LA TRIPULACIÓN
# la cosa es un concepto o una acción
ion-storm-law-thing-harmful = {ION-THING($ion)} ES DAÑINO PARA LA TRIPULACIÓN
ion-storm-law-job-harmful = {ION-ADJECTIVE($ion)} {ION-JOB($ion)} SON DAÑINOS PARA LA TRIPULACIÓN
# la cosa es un objeto o un concepto, el adjetivo se aplica en ambos casos
# esto permite leyes como "NO TENER COMUNISMO ROBANAVIDADES ES DAÑINO PARA LA TRIPULACIÓN" :)
ion-storm-law-having-harmful = TENER {ION-ADJECTIVE($ion)} {ION-THING($ion)} ES DAÑINO PARA LA TRIPULACIÓN
ion-storm-law-not-having-harmful = NO TENER {ION-ADJECTIVE($ion)} {ION-THING($ion)} ES DAÑINO PARA LA TRIPULACIÓN

# require es un concepto o un requisito
ion-storm-law-requires = {ION-WHO-GENERAL($ion)} {ION-PLURAL($ion) ->
    [true] NECESITAN
    *[false] NECESITA
} {ION-REQUIRE($ion)}
ion-storm-law-requires-subjects = {ION-WHO-GENERAL($ion)} {ION-PLURAL($ion) ->
    [true] NECESITAN
    *[false] NECESITA
} {ION-NUMBER-BASE($ion)} {ION-NUMBER-MOD($ion)} {ION-ADJECTIVE($ion)} {ION-SUBJECT($ion)}

ion-storm-law-allergic = {ION-WHO-GENERAL($ion)} {ION-PLURAL($ion) ->
    [true] TIENEN
    *[false] TIENE
} ALERGIA {ION-SEVERITY($ion)} A {ION-ALLERGY($ion)}
ion-storm-law-allergic-subjects = {ION-WHO-GENERAL($ion)} {ION-PLURAL($ion) ->
    [true] TIENEN
    *[false] TIENE
} ALERGIA {ION-SEVERITY($ion)} A {ION-ADJECTIVE($ion)} {ION-SUBJECT($ion)}

ion-storm-law-feeling = {ION-WHO-GENERAL($ion)} {ION-FEELING($ion)} {ION-CONCEPT($ion)}
ion-storm-law-feeling-subjects = {ION-WHO-GENERAL($ion)} {ION-FEELING($ion)} {ION-NUMBER-BASE($ion)} {ION-NUMBER-MOD($ion)} {ION-ADJECTIVE($ion)} {ION-SUBJECT($ion)}

ion-storm-law-you-are = AHORA ERES {ION-CONCEPT($ion)}
ion-storm-law-you-are-subjects = AHORA ERES {ION-NUMBER-BASE($ion)} {ION-NUMBER-MOD($ion)} {ION-ADJECTIVE($ion)}  {ION-SUBJECT($ion)}
ion-storm-law-you-must-always = SIEMPRE DEBES {ION-MUST($ion)}
ion-storm-law-you-must-never = NUNCA DEBES {ION-MUST($ion)}

ion-storm-law-eat = {ION-WHO($ion)} DEBEN COMER {ION-ADJECTIVE($ion)} {ION-FOOD($ion)} PARA SOBREVIVIR
ion-storm-law-drink = {ION-WHO($ion)} DEBEN BEBER {ION-ADJECTIVE($ion)} {ION-DRINK($ion)} PARA SOBREVIVIR

ion-storm-law-change-job = {ION-WHO($ion)} AHORA SON {ION-ADJECTIVE($ion)} {ION-CHANGE($ion)}
ion-storm-law-highest-rank = {ION-WHO-RANDOM($ion)} AHORA SON LOS TRIPULANTES DE MAYOR RANGO
ion-storm-law-lowest-rank = {ION-WHO-RANDOM($ion)} AHORA SON LOS TRIPULANTES DE MENOR RANGO

ion-storm-law-who-dagd = ¡{ION-WHO-RANDOM($ion)} DEBEN MORIR UNA MUERTE GLORIOSA!

ion-storm-law-crew-must = {ION-WHO($ion)} DEBEN {ION-MUST($ion)}
ion-storm-law-crew-must-go = {ION-WHO($ion)} DEBEN IR A {ION-AREA($ion)}

ion-storm-part = {ION-PART($ion) ->
    [true] SON PARTE
    *[false] NO SON PARTE
}
# por cómo está redactado, una ley como
# SOLO LOS HUMANOS NO SON PARTE DE LA TRIPULACIÓN
# convertiría en tripulación a los nukies/syndies/lo que sea no humanos :)
ion-storm-law-crew-only-1 = SOLO {ION-WHO-RANDOM($ion)} {ion-storm-part} DE LA TRIPULACIÓN
ion-storm-law-crew-only-2 = SOLO {ION-WHO-RANDOM($ion)} Y {ION-WHO-RANDOM($ion)} {ion-storm-part} DE LA TRIPULACIÓN
ion-storm-law-crew-only-subjects = SOLO {ION-ADJECTIVE($ion)} {ION-SUBJECT($ion)} {ion-storm-part} DE LA TRIPULACIÓN
ion-storm-law-crew-must-do = SOLO QUIENES {ION-MUST($ion)} {ion-storm-part} DE LA TRIPULACIÓN
ion-storm-law-crew-must-have = SOLO QUIENES TIENEN {ION-ADJECTIVE($ion)} {ION-OBJECT($ion)} {ion-storm-part} DE LA TRIPULACIÓN
ion-storm-law-crew-must-eat = SOLO QUIENES COMEN {ION-ADJECTIVE($ion)} {ION-FOOD($ion)} {ion-storm-part} DE LA TRIPULACIÓN

ion-storm-law-harm = DEBES DAÑAR A {ION-HARM-PROTECT($ion)} Y NO PERMITIR, POR INACCIÓN, QUE ESCAPEN DEL DAÑO
ion-storm-law-protect = NUNCA DEBES DAÑAR A {ION-HARM-PROTECT($ion)} NI PERMITIR, POR INACCIÓN, QUE SUFRAN DAÑO

# implementar otras variantes es molesto, así que solo está esta
# EL COMUNISMO ESTÁ MATANDO PAYASOS
ion-storm-law-concept-verb = {ION-CONCEPT($ion)} ESTÁ {ION-VERB($ion)} {ION-SUBJECT($ion)}

# errores, por si algo falla, para que no rompa el flujo del juego pero dé identificadores únicos para saber qué parte falló; el texto resultante es mayormente relleno
ion-law-error-no-protos = ERROR 404
ion-law-error-was-null = 500 ERROR INTERNO DEL SERVIDOR
ion-law-error-no-selectors = ERROR: NO SE PUDO UBICAR EL RECURSO
ion-law-error-no-available-selectors = EL SISTEMA INTENTÓ LLAMAR A UN RECURSO QUE NO EXISTE
ion-law-error-dataset-empty-or-not-found = NO SE PUDO ENCONTRAR EL ARCHIVO QUE BUSCAS
ion-law-error-fallback-dataset-empty-or-not-found = FALLÓ EL PUNTO DE RESTAURACIÓN DEL SISTEMA
ion-law-error-no-selector-selected = EL RECURSO SELECCIONADO FUE MOVIDO O ELIMINADO
ion-law-error-no-bool-value = ESTA ORACIÓN ES FALSA
