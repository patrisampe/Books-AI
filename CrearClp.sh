usage() {
    echo "CrearClp.sh [destino]"
}

CLP=Libros.clp

if [ $# -eq 1 ]; then
    CLP=$1
fi

cp $CLP $CLP.save
echo ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;" > $CLP
echo ";;          Practica 2 IA       ;;" >> $CLP
echo ";; Por:                         ;;" >> $CLP
echo ";; * Octavi Pascual             ;;" >> $CLP
echo ";; * Patricia Sampedro          ;;" >> $CLP
echo ";; * Yoel Cabo                  ;;" >> $CLP
echo ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;" >> $CLP
echo "" >> $CLP

FITXERS=$(cat FitxersEnOrdre.txt | grep -v "#")
EXCLUSIONS=$(cat Exclusions.txt | grep -v "#")
for name in $FITXERS; do
    for fit in $(ls $name); do
        if [ "$(echo $EXCLUSIONS | grep $fit)" != "" ]; then
            continue
        fi
        echo "Añadiendo $fit a $CLP ..."
	echo ";;; $fit BEGIN" >> $CLP
	echo "" >> $CLP 
        if [ "$(echo $fit | grep pins)" != "" ]; then
            echo "(definstances instancies " >> $CLP
	    sed -e  "s/^/    /g" $fit >> $CLP 
            echo ")" >> $CLP
        else 
	    sed -e '$a\' $fit >> $CLP
        fi
	echo "" >> $CLP
	echo ";;; $fit END" >> $CLP
	echo "" >> $CLP
	echo "" >> $CLP
    done
done
