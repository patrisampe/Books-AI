(clear)
(load "../Libros.clp")
(reset)

(assert (Lector (nombre "Julie") (edad 24) (sexo mujer) (nacionalidad [libros_Class8]) (estudios Bachillerato)))
(assert (Habitos (lugar cama) (frecuencia diario) (momento noche) (tiempo 60)))
(assert 
	(Preferencias
		(autores-preferidos [Libros_Class10009] [Libros_Class35])
		(generos-preferidos [libros_Class53] [libros_Class55] [libros_Class48])
		(temas-preferidos [libros_Class39] [libros_Class38])
		(autores-deseados [Libros_Class10084] [Libros_Class10071] [Libros_Class10056] [Libros_Class10039] [Libros_Class27] [Libros_Class10009] [libros_Class69] [Libros_Class10059] [Libros_Class10069])
	)
)
(assert
	(Prohibiciones
		(autores-prohibidos [Libros_Class10009] [Libros_Class35])
		(generos-prohibidos [libros_Class54] [Libros_Class15])
	)
)
(assert (PreguntasExtra (seguir-criticos si) (libro-desconocido si)))

(run)
