## Líder revolucionario

roles-antag-rev-head-name = Agente del SKB de la USSP
roles-antag-rev-head-objective = Tu objetivo es tomar el control de la estación sumando gente a tu causa, abriendo grietas de suministros y matando, convirtiendo o encarcelando a todo el personal del mando de la estación.

head-rev-role-greeting =
    ¡Camarada {$name}! ¡Eres un agente reclutador que promueve los intereses de la USSP!
    Tu tarea es tomar el control de la estación eliminando a todo el mando mediante conversión, muerte o encarcelamiento.
    El SKB te proporcionó un flash que pone a los contratistas de tu lado.
    Cuidado: no funciona con quienes tienen el cerebro lavado con un 'mindshield' ni con quienes usan protección contra flashes, como lentes de sol, máscaras o gafas de soldar.
    Con suficiente tripulación, puedes intentar crear una grieta de suministros que ayudará a tu gloriosa revolución. ¡Pero cuidado, alertará a la estación de tu influencia!
    ¡Gloria a la USSP!

head-rev-briefing =
    Usa flashes para sumar gente a tu causa.
    Deshazte de todos los jefes o conviértelos para tomar el control de la estación.
    Muchos flashes usados son la mayor señal de una revolución para Seguridad, ¡así que ten cuidado!

head-rev-break-mindshield = ¡El MindShield™ fue destruido!

## Revolucionario

roles-antag-rev-name = Revolucionario de la USSP
roles-antag-rev-objective = Tu objetivo es garantizar la seguridad de los agentes del SKB, seguir sus órdenes y deshacerte de todo el personal del mando de la estación o convertirlo.

rev-break-control = ¡{$name} recordó su verdadera lealtad!

rev-role-greeting =
    ¡Camarada {$name}! ¡Eres un revolucionario de la USSP!
    ¡Tu tarea es tomar el control de la estación y promover los intereses del agente soviético que te reclutó!
    ¡Ejecuta, encarcela o convierte a la escoria corporativa del mando con el cerebro lavado!
    ¡Se acabaron los días de opresión y del trato injusto a los contratistas!
    ¡Gloria a la USSP!

rev-briefing = Ayuda a tu agente soviético a deshacerse de cada miembro del mando para tomar el control de la estación.

## General

rev-title = Marea Roja
rev-description = El aire está cargado de trato injusto.

rev-not-enough-ready-players = No hay suficientes jugadores listos para la partida. Había {$readyPlayersCount} jugadores listos de los {$minimumPlayers} necesarios. ¡No se puede iniciar una gloriosa revolución!
rev-no-one-ready = ¡Ningún jugador está listo! ¡No se puede iniciar una gloriosa revolución!
rev-no-heads = No había agentes revolucionarios para seleccionar. ¡No se puede iniciar una gloriosa revolución!

rev-won = [color=red]¡Los agentes del SKB sobrevivieron y tomaron el control de la estación![/color]

rev-lost = El mando sobrevivió y mató a todos los agentes del SKB.

rev-stalemate = Murieron todos los agentes del SKB y todo el mando. Es un empate.

rev-reverse-stalemate = Sobrevivieron tanto el mando como los agentes del SKB.

# Starlight - added "or have abandoned the station" as a clarification for why revs may have won
central-command-revolution-announcement = Según los escaneos de nuestros sensores de largo alcance, creemos que la estación cayó bajo el control de fuerzas revolucionarias hostiles. Se confirmó que todos los jefes de departamento murieron, desaparecieron o abandonaron la estación. Toda la tripulación restante debe esperar más instrucciones.

soviet-commissariat-revolution-announcement = Conjunto de comunicaciones de largo alcance en línea. La Madre Patria los saluda, camaradas, pero la batalla todavía no terminó. Su corporación va a evaluar si puede recuperar su estación una última vez, ¡pero no se preocupen! La SSF llegará en breve. ¡Gloria a la USSP!

centcomm-revs-gammarift = Según los escaneos de los sensores de largo alcance, detectamos actividad revolucionaria hostil a bordo. La ley marcial entra en vigor. Gloria a NanoTrasen.

centcomm-revs-alldead = Los escaneos de los sensores de largo alcance informan que todos los agentes del SKB de la USSP a bordo están muertos de forma permanente.

central-command-sender = Comando Central

soviet-commissariat-sender = Comisariado del Pueblo Soviético

rev-headrev-count = {$initialCount ->
    [one] Había un agente de la [color=Yellow]USSP[/color]:
    *[other] Había {$initialCount} agentes de la USSP:
}

rev-headrev-name-user = [color=#5e9cff]{$name}[/color] ([color=gray]{$username}[/color]) reclutó a {$count} {$count ->
    [one] contratista
    *[other] contratistas
}

rev-headrev-name = [color=#5e9cff]{$name}[/color] reclutó a {$count} {$count ->
    [one] contratista
    *[other] contratistas
}

## Ventana de desconversión

rev-deconverted-title = ¡Reconvertido!
rev-deconverted-text =
    Como murió el último agente soviético, la gloriosa revolución terminó.

    Ya no eres un revolucionario. Vuelves a ser un contratista de NanoTrasen.

    Cualquier otra fechoría queda registrada y es sancionable. Así que pórtate bien.

rev-deconverted-rule = Recordatorio: según la Regla 3 del servidor, [bold][color=#a4885c]los revolucionarios desconvertidos olvidan lo que pasó mientras tenían el cerebro lavado.[/color][/bold]

rev-deconverted-ruletext = Tu personaje puede enterarse de lo que pasó investigando y mediante el roleplay, pero no debería poder recordar haber sido revolucionario ni las acciones que cometió en nombre de la revolución.

rev-deconverted-confirm = Entendido
