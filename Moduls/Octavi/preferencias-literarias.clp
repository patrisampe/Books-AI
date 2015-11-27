; Modulo de recopilacion de las prefencias literarias del lector
(defmodule preferencias-literarias
        (import MAIN ?ALL)
        (export ?ALL)
)

(defrule establecer-generos-preferidos
    =>
    (bind $?allGeneros (find-all-instances((?inst Genero)) TRUE))
    (loop-for-count (?i 1 (length$ ?allGeneros)) do
        (bind ?genero (nth$ ?i ?allGeneros)) 
        (printout t (send ?genero get-nombreGenero) crlf)
    )
)