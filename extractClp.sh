CLP=Libros.clp
BEGINLINES=$(cat $CLP | grep ";;; " --line-number | grep BEGIN | xargs --delimiter=: | awk '{print $1}')
FILENAMES1=$(cat $CLP | grep ";;; " --line-number | grep BEGIN | xargs --delimiter=: | awk '{print $3}') 
FILENAMES2=$(cat $CLP | grep ";;; " --line-number | grep END | xargs --delimiter=: | awk '{print $3}') 
ENDLINES=$(cat $CLP | grep ";;; " --line-number | grep END | xargs --delimiter=: | awk '{print $1}')

BEGINARRAY=($BEGINLINES)
FILEARRAY1=($FILENAMES1)
FILEARRAY2=($FILENAMES2)
ENDARRAY=($ENDLINES)
ELEMS=$(cat Libros.clp | grep ";;; " | grep BEGIN  | wc -l)


for (( c=0; c<$ELEMS; c++ ))
do
  BEGLINE=${BEGINARRAY[$c]}
  FILE=${FILEARRAY1[$c]}
  FILE2=${FILEARRAY2[$c]}
  if [ $FILE != $FILE2 ]; then
     echo "[ERROR ] in the BEGIN line ($BEGLINE) we found $FILE but in the END line ($ENDLINE)it was $FILE2"
     exit
  fi
  if [ "$(echo $FILE | grep pins)" != "" ] || [ "$(echo $FILE | grep pont)" != "" ]; then
    continue
  fi 
  ENDLINE=${ENDARRAY[$c]}
  echo "Parsing $FILE from line $BEGLINE to $ENDLINE ..."
  BEGLINE=$(($BEGLINE+2))
  ENDLINE=$(($ENDLINE-1)) 
  if [ "$(head -n $ENDLINE $CLP | tail -1)" == "" ]; then
    ENDLINE=$(($ENDLINE-1)) 
  fi
  cp $FILE $FILE.save
  sed -n "$BEGLINE,$(echo $ENDLINE)p" $CLP > $FILE
  
done



