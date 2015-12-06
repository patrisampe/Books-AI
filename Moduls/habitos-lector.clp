; =============================================================================
; MODULO DE PREGUNTAS: HABITOS DEL LECTOR
; =============================================================================

(defmodule habitos-lector
        (import MAIN ?ALL)
        (export ?ALL)
)

(defrule establecer-lugar
        ?habitos <- (Habitos)
        ?flow <- (establecer-lugar)
        =>
        (bind ?lugar (pregunta-general 
                "¿En que lugar acostumbra a leer?
                cama(1) transporte publico(2) casa(3) biblioteca(4)"))
        (switch ?lugar
                (case 1 then (bind ?lugar cama))
                (case 2 then (bind ?lugar transporte_publico))
                (case 3 then (bind ?lugar casa))
                (case 4 then (bind ?lugar biblioteca))
        )
        (modify ?habitos (lugar ?lugar))
        (retract ?flow)
        (assert (establecer-frecuencia))
)

(defrule establecer-frecuencia
        ?habitos <- (Habitos)
        ?flow <- (establecer-frecuencia)
        =>
        (bind ?frecuencia (pregunta-general 
                "¿Con que frecuencia lee? 
                diario(1) fin de semana(2) ocasionalmente(3) cuando se puede(4)"))
        (switch ?frecuencia
                (case 1 then (modify ?habitos (frecuencia diario)))
                (case 2 then (modify ?habitos (frecuencia finde)))
                (case 3 then (modify ?habitos (frecuencia ocasionalmente)))
                (case 4 then (modify ?habitos (frecuencia cuando_se_puede)))
        )
        (retract ?flow)
        (assert (establecer-momento))
)

(defrule establecer-momento
        ?habitos <- (Habitos)
        ?flow <- (establecer-momento)
        =>
        (bind ?momento (pregunta-general 
                "¿En que momento acostumbra a leer?
                manana(1) mediodia(2) tarde(3) noche(4)"))
        (switch ?momento
                (case 1 then (modify ?habitos (momento manana)))
                (case 2 then (modify ?habitos (momento mediodia)))
                (case 3 then (modify ?habitos (momento tarde)))
                (case 4 then (modify ?habitos (momento noche)))
        )
        (retract ?flow)
        (assert (establecer-tiempo))
)

(defrule establecer-tiempo
        ?habitos <- (Habitos)
        ?flow <- (establecer-tiempo)
        =>
        (bind ?tiempo (pregunta-numerica "¿Cuantos minutos seguidos lee al dia? " 0 1440))
        (modify ?habitos (tiempo ?tiempo))
        (retract ?flow)
        (assert (fin-modulo))
)

(defrule fin-modulo "Pasa a otro modulo"
        (Habitos (lugar ?lugar) (frecuencia ?frecuencia) (momento ?momento) (tiempo ?tiempo))
        ?flow <- (fin-modulo)
        =>
        (printout t "Resumen Habitos" crlf)
        (printout t " lugar: " ?lugar crlf)
        (printout t " frecuencia: " ?frecuencia crlf)
        (printout t " momento: " ?momento crlf)
        (printout t " tiempo: " ?tiempo crlf)
        (retract ?flow)
        (focus MAIN)
)
