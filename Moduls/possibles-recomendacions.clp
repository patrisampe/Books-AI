
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
    ?libros <- (LibrosT)
    ?flow <- (filtrar) 
    =>

    (printout t "HOOOOOOOOOOOOOOOOOLAAAAAAAAAAAAAAA" crlf crlf)
    (bind ?libros-possibles (maybe-multislot-multi ?generos-possibles ?libros-possibles get-pertenece))
    (modify ?libros (libros-possibles  ?libros-possibles))
    (printout t " ponemos solo los libros de generos-possibles" crlf crlf)
    (print-multislot "libros possibles:" ?libros-possibles get-titulo)

    (bind ?libros-possibles (maybe-multislot-single ?autores-possibles ?libros-possibles get-escritoPor))
    (modify ?libros (libros-possibles  ?libros-possibles))
    (printout t " ponemos solo los libros de autores-possibles" crlf crlf)
    (print-multislot "libros possibles:" ?libros-possibles get-titulo)


    (bind ?libros-possibles (maybe-multislot-multi ?temas-possibles ?libros-possibles get-trataSobre))
    (modify ?libros (libros-possibles  ?libros-possibles))
    (printout t " ponemos solo los libros de autores-possibles" crlf crlf)
    (print-multislot "libros possibles:" ?libros-possibles get-titulo)

    


    ;(bind ?vectorLibros (todas-instancia Libro))
    ;(assert (LibrosT (libros-possibles ?vectorLibros)))                                     
    ;(modify ?libros (libros-possibles ?vectorLibros))
    ;(printout t "HOOOOOOOOOOOOOOOOOLAAAAAAAAAAAAAAA" crlf crlf)
    (printout t "Resumen Libros" crlf crlf)
    ;(print-multislot "Libros possibles:" ?vectorLibros get-titulo)
    ;(printout t "Resumen possibles" crlf crlf)
    ;(print-multislot "Generos possibles:" ?generos-possibles4 get-nombreGenero)
    (retract ?flow)
    (assert (veinte24))
)

(defrule veinte24 "recopilacion de los LIBROS possibles del lector"
    
    (LibrosT
                (libros-possibles $?libros-possibles))
    (or (Cultura Bajo) (Cultura Medio))
    ?libros <- (LibrosT)
    ?flow <- (veinte24) 
    =>

    

    (loop-for-count (?i 1 (length$ ?libros-possibles)) do
        (bind ?inst (nth$ ?i ?libros-possibles))
            (bind ?e -1)
            (bind ?j (send ?inst get-paginas))
            (bind ?dif (send ?inst get-dificultad))
            (if (and (> ?j 800 ) (eq ?dif "Alta")) then
                (bind ?libros-possibles (delete$ ?libros-possibles ?i ?i))
            )
    )


    (retract ?flow)
    (assert (f))
)


(defrule veinte25 "recopilacion de los LIBROS possibles del lector"
    
    (LibrosT
                (libros-possibles $?libros-possibles))
    (Cultura Alto)
    ?libros <- (LibrosT)
    ?flow <- (veinte25) 
    =>

    

    (loop-for-count (?i 1 (length$ ?libros-possibles)) do
        (bind ?inst (nth$ ?i ?libros-possibles))
            (bind ?dif (send ?inst get-dificultad))
            (if  (eq ?dif "Bajo") then
                (bind ?libros-possibles (delete$ ?libros-possibles ?i ?i))
            )
    )


    (retract ?flow)
    (assert (veinte26))
)

(defrule veinte26 "recopilacion de los LIBROS possibles del lector"
    
    (LibrosT
                (libros-possibles $?libros-possibles))
    (not (Lectura ligera))
    ?libros <- (LibrosT)
    ?flow <- (veinte26) 
    =>

    

    (loop-for-count (?i 1 (length$ ?libros-possibles)) do
        (bind ?inst (nth$ ?i ?libros-possibles))
            (bind ?j (send ?inst get-paginas))
            (bind ?dif (send ?inst get-dificultad))
            (if (and (< ?j 400 ) (eq ?dif "Baja")) then
                (bind ?libros-possibles (delete$ ?libros-possibles ?i ?i))
            )
    )


    (retract ?flow)
    (assert (veinte27))
)
(defrule veinte27 "recopilacion de los LIBROS possibles del lector"
    
    (LibrosT
                (libros-possibles $?libros-possibles))
    (not (Lectura densa))
    ?libros <- (LibrosT)
    ?flow <- (veinte27) 
    =>

    

     (loop-for-count (?i 1 (length$ ?libros-possibles)) do
        (bind ?inst (nth$ ?i ?libros-possibles))
            (bind ?e -1)
            (bind ?j (send ?inst get-paginas))
            (bind ?dif (send ?inst get-dificultad))
            (if (and (> ?j 800 ) (eq ?dif "Alta")) then
                (bind ?libros-possibles (delete$ ?libros-possibles ?i ?i))
            )
    )


    (retract ?flow)
    (assert (veinte28))
)

(defrule veinte28 "recopilacion de los LIBROS possibles del lector"
    
    (LibrosT
                (libros-possibles $?libros-possibles))
    (Edad nino)
    ?libros <- (LibrosT)
    ?flow <- (veinte28) 
    =>

    

     (loop-for-count (?i 1 (length$ ?libros-possibles)) do
        (bind ?inst (nth$ ?i ?libros-possibles))
            (bind ?audi (send ?inst get-audiencia))
            (if (or (eq ?audi "Adolescente") (eq ?audi "Adulto")) then
                (bind ?libros-possibles (delete$ ?libros-possibles ?i ?i))
            )
    )

    (retract ?flow)
    (assert (veinte29))
)

(defrule veinte29 "recopilacion de los LIBROS possibles del lector"
    
    (LibrosT
                (libros-possibles $?libros-possibles))
    (not (Edad nino))
    ?libros <- (LibrosT)
    ?flow <- (veinte29) 
    =>

    

     (loop-for-count (?i 1 (length$ ?libros-possibles)) do
        (bind ?inst (nth$ ?i ?libros-possibles))
            (bind ?audi (send ?inst get-audiencia))
            (if (eq ?audi "Infantil") then
                (bind ?libros-possibles (delete$ ?libros-possibles ?i ?i))
            )
    )

    (retract ?flow)
    (assert (veinte30))
)


(defrule veinte30 "recopilacion de los LIBROS possibles del lector"
    
    (LibrosT
                (libros-possibles $?libros-possibles))
    (Edad adolescente)
    (Cultura Bajo)
    ?libros <- (LibrosT)
    ?flow <- (veinte30) 
    =>

    

     (loop-for-count (?i 1 (length$ ?libros-possibles)) do
        (bind ?inst (nth$ ?i ?libros-possibles))
            (bind ?audi (send ?inst get-audiencia))
            (if (eq ?audi "Adulto") then
                (bind ?libros-possibles (delete$ ?libros-possibles ?i ?i))
            )
    )

    (retract ?flow)
    (assert (veinte31))
)

(defrule veinte31 "recopilacion de los LIBROS possibles del lector"
    
    (LibrosT
                (libros-possibles $?libros-possibles))


    (or (Edad Adulto) (Edad terceraEdad) (and (Edad joven) (Cultura Alto) ) )
    (Cultura Bajo)
    ?libros <- (LibrosT)
    ?flow <- (veinte31) 
    =>

    

     (loop-for-count (?i 1 (length$ ?libros-possibles)) do
        (bind ?inst (nth$ ?i ?libros-possibles))
            (bind ?audi (send ?inst get-audiencia))
            (if (eq ?audi "Adolescente") then
                (bind ?libros-possibles (delete$ ?libros-possibles ?i ?i))
            )
    )

    (retract ?flow)
    (assert (f))
)
;(deffunction elimina-multislot (?respuesta ?multislot)
    
;(and (Edad joven) (Cultura Alto)) )
(defrule f "Fin del modulo"
        (LibrosT
                (libros-possibles $?libros-possibles))
        ?flow <- (f)
        =>
       (printout t "Resumen recomendaciones" crlf crlf)
        (print-multislot "Libros possibles:" ?libros-possibles get-titulo)
        ;(print-multislot "Generos possibles:" ?generos-possibles get-nombreGenero)
        ;(print-multislot "Temas possibles:" ?temas-possibles get-nombreTema)
        (retract ?flow)
        (focus MAIN)
)
