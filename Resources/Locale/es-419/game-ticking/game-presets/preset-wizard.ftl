## Superviviente

roles-antag-survivor-name = Superviviente
# Es una referencia a Halo
roles-antag-survivor-objective = Objetivo actual: sobrevivir

survivor-role-greeting =
    Eres un Superviviente. Por encima de todo, tienes que volver con vida a Central Command.
    Reúne toda la potencia de fuego que necesites para garantizar tu supervivencia.
    No confíes en nadie.

survivor-round-end-dead-count =
{
    $deadCount ->
        [one] [color=red]{$deadCount}[/color] superviviente murió.
        *[other] [color=red]{$deadCount}[/color] supervivientes murieron.
}

survivor-round-end-alive-count =
{
    $aliveCount ->
        [one] [color=yellow]{$aliveCount}[/color] superviviente quedó abandonado en la estación.
        *[other] [color=yellow]{$aliveCount}[/color] supervivientes quedaron abandonados en la estación.
}

survivor-round-end-alive-on-shuttle-count =
{
    $aliveCount ->
        [one] [color=green]{$aliveCount}[/color] superviviente logró salir con vida.
        *[other] [color=green]{$aliveCount}[/color] supervivientes lograron salir con vida.
}

## Mago

objective-issuer-swf = [color=turquoise]La Federación de Magos del Espacio[/color]

wizard-title = Mago
wizard-description = ¡Hay un Mago en la estación! Nunca se sabe lo que podría hacer.

roles-antag-wizard-name = Mago
roles-antag-wizard-objective = Dales una lección que nunca olvidarán.

wizard-role-greeting =
    ¡Es hora de magia, bola de fuego!
    Hubo tensiones entre la Federación de Magos del Espacio y NanoTrasen. La Federación de Magos del Espacio te eligió para visitar la estación y "recordarles" por qué con los hechiceros no se juega.
    ¡Causa caos y destrucción! Lo que hagas depende de ti, pero recuerda que los Magos del Espacio quieren que salgas con vida.

wizard-round-end-name = mago

## TODO: Aprendiz de mago (llegará en algún momento después del lanzamiento del mago)
