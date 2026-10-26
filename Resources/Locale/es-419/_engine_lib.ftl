# Versión en español de las funciones gramaticales del motor
# (RobustToolbox/Resources/Locale/en-US/_engine_lib.ftl).
# En español el artículo depende del género del sustantivo, no de la entidad,
# así que THE() devuelve el nombre sin artículo.

# Used internally by the THE() function.
zzzz-the = { $ent }

# Used internally by the SUBJECT() function.
zzzz-subject-pronoun = { GENDER($ent) ->
    [male] él
    [female] ella
    [epicene] elle
   *[neuter] eso
   }

# Used internally by the OBJECT() function.
zzzz-object-pronoun = { GENDER($ent) ->
    [male] lo
    [female] la
    [epicene] le
   *[neuter] lo
   }

# Used internally by the DAT-OBJ() function.
zzzz-dat-object = { GENDER($ent) ->
    [male] él
    [female] ella
    [epicene] elle
   *[neuter] eso
   }

# Used internally by the GENITIVE() function.
zzzz-genitive = { GENDER($ent) ->
    [male] de él
    [female] de ella
    [epicene] de elle
   *[neuter] de eso
   }

# Used internally by the POSS-PRONOUN() function.
zzzz-possessive-pronoun = { GENDER($ent) ->
    [female] suya
   *[other] suyo
   }

# Used internally by the POSS-ADJ() function.
zzzz-possessive-adjective = su

# Used internally by the REFLEXIVE() function.
zzzz-reflexive-pronoun = { GENDER($ent) ->
    [female] sí misma
    [epicene] sí misme
   *[other] sí mismo
   }

# Used internally by the CONJUGATE-BE() function.
zzzz-conjugate-be = es

# Used internally by the CONJUGATE-HAVE() function.
zzzz-conjugate-have = tiene

# Used internally by the CONJUGATE-BASIC() function.
zzzz-conjugate-basic = { $second }
