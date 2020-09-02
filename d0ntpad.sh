#!/bin/bash

clear
echo "Scan simples para encontrar informações de arquivos do Dontpad.com"
echo
echo "Script desenvolvido por Eduardo Buzzi"
echo "Mais Scripts em: https://github.com/edubuzzi"
echo

read -p "Informe o nome do arquivo: " nome
read -p "Informe o número inicial: " numInicial
read -p "Informe o número final: " numFinal

mkdir d0ntpad.$nome.$numInicial-$numFinal
cd d0ntpad.$nome.$numInicial-$numFinal

wget -q dontpad.com/$nome.txt
echo
echo "CONTEÚDO DO ARQUIVO -> dontpad.com/$nome"
echo 
changeCOLOR=$(cat $nome.txt)
echo -e "\033[01;31m$changeCOLOR\033[01;00m"
echo

if [ -z "$changeCOLOR" ]
then
echo "Não tem nada escrito nesse arquivo."
echo
echo "=-=-=-=-=-=-=-=-=-=-=-=-="
else

echo >> save.$nome.$numInicial-$numFinal.txt
echo "CONTEÚDO DO ARQUIVO -> dontpad.com/$nome" >> save.$nome.$numInicial-$numFinal.txt
echo >> save.$nome.$numInicial-$numFinal.txt
echo -e "\033[01;31m$changeCOLOR\033[01;00m" >> save.$nome.$numInicial-$numFinal.txt
echo >> save.$nome.$numInicial-$numFinal.txt
echo
echo "Informações do Arquivo foram salvas em $PWD/save.$nome.$numInicial-$numFinal.txt"
echo
echo "=-=-=-=-=-=-=-=-=-=-=-=-="
fi
rm $nome.txt

for i in `seq $numInicial $numFinal`;
do

wget -q dontpad.com/$nome$i.txt
echo
echo "CONTEÚDO DO ARQUIVO -> dontpad.com/$nome$i"
echo
changeCOLOR=$(cat $nome$i.txt)
echo -e "\033[01;31m$changeCOLOR\033[01;00m"
echo

if [ -z "$changeCOLOR" ]
then
echo "Não tem nada escrito nesse arquivo."
echo
echo "=-=-=-=-=-=-=-=-=-=-=-=-="
else

echo >> save.$nome.$i.$numInicial-$numFinal.txt
echo "ABAIXO TEM INFORMAÇÕES -> dontpad.com/$nome$i" >> save.$nome.$i.$numInicial-$numFinal.txt
echo >> save.$nome.$i.$numInicial-$numFinal.txt
echo -e "\033[01;31m$changeCOLOR\033[01;00m" >> save.$nome.$i.$numInicial-$numFinal.txt
echo >> save.$nome.$i.$numInicial-$numFinal.txt	
echo
echo "Informações do Arquivo foram salvas em $PWD/save.$nome.$i.$numInicial-$numFinal.txt"
echo
echo "=-=-=-=-=-=-=-=-=-=-=-=-="
fi
rm $nome$i.txt

done

for i in `seq $numInicial $numFinal`;
do

wget -q dontpad.com/$i$nome.txt
echo
echo "CONTEÚDO DO ARQUIVO -> dontpad.com/$i$nome"
echo 
changeCOLOR=$(cat $i$nome.txt)
echo -e "\033[01;31m$changeCOLOR\033[01;00m"
echo

if [ -z "$changeCOLOR" ]
then
echo "Não tem nada escrito nesse arquivo."
echo
echo "=-=-=-=-=-=-=-=-=-=-=-=-="
else

echo >> save.$i.$nome.$numInicial-$numFinal.txt
echo "ABAIXO TEM INFORMAÇÕES -> dontpad.com/$i$nome" >> save.$i.$nome.$numInicial-$numFinal.txt
echo >> save.$i.$nome.$numInicial-$numFinal.txt
echo -e "\033[01;31m$changeCOLOR\033[01;00m" >> save.$i.$nome.$numInicial-$numFinal.txt
echo >> save.$i.$nome.$numInicial-$numFinal.txt
echo
echo "Informações do Arquivo foram salvas em $PWD/save.$i.$nome.$numInicial-$numFinal.txt"
echo
echo "=-=-=-=-=-=-=-=-=-=-=-=-="
fi
rm $i$nome.txt

done
exit
