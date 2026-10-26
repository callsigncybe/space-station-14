job-no-requirements = Este trabajo no tiene requisitos.
ghost-role-no-requirements = Este rol no tiene requisitos.

# Regla de colores: limegreen para requisito cumplido, yellow para requisito no cumplido que aún se puede cumplir, red para imposible de cumplir

role-timer-department-sufficient = Tienes [color=limegreen]{TOSTRING($current, "0")}[/color] de los [color=lightblue]{TOSTRING($required, "0")}[/color] de tiempo de juego requeridos en el departamento de [color={$departmentColor}]{$department}[/color].
role-timer-department-insufficient = Tienes [color=yellow]{TOSTRING($current, "0")}[/color] de los [color=lightblue]{TOSTRING($required, "0")}[/color] de tiempo de juego requeridos en el departamento de [color={$departmentColor}]{$department}[/color].
role-timer-department-not-too-high = Tienes [color=limegreen]{TOSTRING($current, "0")}[/color] de un máximo de [color=lightblue]{TOSTRING($required, "0")}[/color] de tiempo de juego en el departamento de [color={$departmentColor}]{$department}[/color].
role-timer-department-too-high = Tienes [color=red]{TOSTRING($current, "0")}[/color] de un máximo de [color=lightblue]{TOSTRING($required, "0")}[/color] de tiempo de juego en el departamento de [color={$departmentColor}]{$department}[/color]. (¿Estás intentando jugar un rol de aprendiz?)

role-timer-overall-sufficient = Tienes [color=limegreen]{TOSTRING($current, "0")}[/color] de los [color=lightblue]{TOSTRING($required, "0")}[/color] de tiempo de juego total requeridos.
role-timer-overall-insufficient = Tienes [color=yellow]{TOSTRING($current, "0")}[/color] de los [color=lightblue]{TOSTRING($required, "0")}[/color] de tiempo de juego total requeridos.
role-timer-overall-not-too-high = Tienes [color=limegreen]{TOSTRING($current, "0")}[/color] de un máximo de [color=lightblue]{TOSTRING($required, "0")}[/color] de tiempo de juego total.
role-timer-overall-too-high = Tienes [color=red]{TOSTRING($current, "0")}[/color] de un máximo de [color=lightblue]{TOSTRING($required, "0")}[/color] de tiempo de juego total. (¿Estás intentando jugar un rol de aprendiz?)

role-timer-role-sufficient = Tienes [color=limegreen]{TOSTRING($current, "0")}[/color] de los [color=lightblue]{TOSTRING($required, "0")}[/color] de tiempo de juego requeridos como [color={$departmentColor}]{$job}[/color].
role-timer-role-insufficient = Tienes [color=yellow]{TOSTRING($current, "0")}[/color] de los [color=lightblue]{TOSTRING($required, "0")}[/color] de tiempo de juego requeridos como [color={$departmentColor}]{$job}[/color].
role-timer-role-not-too-high = Tienes [color=limegreen]{TOSTRING($current, "0")}[/color] de un máximo de [color=lightblue]{TOSTRING($required, "0")}[/color] de tiempo de juego como [color={$departmentColor}]{$job}[/color].
role-timer-role-too-high = Tienes [color=red]{TOSTRING($current, "0")}[/color] de un máximo de [color=lightblue]{TOSTRING($required, "0")}[/color] de tiempo de juego como [color={$departmentColor}]{$job}[/color]. (¿Estás intentando jugar un rol de aprendiz?)

role-whitelisted = [color=limegreen]Estás[/color] en la whitelist para jugar este rol.
role-not-whitelisted = [color=yellow]No estás[/color] en la whitelist para jugar este rol.

role-timer-age-old-enough = Tu personaje debe tener al menos [color=limegreen]{$age}[/color] años para jugar este rol.
role-timer-age-not-old-enough = Tu personaje debe tener al menos [color=yellow]{$age}[/color] años para jugar este rol.
role-timer-age-young-enough = Tu personaje debe tener como máximo [color=limegreen]{$age}[/color] años para jugar este rol.
role-timer-age-not-young-enough = Tu personaje debe tener como máximo [color=yellow]{$age}[/color] años para jugar este rol.

role-timer-whitelisted-species-pass = Tu personaje [color=limegreen]debe[/color] ser de una de las siguientes especies para jugar este rol: [color=limegreen]{$species}[/color]
role-timer-whitelisted-species-fail = Tu personaje [color=yellow]debe[/color] ser de una de las siguientes especies para jugar este rol: [color=yellow]{$species}[/color]
role-timer-blacklisted-species-pass = Tu personaje [color=limegreen]no debe[/color] ser de ninguna de las siguientes especies para jugar este rol: [color=limegreen]{$species}[/color]
role-timer-blacklisted-species-fail = Tu personaje [color=yellow]no debe[/color] ser de ninguna de las siguientes especies para jugar este rol: [color=yellow]{$species}[/color]

role-timer-whitelisted-traits-pass = Tu personaje [color=limegreen]debe[/color] tener uno de los siguientes rasgos: [color=limegreen]{$traits}[/color]
role-timer-whitelisted-traits-fail = Tu personaje [color=yellow]debe[/color] tener uno de los siguientes rasgos: [color=yellow]{$traits}[/color]
role-timer-blacklisted-traits-pass = Tu personaje [color=limegreen]no debe[/color] tener ninguno de los siguientes rasgos: [color=limegreen]{$traits}[/color]
role-timer-blacklisted-traits-fail = Tu personaje [color=yellow]no debe[/color] tener ninguno de los siguientes rasgos: [color=yellow]{$traits}[/color]

role-ban = Tienes un [color=red]ban[/color] de este rol.
