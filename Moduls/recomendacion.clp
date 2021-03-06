; =============================================================================
; MODULO DE RECOMENDACION
; =============================================================================

(defmodule recomendacion
    (import MAIN ?ALL)
    (export ?ALL)
)

(defrule fin0 "El lector no tiene ningun libro posible"
    (Lector (nombre ?nombre))
    (Ordenacion (puntuaciones $?puntuaciones))
    (LibrosT (libros-possibles $?libros-possibles))
    (test (eq (length$ ?libros-possibles) 0))
    (not (Fin TOTAL))
    =>
    (printout t crlf)
    (printout t crlf)
    (printout t "--------------------------------------------------------" crlf)
    (printout t "--------------- RECOMENDACION COMPLETADA ---------------" crlf)
    (printout t "--------------------------------------------------------" crlf)
    (printout t crlf)
    (printout t crlf)
    (printout t ?nombre ", lamentamos informarle de que no hemos encontrado" crlf)
    (printout t "ningun libro que cumpla con todas sus restricciones" crlf)
    (printout t "Le recomendamos que no sea tan restrictivo :]" crlf)
    (printout t crlf)
    (printout t crlf)
    (printout t "--------------------------------------------------------" crlf)
    (printout t "------------------------- FIN --------------------------" crlf)
    (printout t "--------------------------------------------------------" crlf) 
    (printout t crlf)
    (printout t crlf)
    (assert (Fin TOTAL))
)

(defrule fin1 "El lector solo tiene 1 libro posible"
    (Lector (nombre ?nombre))
    (Ordenacion (puntuaciones $?puntuaciones))
    (LibrosT (libros-possibles $?libros-possibles))
    (test (eq (length$ ?libros-possibles) 1))
    (not (Fin TOTAL))
    =>
    (bind ?posMax1 (getPosMax ?puntuaciones))
    (bind ?libro1 (nth$ ?posMax1 ?libros-possibles))
    (bind ?titulo1 (send ?libro1 get-titulo))
    (bind ?aux (send ?libro1 get-escritoPor))
    (bind ?autor1 (send ?aux get-nombre))
    (printout t crlf)
    (printout t crlf)
    (printout t "--------------------------------------------------------" crlf)
    (printout t "--------------- RECOMENDACION COMPLETADA ---------------" crlf)
    (printout t "--------------------------------------------------------" crlf)
    (printout t crlf)
    (printout t crlf)
    (printout t ?nombre ", este es el unico libro que cumplia con todas sus restricciones: " crlf) 
    (printout t crlf)
    (printout t ?titulo1 ", " ?autor1 crlf)
    (printout t crlf) 
    (printout t "Muchas gracias por confiar en nuestro sistema" crlf)
    (printout t "Disfrute con la lectura de este libro" crlf)
    (printout t "No dude en volver a preguntarnos cuando lo finalice" crlf)
    (printout t crlf)
    (printout t crlf)
    (printout t "--------------------------------------------------------" crlf)
    (printout t "------------------------- FIN --------------------------" crlf)
    (printout t "--------------------------------------------------------" crlf) 
    (printout t crlf)
    (printout t crlf)
    (assert (Fin TOTAL))
)

(defrule fin2 "El lector solo tiene 2 libros posibles"
    (Lector (nombre ?nombre))
    (Ordenacion (puntuaciones $?puntuaciones))
    (LibrosT (libros-possibles $?libros-possibles))
    (test (eq (length$ ?libros-possibles) 2))
    (not (Fin TOTAL))
    =>
    (bind ?libro1 (nth$ 1 ?libros-possibles))
    (bind ?titulo1 (send ?libro1 get-titulo))
    (bind ?aux (send ?libro1 get-escritoPor))
    (bind ?autor1 (send ?aux get-nombre))

    (bind ?libro2 (nth$ 2 ?libros-possibles))
    (bind ?titulo2 (send ?libro2 get-titulo))
    (bind ?aux (send ?libro2 get-escritoPor))
    (bind ?autor2 (send ?aux get-nombre))

    (printout t crlf)
    (printout t crlf)
    (printout t "--------------------------------------------------------" crlf)
    (printout t "--------------- RECOMENDACION COMPLETADA ---------------" crlf)
    (printout t "--------------------------------------------------------" crlf)
    (printout t crlf)
    (printout t crlf)
    (printout t ?nombre ", le recomendamos los 2 siguientes libros:" crlf) 
    (printout t crlf)
    (printout t ?titulo1 ", " ?autor1 crlf)
    (printout t ?titulo2 ", " ?autor2 crlf)
    (printout t crlf) 
    (printout t "Muchas gracias por confiar en nuestro sistema" crlf)
    (printout t "Disfrute con la lectura de estos libros" crlf)
    (printout t "No dude en volver a preguntarnos cuando lo finalice" crlf)
    (printout t crlf)
    (printout t crlf)
    (printout t "--------------------------------------------------------" crlf)
    (printout t "------------------------- FIN --------------------------" crlf)
    (printout t "--------------------------------------------------------" crlf) 
    (printout t crlf)
    (printout t crlf)
    (assert (Fin TOTAL))
)

(defrule fin3 "El lector tiene al menos 3 libros posibles"
    (Lector (nombre ?nombre))
    (Ordenacion (puntuaciones $?puntuaciones))
    (LibrosT (libros-possibles $?libros-possibles))
    (not (Fin TOTAL))
    (test (>= (length$ ?libros-possibles) 3))
    =>
    (bind ?posMax1 (getPosMax ?puntuaciones))
    (bind ?libro1 (nth$ ?posMax1 ?libros-possibles))
    (bind ?titulo1 (send ?libro1 get-titulo))
    (bind ?aux (send ?libro1 get-escritoPor))
    (bind ?autor1 (send ?aux get-nombre))
    (bind ?puntuaciones (delete$ ?puntuaciones ?posMax1 ?posMax1))
    (bind ?libros-possibles (delete$ ?libros-possibles ?posMax1 ?posMax1))

    (bind ?posMax2 (getPosMax ?puntuaciones))
    (bind ?libro2 (nth$ ?posMax2 ?libros-possibles))
    (bind ?titulo2 (send ?libro2 get-titulo))
    (bind ?aux (send ?libro2 get-escritoPor))
    (bind ?autor2 (send ?aux get-nombre))
    (bind ?puntuaciones (delete$ ?puntuaciones ?posMax2 ?posMax2))
    (bind ?libros-possibles (delete$ ?libros-possibles ?posMax2 ?posMax2))

    (bind ?posMax3 (getPosMax ?puntuaciones))
    (bind ?libro3 (nth$ ?posMax3 ?libros-possibles))
    (bind ?titulo3 (send ?libro3 get-titulo))
    (bind ?aux (send ?libro3 get-escritoPor))
    (bind ?autor3 (send ?aux get-nombre))

    (printout t crlf)
    (printout t crlf)
    (printout t "--------------------------------------------------------" crlf)
    (printout t "--------------- RECOMENDACION COMPLETADA ---------------" crlf)
    (printout t "--------------------------------------------------------" crlf)
    (printout t crlf)
    (printout t crlf)
    (printout t ?nombre ", le recomendamos los 3 siguientes libros:" crlf)
    (printout t crlf)
    (printout t ?titulo1 ", " ?autor1 crlf)
    (printout t ?titulo2 ", " ?autor2 crlf)
    (printout t ?titulo3 ", " ?autor3 crlf)
    (printout t crlf) 
    (printout t "Muchas gracias por confiar en nuestro sistema" crlf)
    (printout t "Disfrute con la lectura de estos libros" crlf)
    (printout t "No dude en volver a preguntarnos de nuevo cuando quiera" crlf)
    (printout t crlf)
    (printout t crlf)
    (printout t "--------------------------------------------------------" crlf)
    (printout t "------------------------- FIN --------------------------" crlf)
    (printout t "--------------------------------------------------------" crlf) 
    (printout t crlf)
    (printout t crlf)
    (assert (Fin TOTAL))

)
