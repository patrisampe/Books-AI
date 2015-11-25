;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;          Practica 2 IA       ;;
;; Por:                         ;;
;; * Octavi Pascual             ;;
;; * Patricia Sampedro          ;;
;; * Yoel Cabo                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Ontologia/Libros.pont BEGIN

; Wed Nov 25 19:20:12 CET 2015
; 
;+ (version "3.5")
;+ (build "Build 663")


(defclass %3ACLIPS_TOP_LEVEL_SLOT_CLASS "Fake class to save top-level slot information"
	(is-a USER)
	(role abstract)
	(single-slot nombreGenero
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot idioma
		(type SYMBOL)
		(allowed-values Frances Catalan Castellano Ingles Aleman Italiano)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot autores
		(type INSTANCE)
;+		(allowed-classes Autor)
;+		(inverse-slot tieneNacionalidad)
		(create-accessor read-write))
	(single-slot Nombre
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot trataSobre
		(type INSTANCE)
;+		(allowed-classes Tema)
;+		(inverse-slot librosTema)
		(create-accessor read-write))
	(single-slot anoDeNacimiento
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot titulo
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot librosEscritos
		(type INSTANCE)
;+		(allowed-classes Libro)
;+		(inverse-slot escritoPor)
		(create-accessor read-write))
	(single-slot premios
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot tieneNacionalidad
		(type INSTANCE)
;+		(allowed-classes Nacionalidad)
;+		(cardinality 0 1)
;+		(inverse-slot autores)
		(create-accessor read-write))
	(multislot librosGenero
		(type INSTANCE)
;+		(allowed-classes Libro)
;+		(inverse-slot pertenece)
		(create-accessor read-write))
	(single-slot anoPublicacion
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot escritoPor
		(type INSTANCE)
;+		(allowed-classes Autor)
;+		(cardinality 1 1)
;+		(inverse-slot librosEscritos)
		(create-accessor read-write))
	(single-slot paginas
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot pertenece
		(type INSTANCE)
;+		(allowed-classes Genero)
		(cardinality 1 ?VARIABLE)
;+		(inverse-slot librosGenero)
		(create-accessor read-write))
	(single-slot audiencia
		(type SYMBOL)
		(allowed-values Infantil Adolescente Adulto)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot nacionalidad
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot nombreTema
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot nPremios
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot dificultad
		(type SYMBOL)
		(allowed-values Baja Media Alta)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot librosTema
		(type INSTANCE)
;+		(allowed-classes Libro)
;+		(inverse-slot trataSobre)
		(create-accessor read-write)))

(defclass Autor
	(is-a USER)
	(role concrete)
	(single-slot Nombre
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot tieneNacionalidad
		(type INSTANCE)
;+		(allowed-classes Nacionalidad)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot librosEscritos
		(type INSTANCE)
;+		(allowed-classes Libro)
		(create-accessor read-write))
	(single-slot anoDeNacimiento
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot nPremios
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass Nacionalidad
	(is-a USER)
	(role concrete)
	(single-slot nacionalidad
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot autores
		(type INSTANCE)
;+		(allowed-classes Autor)
		(create-accessor read-write)))

(defclass Genero
	(is-a USER)
	(role concrete)
	(single-slot nombreGenero
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot librosGenero
		(type INSTANCE)
;+		(allowed-classes Libro)
		(create-accessor read-write)))

(defclass Aventuras
	(is-a Genero)
	(role concrete))

(defclass Ciencia-ficcion
	(is-a Genero)
	(role concrete))

(defclass Fantasia
	(is-a Genero)
	(role concrete))

(defclass Historica
	(is-a Genero)
	(role concrete))

(defclass Narrativa
	(is-a Genero)
	(role concrete))

(defclass Oeste
	(is-a Genero)
	(role concrete))

(defclass Policiaca
	(is-a Genero)
	(role concrete))

(defclass Romantica
	(is-a Genero)
	(role concrete))

(defclass Terror
	(is-a Genero)
	(role concrete))

(defclass Viajes
	(is-a Genero)
	(role concrete))

(defclass Libro
	(is-a USER)
	(role concrete)
	(single-slot paginas
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot idioma
		(type SYMBOL)
		(allowed-values Frances Catalan Castellano Ingles Aleman Italiano)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot audiencia
		(type SYMBOL)
		(allowed-values Infantil Adolescente Adulto)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot premios
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot trataSobre
		(type INSTANCE)
;+		(allowed-classes Tema)
		(create-accessor read-write))
	(single-slot dificultad
		(type SYMBOL)
		(allowed-values Baja Media Alta)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot titulo
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot pertenece
		(type INSTANCE)
;+		(allowed-classes Genero)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write))
	(single-slot anoPublicacion
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot escritoPor
		(type INSTANCE)
;+		(allowed-classes Autor)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Tema
	(is-a USER)
	(role concrete)
	(single-slot nombreTema
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot librosTema
		(type INSTANCE)
;+		(allowed-classes Libro)
		(create-accessor read-write)))
;;; Ontologia/Libros.pont END

(definstances instancies

;;; Ontologia/Libros.pins BEGIN

; Wed Nov 25 19:20:12 CET 2015
; 
;+ (version "3.5")
;+ (build "Build 663")

([libros_Class10] of  Nacionalidad

	(nacionalidad "Italia"))

([libros_Class11] of  Nacionalidad

	(nacionalidad "Liechestein"))

([libros_Class12] of  Nacionalidad

	(nacionalidad "Japon"))

([libros_Class13] of  Nacionalidad

	(nacionalidad "Canada"))

([libros_Class3] of  Nacionalidad

	(autores [libros_Class69])
	(nacionalidad "Espana"))

([libros_Class38] of  Tema

	(librosTema
		[libros_Class59]
		[libros_Class63]
		[libros_Class64])
	(nombreTema "Amor"))

([libros_Class39] of  Tema

	(librosTema [libros_Class59])
	(nombreTema "Erotico"))

([libros_Class4] of  Nacionalidad

	(nacionalidad "Alemania"))

([libros_Class40] of  Tema

	(librosTema [libros_Class70])
	(nombreTema "Deber"))

([libros_Class41] of  Tema

	(librosTema [libros_Class67])
	(nombreTema "Honor"))

([libros_Class42] of  Tema

	(nombreTema "IgualdadGenero"))

([libros_Class43] of  Tema

	(librosTema
		[libros_Class67]
		[libros_Class70])
	(nombreTema "Justicia"))

([libros_Class44] of  Tema

	(librosTema [libros_Class67])
	(nombreTema "Muerte"))

([libros_Class45] of  Tema

	(nombreTema "Soledad"))

([libros_Class46] of  Aventuras

	(nombreGenero "Aventuras"))

([libros_Class47] of  Ciencia-ficcion

	(nombreGenero "Ciencia-ficcion"))

([libros_Class48] of  Fantasia

	(librosGenero
		[libros_Class64]
		[libros_Class63]
		[libros_Class67])
	(nombreGenero "Fantasia"))

([libros_Class49] of  Historica

	(nombreGenero "Historica"))

([libros_Class5] of  Nacionalidad

	(autores
		[libros_Class61]
		[libros_Class66])
	(nacionalidad "EEUU"))

([libros_Class50] of  Narrativa

	(librosGenero [libros_Class70])
	(nombreGenero "Narrativa"))

([libros_Class51] of  Oeste

	(nombreGenero "Oeste"))

([libros_Class52] of  Policiaca

	(nombreGenero "Policiaca"))

([libros_Class53] of  Romantica

	(librosGenero
		[libros_Class59]
		[libros_Class64]
		[libros_Class63])
	(nombreGenero "Romantica"))

([libros_Class54] of  Terror

	(nombreGenero "Terror"))

([libros_Class55] of  Viajes

	(nombreGenero "Viajes"))

([libros_Class58] of  Autor

	(anoDeNacimiento 1963)
	(librosEscritos [libros_Class59])
	(Nombre "E. L. James")
	(nPremios 5)
	(tieneNacionalidad [libros_Class9]))

([libros_Class59] of  Libro

	(anoPublicacion 2011)
	(dificultad Baja)
	(escritoPor [libros_Class58])
	(idioma Ingles)
	(paginas 514)
	(pertenece [libros_Class53])
	(premios FALSE)
	(titulo "Fifty Shades of Grey")
	(trataSobre
		[libros_Class39]
		[libros_Class38]))

([libros_Class6] of  Nacionalidad

	(nacionalidad "Argentina"))

([libros_Class61] of  Autor

	(anoDeNacimiento 1973)
	(librosEscritos
		[libros_Class63]
		[libros_Class64])
	(Nombre "Stephenie Meyer")
	(nPremios 0)
	(tieneNacionalidad [libros_Class5]))

([libros_Class63] of  Libro

	(anoPublicacion 2005)
	(dificultad Baja)
	(escritoPor [libros_Class61])
	(idioma Castellano)
	(paginas 498)
	(pertenece
		[libros_Class53]
		[libros_Class48])
	(titulo "Crepusculo")
	(trataSobre
		[libros_Class38]
		[libros_Class65]))

([libros_Class64] of  Libro

	(anoPublicacion 2006)
	(dificultad Baja)
	(escritoPor [libros_Class61])
	(idioma Castellano)
	(paginas 576)
	(pertenece
		[libros_Class48]
		[libros_Class53])
	(titulo "Luna Nueva")
	(trataSobre
		[libros_Class38]
		[libros_Class65]))

([libros_Class65] of  Tema

	(librosTema
		[libros_Class63]
		[libros_Class64])
	(nombreTema "Vampiros"))

([libros_Class66] of  Autor

	(anoDeNacimiento 1948)
	(librosEscritos [libros_Class67])
	(Nombre "George R. R. Martin")
	(nPremios 22)
	(tieneNacionalidad [libros_Class5]))

([libros_Class67] of  Libro

	(anoPublicacion 2002)
	(dificultad Baja)
	(escritoPor [libros_Class66])
	(idioma Castellano)
	(paginas 800)
	(pertenece [libros_Class48])
	(premios TRUE)
	(titulo "Juego De Tronos")
	(trataSobre
		[libros_Class41]
		[libros_Class43]
		[libros_Class44]
		[libros_Class68]))

([libros_Class68] of  Tema

	(librosTema [libros_Class67])
	(nombreTema "Guerra"))

([libros_Class69] of  Autor

	(anoDeNacimiento 1547)
	(librosEscritos [libros_Class70])
	(Nombre "Miguel de Cervantes")
	(tieneNacionalidad [libros_Class3]))

([libros_Class7] of  Nacionalidad

	(nacionalidad "Rusia"))

([libros_Class70] of  Libro

	(anoPublicacion 1605)
	(dificultad Alta)
	(escritoPor [libros_Class69])
	(idioma Castellano)
	(paginas 1250)
	(pertenece [libros_Class50])
	(titulo "Don Quijote de la Mancha")
	(trataSobre
		[libros_Class40]
		[libros_Class43]))

([libros_Class8] of  Nacionalidad

	(nacionalidad "Francia"))

([libros_Class9] of  Nacionalidad

	(autores [libros_Class58])
	(nacionalidad "Reino Unido"))
)

;;; Ontologia/Libros.pins END


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


