CLP=Libros.clp
rm $CLP 
touch $CLP
for fit in $(ls $(cat FitxersEnOrdre.txt)); do
    echo ";;; $fit BEGIN" >> $CLP
    echo "" >> $CLP 
    cat $fit >> $CLP 
    echo "" >> $CLP
    echo ";;; $fit END" >> $CLP
    echo "" >> $CLP
    echo "" >> $CLP
done
