(clear)
(load "../Libros.clp")
(reset)

(assert (Lector (nombre "Juan Adulto Tonto") (edad 40) (sexo hombre) (nacionalidad [libros_Class3]) (estudios No_graduado_escolar)))
(assert (Habitos (lugar casa) (frecuencia diario) (momento tarde) (tiempo 20)))
(assert 
	(Preferencias
		(autores-preferidos [Libros_Class37] [Libros_Class10015] [Libros_Class10018])
		(generos-preferidos [libros_Class52])
		(generos-deseados [libros_Class46])
	)
)
(assert
	(Prohibiciones
	)
)
(assert (PreguntasExtra (seguir-criticos si) (libro-desconocido no)))
(run)
