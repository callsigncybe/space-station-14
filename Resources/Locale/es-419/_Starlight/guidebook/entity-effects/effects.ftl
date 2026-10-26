entity-effect-guidebook-modify-solution-reagent =
    { $chance ->
        [1] { $deltasign ->
                [1] Agrega
                *[-1] Quita
            }
        *[other]
            { $deltasign ->
                [1] agregar
                *[-1] quitar
            }
    } {NATURALFIXED($amount, 2)}u de {$reagent} { $deltasign ->
        [1] a
        *[-1] de
    } la solución {$solution}
entity-effect-guidebook-regrow-doll-shell =
    { $chance ->
        [1] Regenera
        *[other] regenerar
    } una pieza de caparazón
