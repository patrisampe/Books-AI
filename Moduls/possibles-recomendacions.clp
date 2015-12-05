
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
    (assert (carga))
    (retract ?flow)
)

(defrule filtrar "recopilacion de los LIBROS possibles del lector"
    
    (Possibles 
                (autores-possibles $?autores-possibles) 
                (generos-possibles $?generos-possibles) 
                (temas-possibles $?temas-possibles))
    (LibrosT
                (libros-possibles $?libros-possibles))
    (and (test (> (length$ ?autores-possibles) 0)) (test (> (length$ ?generos-possibles) 0)) (test (> (length$ ?temas-possibles) 0)))
    ?libros <- (LibrosT)
    (not (filtrar))
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
    (assert (filtrar))
)

(defrule veinte24 "recopilacion de los LIBROS possibles del lector"
    
    (LibrosT
                (libros-possibles $?libros-possibles))
    (or (Cultura Bajo) (Cultura Medio))
    ?libros <- (LibrosT)
    (not(veinte24)) 
    =>

    (printout t "veinte24" crlf crlf)
    (bind ?multislot (create$))
    (loop-for-count (?i 1 (length$ ?libros-possibles)) do
        (bind ?inst (nth$ ?i ?libros-possibles))
            (bind ?e -1)
            (bind ?j (send ?inst get-paginas))
            (bind ?dif (send ?inst get-dificultad))
            (if (and (> ?j 800 ) (= (str-compare ?dif "Alta") 0)) then
                (bind ?multislot (insert$ ?multislot 1 ?inst))
            )
    )


    (bind ?libros-possibles (elimina-multislot ?multislot ?libros-possibles))  
       
    (modify ?libros (libros-possibles ?libros-possibles))
   ; (retract ?flow)
    (assert (veinte24))
)


(defrule veinte25 "recopilacion de los LIBROS possibles del lector"
    
    (LibrosT
                (libros-possibles $?libros-possibles))
    (Cultura Alto)
    ?libros <- (LibrosT)
    (not(veinte25)) 
    =>

    (printout t "veinte25" crlf crlf)
    (bind ?multislot (create$))
    (loop-for-count (?i 1 (length$ ?libros-possibles)) do
        (bind ?inst (nth$ ?i ?libros-possibles))
            (bind ?dif (send ?inst get-dificultad))
            (if  (= (str-compare ?dif "Baja") 0) then
                 (bind ?multislot (insert$ ?multislot 1 ?inst))
            )
    )
    (bind ?libros-possibles (elimina-multislot ?multislot ?libros-possibles))  
       
    (modify ?libros (libros-possibles ?libros-possibles))

   ; (retract ?flow)
    (assert (veinte25))
)

(defrule veinte26 "recopilacion de los LIBROS possibles del lector"
    
    (LibrosT
                (libros-possibles $?libros-possibles))
    (not (Lectura ligera))
    ?libros <- (LibrosT)
    (not (veinte26) ) 
    =>

    (printout t "veinte26" crlf crlf)
    (bind ?multislot (create$))
    (loop-for-count (?i 1 (length$ ?libros-possibles)) do
        (bind ?inst (nth$ ?i ?libros-possibles))
            (bind ?j (send ?inst get-paginas))
            (bind ?dif (send ?inst get-dificultad))
            (if (and (< ?j 400 ) (= (str-compare ?dif "Baja") 0)) then
                 (bind ?multislot (insert$ ?multislot 1 ?inst))
            )
    )

    (bind ?libros-possibles (elimina-multislot ?multislot ?libros-possibles))  
       
    (modify ?libros (libros-possibles ?libros-possibles))
   ; (retract ?flow)
    (assert (veinte26))
)
(defrule veinte27 "recopilacion de los LIBROS possibles del lector"
    
    (LibrosT
                (libros-possibles $?libros-possibles))
    (not (Lectura densa))
    ?libros <- (LibrosT)
    (not (veinte27) )
    =>

    (printout t "veinte27" crlf crlf)
    (bind ?multislot (create$))
     (loop-for-count (?i 1 (length$ ?libros-possibles)) do
        (bind ?inst (nth$ ?i ?libros-possibles))
            (bind ?e -1)
            (bind ?j (send ?inst get-paginas))
            (bind ?dif (send ?inst get-dificultad))
            (if (and (> ?j 800 ) (= (str-compare ?dif "Alta") 0) ) then
                (bind ?multislot (insert$ ?multislot 1 ?inst))   
            )
    )

     (bind ?libros-possibles (elimina-multislot ?multislot ?libros-possibles))  
       
    (modify ?libros (libros-possibles ?libros-possibles))

    ;(retract ?flow)
    (assert (veinte27))
)

(defrule veinte28 "recopilacion de los LIBROS possibles del lector"
    
    (LibrosT
                (libros-possibles $?libros-possibles))
    (Edad nino)
    ?libros <- (LibrosT)
    (not (veinte28)) 
    =>

    (printout t "veinte28" crlf crlf)

     (bind ?multislot (create$))
     (loop-for-count (?i 1 (length$ ?libros-possibles)) do
        (bind ?inst (nth$ ?i ?libros-possibles))
            (bind ?audi (send ?inst get-audiencia))
            ;(printout t ?audi crlf crlf)
            (if (or (= (str-compare ?audi "Adulto") 0) (= (str-compare ?audi "Adolescente") 0)) then
                ;(printout t "Guai" crlf crlf)
                (bind ?multislot (insert$ ?multislot 1 ?inst))           
            )
    )
    ;(print-multislot "Libros possibles:" ?multislot get-titulo)
    (bind ?libros-possibles (elimina-multislot ?multislot ?libros-possibles))  
       
    (modify ?libros (libros-possibles ?libros-possibles))
    ;(print-multislot "Libros possibles:" ?libros-possibles get-titulo)
     ;(bind ?libros-possibles (elimina-multislot ?multislot ?libros-possibles))   
    ;(retract ?flow)
    (assert (veinte28))
)





(defrule veinte29 "recopilacion de los LIBROS possibles del lector"
    
    (LibrosT
                (libros-possibles $?libros-possibles))
    (not (Edad nino))
    ?libros <- (LibrosT)
    (not (veinte29)) 
    =>

    (printout t "veinte29" crlf crlf)
    (bind ?multislot (create$))
     (loop-for-count (?i 1 (length$ ?libros-possibles)) do
        (bind ?inst (nth$ ?i ?libros-possibles))
            (bind ?audi (send ?inst get-audiencia))
            (if  (= (str-compare ?audi "Infantil") 0) then
                 (bind ?multislot (insert$ ?multislot 1 ?inst))  
            )
    )
     (bind ?libros-possibles (elimina-multislot ?multislot ?libros-possibles))  
       
    (modify ?libros (libros-possibles ?libros-possibles))

    ;(retract ?flow)
    (assert (veinte29))
)


(defrule veinte30 "recopilacion de los LIBROS possibles del lector"
    
    (LibrosT
                (libros-possibles $?libros-possibles))
    (Edad adolescente)
    (Cultura Bajo)
    ?libros <- (LibrosT)
    (not(veinte30)) 
    =>

    (printout t "veinte30" crlf crlf)
    (bind ?multislot (create$))
     (loop-for-count (?i 1 (length$ ?libros-possibles)) do
        (bind ?inst (nth$ ?i ?libros-possibles))
            (bind ?audi (send ?inst get-audiencia))
            (if (= (str-compare ?audi "Adulto") 0) then
                (bind ?multislot (insert$ ?multislot 1 ?inst))  
            )
    )

    (bind ?libros-possibles (elimina-multislot ?multislot ?libros-possibles))  
       
    (modify ?libros (libros-possibles ?libros-possibles))
    ;(retract ?flow)
    (assert (veinte30))
)

(defrule veinte31 "recopilacion de los LIBROS possibles del lector"
    
    (LibrosT
                (libros-possibles $?libros-possibles))


    (or (Edad Adulto) (Edad terceraEdad) (and (Edad joven) (Cultura Alto) ) )
    (Cultura Bajo)
    ?libros <- (LibrosT)
    (not(veinte31)) 
    =>

    (printout t "veinte31" crlf crlf)
    (bind ?multislot (create$))
     (loop-for-count (?i 1 (length$ ?libros-possibles)) do
        (bind ?inst (nth$ ?i ?libros-possibles))
            (bind ?audi (send ?inst get-audiencia))
            (if (= (str-compare ?audi "Adolescente") 0) then
                (bind ?multislot (insert$ ?multislot 1 ?inst)) 
            )
    )

    ;(retract ?flow)
    (bind ?libros-possibles (elimina-multislot ?multislot ?libros-possibles))  
       
    (modify ?libros (libros-possibles ?libros-possibles))
    (assert (veinte31))
)

(defrule recomanem "hiii"
    (declare (salience 1))
    (LibrosT
                (libros-possibles $?libros-possibles))
    (test (< (length$ ?libros-possibles) 4))
    (not (recomendi) )
    (carga)
    =>

    (printout t "REEEEEEEEEEEEECOOOOOOOOOOOOOOOOOOOOMMMMMMMMMM" crlf crlf)
    (assert (recomendi))

)
;(deffunction elimina-multislot (?respuesta ?multislot)
    
;(and (Edad joven) (Cultura Alto)) )
(defrule f "Fin del modulo"
        (declare (salience 1))
        (LibrosT
                (libros-possibles $?libros-possibles))
        (recomendi)
        =>
        ;(bind ?libros-possibles (coger-tres ?libros-possibles))
       (printout t "Resumen recomendaciones 1" crlf crlf)
       ;
        (print-multislot "Libros possibles:" ?libros-possibles get-titulo)
        ;(print-multislot "Generos possibles:" ?generos-possibles get-nombreGenero)
        ;(print-multislot "Temas possibles:" ?temas-possibles get-nombreTema)
        ;(retract ?flow)
        (focus MAIN)
)


(defrule fuu "Fin del modulo"
        (declare (salience -1))
        (LibrosT
                (libros-possibles $?libros-possibles))
        (not (recomendi) )
        =>
       (bind ?libros-possibles (coger-tres ?libros-possibles))
       (printout t "Resumen recomendaciones 2" crlf crlf)
       ;
        (print-multislot "Libros possibles:" ?libros-possibles get-titulo)
        ;(print-multislot "Generos possibles:" ?generos-possibles get-nombreGenero)
        ;(print-multislot "Temas possibles:" ?temas-possibles get-nombreTema)
        ;(retract ?flow)
        (focus MAIN)
)
