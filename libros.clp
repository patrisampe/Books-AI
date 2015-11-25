;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;          Practica 2 IA       ;;
;; Por:                         ;;
;; * Octavi Pascual             ;;
;; * Patricia Sampedro          ;;
;; * Yoel Cabo                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Ontologia/Libros.pins BEGIN

; Sat Nov 14 23:14:20 CET 2015
; 
;+ (version "3.5")
;+ (build "Build 663")

([Libros_Class0] of  Autor

	(anoDeNacimiento 1963)
	(nacionalidad "Reino Unido")
	(nombre "E. L. James")
	(nPremios 5))

([Libros_Class1] of  Autor

	(anoDeNacimiento 1973)
	(nacionalidad "Estados Unidos")
	(nombre "Stephenie Meyer")
	(nPremios 3))

([Libros_Class10003] of  Habitos
)

([Libros_Class10006] of  Fantasia

	(nombreGenero "Fantasia"))

([Libros_Class10007] of  Historica

	(nombreGenero "Historica"))

([Libros_Class10008] of  Narrativa

	(nombreGenero "Narrativa"))

([Libros_Class10009] of  Oeste

	(nombreGenero "Oeste"))

([Libros_Class10010] of  Policiaca

	(nombreGenero "Policiaca"))

([Libros_Class10011] of  Romantica

	(nombreGenero "Romatica"))

([Libros_Class10012] of  Terror

	(nombreGenero "Terror"))

([Libros_Class10013] of  Viajes

	(nombreGenero "Viajes"))

([Libros_Class10015] of  Habitos

	(horaDelDia Manana Noche)
	(lugarDeLectura Casa))

([Libros_Class10016] of  Habitos

	(horaDelDia Manana)
	(lugarDeLectura TransportePublico))

([Libros_Class10017] of  Amor

	(nombreTema "Amor"))

([Libros_Class10018] of  Deber

	(nombreTema "Deber"))

([Libros_Class10019] of  Erotico

	(nombreTema "Erotico"))

([Libros_Class10020] of  Honor

	(nombreTema "Honor"))

([Libros_Class10021] of  IgualdadGenero

	(nombreTema "IgualdadGenero"))

([Libros_Class10022] of  Justicia

	(nombreTema "Justicia"))

([Libros_Class10023] of  Muerte

	(nombreTema "Muerte"))

([Libros_Class10024] of  Soledad

	(nombreTema "Soledad"))

([Libros_Class10028] of  PreferenciasAutor
)

([Libros_Class10029] of  PreferenciasGenero
)

([Libros_Class10030] of  PreferenciasTema
)

([Libros_Class2] of  Lector

	(edad 21)
	(estudios "Magisterio")
	(Identificador 1)
	(ocupacion "Estudiante")
	(sexo Masculino)
	(suele [Libros_Class10003]))

([Libros_Class3] of  Libro

	(dificultad Baja)
	(editorial "Alfaguara")
	(escritoPor [Libros_Class1])
	(paginas 765)
	(pertenece [Libros_Class10011])
	(premios FALSE)
	(titulo "Crepusculo")
	(trata
		[Libros_Class10017]
		[Libros_Class10019]))

([Libros_Class4] of  Aventuras

	(nombreGenero "Aventuras"))

([Libros_Class5] of  Ciencia-ficcion

	(nombreGenero "Ciencia-ficcion"))

;;; Ontologia/Libros.pins END


;;; Ontologia/Libros.pont BEGIN

; Sat Nov 14 23:14:19 CET 2015
; 
;+ (version "3.5")
;+ (build "Build 663")


(defclass %3ACLIPS_TOP_LEVEL_SLOT_CLASS "Fake class to save top-level slot information"
	(is-a USER)
	(role abstract)
	(single-slot nPremios
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot edad
;+		(comment "Edad del lector")
		(type INTEGER)
		(range 0 %3FVARIABLE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot escritoPor
		(type INSTANCE)
;+		(allowed-classes Autor)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot titulo
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot nombreGenero
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot nombreTema
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot suele
		(type INSTANCE)
;+		(allowed-classes Habitos)
		(create-accessor read-write))
	(single-slot dificultad
		(type SYMBOL)
		(allowed-values Baja Media Alta)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot frecuenciaAnual
		(type INTEGER)
		(range 0 365)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot sexo
		(type SYMBOL)
		(allowed-values Femenino Masculino)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Identificador
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot premios
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot paginas
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot pertenece
		(type INSTANCE)
;+		(allowed-classes Genero)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write))
	(single-slot anoDeNacimiento
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot editorial
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot estudios
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot ocupacion
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot lugarDeLectura
		(type SYMBOL)
		(allowed-values Casa TransportePublico Cama)
		(create-accessor read-write))
	(multislot tiene
		(type INSTANCE)
;+		(allowed-classes Preferencias)
		(create-accessor read-write))
	(single-slot nacionalidad
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot trata
		(type INSTANCE)
;+		(allowed-classes Tema)
		(create-accessor read-write))
	(single-slot nombre
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot horaDelDia
		(type SYMBOL)
		(allowed-values Manana Tarde Noche)
		(create-accessor read-write)))

(defclass Lector
	(is-a USER)
	(role concrete)
	(multislot tiene
		(type INSTANCE)
;+		(allowed-classes Preferencias)
		(create-accessor read-write))
	(single-slot edad
;+		(comment "Edad del lector")
		(type INTEGER)
		(range 0 %3FVARIABLE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot sexo
		(type SYMBOL)
		(allowed-values Femenino Masculino)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Identificador
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot estudios
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot ocupacion
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot suele
		(type INSTANCE)
;+		(allowed-classes Habitos)
		(create-accessor read-write)))

(defclass Libro
	(is-a USER)
	(role concrete)
	(single-slot titulo
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot escritoPor
		(type INSTANCE)
;+		(allowed-classes Autor)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot pertenece
		(type INSTANCE)
;+		(allowed-classes Genero)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write))
	(single-slot dificultad
		(type SYMBOL)
		(allowed-values Baja Media Alta)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot editorial
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot premios
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot paginas
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot trata
		(type INSTANCE)
;+		(allowed-classes Tema)
		(create-accessor read-write)))

(defclass Genero
	(is-a USER)
	(role concrete)
	(single-slot nombreGenero
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Narrativa
	(is-a Genero)
	(role concrete))

(defclass Policiaca
	(is-a Genero)
	(role concrete))

(defclass Terror
	(is-a Genero)
	(role concrete))

(defclass Ciencia-ficcion
	(is-a Genero)
	(role concrete))

(defclass Fantasia
	(is-a Genero)
	(role concrete))

(defclass Romantica
	(is-a Genero)
	(role concrete))

(defclass Historica
	(is-a Genero)
	(role concrete))

(defclass Oeste
	(is-a Genero)
	(role concrete))

(defclass Aventuras
	(is-a Genero)
	(role concrete))

(defclass Viajes
	(is-a Genero)
	(role concrete))

(defclass Tema
	(is-a USER)
	(role concrete)
	(single-slot nombreTema
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Amor
	(is-a Tema)
	(role concrete))

(defclass Erotico
	(is-a Tema)
	(role concrete))

(defclass Muerte
	(is-a Tema)
	(role concrete))

(defclass Honor
	(is-a Tema)
	(role concrete))

(defclass Deber
	(is-a Tema)
	(role concrete))

(defclass Soledad
	(is-a Tema)
	(role concrete))

(defclass Justicia
	(is-a Tema)
	(role concrete))

(defclass IgualdadGenero
	(is-a Tema)
	(role concrete))

(defclass Autor
	(is-a USER)
	(role concrete)
	(single-slot nPremios
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot anoDeNacimiento
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot nacionalidad
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot nombre
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass Preferencias
	(is-a USER)
	(role concrete))

(defclass PreferenciasGenero
	(is-a Preferencias)
	(role concrete))

(defclass PreferenciasAutor
	(is-a Preferencias)
	(role concrete))

(defclass PreferenciasTema
	(is-a Preferencias)
	(role concrete))

(defclass Habitos
	(is-a USER)
	(role concrete)
	(single-slot frecuenciaAnual
		(type INTEGER)
		(range 0 365)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot lugarDeLectura
		(type SYMBOL)
		(allowed-values Casa TransportePublico Cama)
		(create-accessor read-write))
	(multislot horaDelDia
		(type SYMBOL)
		(allowed-values Manana Tarde Noche)
		(create-accessor read-write)))
;;; Ontologia/Libros.pont END


;;; octavipatridivendres.clp BEGIN

; =============================================================================
; TEMPLATES 
; =============================================================================

(deftemplate Lector
        (slot nombre (type STRING) (default ?DERIVE))
        (slot edad (type INTEGER) (range 0 120) (default 0))
        (slot sexo (type SYMBOL) (allowed-values hombre mujer IND) (default IND))
        (slot estudios (type SYMBOL) (allowed-values No_graduado_escolar CFGS Bachillerato Universidad IND) (default IND))
)

(deftemplate Habitos
        (slot lugar (type SYMBOL) (allowed-values cama transporte_publico casa biblioteca IND) (default IND))
        (slot frecuencia (type SYMBOL) (allowed-values diario finde ocasionalmente cuando_se_puede IND) (default IND))
        (slot momento (type SYMBOL) (allowed-values manana mediodia tarde noche IND) (default IND))
        (slot tiempo (type INTEGER) (range 0 1440) (default 0))
)

; =============================================================================
; MENSAJES
; =============================================================================

; No funciona ja que nomes es pot fer per CLASSES i no deftemplates!!!
; Ho guardem com exemple xD

;(defmessage-handler Lector imprimeLector primary ()
;  (printout t " Lector:  " ?self:nombre crlf)
;  (printout t " Lector:  " ?self:sexo crlf)
;  (printout t " Lector:  " ?self:edad crlf)
;  (printout t " Lector:  " ?self:estudios crlf) 
;)

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

; =============================================================================
; MAIN
; =============================================================================

(defmodule MAIN (export ?ALL))

(defrule comienzo "regla inicial"
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
        (assert (nuevo-lector))
        (focus datos-lector)           
)

; =============================================================================
; MODULO DE PREGUNTAS
; =============================================================================

; Modulo de recopilacion de los datos del lector
(defmodule datos-lector
        (import MAIN ?ALL)
        (export ?ALL)
)

(defrule establecer-nombre "Establece el nombre de usuario, es la primera pregunta"
        (nuevo-lector)
        =>
        (bind ?nombre (pregunta-general "¿Como se llama?"))
        (assert (Lector (nombre ?nombre)))
        (assert (establecer-edad))
)

(defrule establecer-edad "Establece la edad del usuario"
        ?lector <- (Lector)
        ?flow <- (establecer-edad)
        =>
        (bind ?edad (pregunta-numerica "¿Que edad tiene? " 0 120))
        (modify ?lector (edad ?edad))
        (retract ?flow)
        (assert (establecer-sexo))
)

(defrule establecer-sexo "Establece el sexo del usuario"
        ?lector <- (Lector)
        ?flow <- (establecer-sexo)
        =>
        (bind ?sexo (pregunta-general "¿Es hombre(1) o mujer(2)?"))
        (switch ?sexo
                (case 1 then (modify ?lector (sexo hombre)))
                (case 2 then (modify ?lector (sexo mujer)))
        )
        (retract ?flow)
        (assert (establecer-estudios))
)

(defrule establecer-estudios "Establece los estudios del usuario"
        ?lector <- (Lector)
        ?flow <- (establecer-estudios)
        =>
        (bind ?estudios (pregunta-general 
          "¿Cual es tu ultimo titulo academico? 
          No graduado escolar(1) CFGS(2) Bachillerato(3) Universidad(4)"))
        (switch ?estudios
                (case 1 then (modify ?lector (estudios No_graduado_escolar)))
                (case 2 then (modify ?lector (estudios CFGS)))
                (case 3 then (modify ?lector (estudios Bachillerato)))
                (case 4 then (modify ?lector (estudios Universidad)))
        )
        (retract ?flow)
        (assert (pasar-a-habitos-lector))
)       

(defrule pasar-a-habitos-lector "Pasa a la recopilacion de preferencias"
        (Lector (nombre ?nombre) (edad ?edad) (sexo ?sexo) (estudios ?estudios))
        ?flow <- (pasar-a-habitos-lector)
        =>
        (printout t "Resumen Lector" crlf)
        (printout t " nombre: " ?nombre crlf)
        (printout t " edad: " ?edad crlf)
        (printout t " sexo: " ?sexo crlf)
        (printout t " estudios: " ?estudios crlf)
        (retract ?flow)
        (focus habitos-lector)
)

; Modulo de recopilacion de los habitos del lector
(defmodule habitos-lector
        (import MAIN ?ALL)
        (export ?ALL)
;       (import recopilacion_usuario ?ALL)
)

(defrule establecer-lugar
        (nuevo-lector)
        =>
        (bind ?lugar (pregunta-general 
                "¿En que lugar acostumbra a leer?
                cama(1) transporte publico(2) casa(3) biblioteca(4)"))
        (switch ?lugar
                ;(case 1 then (assert (Habitos (lugar casa))))
                ;(case 2 then (assert (Habitos (lugar transporte_publico))))
                ;(case 3 then (assert (Habitos(lugar cama))))
                ;(case 4 then (assert (Habitos (lugar biblioteca))))
                (case 1 then (bind ?lugar cama))
                (case 2 then (bind ?lugar transporte_publico))
                (case 3 then (bind ?lugar casa))
                (case 4 then (bind ?lugar biblioteca))
        )
        (assert (Habitos (lugar ?lugar)))
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
        (assert (pasar-a-preferencias-literarias))
)

(defrule pasar-a-preferencias-literarias "Pasa a la recopilacion de preferencias-literarias"
        (Habitos (lugar ?lugar) (frecuencia ?frecuencia) (momento ?momento) (tiempo ?tiempo))
        ?flow <- (pasar-a-preferencias-literarias)
        =>
        (printout t "Resumen Habitos" crlf)
        (printout t " lugar: " ?lugar crlf)
        (printout t " frecuencia: " ?frecuencia crlf)
        (printout t " momento: " ?momento crlf)
        (printout t " tiempo: " ?tiempo crlf)
        (retract ?flow)
        ;(focus preferencias-literarias)
)

; HASTA AQUI HEMOS LLEGADO!:(
; Modulo de recopilacion de las prefencias literarias del lector


;;; octavipatridivendres.clp END


