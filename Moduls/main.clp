; =============================================================================
; MAIN
; =============================================================================

(defmodule MAIN (export ?ALL))

(defrule comienzo "regla inicial"
        (declare (salience 1))
        =>
        (printout t crlf)
        (printout t crlf)
        (printout t "--------------------------------------------------------" crlf)
        (printout t "------ SISTEMA EXPERTO DE RECOMENDACION DE LIBROS ------" crlf)
        (printout t "--------------------------------------------------------" crlf)
        (printout t crlf)
        (printout t "Bievenido a nuestro sistema!" crlf)
        (printout t "Le recomendaremos los libros mas adecuados para usted." crlf)
        (printout t "A continuacion, se le plantearan una serie de preguntas para conocerle mejor." crlf)
        (printout t crlf)
        (printout t crlf)        
)

(defrule focus-datos-lector
    (not (Lector))
    =>
    (assert (Lector))
    (focus datos-lector)
)

(defrule focus-habitos-lector
    (Lector)
    (not (Habitos))
    =>
    (assert (Habitos))
    (focus habitos-lector)
)

(defrule focus-preferencias-lector
    (Lector)
    (Habitos)
    (not (Preferencias))
    =>
    (assert(Preferencias))   
    (focus preferencias-literarias)
)