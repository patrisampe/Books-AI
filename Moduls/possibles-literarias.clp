
(defmodule possibles-literarias
    (import MAIN ?ALL)
    (export ?ALL)
)

(defrule establecer-generos-possibles "recopilacion de los generos possibles del lector"
    (Prohibiciones 
                (generos-prohibidos $?generos-prohibidos))
    (Preferencias
                (generos-preferidos $?generos-preferidos)
                (generos-deseados $?generos-deseados)) 
    (Possibles 
                (generos-possibles $?generos-possibles))
    ?possibles <- (Possibles)
    ?flow <- (establecer-generos-possibles) 
    =>
    (bind ?generos-possibles2 (une-multislot ?generos-preferidos ?generos-possibles))
    (bind ?generos-possibles3 (une-multislot ?generos-deseados ?generos-possibles2))
    (bind ?generos-possibles4 (elimina-multislot ?generos-prohibidos ?generos-possibles3))
    (modify ?possibles (generos-possibles ?generos-possibles4))
    ;(printout t "Resumen possibles" crlf crlf)
    ;(print-multislot "Generos possibles:" ?generos-possibles4 get-nombreGenero)
    (retract ?flow)
    (assert (establecer-autores-possibles))
)

(defrule establecer-autores-possibles "recopilacion de los autores possibles del lector"
    (Prohibiciones 
                (autores-prohibidos $?autores-prohibidos))
    (Preferencias
                (autores-preferidos $?autores-preferidos)
                (autores-deseados $?autores-deseados)) 
    (Possibles 
                (autores-possibles $?autores-possibles))
    ?possibles <- (Possibles)
    ?flow <- (establecer-autores-possibles) 
    =>
    (bind ?autores-possibles2 (une-multislot ?autores-preferidos ?autores-possibles))
    (bind ?autores-possibles3 (une-multislot ?autores-deseados ?autores-possibles2))
    (bind ?autores-possibles4 (elimina-multislot ?autores-prohibidos ?autores-possibles3))
    (modify ?possibles (autores-possibles ?autores-possibles4))
    ;(printout t "Resumen possibles" crlf crlf)
    ;(print-multislot "autores possibles:" ?autores-possibles4 get-nombre)
    (retract ?flow)
    (assert (establecer-temas-possibles))
)

(defrule establecer-temas-possibles "recopilacion de los temas possibles del lector"
    (Prohibiciones 
                (temas-prohibidos $?temas-prohibidos))
    (Preferencias
                (temas-preferidos $?temas-preferidos)
                (temas-deseados $?temas-deseados)) 
    (Possibles 
                (temas-possibles $?temas-possibles))
    ?possibles <- (Possibles)
    ?flow <- (establecer-temas-possibles) 
    =>
    (bind ?temas-possibles2 (une-multislot ?temas-preferidos ?temas-possibles))
    (bind ?temas-possibles3 (une-multislot ?temas-deseados ?temas-possibles2))
    (bind ?temas-possibles4 (elimina-multislot ?temas-prohibidos ?temas-possibles3))
    (modify ?possibles (temas-possibles ?temas-possibles4))
    ;(printout t "Resumen possibles" crlf crlf)
    ;(print-multislot "temas possibles:" ?temas-possibles4 get-nombreTema)
    (retract ?flow)
    (assert (fin-possibles))
)

(defrule fin-possibles "Fin del modulo"
        (Possibles 
                (autores-possibles $?autores-possibles) 
                (generos-possibles $?generos-possibles) 
                (temas-possibles $?temas-possibles))
        ?flow <- (fin-possibles)
        =>
        (printout t "Resumen Possibles" crlf crlf)
        (print-multislot "Autores possibles:" ?autores-possibles get-nombre)
        (print-multislot "Generos possibles:" ?generos-possibles get-nombreGenero)
        (print-multislot "Temas possibles:" ?temas-possibles get-nombreTema)
        (retract ?flow)
        (focus MAIN)
)