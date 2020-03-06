read -p "Informe o número mínimo: " numMIN
read -p "Informe o número máximo: " numMAX
read -p "Informe o nome do arquivo que será salvo com o log: " logRANDOMnumber
rm -rf $logRANDOMnumber
mkdir $logRANDOMnumber

while :; do

NUM=$(shuf -i $numMIN-$numMAX -n1)
wget -q dontpad.com/$NUM.txt
TRUEorFALSE=$(cat $NUM.txt)

if [ -z "$TRUEorFALSE" ]
then
echo "Não tem nada dentro do dontpad.com/$NUM"
rm $NUM.txt
else
echo "Encontrei algo interessante dentro do dontpad.com/$NUM"
touch $PWD/$logRANDOMnumber/$NUM
echo $TRUEorFALSE > $PWD/$logRANDOMnumber/$NUM
rm $NUM.txt
fi
done
