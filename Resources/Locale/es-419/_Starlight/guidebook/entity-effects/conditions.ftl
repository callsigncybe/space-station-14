entity-condition-guidebook-unknown-reagent = un reactivo desconocido

entity-condition-guidebook-blood-reagent-threshold =
    { $max ->
        [2147483648] el torrente sanguíneo tiene al menos {NATURALFIXED($min, 2)}u de {$reagent}
        *[other] { $min ->
                    [0] el torrente sanguíneo tiene como máximo {NATURALFIXED($max, 2)}u de {$reagent}
                    *[other] el torrente sanguíneo tiene entre {NATURALFIXED($min, 2)}u y {NATURALFIXED($max, 2)}u de {$reagent}
                 }
    }

entity-condition-guidebook-has-components =
    el objetivo { $shouldhave ->
                    [true] tiene
                    *[false] no tiene
               } el componente {$name}
