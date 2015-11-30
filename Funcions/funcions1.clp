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
    (bind ?encontrado FALSE)
    (loop-for-count (?i 1 (length$ ?respuesta)) do
        (bind ?aux (nth$ ?i ?respuesta))
              (if (eq ?auxi ?aux) then
                (bind ?multislot (delete$ ?multislot ?i ?i))
              )
    )
    ?multislot
)

(deffunction maybe-multislot (?respuesta ?multislot ?getter)
;    (progn$ (?inst ?multislot)
;        (bind ?aux (send ?inst ?getter))
;            (if (evalua-multislot ?respuesta ?aux) then
   ;             (bind ?multislot (delete$ ?multislot ?i ?i))
 ;           )
  ;  )
    (loop-for-count (?i 1 (length$ ?respuesta)) do
        (bind ?B (nth$ ?i ?respuesta))
        (bind ?aux (send ?B ?getter))
           (bind ?multislot (evalua-multislot-elimina ?multislot ?aux))
    )
    ?multislot
)


(deffunction une-multislot (?respuesta ?multislot)
    (loop-for-count (?i 1 (length$ ?multislot)) do
        (bind ?aux (nth$ ?i ?multislot))
            (if (not (evalua-multislot ?respuesta ?aux)) then
              (bind ?multislot (insert$ ?multislot 1 ?aux))
            )
    )
    ?multislot
)

(deffunction elimina-multislot (?respuesta ?multislot)
    (loop-for-count (?i 1 (length$ ?multislot)) do
        (bind ?aux (nth$ ?i ?multislot))
            (if (evalua-multislot ?respuesta ?aux) then
              (bind ?multislot (delete$ ?multislot ?i ?i))
            )
    )
    ?multislot
)

