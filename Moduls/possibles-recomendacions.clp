


(defmodule possibles-recomendaciones
    (import MAIN ?ALL)
    (export ?ALL)
)

(defrule establecer-libros "recopilacion de los LIBROS possibles del lector"
    ?libros <- (LibrosT)
    ?flow <- (establecer-libros) 
    =>

    (printout t "HOOOOOOOOOOOOOOOOOLAAAAAAAAAAAAAAA" crlf crlf)
    (bind ?vectorLibros (todas-instancia Libro))
    ;(assert (LibrosT (libros-possibles ?vectorLibros)))                                     
    (modify ?libros (libros-possibles ?vectorLibros))
    (printout t "HOOOOOOOOOOOOOOOOOLAAAAAAAAAAAAAAA" crlf crlf)
    (printout t "Resumen Libros" crlf crlf)
    (print-multislot "Libros possibles:" ?vectorLibros get-titulo)
    ;(printout t "Resumen possibles" crlf crlf)
    ;(print-multislot "Generos possibles:" ?generos-possibles4 get-nombreGenero)
    (retract ?flow)
    (assert (filtrar))
)

(defrule filtrar "recopilacion de los LIBROS possibles del lector"
    
    (Possibles 
                (autores-possibles $?autores-possibles) 
                (generos-possibles $?generos-possibles) 
                (temas-possibles $?temas-possibles))
    (LibrosT
                (libros-possibles $?libros-possibles))
    ?flow <- (filtrar) 
    =>

    (printout t "HOOOOOOOOOOOOOOOOOLAAAAAAAAAAAAAAA" crlf crlf)
    ;(bind ?vectorLibros (todas-instancia Libro))
    ;(assert (LibrosT (libros-possibles ?vectorLibros)))                                     
    ;(modify ?libros (libros-possibles ?vectorLibros))
    ;(printout t "HOOOOOOOOOOOOOOOOOLAAAAAAAAAAAAAAA" crlf crlf)
    (printout t "Resumen Libros" crlf crlf)
    ;(print-multislot "Libros possibles:" ?vectorLibros get-titulo)
    ;(printout t "Resumen possibles" crlf crlf)
    ;(print-multislot "Generos possibles:" ?generos-possibles4 get-nombreGenero)
    (retract ?flow)
    (assert (f))
)

(defrule f "Fin del modulo"
        (Possibles 
                (autores-possibles $?autores-possibles) 
                (generos-possibles $?generos-possibles) 
                (temas-possibles $?temas-possibles))
        ?flow <- (f)
        =>
       ; (printout t "Resumen Possibles" crlf crlf)
        ;(print-multislot "Autores possibles:" ?autores-possibles get-nombre)
        ;(print-multislot "Generos possibles:" ?generos-possibles get-nombreGenero)
        ;(print-multislot "Temas possibles:" ?temas-possibles get-nombreTema)
        (retract ?flow)
        (focus MAIN)
)
