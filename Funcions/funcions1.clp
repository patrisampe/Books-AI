; =============================================================================
; FUNCIONES
; =============================================================================
(deffunction pregunta-general (?pregunta) 
        (format t "%s" ?pregunta)
        (printout t crlf) 
        (bind ?respuesta (read)) 
        ?respuesta
)

(deffunction pregunta-numerica (?pregunta ?rangini ?rangfi)
        (format t "%s [%d, %d] " ?pregunta ?rangini ?rangfi)
        (printout t crlf) 
        (bind ?respuesta (read))
        (while (not(and(>= ?respuesta ?rangini)(<= ?respuesta ?rangfi))) do
                (format t "%s [%d, %d] " ?pregunta ?rangini ?rangfi)
                (bind ?respuesta (read))
        )
        ?respuesta
)


(deffunction pregunta-lista (?pregunta $?valores_posibles) 
        (format t "%s" ?pregunta)  
        (bind ?resposta (readline))  
        (bind ?res (str-explode ?resposta))   
        ?res
)


(deffunction pregunta-instancia (?pregunta ?instancia ?getter)
    (format t "%s" ?pregunta)
    (printout t crlf)
    (printout t crlf)
    (bind $?allInstances (find-all-instances((?inst ?instancia)) TRUE))
    (bind ?vectorInstancias (create$))
    (loop-for-count (?i 1 (length$ ?allInstances)) do
        (bind ?inst (nth$ ?i ?allInstances)) 
        (printout t (send ?inst ?getter) "(" ?i ")" crlf)
        (bind ?vectorInstancias (insert$ ?vectorInstancias ?i ?inst))
    )
    (printout t crlf)
    (printout t crlf)
    ?vectorInstancias 
)

(deffunction in-multislot (?x ?vector)
    (bind ?bool FALSE)
    (loop-for-count (?i 1 (length$ ?vector)) do
        (bind ?aux (nth$ ?i ?vector))
        (if (eq ?x ?aux) then (bind ?bool TRUE))
    )
    ?bool
)

(deffunction pregunta-instancia-prohibicion(?pregunta ?instancia ?getter ?deseos)
    (format t "%s" ?pregunta)
    (printout t crlf)
    (printout t crlf)
    (bind $?allInstances (find-all-instances((?inst ?instancia)) TRUE))
    (bind ?vectorInstancias (create$))
    (loop-for-count (?i 1 (length$ ?allInstances)) do
        (bind ?inst (nth$ ?i ?allInstances))
        (if (not (in-multislot ?inst ?deseos)) then (printout t (send ?inst ?getter) "(" ?i ")" crlf))
        (bind ?vectorInstancias (insert$ ?vectorInstancias ?i ?inst))
    )
    (printout t crlf)
    (printout t crlf)
    ?vectorInstancias 
)

(deffunction todas-instancia ( ?instancia )
    ;(format t "%s" ?pregunta)
    ;(printout t crlf)
    ;(printout t crlf)
    (bind $?allInstances (find-all-instances((?inst ?instancia)) TRUE))
    (bind ?vectorInstancias (create$))
    (loop-for-count (?i 1 (length$ ?allInstances)) do
        (bind ?inst (nth$ ?i ?allInstances)) 
     ;   (printout t (send ?inst ?getter) "(" ?i ")" crlf)
        (bind ?vectorInstancias (insert$ ?vectorInstancias ?i ?inst))
    )
    ;(printout t crlf)
    ;(printout t crlf)
    ?vectorInstancias 
)



(deffunction rellena-multislot (?lista ?vectorInstancias)
    (bind ?multislot (create$))
    (progn$ (?it ?lista)
        (bind ?multislot (insert$ ?multislot 1 (nth$ ?it ?vectorInstancias)))
    )
    ?multislot
)



(deffunction print-multislot (?mensaje ?multislot ?getter)
        (format t "%s" ?mensaje)
        (printout t crlf)
        (progn$ (?inst ?multislot)
                (printout t (send ?inst ?getter) crlf)
        )
        (printout t crlf)
)


(deffunction evalua-multislot (?respuesta ?auxi)
    (bind ?encontrado FALSE)
    (loop-for-count (?i 1 (length$ ?respuesta)) do
        (bind ?aux (nth$ ?i ?respuesta))
              (if (eq ?auxi ?aux) then
                (bind ?encontrado TRUE)
              )
    )
    ?encontrado
)
(deffunction evalua-multislot-elimina (?respuesta ?auxi)
    (bind ?encontrado -1)
    (loop-for-count (?i 1 (length$ ?respuesta)) do
        (bind ?aux (nth$ ?i ?respuesta))
              (if (eq ?auxi ?aux) then
                (bind ?encontrado ?i)
              )
    )
    ?encontrado
)

(deffunction elimina-multislot (?respuesta ?multislot)
    (loop-for-count (?i 1 (length$ ?respuesta)) do
        (bind ?aux (nth$ ?i ?respuesta))
            (bind ?e -1)
            (bind ?j (evalua-multislot-elimina ?multislot ?aux))
            (if (not (eq ?j ?e ) ) then
                (bind ?multislot (delete$ ?multislot ?j ?j))
            )
        
    )
    ?multislot
)

(deffunction evalua-elimina-multislot (?respuesta ?aux)
    (bind ?encontrado -1)
    (loop-for-count (?z 1 (length$ ?aux)) do
        (bind ?auxi (nth$ ?z ?aux))
   ;     (bind ?e -1)
        (loop-for-count (?o 1 (length$ ?respuesta)) do
            (bind ?d (nth$ ?o ?respuesta))
                  (if (eq ?auxi ?d) then
                    (bind ?encontrado 1)
                  )
        )
    )
    ?encontrado
)

(deffunction evalua-multislot-inserta (?respuesta ?auxi)
    (bind ?encontrado FALSE)
    (loop-for-count (?i 1 (length$ ?respuesta)) do
        (bind ?aux (nth$ ?i ?respuesta))
              (if (eq ?auxi ?aux) then
                (bind ?multislot (insert$ ?multislot ?i ?aux))
              )
    )
    ?multislot
)
(deffunction maybe-multislot-multi (?respuesta ?multislot-libros ?getter)
    (bind ?multislot (create$))
    (loop-for-count (?i 1 (length$ ?multislot-libros)) do
        (bind ?B (nth$ ?i ?multislot-libros))
        (bind ?aux (send ?B ?getter))
                (bind ?j (evalua-elimina-multislot ?respuesta ?aux))
                ;(bind ?j -1)
                (if (not(eq ?j -1 ) )then
                    (bind ?multislot (insert$ ?multislot 1 ?B))
                )

    )

    (bind ?multislot-libros (elimina-multislot ?multislot ?multislot-libros))    
    ?multislot-libros
)

(deffunction maybe-multislot-multi-insert (?respuesta ?intii ?multislot-libros ?getter)
    (bind ?multislot (create$))
    ;(printout t "uolaa insertaoooo 0" crlf)
    (loop-for-count (?i 1 (length$ ?multislot-libros)) do
      ;  (printout t "uolaa insertaoooo 0.1" crlf)
        (bind ?B (nth$ ?i ?multislot-libros))
     ;   (printout t "uolaa insertaoooo 0.25" crlf)
        (bind ?aux (send ?B ?getter))
      ; (printout t "uolaa insertaoooo 0.5" crlf)
       ;(bind ?len (length$ ?intii))
       ;(printout t ?len crlf)
               (if (eq (length$ ?intii) 0) then
                    (bind ?z -1)
                else (bind ?z (evalua-multislot-elimina ?intii ?B))
                )
        ;       (printout t "uolaa insertaoooo 1" crlf)
                (bind ?j (evalua-elimina-multislot ?respuesta ?aux))
         ;       (printout t "uolaa insertaoooo 1.5" crlf)
                ;(bind ?j -1)
               ;(if (not (eq ?j -1)) then
                (if (or (not (eq ?j -1 ) ) (not (eq ?z -1 ) ))then
          ;           (printout t "uolaa insertaoooo 2 " crlf)
                    (bind ?multislot (insert$ ?multislot 1 ?B))
                )

    )
    ?multislot
)

(deffunction maybe-multislot-single (?respuesta ?multislot-libros ?getter)
    (bind ?multislot (create$))
    (loop-for-count (?i 1 (length$ ?multislot-libros)) do
        (bind ?B (nth$ ?i ?multislot-libros))
        (bind ?aux (send ?B ?getter))
                (bind ?j (evalua-multislot-elimina ?respuesta ?aux))
                (if (not (eq ?j -1) ) then
                    (bind ?multislot (insert$ ?multislot 1 ?B)))
                )

    
    (bind ?multislot-libros (elimina-multislot ?multislot ?multislot-libros))    
    ?multislot-libros
)

(deffunction maybe-multislot-single-insert (?respuesta ?intii ?multislot-libros ?getter)

    (bind ?multislot (create$))
    ;(printout t "uolaa insertaoooo 0" crlf)
    (loop-for-count (?i 1 (length$ ?multislot-libros)) do
     ;   (printout t "uolaa insertaoooo 0.1" crlf)
        (bind ?B (nth$ ?i ?multislot-libros))
     ;   (printout t "uolaa insertaoooo 0.25" crlf)
        (bind ?aux (send ?B ?getter))
     ;   (printout t "uolaa insertaoooo 0.5" crlf)
               (if (eq (length$ ?intii) 0) then
                    (bind ?z -1)
                else (bind ?z (evalua-multislot-elimina ?intii ?B))
                )
                (bind ?j (evalua-multislot-elimina ?respuesta ?aux))
     ;           (printout t "uolaa insertaoooo 1" crlf)
                ;(bind ?j -1)
               ;(if (not (eq ?j -1)) then
                (if (or (not (eq ?j -1 ) ) (not (eq ?z -1 ) ))then
       ;              (printout t "uolaa insertaoooo 2 " crlf)
                    (bind ?multislot (insert$ ?multislot 1 ?B))
                )

    )
    ?multislot
)

(deffunction coger-tres (?multislot-libros)
    (bind ?multislot (create$))
    (loop-for-count (?i 1 (length$ ?multislot-libros)) do
        (bind ?B (nth$ ?i ?multislot-libros))
                (if (< ?i 4) then
                    (bind ?multislot (insert$ ?multislot 1 ?B)))
     )

    
    ;(bind ?multislot-libros (elimina-multislot ?multislot ?multislot-libros))    
    ?multislot
)


(deffunction une-multislot (?respuesta ?multislot)
    (loop-for-count (?i 1 (length$ ?respuesta)) do
        (bind ?aux (nth$ ?i ?respuesta))
            (if (not (evalua-multislot ?multislot ?aux)) then
              (bind ?multislot (insert$ ?multislot 1 ?aux))
            )
    )
    ?multislot
)

; Funcion que retorna la posicion del maximo elemento de una lista
; PRE: La lista no es vacia
(deffunction getPosMax (?vector)
    (bind ?pos 1)
    (bind ?max (nth$ 1 ?vector))
    (loop-for-count (?i 1 (length$ ?vector)) do
        (bind ?act (nth$ ?i ?vector))
        (if (> ?act ?max) then
            (bind ?pos ?i)
            (bind ?max ?act)
        )
    )
    ?pos
)
