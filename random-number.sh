read -p "Informe o número mínimo: " numMIN
read -p "Informe o número máximo: " numMAX
read -p "Informe o nome do arquivo que será salvo com o log: " logRANDOMnumber
echo

rm -rf $logRANDOMnumber
mkdir $logRANDOMnumber

while :; do

NUM=$(shuf -i $numMIN-$numMAX -n1)
wget -q dontpad.com/$NUM.txt
TRUEorFALSE=$(cat $NUM.txt)

if [ -z "$TRUEorFALSE" ]

then
echo -e "\033[01;31mNão tem nada dentro do dontpad.com/$NUM\033[01;00m"
rm $NUM.txt

else
echo -e "\033[01;32mEncontrei algo interessante dentro do dontpad.com/$NUM\033[01;00m"
touch $PWD/$logRANDOMnumber/$NUM
echo $TRUEorFALSE > $PWD/$logRANDOMnumber/$NUM
rm $NUM.txt

fi
done
