CLP=Libros.clp
rm $CLP 
touch $CLP
for name in $(cat FitxersEnOrdre.txt); do
    for fit in $(ls $name); do
        echo "Añadiendo $fit a $CLP ..."
	echo ";;; $fit BEGIN" >> $CLP
	echo "" >> $CLP 
	cat $fit >> $CLP 
	echo "" >> $CLP
	echo ";;; $fit END" >> $CLP
	echo "" >> $CLP
	echo "" >> $CLP
    done
done
