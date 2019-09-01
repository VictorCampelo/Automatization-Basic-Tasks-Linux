#! /bin/bash

#Recebe um número como parâmetro e o diminui até
#chegar a zero, mostrando na tela cada passo, numa
#mesma linha. Exemplo:
#prompt$ ./zerador.sh 5
#5 4 3 2 1 0
#prompt$ ./zerador.sh 10
#10 9 8 7 6 5 4 3 2 1 0

var=$1

while [ $var -ge 0 ]
do
	echo $var
	var=$(($var-1))
done
