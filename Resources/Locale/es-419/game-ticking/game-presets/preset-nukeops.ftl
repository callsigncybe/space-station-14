nukeops-title = Nuclear Operatives
nukeops-description = Los Nuclear Operatives tienen la estación en la mira. ¡Intenta evitar que armen y detonen la bomba nuclear protegiendo el disco nuclear!

nukeops-welcome =
    Eres un Nuclear Operative. Tu objetivo es volar {$station} y asegurarte de que no quede más que una pila de escombros. Tus jefes, el Syndicate, te dieron las herramientas que necesitarás para la tarea.
    ¡La Operación {$name} está en marcha! ¡Muerte a NanoTrasen!
nukeops-briefing = Tus objetivos son simples. Entrega la carga y sal antes de que detone. Comienza la misión.

nukeops-opsmajor = [color=crimson]¡Victoria mayor del Syndicate![/color]
nukeops-opsminor = [color=crimson]¡Victoria menor del Syndicate![/color]
nukeops-neutral = [color=yellow]¡Resultado neutral![/color]
nukeops-crewminor = [color=green]¡Victoria menor de la tripulación![/color]
nukeops-crewmajor = [color=green]¡Victoria mayor de la tripulación![/color]

nukeops-cond-nukeexplodedoncorrectstation = Los Nuclear Operatives lograron volar la estación.
# Starlight-edit
nukeops-cond-nukeexplodedonnukieoutpost = La tripulación le devolvió la bomba al Syndicate.
nukeops-cond-nukeexplodedonincorrectlocation = La bomba nuclear se detonó fuera de la estación.
nukeops-cond-nukeactiveinstation = La bomba nuclear quedó armada en la estación.
nukeops-cond-nukeactiveatcentcom = ¡La bomba nuclear fue armada y entregada al Comando Central!
nukeops-cond-nukediskoncentcom = La tripulación escapó con el disco de autenticación nuclear.
nukeops-cond-nukedisknotoncentcom = La tripulación dejó atrás el disco de autenticación nuclear.
nukeops-cond-nukiesabandoned = Los Nuclear Operatives fueron abandonados.
nukeops-cond-allnukiesdead = Todos los Nuclear Operatives murieron.
nukeops-cond-somenukiesalive = Algunos Nuclear Operatives murieron.
nukeops-cond-allnukiesalive = Ningún Nuclear Operative murió.

nukeops-disk-location-title = Ubicación final del disco:
nukeops-disk-carried-by = {" "}en manos de [color=White]{$name}[/color], [color=orange]{$job}[/color], {$location} { $user ->
    [unknown] { "" }
    *[other] ([color=gray]{$user}[/color])
}

storage-hierarchy-list = { $items-left ->
  [0] { $existing-text } { $item },
  *[other] { $existing-text } { $item }, dentro de
}

nukeops-list-start = Los Nuclear Operatives eran:
nukeops-list-name = - [color=White]{$name}[/color]
nukeops-list-name-user = - [color=White]{$name}[/color] ([color=gray]{$user}[/color])
nukeops-not-enough-ready-players = ¡No hay suficientes jugadores listos para la partida! Había {$readyPlayersCount} jugadores listos de {$minimumPlayers} necesarios. No se puede iniciar Nukeops.
nukeops-no-one-ready = ¡Ningún jugador está listo! No se puede iniciar Nukeops.

nukeops-role-commander = Comandante
nukeops-role-agent = Médico de combate
nukeops-role-operator = Operador
