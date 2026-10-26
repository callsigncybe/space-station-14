# Examine text after when they're holding something (in-hand)
comp-hands-examine = { CAPITALIZE(SUBJECT($user)) } tiene en las manos: { $items }.
comp-hands-examine-empty = { CAPITALIZE(SUBJECT($user)) } no tiene nada en las manos.
comp-hands-examine-wrapper = [color=paleturquoise]{$item}[/color]

hands-system-blocked-by = Bloqueado por
