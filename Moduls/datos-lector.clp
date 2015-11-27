; =============================================================================
; MODULO DE PREGUNTAS
; =============================================================================

; Modulo de recopilacion de los datos del lector
(defmodule datos-lector
        (import MAIN ?ALL)
        (export ?ALL)
)

(defrule establecer-nombre "Establece el nombre de usuario, es la primera pregunta"
        =>
        (bind ?nombre (pregunta-general "¿Como se llama?"))
        (assert (Lector (nombre ?nombre)))
        (assert (establecer-edad))
)

(defrule establecer-edad "Establece la edad del usuario"
        ?lector <- (Lector)
        ?flow <- (establecer-edad)
        =>
        (bind ?edad (pregunta-numerica "¿Que edad tiene? " 0 120))
        (modify ?lector (edad ?edad))
        (retract ?flow)
        (assert (establecer-sexo))
)

(defrule establecer-sexo "Establece el sexo del usuario"
        ?lector <- (Lector)
        ?flow <- (establecer-sexo)
        =>
        (bind ?sexo (pregunta-general "¿Es hombre(1) o mujer(2)?"))
        (switch ?sexo
                (case 1 then (modify ?lector (sexo hombre)))
                (case 2 then (modify ?lector (sexo mujer)))
        )
        (retract ?flow)
        (assert (establecer-estudios))
)

(defrule establecer-estudios "Establece los estudios del usuario"
        ?lector <- (Lector)
        ?flow <- (establecer-estudios)
        =>
        (bind ?estudios (pregunta-general 
          "¿Cual es tu ultimo titulo academico? 
          No graduado escolar(1) CFGS(2) Bachillerato(3) Universidad(4)"))
        (switch ?estudios
                (case 1 then (modify ?lector (estudios No_graduado_escolar)))
                (case 2 then (modify ?lector (estudios CFGS)))
                (case 3 then (modify ?lector (estudios Bachillerato)))
                (case 4 then (modify ?lector (estudios Universidad)))
        )
        (retract ?flow)
        (assert (pasar-a-habitos-lector))
)       

(defrule pasar-a-habitos-lector "Pasa a la recopilacion de preferencias"
        (Lector (nombre ?nombre) (edad ?edad) (sexo ?sexo) (estudios ?estudios))
        ?flow <- (pasar-a-habitos-lector)
        =>
        (printout t "Resumen Lector" crlf)
        (printout t " nombre: " ?nombre crlf)
        (printout t " edad: " ?edad crlf)
        (printout t " sexo: " ?sexo crlf)
        (printout t " estudios: " ?estudios crlf)
        (retract ?flow)
        (focus MAIN)
)